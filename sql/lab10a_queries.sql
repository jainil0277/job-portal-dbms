-- ==========================================================
-- MC212 DBMS | Team 9: Job Portal Database System
-- Lab 10A: Complete SQL Query Bank (Queries 1 - 30)
-- ==========================================================

-- Query 1: Find all candidate profiles that are set to 'Public' visibility.
SELECT CandidateID, Name, Email, ExperienceLevel  
FROM CANDIDATE  
WHERE ProfileVisibility = 'Public';;

-- Query 2: Retrieve all active job postings that offer a minimum salary greater than or equal to 800,000 INR.
SELECT JobID, Title, Location, SalaryMin, SalaryMax  
FROM JOB_POSTING  
WHERE Status = 'Active' AND SalaryMin >= 800000.00;;

-- Query 3: List all registered companies headquartered in 'Ahmedabad, India'.
SELECT CompanyID, Name, Industry, Website  
FROM COMPANY  
WHERE HQ_Location = 'Ahmedabad, India';;

-- Query 4: Retrieve all default resumes uploaded across candidate profiles.
SELECT CandidateID, ResumeID, VersionName, FilePath  
FROM RESUME  
WHERE IsDefault = TRUE;;

-- Query 5: List all subscription plans with a price under 10,000 INR.
SELECT PlanID, TierName, PostingLimit, Credits, Price  
FROM SUBSCRIPTION_PLAN  
WHERE Price < 10000.00;;

-- Query 6: Find all verified employer accounts that have more than 10 posting credits remaining.
SELECT EmployerID, CompanyID, Email, CreditsRemaining  
FROM EMPLOYER  
WHERE VerificationStatus = 'Verified' AND CreditsRemaining > 10;;

-- Query 7: List all screening questions categorized as 'Text' type.
SELECT JobID, QuestionID, QuestionText  
FROM SCREENING_QUESTION  
WHERE QuestionType = 'Text';;

-- Query 8: Retrieve all job applications that are currently in the 'Interviewing' stage.
SELECT ApplicationID, CandidateID, JobID, Timestamp  
FROM APPLICATION  
WHERE Stage = 'Interviewing' AND IsDraft = FALSE;;

-- Query 9: List all candidates with an 'Entry-level' experience rating.
SELECT CandidateID, Name, Email, Phone  
FROM CANDIDATE  
WHERE ExperienceLevel = 'Entry-level';;

-- Query 10: Find all technical skills categorized under 'Backend'.
SELECT SkillID, SkillName  
FROM SKILL  
WHERE Category = 'Backend';;

-- Query 11: Retrieve all job postings alongside their corresponding employer's contact email and verification status.
SELECT j.JobID, j.Title, j.Location, e.Email AS EmployerEmail, 
e.VerificationStatus  
FROM JOB_POSTING j 
JOIN EMPLOYER e ON j.EmployerID = e.EmployerID;;

-- Query 12: Count the total number of applications submitted for each job posting.
SELECT j.JobID, j.Title, COUNT(a.ApplicationID) AS TotalApplications  
FROM JOB_POSTING j 
LEFT JOIN APPLICATION a ON j.JobID = a.JobID 
GROUP BY j.JobID, j.Title;;

-- Query 13: List all candidates and the names of the skills they possess along with their proficiency levels. --- PAGE 13 ---
SELECT c.CandidateID, c.Name, s.SkillName, cs.ProficiencyLevel, 
cs.YearsOfExperience  
FROM CANDIDATE c 
JOIN CANDIDATE_SKILL cs ON c.CandidateID = cs.CandidateID 
JOIN SKILL s ON cs.SkillID = s.SkillID;;

-- Query 14: Find all educational qualifications belonging to candidates who applied for job 'JOB-001'.
SELECT DISTINCT c.Name, ed.Institution, ed.Degree, ed.GPA  
FROM APPLICATION a 
JOIN CANDIDATE c ON a.CandidateID = c.CandidateID 
JOIN EDUCATION ed ON c.CandidateID = ed.CandidateID 
WHERE a.JobID = 'JOB-001';;

-- Query 15: Calculate the average expected salary of candidates grouped by their preferred work model.
SELECT PreferredWorkModel, AVG(ExpectedSalary) AS AvgExpectedSalary  
FROM JOB_PREFERENCE  
GROUP BY PreferredWorkModel;;

-- Query 16: List all employers along with the tier name and price of their active subscription plan.
SELECT e.EmployerID, e.Email, sp.TierName, sp.Price  
FROM EMPLOYER e 
JOIN SUBSCRIPTION_PLAN sp ON e.PlanID = sp.PlanID;;

-- Query 17: Find mandatory skills required for each active job posting.
SELECT j.JobID, j.Title, s.SkillName, js.ProficiencyLevel  
FROM JOB_POSTING j 
JOIN JOB_SKILL js ON j.JobID = js.JobID 
JOIN SKILL s ON js.SkillID = s.SkillID 
WHERE js.IsMandatory = TRUE AND j.Status = 'Active';;

-- Query 18: Display employer user accounts along with their parent company name and corporate role.
SELECT eu.UserID, eu.Name AS UserName, eu.Role, c.Name AS CompanyName  
FROM EMPLOYER_USER eu 
JOIN EMPLOYER e ON eu.EmployerID = e.EmployerID 
JOIN COMPANY c ON e.CompanyID = c.CompanyID;;

-- Query 19: Find candidates who possess all mandatory skills required for job posting 'JOB-001'.
SELECT c.CandidateID, c.Name  
FROM CANDIDATE c 
WHERE NOT EXISTS ( 
    SELECT js.SkillID  
    FROM JOB_SKILL js  
    WHERE js.JobID = 'JOB-001' AND js.IsMandatory = TRUE 
    EXCEPT 
    SELECT cs.SkillID  
    FROM CANDIDATE_SKILL cs  
    WHERE cs.CandidateID = c.CandidateID 
);;

