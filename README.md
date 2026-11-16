# Job Portal Database System — Final Project GUI

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/jainil0277/job-portal-dbms)
[![GitHub Repository](https://img.shields.io/badge/GitHub-jainil0277%2Fjob--portal--dbms-181717?style=flat&logo=github)](https://github.com/jainil0277/job-portal-dbms)
[![Python](https://img.shields.io/badge/Python-3.10%2B-3776AB?style=flat&logo=python&logoColor=white)](https://www.python.org/)
[![Streamlit](https://img.shields.io/badge/Frontend-Streamlit-FF4B4B?style=flat&logo=streamlit&logoColor=white)](https://streamlit.io/)
[![Database](https://img.shields.io/badge/Database-PostgreSQL%20%7C%20SQLite-336791?style=flat&logo=postgresql&logoColor=white)](https://www.postgresql.org/)
[![License](https://img.shields.io/badge/Course-DA--IICT%20MC212-blue)](https://www.daiict.ac.in/)

**Course:** MC212 — Database Management Systems  
**Project:** Job Portal Database System  
**Team:** Team 9  
**Student ID:** 202503016  
**Institution:** DA-IICT (Dhirubhai Ambani Institute of Information and Communication Technology), Gandhinagar  
**GitHub Repository:** [https://github.com/jainil0277/job-portal-dbms](https://github.com/jainil0277/job-portal-dbms)  
**1-Click Cloud GUI (In Browser):** [Launch in GitHub Codespaces](https://codespaces.new/jainil0277/job-portal-dbms)  
**Google Drive Deliverables & Assets:** [https://drive.google.com/drive/folders/1-YPzq-1GSedNlsZaLJFIb87OvMb1X-61?usp=sharing](https://drive.google.com/drive/folders/1-YPzq-1GSedNlsZaLJFIb87OvMb1X-61?usp=sharing)  
**Gemini AI Prompting & Chat Transcript:** [https://share.gemini.google/SxSMukY7vQ4z](https://share.gemini.google/SxSMukY7vQ4z)  

---

## 🌐 Instant In-Browser Cloud Launch (Zero Install Needed)

Anyone reading this project can run and explore the live interactive GUI directly in their web browser without downloading files, installing Python, or setting up databases:

👉 **[Launch Live GUI with GitHub Codespaces](https://codespaces.new/jainil0277/job-portal-dbms)**  
*(Spins up an automated cloud environment, pre-loads the bundled database, and pops open the Streamlit GUI in a browser tab).*

---

## 🔗 Project Resources & Cloud Links

- 📂 **Google Drive Folder (High-Res Diagrams, Submissions & Deliverables):**  
  [https://drive.google.com/drive/folders/1-YPzq-1GSedNlsZaLJFIb87OvMb1X-61?usp=sharing](https://drive.google.com/drive/folders/1-YPzq-1GSedNlsZaLJFIb87OvMb1X-61?usp=sharing)  
  *Contains raw PDFs, high-resolution ER diagrams, relational schemas, and lab reports.*

- 🤖 **Gemini AI Conversation Transcript (Complete AI Collaboration Log):**  
  [https://share.gemini.google/SxSMukY7vQ4z](https://share.gemini.google/SxSMukY7vQ4z)  
  *Transparent audit log detailing the prompting workflow, schema refinement, normalization assistance, and SQL verification conducted during the project.*

---

## 🌟 Overview

This is the production-grade graphical user interface (GUI) developed for the MC212 DBMS final project. Built on top of the fully normalized **Lab 9 BCNF Schema (16 tables)** and integrating all **30 analytical and transactional queries from Lab 10A**, this system provides an end-to-end recruitment platform.

### Core Capabilities:
1. **Zero-Configuration Instant Launch:** Bundled with a fully seeded local database (`job_portal_local.db`) containing all 16 relations and 1,600 tuples. Anyone cloning this repository can launch the GUI immediately with zero database installation required.
2. **Live PostgreSQL Connectivity:** Full support for direct PostgreSQL connection (`job_portal_db` via `psycopg2` on port 5432). All updates, insertions, and status transitions persist immediately to the database.
3. **Multi-Role Portals:**
   - **Candidate Portal:** Multi-filter job search, qualification setup, resume manager (enforcing 5-resume cap BC2), and duplicate application prevention.
   - **Employer & Recruiter Portal:** Job posting lifecycle, automatic credit deduction via PostgreSQL stored function, live applicant tracking system (ATS), and stage progression pipeline.
   - **Platform Operations & Admin:** Employer verification workflow, live platform KPI metrics, and analytical reports.
   - **Lab 10A SQL Query Explorer:** Pre-loaded runner for all 30 Lab 10A queries with execution times, interactive data tables, and an open SQL console.

---

## 🚀 Quick Start (Anyone Can Run This in 1 Minute)

### 1. Clone the Repository
```bash
git clone https://github.com/jainil0277/job-portal-dbms.git
cd job-portal-dbms
```

### 2. Launch the Application

#### On macOS / Linux:
```bash
chmod +x run.sh
./run.sh
```

#### On Windows:
Double-click `run.bat` or run in Command Prompt:
```cmd
run.bat
```

#### Or Run Manually with Python:
```bash
pip install -r requirements.txt
streamlit run app.py
```

The application will launch automatically in your default browser at:  
👉 **`http://localhost:8501`**

---

## 🔌 Database Connectivity Options

The application works out of the box in two modes:

### Mode 1: Instant Bundled Mode (Default & Automatic)
- The app automatically starts in SQLite mode using the pre-seeded `job_portal_local.db` if PostgreSQL is not installed locally.
- All 16 tables and 1,600 pre-generated realistic records are loaded instantly.
- You can perform all search, apply, posting, and ATS actions with zero setup.

### Mode 2: Connect to PostgreSQL (Production)
- If you have PostgreSQL installed locally:
  - Database: `job_portal_db`
  - User: `postgres`
  - Password: `team9` (or change it in the sidebar)
- To load the schema and data into your PostgreSQL instance:
  ```bash
  psql -U postgres -c "CREATE DATABASE job_portal_db;"
  psql -U postgres -d job_portal_db -f sql/schema_dump.sql
  psql -U postgres -d job_portal_db -f sql/data_dump.sql
  ```
- In the GUI sidebar, select **PostgreSQL** under Database Connection. The connection pill will turn green.

---

## 📂 Project Directory Structure

```
job-portal-dbms/
├── app.py                      # Main Streamlit UI application with 4 portals
├── db.py                       # Unified database driver (PostgreSQL + SQLite)
├── schema_sqlite.py            # Local database initialization & seed generator
├── job_portal_local.db         # Bundled offline database with all 16 tables
├── queries.json                # Structured catalog of all 30 Lab 10A queries
├── run.sh                      # 1-Click launcher for macOS & Linux
├── run.bat                     # 1-Click launcher for Windows
├── requirements.txt            # Python dependency manifest
├── README.md                   # Project documentation and guide
├── docs/                       # Final Project Report (PDF and Markdown)
│   ├── Team-9_202503016_Final_Report.pdf
│   └── Team-9_202503016_Final_Report.md
└── sql/
    ├── schema_dump.sql         # PostgreSQL schema dump (tables, PK/FK, triggers)
    ├── data_dump.sql           # Full database records dump (1,600 tuples)
    └── lab10a_queries.sql      # All 30 Lab 10A SQL queries with problem statements
```

---

## 🏆 Lab Alignment Matrix

| Project Milestone | Relational Artifact | GUI Implementation |
| :--- | :--- | :--- |
| **Lab 4 & 5 (SRS)** | 41 Product Functions (F1 - F41), 10 Business Constraints | Form validation, profile privacy, credit constraints, duplicate blocking |
| **Lab 6 & 7b (ERD)** | 16 Normalized Entities (V-4 Complete Conceptual Schema) | Complete entity coverage with weak entity relationships |
| **Lab 8 (Relational)** | Relational Schema Mapping, Composite Keys, Foreign Keys | Parameterized relational CRUD queries matching exact keys |
| **Lab 9 (DDL & BCNF)** | PostgreSQL DDL script with CHECK constraints & ENUMs | Dropdown enums, GPA [0-10] bounds, salary constraints |
| **Lab 10A (SQL Bank)** | 30 Complex Queries, deduct credit procedure, duplicate trigger | Dedicated interactive Query Explorer + live analytics dashboards |

---

## 📄 License & Academic Attribution
Developed as part of the MC212 Database Management Systems course at **DA-IICT**, Gandhinagar, Autumn Semester 2024-25 by **Team 9 (Student ID: 202503016)**.
All rights reserved.
