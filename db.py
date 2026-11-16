import sqlite3
import pandas as pd
import os
import re

try:
    import psycopg2
    from psycopg2.extras import RealDictCursor
    PSYCOPG2_AVAILABLE = True
except ImportError:
    PSYCOPG2_AVAILABLE = False

LOCAL_DB_PATH = os.path.join(os.path.dirname(__file__), "job_portal_local.db")

class DatabaseManager:
    def __init__(self):
        self.mode = "sqlite" # 'postgres' or 'sqlite'
        self.pg_config = {
            "host": "localhost",
            "port": 5432,
            "dbname": "job_portal_db",
            "user": "postgres",
            "password": "team9"
        }
        self.conn = None
        self._ensure_sqlite_ready()
        # Auto-connect to PostgreSQL on startup
        self._try_auto_connect()

    def _try_auto_connect(self):
        """Attempt to connect to PostgreSQL automatically on startup."""
        if PSYCOPG2_AVAILABLE and self.pg_config["password"]:
            try:
                success, _ = self.connect_postgres(
                    self.pg_config["host"],
                    self.pg_config["port"],
                    self.pg_config["dbname"],
                    self.pg_config["user"],
                    self.pg_config["password"]
                )
            except Exception:
                pass  # Fall back to sqlite silently

    def _ensure_sqlite_ready(self):
        if not os.path.exists(LOCAL_DB_PATH):
            from schema_sqlite import init_sqlite_db
            init_sqlite_db(LOCAL_DB_PATH)

    def connect_postgres(self, host="localhost", port=5432, dbname="job_portal_db", user="postgres", password=""):
        if not PSYCOPG2_AVAILABLE:
            return False, "psycopg2 is not installed."
        try:
            conn = psycopg2.connect(
                host=host,
                port=int(port),
                dbname=dbname,
                user=user,
                password=password,
                connect_timeout=3
            )
            # test query
            cur = conn.cursor()
            cur.execute("SELECT COUNT(*) FROM information_schema.tables WHERE table_schema='public'")
            count = cur.fetchone()[0]
            cur.close()
            
            self.conn = conn
            self.mode = "postgres"
            self.pg_config = {
                "host": host, "port": port, "dbname": dbname, "user": user, "password": password
            }
            return True, f"Connected to PostgreSQL ({dbname})! Found {count} tables."
        except Exception as e:
            return False, f"PostgreSQL Connection Error: {str(e)}"

    def connect_sqlite(self):
        self.mode = "sqlite"
        self._ensure_sqlite_ready()
        return True, "Connected to Local SQLite Mirror (Demo Mode)."

    def get_connection(self):
        if self.mode == "postgres":
            if self.conn is None or self.conn.closed:
                self.conn = psycopg2.connect(
                    host=self.pg_config["host"],
                    port=self.pg_config["port"],
                    dbname=self.pg_config["dbname"],
                    user=self.pg_config["user"],
                    password=self.pg_config["password"]
                )
            return self.conn
        else:
            return sqlite3.connect(LOCAL_DB_PATH)

    def execute_query(self, sql, params=None, fetch=True):
        """Execute a query and return a pandas DataFrame or status"""
        conn = self.get_connection()
        if self.mode == "sqlite":
            # Translate syntax differences if needed (%s -> ?)
            if params and isinstance(params, (list, tuple)):
                sql = sql.replace("%s", "?")
            try:
                if fetch:
                    df = pd.read_sql_query(sql, conn, params=params)
                    conn.close()
                    return df, None
                else:
                    cur = conn.cursor()
                    cur.execute(sql, params or ())
                    conn.commit()
                    rowcount = cur.rowcount
                    conn.close()
                    return rowcount, None
            except Exception as e:
                conn.close()
                return None, str(e)
        else:
            # Postgres mode
            try:
                cur = conn.cursor(cursor_factory=RealDictCursor if fetch else None)
                cur.execute(sql, params)
                if fetch:
                    if cur.description:
                        rows = cur.fetchall()
                        df = pd.DataFrame(rows)
                    else:
                        df = pd.DataFrame()
                    cur.close()
                    return df, None
                else:
                    conn.commit()
                    rowcount = cur.rowcount
                    cur.close()
                    return rowcount, None
            except Exception as e:
                conn.rollback()
                return None, str(e)

    # --- Domain Methods ---

    def get_kpis(self):
        """Platform-wide metrics"""
        t_cand, _ = self.execute_query("SELECT COUNT(*) as count FROM CANDIDATE")
        t_jobs, _ = self.execute_query("SELECT COUNT(*) as count FROM JOB_POSTING WHERE Status='Active'")
        t_apps, _ = self.execute_query("SELECT COUNT(*) as count FROM APPLICATION")
        t_emps, _ = self.execute_query("SELECT COUNT(*) as count FROM EMPLOYER WHERE VerificationStatus='Verified'")
        return {
            "candidates": t_cand.iloc[0, 0] if t_cand is not None and not t_cand.empty else 0,
            "active_jobs": t_jobs.iloc[0, 0] if t_jobs is not None and not t_jobs.empty else 0,
            "applications": t_apps.iloc[0, 0] if t_apps is not None and not t_apps.empty else 0,
            "verified_employers": t_emps.iloc[0, 0] if t_emps is not None and not t_emps.empty else 0,
        }

    def search_jobs(self, keyword="", location="All", min_salary=0, employment_type="All"):
        sql = """
        SELECT j.JobID, j.Title, c.Name AS Company, j.Location, j.EmploymentType, 
               j.SeniorityLevel, j.SalaryMin, j.SalaryMax, j.Status, j.PostDate
        FROM JOB_POSTING j
        JOIN EMPLOYER e ON j.EmployerID = e.EmployerID
        JOIN COMPANY c ON e.CompanyID = c.CompanyID
        WHERE j.Status = 'Active' AND j.SalaryMin >= %s
        """
        params = [min_salary]
        if keyword:
            sql += " AND (LOWER(j.Title) LIKE %s OR LOWER(j.Description) LIKE %s)"
            kw = f"%{keyword.lower()}%"
            params.extend([kw, kw])
        if location and location != "All":
            sql += " AND j.Location = %s"
            params.append(location)
        if employment_type and employment_type != "All":
            sql += " AND j.EmploymentType = %s"
            params.append(employment_type)
        sql += " ORDER BY j.PostDate DESC"
        df, err = self.execute_query(sql, params)
        return df, err

    def get_job_full_details(self, job_id):
        sql = """
        SELECT j.*, c.Name as CompanyName, c.Industry, c.Website, c.HQ_Location, e.Email as EmployerEmail
        FROM JOB_POSTING j
        JOIN EMPLOYER e ON j.EmployerID = e.EmployerID
        JOIN COMPANY c ON e.CompanyID = c.CompanyID
        WHERE j.JobID = %s
        """
        job_df, _ = self.execute_query(sql, [job_id])
        skills_df, _ = self.execute_query("""
            SELECT s.SkillName, js.ProficiencyLevel, js.IsMandatory
            FROM JOB_SKILL js
            JOIN SKILL s ON js.SkillID = s.SkillID
            WHERE js.JobID = %s
        """, [job_id])
        questions_df, _ = self.execute_query("""
            SELECT QuestionID, QuestionText, QuestionType
            FROM SCREENING_QUESTION
            WHERE JobID = %s
        """, [job_id])
        return job_df, skills_df, questions_df

    def get_candidate_resumes(self, candidate_id):
        sql = "SELECT ResumeID, VersionName, FilePath, IsDefault FROM RESUME WHERE CandidateID = %s ORDER BY IsDefault DESC"
        return self.execute_query(sql, [candidate_id])

    def submit_application(self, candidate_id, job_id, resume_id, answers=None):
        # 1. Duplicate check (Simulating Lab 10A Trigger)
        chk_sql = "SELECT ApplicationID FROM APPLICATION WHERE CandidateID = %s AND JobID = %s AND Stage != 'Rejected'"
        existing, _ = self.execute_query(chk_sql, [candidate_id, job_id])
        if existing is not None and not existing.empty:
            return False, "Duplicate Application Blocked: You have already applied for this job posting!"

        # Generate new App ID
        t_apps, _ = self.execute_query("SELECT COUNT(*) FROM APPLICATION")
        cnt = t_apps.iloc[0, 0] if t_apps is not None else 100
        new_app_id = f"APP-{cnt + 1:03d}"

        # Insert Application
        app_sql = """
        INSERT INTO APPLICATION (ApplicationID, CandidateID, JobID, ResumeID, Timestamp, Stage, IsDraft)
        VALUES (%s, %s, %s, %s, CURRENT_TIMESTAMP, 'Applied', FALSE)
        """
        _, err = self.execute_query(app_sql, [new_app_id, candidate_id, job_id, resume_id], fetch=False)
        if err:
            return False, f"Failed to submit application: {err}"

        # Insert screening answers
        if answers:
            for qid, ans_text in answers.items():
                ans_sql = """
                INSERT INTO APPLICATION_ANSWER (ApplicationID, JobID, QuestionID, AnswerText, AnsweredAt)
                VALUES (%s, %s, %s, %s, CURRENT_TIMESTAMP)
                """
                self.execute_query(ans_sql, [new_app_id, job_id, qid, str(ans_text)], fetch=False)

        return True, f"Application {new_app_id} submitted successfully!"

    def post_new_job(self, employer_id, title, desc, loc, emp_type, seniority, sal_min, sal_max, expiry_date, skills_data, questions_list):
        # 1. Deduct employer credit (Simulating Lab 10A Query 29)
        emp_chk, _ = self.execute_query("SELECT CreditsRemaining, VerificationStatus FROM EMPLOYER WHERE EmployerID = %s", [employer_id])
        if emp_chk is None or emp_chk.empty:
            return False, "Employer account not found."
        
        status = emp_chk.iloc[0]["VerificationStatus"] if "VerificationStatus" in emp_chk.columns else emp_chk.iloc[0]["verificationstatus"]
        credits = emp_chk.iloc[0]["CreditsRemaining"] if "CreditsRemaining" in emp_chk.columns else emp_chk.iloc[0]["creditsremaining"]
        
        if status != "Verified":
            return False, f"Account is {status}. Only Verified employers can publish job listings."
        if credits < 1:
            return False, "Insufficient posting credits. Please upgrade subscription or purchase credits."

        # Deduct credit
        self.execute_query("UPDATE EMPLOYER SET CreditsRemaining = CreditsRemaining - 1 WHERE EmployerID = %s", [employer_id], fetch=False)

        # Generate JobID
        t_jobs, _ = self.execute_query("SELECT COUNT(*) FROM JOB_POSTING")
        cnt = t_jobs.iloc[0, 0] if t_jobs is not None else 50
        new_job_id = f"JOB-{cnt + 1:03d}"

        # Insert Job
        job_sql = """
        INSERT INTO JOB_POSTING (JobID, EmployerID, Title, Description, Location, EmploymentType, SeniorityLevel, SalaryMin, SalaryMax, PostDate, ExpiryDate, Status)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, CURRENT_TIMESTAMP, %s, 'Active')
        """
        _, err = self.execute_query(job_sql, [new_job_id, employer_id, title, desc, loc, emp_type, seniority, sal_min, sal_max, expiry_date], fetch=False)
        if err:
            return False, f"Failed to create job: {err}"

        # Insert Skills
        for sk_id, prof, is_mand in skills_data:
            self.execute_query("INSERT INTO JOB_SKILL VALUES (%s, %s, %s, %s)", [new_job_id, sk_id, prof, is_mand], fetch=False)

        # Insert Questions
        for idx, (q_text, q_type) in enumerate(questions_list, start=1):
            qid = f"Q-{cnt + 1:03d}-{idx}"
            self.execute_query("INSERT INTO SCREENING_QUESTION VALUES (%s, %s, %s, %s)", [new_job_id, qid, q_text, q_type], fetch=False)

        return True, f"Job Posting {new_job_id} successfully created! (1 credit deducted)"

    def get_job_applicants(self, job_id):
        sql = """
        SELECT a.ApplicationID, c.CandidateID, c.Name as CandidateName, c.Email, c.Phone,
               c.ExperienceLevel, a.Timestamp, a.Stage, r.FilePath as ResumePath,
               (SELECT ed.GPA FROM EDUCATION ed WHERE ed.CandidateID = c.CandidateID ORDER BY ed.GPA DESC LIMIT 1) as TopGPA
        FROM APPLICATION a
        JOIN CANDIDATE c ON a.CandidateID = c.CandidateID
        JOIN RESUME r ON a.CandidateID = r.CandidateID AND a.ResumeID = r.ResumeID
        WHERE a.JobID = %s
        ORDER BY a.Timestamp DESC
        """
        return self.execute_query(sql, [job_id])

    def get_applicant_answers(self, application_id):
        sql = """
        SELECT sq.QuestionText, aa.AnswerText, aa.AnsweredAt
        FROM APPLICATION_ANSWER aa
        JOIN SCREENING_QUESTION sq ON aa.JobID = sq.JobID AND aa.QuestionID = sq.QuestionID
        WHERE aa.ApplicationID = %s
        """
        return self.execute_query(sql, [application_id])

    def update_application_stage(self, app_id, new_stage):
        sql = "UPDATE APPLICATION SET Stage = %s WHERE ApplicationID = %s"
        return self.execute_query(sql, [new_stage, app_id], fetch=False)


    # --- Candidate Profile Setup & Modification Methods ---

    def register_candidate(self, name, email, phone, headline, summary, location, exp_level, visibility):
        # Generate new CandidateID
        t_cands, _ = self.execute_query("SELECT COUNT(*) FROM CANDIDATE")
        cnt = t_cands.iloc[0, 0] if t_cands is not None and not t_cands.empty else 100
        new_cid = f"CAN-{cnt + 1:03d}"

        sql = """
        INSERT INTO CANDIDATE (CandidateID, Name, Email, Phone, Headline, Summary, Location, ExperienceLevel, ProfileVisibility)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
        """
        _, err = self.execute_query(sql, [new_cid, name, email, phone, headline, summary, location, exp_level, visibility], fetch=False)
        if err:
            return None, err
        return new_cid, None

    def update_candidate_profile(self, candidate_id, name, email, phone, headline, summary, location, exp_level, visibility):
        sql = """
        UPDATE CANDIDATE 
        SET Name = %s, Email = %s, Phone = %s, Headline = %s, Summary = %s, Location = %s,
            ExperienceLevel = %s, ProfileVisibility = %s
        WHERE CandidateID = %s
        """
        _, err = self.execute_query(sql, [name, email, phone, headline, summary, location, exp_level, visibility, candidate_id], fetch=False)
        return err is None, err

    def add_candidate_education(self, candidate_id, institution, degree, field, start_date, end_date, gpa):
        t_edu, _ = self.execute_query("SELECT COUNT(*) FROM EDUCATION WHERE CandidateID = %s", [candidate_id])
        cnt = t_edu.iloc[0, 0] if t_edu is not None and not t_edu.empty else 0
        new_ed_id = f"EDU-{cnt + 1:02d}"

        sql = """
        INSERT INTO EDUCATION (CandidateID, EducationID, Institution, Degree, FieldOfStudy, StartDate, EndDate, GPA)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
        """
        _, err = self.execute_query(sql, [candidate_id, new_ed_id, institution, degree, field, start_date, end_date if end_date else None, gpa], fetch=False)
        return err is None, err

    def delete_candidate_education(self, candidate_id, education_id):
        sql = "DELETE FROM EDUCATION WHERE CandidateID = %s AND EducationID = %s"
        _, err = self.execute_query(sql, [candidate_id, education_id], fetch=False)
        return err is None, err

    def add_candidate_experience(self, candidate_id, company, title, start_date, end_date, description):
        t_exp, _ = self.execute_query("SELECT COUNT(*) FROM EMPLOYMENT_HISTORY WHERE CandidateID = %s", [candidate_id])
        cnt = t_exp.iloc[0, 0] if t_exp is not None and not t_exp.empty else 0
        new_hist_id = f"HIST-{cnt + 1:02d}"

        sql = """
        INSERT INTO EMPLOYMENT_HISTORY (CandidateID, HistoryID, PreviousCompanyName, JobTitle, StartDate, EndDate, Description)
        VALUES (%s, %s, %s, %s, %s, %s, %s)
        """
        _, err = self.execute_query(sql, [candidate_id, new_hist_id, company, title, start_date, end_date if end_date else None, description], fetch=False)
        return err is None, err

    def delete_candidate_experience(self, candidate_id, history_id):
        sql = "DELETE FROM EMPLOYMENT_HISTORY WHERE CandidateID = %s AND HistoryID = %s"
        _, err = self.execute_query(sql, [candidate_id, history_id], fetch=False)
        return err is None, err

    def add_candidate_resume(self, candidate_id, version_name, file_path, is_default=False):
        # Check max 5 resumes constraint (SRS BC2)
        chk_df, _ = self.execute_query("SELECT COUNT(*) FROM RESUME WHERE CandidateID = %s", [candidate_id])
        cnt = chk_df.iloc[0, 0] if chk_df is not None and not chk_df.empty else 0
        if cnt >= 5:
            return False, "Maximum 5 resumes allowed per candidate profile (SRS Business Constraint BC2)."

        if is_default:
            # Clear default on other resumes
            self.execute_query("UPDATE RESUME SET IsDefault = FALSE WHERE CandidateID = %s", [candidate_id], fetch=False)

        new_res_id = f"RES-{cnt + 1:02d}"
        sql = "INSERT INTO RESUME (CandidateID, ResumeID, VersionName, FilePath, IsDefault) VALUES (%s, %s, %s, %s, %s)"
        _, err = self.execute_query(sql, [candidate_id, new_res_id, version_name, file_path, is_default], fetch=False)
        return err is None, err

    def delete_candidate_resume(self, candidate_id, resume_id):
        sql = "DELETE FROM RESUME WHERE CandidateID = %s AND ResumeID = %s"
        _, err = self.execute_query(sql, [candidate_id, resume_id], fetch=False)
        return err is None, err

    def add_candidate_skill(self, candidate_id, skill_id, proficiency, years):
        # Replace if exists or insert
        self.execute_query("DELETE FROM CANDIDATE_SKILL WHERE CandidateID = %s AND SkillID = %s", [candidate_id, skill_id], fetch=False)
        sql = "INSERT INTO CANDIDATE_SKILL (CandidateID, SkillID, ProficiencyLevel, YearsOfExperience) VALUES (%s, %s, %s, %s)"
        _, err = self.execute_query(sql, [candidate_id, skill_id, proficiency, years], fetch=False)
        return err is None, err

    def remove_candidate_skill(self, candidate_id, skill_id):
        sql = "DELETE FROM CANDIDATE_SKILL WHERE CandidateID = %s AND SkillID = %s"
        _, err = self.execute_query(sql, [candidate_id, skill_id], fetch=False)
        return err is None, err

    def update_job_preference(self, candidate_id, target_title, expected_salary, work_model, avail_date):
        pref_chk, _ = self.execute_query("SELECT PrefID FROM JOB_PREFERENCE WHERE CandidateID = %s", [candidate_id])
        if pref_chk is not None and not pref_chk.empty:
            sql = """
            UPDATE JOB_PREFERENCE 
            SET TargetTitle = %s, ExpectedSalary = %s, PreferredWorkModel = %s, AvailabilityDate = %s
            WHERE CandidateID = %s
            """
            _, err = self.execute_query(sql, [target_title, expected_salary, work_model, avail_date, candidate_id], fetch=False)
        else:
            sql = """
            INSERT INTO JOB_PREFERENCE (CandidateID, PrefID, TargetTitle, ExpectedSalary, PreferredWorkModel, AvailabilityDate)
            VALUES (%s, 'PREF-01', %s, %s, %s, %s)
            """
            _, err = self.execute_query(sql, [candidate_id, target_title, expected_salary, work_model, avail_date], fetch=False)
        return err is None, err


    def register_employer(self, company_name, trade_name, industry, website, hq_location, description, plan_id, email, phone, admin_name="", admin_email=""):
        t_comp, _ = self.execute_query("SELECT COUNT(*) FROM COMPANY")
        cnt_comp = t_comp.iloc[0, 0] if t_comp is not None and not t_comp.empty else 100
        new_comp_id = f"COMP-{cnt_comp + 1:03d}"

        comp_sql = """
        INSERT INTO COMPANY (CompanyID, Name, TradeName, Industry, Website, Logo, HQ_Location, Description)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
        """
        _, err = self.execute_query(comp_sql, [new_comp_id, company_name, trade_name or company_name, industry, website or "https://company.com", f"logo_{cnt_comp+1}.png", hq_location, description or "Registered corporate account."], fetch=False)
        if err:
            return None, None, f"Failed to register company: {err}"

        plan_df, _ = self.execute_query("SELECT Credits FROM SUBSCRIPTION_PLAN WHERE PlanID = %s", [plan_id])
        init_credits = int(plan_df.iloc[0]["Credits"]) if plan_df is not None and not plan_df.empty else 10

        t_emp, _ = self.execute_query("SELECT COUNT(*) FROM EMPLOYER")
        cnt_emp = t_emp.iloc[0, 0] if t_emp is not None and not t_emp.empty else 100
        new_emp_id = f"EMP-{cnt_emp + 1:03d}"

        emp_sql = """
        INSERT INTO EMPLOYER (EmployerID, CompanyID, PlanID, Email, Phone, VerificationStatus, CreditsRemaining)
        VALUES (%s, %s, %s, %s, %s, 'Verified', %s)
        """
        _, err = self.execute_query(emp_sql, [new_emp_id, new_comp_id, plan_id, email, phone, init_credits], fetch=False)
        if err:
            return None, None, f"Failed to register employer: {err}"

        user_name = admin_name if admin_name else f"{company_name} Admin"
        user_email = admin_email if admin_email else email
        user_sql = """
        INSERT INTO EMPLOYER_USER (EmployerID, UserID, Name, Email, Role)
        VALUES (%s, %s, %s, %s, 'Admin')
        """
        self.execute_query(user_sql, [new_emp_id, f"USR-{cnt_emp + 1:03d}", user_name, user_email], fetch=False)

        return new_emp_id, new_comp_id, None

# Singleton instance
db_manager = DatabaseManager()