-- Query 20: List all job applications including candidate name, job title, company name, and the file path of the attached resume.
SELECT a.ApplicationID, c.Name AS CandidateName, j.Title AS JobTitle, 
comp.Name AS CompanyName, r.FilePath  
FROM APPLICATION a 
JOIN CANDIDATE c ON a.CandidateID = c.CandidateID 
JOIN JOB_POSTING j ON a.JobID = j.JobID 
JOIN EMPLOYER e ON j.EmployerID = e.EmployerID 
JOIN COMPANY comp ON e.CompanyID = comp.CompanyID 
JOIN RESUME r ON a.CandidateID = r.CandidateID AND a.ResumeID = r.ResumeID;;

-- Query 21: Retrieve the top 3 highest-paying job postings per industry using window ranking functions.
WITH RankedJobs AS ( 
    SELECT j.JobID, j.Title, c.Industry, j.SalaryMax, 
           DENSE_RANK() OVER (PARTITION BY c.Industry ORDER BY j.SalaryMax 
DESC) AS rank_num 
    FROM JOB_POSTING j 
    JOIN EMPLOYER e ON j.EmployerID = e.EmployerID 
    JOIN COMPANY c ON e.CompanyID = c.CompanyID 
) 
SELECT JobID, Title, Industry, SalaryMax  
FROM RankedJobs  
WHERE rank_num <= 3;;

-- Query 22: Find candidates who have submitted applications to more than 3 different companies.
SELECT c.CandidateID, c.Name, COUNT(DISTINCT e.CompanyID) AS 
CompaniesAppliedTo  
FROM CANDIDATE c 
JOIN APPLICATION a ON c.CandidateID = a.CandidateID 
JOIN JOB_POSTING j ON a.JobID = j.JobID 
JOIN EMPLOYER e ON j.EmployerID = e.EmployerID 
GROUP BY c.CandidateID, c.Name 
HAVING COUNT(DISTINCT e.CompanyID) > 3;;

-- Query 23: Retrieve screening questions and their submitted candidate answers for a specific application 'APP-001'.
SELECT sq.QuestionID, sq.QuestionText, aa.AnswerText, aa.AnsweredAt  
FROM APPLICATION_ANSWER aa 
JOIN SCREENING_QUESTION sq ON aa.JobID = sq.JobID AND aa.QuestionID = 
sq.QuestionID 
WHERE aa.ApplicationID = 'APP-001';;

-- Query 24: Identify companies that have posted jobs but have not received any applications yet.
SELECT c.CompanyID, c.Name  
FROM COMPANY c 
JOIN EMPLOYER e ON c.CompanyID = e.CompanyID 
JOIN JOB_POSTING j ON e.EmployerID = j.EmployerID 
WHERE j.JobID NOT IN (SELECT DISTINCT JobID FROM APPLICATION);;

-- Query 25: Calculate total revenue generated per subscription tier based on active employer subscriptions.
SELECT sp.TierName, COUNT(e.EmployerID) AS TotalSubscribers, SUM(sp.Price) AS 
TotalRevenue  
FROM SUBSCRIPTION_PLAN sp 
JOIN EMPLOYER e ON sp.PlanID = e.PlanID 
GROUP BY sp.TierName;;

-- Query 26: Find candidates whose expected salary is lower than the minimum salary offered by job postings in their location.
SELECT DISTINCT c.CandidateID, c.Name, jp.ExpectedSalary, j.Title, 
j.SalaryMin, j.Location  
FROM CANDIDATE c 
JOIN JOB_PREFERENCE jp ON c.CandidateID = jp.CandidateID 
JOIN JOB_POSTING j ON j.Location = c.Location 
WHERE jp.ExpectedSalary < j.SalaryMin;;

-- Query 27: List candidates who have earned a GPA above 8.5 and possess at least one 'Advanced' skill.
SELECT DISTINCT c.CandidateID, c.Name, ed.GPA, s.SkillName, 
cs.ProficiencyLevel  
FROM CANDIDATE c 
JOIN EDUCATION ed ON c.CandidateID = ed.CandidateID 
JOIN CANDIDATE_SKILL cs ON c.CandidateID = cs.CandidateID 
JOIN SKILL s ON cs.SkillID = s.SkillID 
WHERE ed.GPA > 8.50 AND cs.ProficiencyLevel = 'Advanced';;

-- Query 28: Calculate the average time to hire per job posting for applications that reached the 'Hired' stage.
SELECT j.JobID, j.Title, AVG(EXTRACT(DAY FROM (aa.AnsweredAt - a.Timestamp))) 
AS AvgDaysToHire  
FROM APPLICATION a 
JOIN JOB_POSTING j ON a.JobID = j.JobID 
LEFT JOIN APPLICATION_ANSWER aa ON a.ApplicationID = aa.ApplicationID 
WHERE a.Stage = 'Hired' 
GROUP BY j.JobID, j.Title;;

-- Query 29: Create a PostgreSQL function to deduct one credit from an employer upon posting a job.
CREATE OR REPLACE FUNCTION deduct_employer_credit(emp_id VARCHAR)  
RETURNS VOID AS $$ 
BEGIN 
    UPDATE EMPLOYER  
    SET CreditsRemaining = CreditsRemaining - 1  
    WHERE EmployerID = emp_id AND CreditsRemaining > 0; 
END; 
$$ LANGUAGE plpgsql;;

-- Query 30: Create an automated trigger that prevents candidates from submitting duplicate active applications to the same job posting.
CREATE OR REPLACE FUNCTION check_duplicate_application()  
RETURNS TRIGGER AS $$ 
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
$$ LANGUAGE plpgsql;

