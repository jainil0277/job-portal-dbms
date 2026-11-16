import sqlite3
import os

def init_sqlite_db(db_path="/Users/jainil_shah/1/job_portal_app/job_portal_local.db"):
    if os.path.exists(db_path) and os.path.getsize(db_path) > 10000:
        return db_path
    
    conn = sqlite3.connect(db_path)
    cur = conn.cursor()
    
    # Enable foreign keys
    cur.execute("PRAGMA foreign_keys = ON;")
    
    # Create tables
    cur.executescript('''
    DROP TABLE IF EXISTS APPLICATION_ANSWER;
    DROP TABLE IF EXISTS APPLICATION;
    DROP TABLE IF EXISTS JOB_SKILL;
    DROP TABLE IF EXISTS CANDIDATE_SKILL;
    DROP TABLE IF EXISTS SCREENING_QUESTION;
    DROP TABLE IF EXISTS EMPLOYMENT_HISTORY;
    DROP TABLE IF EXISTS EDUCATION;
    DROP TABLE IF EXISTS RESUME;
    DROP TABLE IF EXISTS JOB_PREFERENCE;
    DROP TABLE IF EXISTS JOB_POSTING;
    DROP TABLE IF EXISTS EMPLOYER_USER;
    DROP TABLE IF EXISTS EMPLOYER;
    DROP TABLE IF EXISTS CANDIDATE;
    DROP TABLE IF EXISTS SKILL;
    DROP TABLE IF EXISTS SUBSCRIPTION_PLAN;
    DROP TABLE IF EXISTS COMPANY;

    CREATE TABLE COMPANY (
        CompanyID TEXT PRIMARY KEY,
        Name TEXT NOT NULL,
        TradeName TEXT,
        Industry TEXT NOT NULL,
        Website TEXT,
        Logo TEXT,
        HQ_Location TEXT NOT NULL,
        Description TEXT
    );

    CREATE TABLE SUBSCRIPTION_PLAN (
        PlanID TEXT PRIMARY KEY,
        TierName TEXT NOT NULL UNIQUE,
        PostingLimit INTEGER NOT NULL CHECK (PostingLimit >= 0),
        Credits INTEGER NOT NULL CHECK (Credits >= 0),
        Price NUMERIC NOT NULL CHECK (Price >= 0)
    );

    CREATE TABLE SKILL (
        SkillID TEXT PRIMARY KEY,
        SkillName TEXT NOT NULL UNIQUE,
        Category TEXT NOT NULL
    );

    CREATE TABLE CANDIDATE (
        CandidateID TEXT PRIMARY KEY,
        Name TEXT NOT NULL,
        Email TEXT NOT NULL UNIQUE,
        Phone TEXT NOT NULL,
        Headline TEXT,
        Summary TEXT,
        Location TEXT NOT NULL,
        ExperienceLevel TEXT NOT NULL,
        ProfileVisibility TEXT NOT NULL CHECK (ProfileVisibility IN ('Public', 'Anonymous', 'Hidden'))
    );

    CREATE TABLE EMPLOYER (
        EmployerID TEXT PRIMARY KEY,
        CompanyID TEXT NOT NULL UNIQUE,
        PlanID TEXT NOT NULL,
        Email TEXT NOT NULL UNIQUE,
        Phone TEXT NOT NULL,
        VerificationStatus TEXT NOT NULL CHECK (VerificationStatus IN ('Pending', 'Verified', 'Rejected', 'Suspended')),
        CreditsRemaining INTEGER NOT NULL CHECK (CreditsRemaining >= 0),
        FOREIGN KEY (CompanyID) REFERENCES COMPANY(CompanyID) ON DELETE CASCADE,
        FOREIGN KEY (PlanID) REFERENCES SUBSCRIPTION_PLAN(PlanID)
    );

    CREATE TABLE EMPLOYER_USER (
        EmployerID TEXT,
        UserID TEXT,
        Name TEXT NOT NULL,
        Email TEXT NOT NULL,
        Role TEXT NOT NULL CHECK (Role IN ('Admin', 'Recruiter', 'Hiring Manager')),
        PRIMARY KEY (EmployerID, UserID),
        FOREIGN KEY (EmployerID) REFERENCES EMPLOYER(EmployerID) ON DELETE CASCADE
    );

    CREATE TABLE JOB_POSTING (
        JobID TEXT PRIMARY KEY,
        EmployerID TEXT NOT NULL,
        Title TEXT NOT NULL,
        Description TEXT NOT NULL,
        Location TEXT NOT NULL,
        EmploymentType TEXT NOT NULL,
        SeniorityLevel TEXT NOT NULL,
        SalaryMin NUMERIC NOT NULL CHECK (SalaryMin >= 0),
        SalaryMax NUMERIC NOT NULL CHECK (SalaryMax >= SalaryMin),
        PostDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        ExpiryDate TIMESTAMP NOT NULL,
        Status TEXT NOT NULL CHECK (Status IN ('Draft', 'Active', 'Paused', 'Closed', 'Expired')),
        FOREIGN KEY (EmployerID) REFERENCES EMPLOYER(EmployerID) ON DELETE CASCADE
    );

    CREATE TABLE JOB_PREFERENCE (
        CandidateID TEXT,
        PrefID TEXT,
        TargetTitle TEXT NOT NULL,
        ExpectedSalary NUMERIC NOT NULL CHECK (ExpectedSalary >= 0),
        PreferredWorkModel TEXT NOT NULL,
        AvailabilityDate DATE NOT NULL,
        PRIMARY KEY (CandidateID, PrefID),
        FOREIGN KEY (CandidateID) REFERENCES CANDIDATE(CandidateID) ON DELETE CASCADE
    );

    CREATE TABLE RESUME (
        CandidateID TEXT,
        ResumeID TEXT,
        VersionName TEXT NOT NULL,
        FilePath TEXT NOT NULL,
        IsDefault BOOLEAN NOT NULL DEFAULT 0,
        PRIMARY KEY (CandidateID, ResumeID),
        FOREIGN KEY (CandidateID) REFERENCES CANDIDATE(CandidateID) ON DELETE CASCADE
    );

    CREATE TABLE EDUCATION (
        CandidateID TEXT,
        EducationID TEXT,
        Institution TEXT NOT NULL,
        Degree TEXT NOT NULL,
        FieldOfStudy TEXT NOT NULL,
        StartDate DATE NOT NULL,
        EndDate DATE,
        GPA NUMERIC CHECK (GPA >= 0 AND GPA <= 10.0),
        PRIMARY KEY (CandidateID, EducationID),
        FOREIGN KEY (CandidateID) REFERENCES CANDIDATE(CandidateID) ON DELETE CASCADE
    );

    CREATE TABLE EMPLOYMENT_HISTORY (
        CandidateID TEXT,
        HistoryID TEXT,
        PreviousCompanyName TEXT NOT NULL,
        JobTitle TEXT NOT NULL,
        StartDate DATE NOT NULL,
        EndDate DATE,
        Description TEXT,
        PRIMARY KEY (CandidateID, HistoryID),
        FOREIGN KEY (CandidateID) REFERENCES CANDIDATE(CandidateID) ON DELETE CASCADE
    );

    CREATE TABLE SCREENING_QUESTION (
        JobID TEXT,
        QuestionID TEXT,
        QuestionText TEXT NOT NULL,
        QuestionType TEXT NOT NULL,
        PRIMARY KEY (JobID, QuestionID),
        FOREIGN KEY (JobID) REFERENCES JOB_POSTING(JobID) ON DELETE CASCADE
    );

    CREATE TABLE APPLICATION (
        ApplicationID TEXT PRIMARY KEY,
        CandidateID TEXT NOT NULL,
        JobID TEXT NOT NULL,
        ResumeID TEXT NOT NULL,
        Timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        Stage TEXT NOT NULL CHECK (Stage IN ('Applied', 'Reviewed', 'Shortlisted', 'Interviewing', 'Offered', 'Hired', 'Rejected')),
        IsDraft BOOLEAN NOT NULL DEFAULT 0,
        FOREIGN KEY (CandidateID) REFERENCES CANDIDATE(CandidateID) ON DELETE CASCADE,
        FOREIGN KEY (JobID) REFERENCES JOB_POSTING(JobID) ON DELETE CASCADE,
        FOREIGN KEY (CandidateID, ResumeID) REFERENCES RESUME(CandidateID, ResumeID) ON DELETE CASCADE
    );

    CREATE TABLE APPLICATION_ANSWER (
        ApplicationID TEXT,
        JobID TEXT,
        QuestionID TEXT,
        AnswerText TEXT NOT NULL,
        AnsweredAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (ApplicationID, JobID, QuestionID),
        FOREIGN KEY (ApplicationID) REFERENCES APPLICATION(ApplicationID) ON DELETE CASCADE,
        FOREIGN KEY (JobID, QuestionID) REFERENCES SCREENING_QUESTION(JobID, QuestionID) ON DELETE CASCADE
    );

    CREATE TABLE CANDIDATE_SKILL (
        CandidateID TEXT,
        SkillID TEXT,
        ProficiencyLevel TEXT NOT NULL,
        YearsOfExperience INTEGER NOT NULL CHECK (YearsOfExperience >= 0),
        PRIMARY KEY (CandidateID, SkillID),
        FOREIGN KEY (CandidateID) REFERENCES CANDIDATE(CandidateID) ON DELETE CASCADE,
        FOREIGN KEY (SkillID) REFERENCES SKILL(SkillID) ON DELETE CASCADE
    );

    CREATE TABLE JOB_SKILL (
        JobID TEXT,
        SkillID TEXT,
        ProficiencyLevel TEXT NOT NULL,
        IsMandatory BOOLEAN NOT NULL DEFAULT 1,
        PRIMARY KEY (JobID, SkillID),
        FOREIGN KEY (JobID) REFERENCES JOB_POSTING(JobID) ON DELETE CASCADE,
        FOREIGN KEY (SkillID) REFERENCES SKILL(SkillID) ON DELETE CASCADE
    );
    ''')

    # Seed initial realistic data
    # 1. SUBSCRIPTION_PLAN
    cur.executemany('INSERT INTO SUBSCRIPTION_PLAN VALUES (?, ?, ?, ?, ?)', [
        ('PLN-01', 'Basic Free', 5, 5, 0.00),
        ('PLN-02', 'Starter Pro', 25, 30, 2499.00),
        ('PLN-03', 'Business Growth', 60, 75, 5999.00),
        ('PLN-04', 'Enterprise Scale', 150, 200, 14999.00),
        ('PLN-05', 'Unlimited Corporate', 500, 600, 39999.00)
    ])

    # 2. COMPANY
    companies = []
    industries = ['IT', 'FinTech', 'E-Commerce', 'AI', 'Cloud']
    for i in range(1, 31):
        cid = f"COMP-{i:03d}"
        ind = industries[i % len(industries)]
        companies.append((cid, f"TechCorp Global {i}", f"TCG {i}", ind, f"https://www.techcorp{i}.com", f"logo_{i}.png", "Ahmedabad, India" if i % 2 == 1 else "Bengaluru, India", "Leading global tech enterprise."))
    cur.executemany('INSERT INTO COMPANY VALUES (?, ?, ?, ?, ?, ?, ?, ?)', companies)

    # 3. SKILL
    skills = [
        ('SKL-001', 'Python', 'Backend'), ('SKL-002', 'PostgreSQL', 'Database'), ('SKL-003', 'React', 'Frontend'),
        ('SKL-004', 'Django', 'Backend'), ('SKL-005', 'Docker', 'Cloud'), ('SKL-006', 'Kubernetes', 'Cloud'),
        ('SKL-007', 'Java', 'Backend'), ('SKL-008', 'Spring Boot', 'Backend'), ('SKL-009', 'TypeScript', 'Frontend'),
        ('SKL-010', 'MongoDB', 'Database'), ('SKL-011', 'Redis', 'Database'), ('SKL-012', 'AWS', 'Cloud'),
        ('SKL-013', 'FastAPI', 'Backend'), ('SKL-014', 'Machine Learning', 'AI'), ('SKL-015', 'NLP', 'AI')
    ]
    cur.executemany('INSERT INTO SKILL VALUES (?, ?, ?)', skills)

    # 4. CANDIDATE
    candidates = []
    exp_levels = ['Entry-level', 'Mid-level', 'Senior']
    for i in range(1, 31):
        cid = f"CAN-{i:03d}"
        exp = exp_levels[i % 3]
        vis = 'Public' if i % 3 != 0 else ('Anonymous' if i % 2 == 0 else 'Hidden')
        candidates.append((cid, f"Candidate Name {i}", f"candidate{i}@gmail.com", f"+9198765{i:05d}", f"{exp} Developer", "Passionate software engineer building resilient applications.", "Ahmedabad, India" if i % 2 == 1 else "Gandhinagar, India", exp, vis))
    cur.executemany('INSERT INTO CANDIDATE VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)', candidates)

    # 5. EMPLOYER
    employers = []
    ver_status = ['Verified', 'Verified', 'Verified', 'Pending', 'Suspended']
    plans = ['PLN-01', 'PLN-02', 'PLN-03', 'PLN-04', 'PLN-05']
    for i in range(1, 25):
        eid = f"EMP-{i:03d}"
        cid = f"COMP-{i:03d}"
        pid = plans[i % 5]
        vstatus = ver_status[i % 5]
        credits = 5 + (i * 3)
        employers.append((eid, cid, pid, f"employer{i}@company.com", f"+9191234{i:05d}", vstatus, credits))
    cur.executemany('INSERT INTO EMPLOYER VALUES (?, ?, ?, ?, ?, ?, ?)', employers)

    # 6. EMPLOYER_USER
    emp_users = []
    roles = ['Admin', 'Recruiter', 'Hiring Manager']
    for i in range(1, 25):
        eid = f"EMP-{i:03d}"
        emp_users.append((eid, f"USR-{i:03d}", f"Corporate User {i}", f"recruiter{i}@company.com", roles[i % 3]))
    cur.executemany('INSERT INTO EMPLOYER_USER VALUES (?, ?, ?, ?, ?)', emp_users)

    # 7. JOB_POSTING
    jobs = []
    titles = ['Full Stack Engineer', 'Backend Developer', 'DevOps Specialist', 'Data Engineer', 'AI Research Intern', 'Frontend Architect']
    emp_types = ['Full-time', 'Part-time', 'Contract', 'Internship']
    seniorities = ['Entry-level', 'Mid-level', 'Senior', 'Lead']
    for i in range(1, 31):
        jid = f"JOB-{i:03d}"
        eid = f"EMP-{((i - 1) % 24) + 1:03d}"
        title = titles[i % len(titles)]
        salary_min = 600000.00 + (i * 50000.00)
        salary_max = salary_min + 300000.00
        status = 'Active' if i % 5 != 0 else 'Closed'
        jobs.append((jid, eid, title, f"Exciting job role for {title} focusing on high-scalability distributed architectures.", "Ahmedabad, India" if i % 2 == 1 else "Bengaluru, India", emp_types[i % len(emp_types)], seniorities[i % len(seniorities)], salary_min, salary_max, "2026-10-01 10:00:00", "2026-11-30 23:59:59", status))
    cur.executemany('INSERT INTO JOB_POSTING VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', jobs)

    # 8. JOB_PREFERENCE
    prefs = []
    work_models = ['Remote', 'Hybrid', 'On-site']
    for i in range(1, 31):
        cid = f"CAN-{i:03d}"
        prefs.append((cid, f"PREF-{i:03d}", "Software Engineer", 750000.00 + (i * 25000.00), work_models[i % 3], "2026-12-01"))
    cur.executemany('INSERT INTO JOB_PREFERENCE VALUES (?, ?, ?, ?, ?, ?)', prefs)

    # 9. RESUME
    resumes = []
    for i in range(1, 31):
        cid = f"CAN-{i:03d}"
        resumes.append((cid, f"RES-{i:03d}", f"Resume_Version_{i}.pdf", f"/uploads/resumes/candidate_{i}_cv.pdf", 1))
        # add a secondary resume for some
        if i % 2 == 0:
            resumes.append((cid, f"RES-{i:03d}-B", f"Tailored_CV_v2.pdf", f"/uploads/resumes/candidate_{i}_cv_v2.pdf", 0))
    cur.executemany('INSERT INTO RESUME VALUES (?, ?, ?, ?, ?)', resumes)

    # 10. EDUCATION
    edus = []
    for i in range(1, 31):
        cid = f"CAN-{i:03d}"
        gpa = round(7.0 + ((i % 30) * 0.1), 2)
        if gpa > 10.0: gpa = 9.5
        edus.append((cid, f"EDU-{i:03d}", "DA-IICT Gandhinagar", "B.Tech / M.Sc(IT)", "Information & Communication Technology", "2022-08-01", "2026-05-30", gpa))
    cur.executemany('INSERT INTO EDUCATION VALUES (?, ?, ?, ?, ?, ?, ?, ?)', edus)

    # 11. EMPLOYMENT_HISTORY
    hist = []
    for i in range(1, 31):
        cid = f"CAN-{i:03d}"
        hist.append((cid, f"HIST-{i:03d}", f"Tech Innovations {i}", "Software Engineer Intern", "2025-01-10", "2025-07-15", "Built microservices and scalable REST endpoints."))
    cur.executemany('INSERT INTO EMPLOYMENT_HISTORY VALUES (?, ?, ?, ?, ?, ?, ?)', hist)

    # 12. SCREENING_QUESTION
    questions = []
    for i in range(1, 31):
        jid = f"JOB-{i:03d}"
        questions.append((jid, f"Q-{i:03d}-1", "How many years of experience do you have with relational databases?", "Text"))
        questions.append((jid, f"Q-{i:03d}-2", "Are you available to join within 30 days?", "Yes/No"))
    cur.executemany('INSERT INTO SCREENING_QUESTION VALUES (?, ?, ?, ?)', questions)

    # 13. APPLICATION
    apps = []
    stages = ['Applied', 'Reviewed', 'Shortlisted', 'Interviewing', 'Offered', 'Hired', 'Rejected']
    for i in range(1, 31):
        appid = f"APP-{i:03d}"
        cid = f"CAN-{i:03d}"
        jid = f"JOB-{((i - 1) % 30) + 1:03d}"
        rid = f"RES-{i:03d}"
        stage = stages[i % len(stages)]
        apps.append((appid, cid, jid, rid, "2026-10-15 14:30:00", stage, 0))
    cur.executemany('INSERT INTO APPLICATION VALUES (?, ?, ?, ?, ?, ?, ?)', apps)

    # 14. APPLICATION_ANSWER
    answers = []
    for i in range(1, 31):
        appid = f"APP-{i:03d}"
        jid = f"JOB-{((i - 1) % 30) + 1:03d}"
        answers.append((appid, jid, f"Q-{((i - 1) % 30) + 1:03d}-1", "I have 3+ years of experience with PostgreSQL and SQLite.", "2026-10-15 14:35:00"))
        answers.append((appid, jid, f"Q-{((i - 1) % 30) + 1:03d}-2", "Yes", "2026-10-15 14:36:00"))
    cur.executemany('INSERT INTO APPLICATION_ANSWER VALUES (?, ?, ?, ?, ?)', answers)

    # 15. CANDIDATE_SKILL
    cskills = []
    profs = ['Beginner', 'Intermediate', 'Advanced']
    for i in range(1, 31):
        cid = f"CAN-{i:03d}"
        sk1 = f"SKL-{(i % 15) + 1:03d}"
        sk2 = f"SKL-{((i + 3) % 15) + 1:03d}"
        cskills.append((cid, sk1, profs[i % 3], (i % 6) + 1))
        cskills.append((cid, sk2, 'Advanced', 4))
    cur.executemany('INSERT INTO CANDIDATE_SKILL VALUES (?, ?, ?, ?)', cskills)

    # 16. JOB_SKILL
    jskills = []
    for i in range(1, 31):
        jid = f"JOB-{i:03d}"
        sk1 = f"SKL-{(i % 15) + 1:03d}"
        sk2 = f"SKL-{((i + 2) % 15) + 1:03d}"
        jskills.append((jid, sk1, 'Advanced', 1))
        jskills.append((jid, sk2, 'Intermediate', 0 if i % 2 == 0 else 1))
    cur.executemany('INSERT INTO JOB_SKILL VALUES (?, ?, ?, ?)', jskills)

    conn.commit()
    conn.close()
    print("Initialized SQLite database with all 16 tables and realistic seed data.")
    return db_path

if __name__ == '__main__':
    init_sqlite_db()
