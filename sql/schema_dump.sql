--
-- PostgreSQL database dump
--

\restrict 3DOafhtZ8Y4VCCmmt0hNyXZglRbPNMrp2QdHCLViMbqago6gV25tXzQh75HX6KF

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: check_duplicate_application(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.check_duplicate_application() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM APPLICATION 
        WHERE CandidateID = NEW.CandidateID 
          AND JobID = NEW.JobID 
          AND Stage NOT IN ('Rejected')
    ) THEN
        RAISE EXCEPTION 'Candidate has already applied for this position.';
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.check_duplicate_application() OWNER TO postgres;

--
-- Name: deduct_employer_credit(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.deduct_employer_credit(emp_id character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE EMPLOYER 
    SET CreditsRemaining = CreditsRemaining - 1 
    WHERE EmployerID = emp_id AND CreditsRemaining > 0;
END;
$$;


ALTER FUNCTION public.deduct_employer_credit(emp_id character varying) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: application; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.application (
    applicationid character varying(50) NOT NULL,
    candidateid character varying(50) NOT NULL,
    jobid character varying(50) NOT NULL,
    resumeid character varying(50) NOT NULL,
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    stage character varying(50) NOT NULL,
    isdraft boolean DEFAULT false NOT NULL,
    CONSTRAINT application_stage_check CHECK (((stage)::text = ANY ((ARRAY['Applied'::character varying, 'Reviewed'::character varying, 'Shortlisted'::character varying, 'Interviewing'::character varying, 'Offered'::character varying, 'Hired'::character varying, 'Rejected'::character varying])::text[])))
);


ALTER TABLE public.application OWNER TO postgres;

--
-- Name: application_answer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.application_answer (
    applicationid character varying(50) NOT NULL,
    jobid character varying(50) NOT NULL,
    questionid character varying(50) NOT NULL,
    answertext text NOT NULL,
    answeredat timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.application_answer OWNER TO postgres;

--
-- Name: candidate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.candidate (
    candidateid character varying(50) NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(150) NOT NULL,
    phone character varying(20) NOT NULL,
    headline character varying(200),
    summary text,
    location character varying(150) NOT NULL,
    experiencelevel character varying(50) NOT NULL,
    profilevisibility character varying(20) NOT NULL,
    CONSTRAINT candidate_profilevisibility_check CHECK (((profilevisibility)::text = ANY ((ARRAY['Public'::character varying, 'Anonymous'::character varying, 'Hidden'::character varying])::text[])))
);


ALTER TABLE public.candidate OWNER TO postgres;

--
-- Name: candidate_skill; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.candidate_skill (
    candidateid character varying(50) NOT NULL,
    skillid character varying(50) NOT NULL,
    proficiencylevel character varying(50) NOT NULL,
    yearsofexperience integer NOT NULL,
    CONSTRAINT candidate_skill_yearsofexperience_check CHECK ((yearsofexperience >= 0))
);


ALTER TABLE public.candidate_skill OWNER TO postgres;

--
-- Name: company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company (
    companyid character varying(50) NOT NULL,
    name character varying(150) NOT NULL,
    tradename character varying(150),
    industry character varying(100) NOT NULL,
    website character varying(255),
    logo character varying(255),
    hq_location character varying(150) NOT NULL,
    description text
);


ALTER TABLE public.company OWNER TO postgres;

--
-- Name: education; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.education (
    candidateid character varying(50) NOT NULL,
    educationid character varying(50) NOT NULL,
    institution character varying(150) NOT NULL,
    degree character varying(100) NOT NULL,
    fieldofstudy character varying(100) NOT NULL,
    startdate date NOT NULL,
    enddate date,
    gpa numeric(3,2),
    CONSTRAINT education_gpa_check CHECK (((gpa >= (0)::numeric) AND (gpa <= 10.0)))
);


ALTER TABLE public.education OWNER TO postgres;

--
-- Name: employer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employer (
    employerid character varying(50) NOT NULL,
    companyid character varying(50) NOT NULL,
    planid character varying(50) NOT NULL,
    email character varying(150) NOT NULL,
    phone character varying(20) NOT NULL,
    verificationstatus character varying(30) NOT NULL,
    creditsremaining integer NOT NULL,
    CONSTRAINT employer_creditsremaining_check CHECK ((creditsremaining >= 0)),
    CONSTRAINT employer_verificationstatus_check CHECK (((verificationstatus)::text = ANY ((ARRAY['Pending'::character varying, 'Verified'::character varying, 'Rejected'::character varying, 'Suspended'::character varying])::text[])))
);


ALTER TABLE public.employer OWNER TO postgres;

--
-- Name: employer_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employer_user (
    employerid character varying(50) NOT NULL,
    userid character varying(50) NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(150) NOT NULL,
    role character varying(50) NOT NULL,
    CONSTRAINT employer_user_role_check CHECK (((role)::text = ANY ((ARRAY['Admin'::character varying, 'Recruiter'::character varying, 'Hiring Manager'::character varying])::text[])))
);


ALTER TABLE public.employer_user OWNER TO postgres;

--
-- Name: employment_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employment_history (
    candidateid character varying(50) NOT NULL,
    historyid character varying(50) NOT NULL,
    previouscompanyname character varying(150) NOT NULL,
    jobtitle character varying(100) NOT NULL,
    startdate date NOT NULL,
    enddate date,
    description text
);


ALTER TABLE public.employment_history OWNER TO postgres;

--
-- Name: job_posting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_posting (
    jobid character varying(50) NOT NULL,
    employerid character varying(50) NOT NULL,
    title character varying(150) NOT NULL,
    description text NOT NULL,
    location character varying(150) NOT NULL,
    employmenttype character varying(50) NOT NULL,
    senioritylevel character varying(50) NOT NULL,
    salarymin numeric(12,2) NOT NULL,
    salarymax numeric(12,2) NOT NULL,
    postdate timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    expirydate timestamp without time zone NOT NULL,
    status character varying(30) NOT NULL,
    CONSTRAINT job_posting_check CHECK ((salarymax >= salarymin)),
    CONSTRAINT job_posting_salarymin_check CHECK ((salarymin >= (0)::numeric)),
    CONSTRAINT job_posting_status_check CHECK (((status)::text = ANY ((ARRAY['Draft'::character varying, 'Active'::character varying, 'Paused'::character varying, 'Closed'::character varying, 'Expired'::character varying])::text[])))
);


ALTER TABLE public.job_posting OWNER TO postgres;

--
-- Name: job_preference; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_preference (
    candidateid character varying(50) NOT NULL,
    prefid character varying(50) NOT NULL,
    targettitle character varying(100) NOT NULL,
    expectedsalary numeric(12,2) NOT NULL,
    preferredworkmodel character varying(50) NOT NULL,
    availabilitydate date NOT NULL,
    CONSTRAINT job_preference_expectedsalary_check CHECK ((expectedsalary >= (0)::numeric))
);


ALTER TABLE public.job_preference OWNER TO postgres;

--
-- Name: job_skill; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_skill (
    jobid character varying(50) NOT NULL,
    skillid character varying(50) NOT NULL,
    proficiencylevel character varying(50) NOT NULL,
    ismandatory boolean DEFAULT true NOT NULL
);


ALTER TABLE public.job_skill OWNER TO postgres;

--
-- Name: resume; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resume (
    candidateid character varying(50) NOT NULL,
    resumeid character varying(50) NOT NULL,
    versionname character varying(100) NOT NULL,
    filepath character varying(255) NOT NULL,
    isdefault boolean DEFAULT false NOT NULL
);


ALTER TABLE public.resume OWNER TO postgres;

--
-- Name: screening_question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.screening_question (
    jobid character varying(50) NOT NULL,
    questionid character varying(50) NOT NULL,
    questiontext text NOT NULL,
    questiontype character varying(50) NOT NULL
);


ALTER TABLE public.screening_question OWNER TO postgres;

--
-- Name: skill; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skill (
    skillid character varying(50) NOT NULL,
    skillname character varying(100) NOT NULL,
    category character varying(50) NOT NULL
);


ALTER TABLE public.skill OWNER TO postgres;

--
-- Name: subscription_plan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscription_plan (
    planid character varying(50) NOT NULL,
    tiername character varying(50) NOT NULL,
    postinglimit integer NOT NULL,
    credits integer NOT NULL,
    price numeric(10,2) NOT NULL,
    CONSTRAINT subscription_plan_credits_check CHECK ((credits >= 0)),
    CONSTRAINT subscription_plan_postinglimit_check CHECK ((postinglimit >= 0)),
    CONSTRAINT subscription_plan_price_check CHECK ((price >= (0)::numeric))
);


ALTER TABLE public.subscription_plan OWNER TO postgres;

--
-- Name: application_answer application_answer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_answer
    ADD CONSTRAINT application_answer_pkey PRIMARY KEY (applicationid, jobid, questionid);


--
-- Name: application application_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application
    ADD CONSTRAINT application_pkey PRIMARY KEY (applicationid);


--
-- Name: candidate candidate_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate
    ADD CONSTRAINT candidate_email_key UNIQUE (email);


--
-- Name: candidate candidate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate
    ADD CONSTRAINT candidate_pkey PRIMARY KEY (candidateid);


--
-- Name: candidate_skill candidate_skill_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_skill
    ADD CONSTRAINT candidate_skill_pkey PRIMARY KEY (candidateid, skillid);


--
-- Name: company company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_pkey PRIMARY KEY (companyid);


--
-- Name: education education_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.education
    ADD CONSTRAINT education_pkey PRIMARY KEY (candidateid, educationid);


--
-- Name: employer employer_companyid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employer
    ADD CONSTRAINT employer_companyid_key UNIQUE (companyid);


--
-- Name: employer employer_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employer
    ADD CONSTRAINT employer_email_key UNIQUE (email);


--
-- Name: employer employer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employer
    ADD CONSTRAINT employer_pkey PRIMARY KEY (employerid);


--
-- Name: employer_user employer_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employer_user
    ADD CONSTRAINT employer_user_pkey PRIMARY KEY (employerid, userid);


--
-- Name: employment_history employment_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employment_history
    ADD CONSTRAINT employment_history_pkey PRIMARY KEY (candidateid, historyid);


--
-- Name: job_posting job_posting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_posting
    ADD CONSTRAINT job_posting_pkey PRIMARY KEY (jobid);


--
-- Name: job_preference job_preference_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_preference
    ADD CONSTRAINT job_preference_pkey PRIMARY KEY (candidateid, prefid);


--
-- Name: job_skill job_skill_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_skill
    ADD CONSTRAINT job_skill_pkey PRIMARY KEY (jobid, skillid);


--
-- Name: resume resume_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resume
    ADD CONSTRAINT resume_pkey PRIMARY KEY (candidateid, resumeid);


--
-- Name: screening_question screening_question_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.screening_question
    ADD CONSTRAINT screening_question_pkey PRIMARY KEY (jobid, questionid);


--
-- Name: skill skill_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skill
    ADD CONSTRAINT skill_pkey PRIMARY KEY (skillid);


--
-- Name: skill skill_skillname_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skill
    ADD CONSTRAINT skill_skillname_key UNIQUE (skillname);


--
-- Name: subscription_plan subscription_plan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscription_plan
    ADD CONSTRAINT subscription_plan_pkey PRIMARY KEY (planid);


--
-- Name: subscription_plan subscription_plan_tiername_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscription_plan
    ADD CONSTRAINT subscription_plan_tiername_key UNIQUE (tiername);


--
-- Name: application trg_prevent_duplicate_application; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_prevent_duplicate_application BEFORE INSERT ON public.application FOR EACH ROW EXECUTE FUNCTION public.check_duplicate_application();


--
-- Name: application_answer fk_ans_app; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_answer
    ADD CONSTRAINT fk_ans_app FOREIGN KEY (applicationid) REFERENCES public.application(applicationid) ON DELETE CASCADE;


--
-- Name: application_answer fk_ans_question; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_answer
    ADD CONSTRAINT fk_ans_question FOREIGN KEY (jobid, questionid) REFERENCES public.screening_question(jobid, questionid) ON DELETE CASCADE;


--
-- Name: application fk_app_candidate; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application
    ADD CONSTRAINT fk_app_candidate FOREIGN KEY (candidateid) REFERENCES public.candidate(candidateid) ON DELETE CASCADE;


--
-- Name: application fk_app_job; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application
    ADD CONSTRAINT fk_app_job FOREIGN KEY (jobid) REFERENCES public.job_posting(jobid) ON DELETE CASCADE;


--
-- Name: application fk_app_resume; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application
    ADD CONSTRAINT fk_app_resume FOREIGN KEY (candidateid, resumeid) REFERENCES public.resume(candidateid, resumeid) ON DELETE CASCADE;


--
-- Name: candidate_skill fk_candskill_candidate; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_skill
    ADD CONSTRAINT fk_candskill_candidate FOREIGN KEY (candidateid) REFERENCES public.candidate(candidateid) ON DELETE CASCADE;


--
-- Name: candidate_skill fk_candskill_skill; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_skill
    ADD CONSTRAINT fk_candskill_skill FOREIGN KEY (skillid) REFERENCES public.skill(skillid) ON DELETE CASCADE;


--
-- Name: education fk_edu_candidate; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.education
    ADD CONSTRAINT fk_edu_candidate FOREIGN KEY (candidateid) REFERENCES public.candidate(candidateid) ON DELETE CASCADE;


--
-- Name: employer fk_employer_company; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employer
    ADD CONSTRAINT fk_employer_company FOREIGN KEY (companyid) REFERENCES public.company(companyid) ON DELETE CASCADE;


--
-- Name: employer fk_employer_plan; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employer
    ADD CONSTRAINT fk_employer_plan FOREIGN KEY (planid) REFERENCES public.subscription_plan(planid);


--
-- Name: employer_user fk_empuser_employer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employer_user
    ADD CONSTRAINT fk_empuser_employer FOREIGN KEY (employerid) REFERENCES public.employer(employerid) ON DELETE CASCADE;


--
-- Name: employment_history fk_hist_candidate; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employment_history
    ADD CONSTRAINT fk_hist_candidate FOREIGN KEY (candidateid) REFERENCES public.candidate(candidateid) ON DELETE CASCADE;


--
-- Name: job_posting fk_job_employer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_posting
    ADD CONSTRAINT fk_job_employer FOREIGN KEY (employerid) REFERENCES public.employer(employerid) ON DELETE CASCADE;


--
-- Name: job_preference fk_jobpref_candidate; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_preference
    ADD CONSTRAINT fk_jobpref_candidate FOREIGN KEY (candidateid) REFERENCES public.candidate(candidateid) ON DELETE CASCADE;


--
-- Name: job_skill fk_jobskill_job; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_skill
    ADD CONSTRAINT fk_jobskill_job FOREIGN KEY (jobid) REFERENCES public.job_posting(jobid) ON DELETE CASCADE;


--
-- Name: job_skill fk_jobskill_skill; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_skill
    ADD CONSTRAINT fk_jobskill_skill FOREIGN KEY (skillid) REFERENCES public.skill(skillid) ON DELETE CASCADE;


--
-- Name: screening_question fk_question_job; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.screening_question
    ADD CONSTRAINT fk_question_job FOREIGN KEY (jobid) REFERENCES public.job_posting(jobid) ON DELETE CASCADE;


--
-- Name: resume fk_resume_candidate; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resume
    ADD CONSTRAINT fk_resume_candidate FOREIGN KEY (candidateid) REFERENCES public.candidate(candidateid) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict 3DOafhtZ8Y4VCCmmt0hNyXZglRbPNMrp2QdHCLViMbqago6gV25tXzQh75HX6KF

