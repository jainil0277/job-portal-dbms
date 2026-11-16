# Job Portal Database System — Final Project GUI

**Course:** MC212 — Database Management Systems  
**Project:** Job Portal Database System  
**Team:** Team 9  
**Student ID:** 202503016  
**Institution:** DA-IICT (Dhirubhai Ambani Institute of Information and Communication Technology), Gandhinagar  

---

## 🌟 Overview

This is the comprehensive, production-grade graphical user interface (GUI) developed for the MC212 DBMS final project. Built on top of the fully normalized **Lab 9 BCNF Schema (16 tables)** and integrating all **30 analytical and transactional queries from Lab 10A**, this system provides an end-to-end recruitment platform.

### Core Capabilities:
1. **Live PostgreSQL Connectivity:** Direct connection to `job_portal_db` via `psycopg2` on port 5432. All updates, insertions, and status transitions persist immediately to the database.
2. **Offline Fallback Engine:** Automatic SQLite mirror pre-seeded with all 16 relations and realistic data, allowing standalone demonstration on any system without database configuration.
3. **Multi-Role Portal Access:**
   - 👤 **Candidate Portal:** Job discovery, multi-filter search, resume version management, dynamic custom screening answers, and duplicate application prevention.
   - 🏢 **Employer & Recruiter Portal:** Job posting lifecycle, automatic credit deduction via PostgreSQL stored function, live applicant tracking system (ATS), and stage progression pipeline.
   - 🛡️ **Platform Operations & Admin:** Employer verification workflow, platform KPI analytics, and Lab 10A analytical reports (tier revenue, top-paying jobs by industry, unfilled roles, time-to-hire metrics).
   - ⚡ **Lab 10A SQL Query Explorer:** Pre-loaded query runner for all 30 Lab 10A queries with English descriptions, execution times, interactive data tables, and an open SQL console.

---

## 🚀 How to Run the Application

### Prerequisites
- Python 3.10+ (tested with Python 3.11 & 3.14)
- PostgreSQL (optional if using the built-in SQLite mirror)

### Quick Start (1-Click)
```bash
cd job_portal_app
./run.sh
```

### Manual Launch
```bash
pip install -r requirements.txt
streamlit run app.py
```

The application will launch automatically in your default browser at:
👉 **`http://localhost:8501`**

---

## 🔌 Database Configuration

* **PostgreSQL (Default & Recommended):**
  - Host: `localhost`
  - Port: `5432`
  - Database: `job_portal_db`
  - Username: `postgres`
  - Password: `team9`
  
  *The application auto-connects to this instance on startup.*

* **Offline Mirror Mode:**
  - Select **SQLite (Offline Mirror)** in the sidebar to run the application entirely offline.

---

## 📂 Project Directory Structure

```
job_portal_app/
├── app.py                  # Main Streamlit UI application with 4 portals
├── db.py                   # Unified database driver (PostgreSQL + SQLite)
├── schema_sqlite.py        # Local database initialization & seed generator
├── queries.json            # Structured catalog of all 30 Lab 10A queries
├── run.sh                  # Shell launcher script
├── requirements.txt        # Python dependency manifest
├── README.md               # Project documentation and guide
└── sql/
    ├── schema_dump.sql     # Live PostgreSQL schema dump with tables, PK/FK, triggers
    ├── data_dump.sql       # Full database records dump
    └── lab10a_queries.sql  # All 30 Lab 10A SQL queries with English problem statements
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

