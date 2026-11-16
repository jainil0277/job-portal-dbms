import streamlit as st
import pandas as pd
import json
import os
import sys
import time

st.set_page_config(page_title="Job Portal System | Enterprise Database Platform", layout="wide")

sys.path.insert(0, os.path.dirname(__file__))
from db import db_manager

# ──────────────────────────────────────────────────────────────────────────────
# GLOBAL CSS
# ──────────────────────────────────────────────────────────────────────────────

CUSTOM_CSS = """
<style>
/* --- Imports --- */
@import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&family=JetBrains+Mono:wght@400;500;600&display=swap');

/* --- Modern Studio Design System Tokens --- */
:root {
    --bg-main: #0B0F17;
    --bg-surface: #111827;
    --bg-card: #151D2A;
    --bg-card-hover: #1A2434;
    --bg-subtle: #1E293B;
    
    --border-color: rgba(255, 255, 255, 0.08);
    --border-hover: rgba(255, 255, 255, 0.16);
    --border-accent: #2563EB;
    
    --text-primary: #F8FAFC;
    --text-secondary: #94A3B8;
    --text-muted: #64748B;
    
    --brand-blue: #3B82F6;
    --brand-indigo: #6366F1;
    --brand-cyan: #06B6D4;
    --brand-emerald: #10B981;
    --brand-amber: #F59E0B;
    --brand-rose: #F43F5E;
}

/* --- Global Overrides --- */
html, body, [data-testid="stAppViewContainer"] {
    font-family: 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif !important;
    color: var(--text-primary);
    background-color: var(--bg-main) !important;
}

[data-testid="stAppViewContainer"] {
    background: radial-gradient(circle at 15% 10%, #172033 0%, var(--bg-main) 60%) !important;
}

[data-testid="stHeader"] {
    background: rgba(11, 15, 23, 0.8) !important;
    backdrop-filter: blur(12px);
    border-bottom: 1px solid var(--border-color);
}

/* --- Sidebar --- */
[data-testid="stSidebar"] {
    background: #0D131F !important;
    border-right: 1px solid var(--border-color) !important;
}
[data-testid="stSidebar"] * {
    color: var(--text-primary) !important;
}
[data-testid="stSidebar"] hr {
    border-color: var(--border-color);
}

/* --- Editorial Header Banner --- */
.header-banner {
    background: linear-gradient(180deg, #162032 0%, #111827 100%);
    border: 1px solid var(--border-color);
    border-left: 4px solid var(--brand-blue);
    border-radius: 8px;
    padding: 24px 28px;
    margin-bottom: 24px;
    box-shadow: 0 4px 20px -2px rgba(0, 0, 0, 0.5);
}
.header-tag {
    font-size: 0.72rem;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 0.12em;
    color: var(--brand-cyan);
    margin-bottom: 6px;
}
.header-title {
    font-size: 1.65rem;
    font-weight: 800;
    color: #FFFFFF;
    margin: 0;
    letter-spacing: -0.02em;
}
.header-sub {
    color: var(--text-secondary);
    font-size: 0.95rem;
    margin-top: 4px;
    font-weight: 400;
}

/* --- Clean Card Architecture --- */
.card {
    background: var(--bg-card);
    border: 1px solid var(--border-color);
    border-radius: 8px;
    padding: 20px 24px;
    margin-bottom: 16px;
    box-shadow: 0 4px 16px rgba(0, 0, 0, 0.25);
    transition: border-color 0.15s ease, transform 0.15s ease;
}
.card:hover {
    border-color: var(--border-hover);
    transform: translateY(-1px);
}

/* --- KPI Metric Cards --- */
.kpi-card {
    background: var(--bg-card);
    border: 1px solid var(--border-color);
    border-top: 3px solid var(--brand-blue);
    border-radius: 8px;
    padding: 20px 16px;
    text-align: center;
    box-shadow: 0 4px 16px rgba(0, 0, 0, 0.25);
    transition: transform 0.15s ease;
}
.kpi-card:hover {
    transform: translateY(-2px);
    border-top-color: var(--brand-cyan);
}
.kpi-card.blue { border-top-color: var(--brand-blue); }
.kpi-card.green { border-top-color: var(--brand-emerald); }
.kpi-card.amber { border-top-color: var(--brand-amber); }
.kpi-card.purple { border-top-color: var(--brand-indigo); }
.kpi-value {
    font-size: 2.2rem;
    font-weight: 800;
    color: #FFFFFF;
    line-height: 1.1;
    font-family: 'Plus Jakarta Sans', sans-serif;
}
.kpi-label {
    font-size: 0.75rem;
    color: var(--text-muted);
    font-weight: 600;
    margin-top: 8px;
    text-transform: uppercase;
    letter-spacing: 0.08em;
}

/* --- Section Headers --- */
.section-header {
    font-size: 1.15rem;
    font-weight: 700;
    color: var(--text-primary);
    margin: 24px 0 14px 0;
    padding-bottom: 6px;
    border-bottom: 1px solid var(--border-color);
    display: flex;
    align-items: center;
    gap: 8px;
    letter-spacing: -0.01em;
}

/* --- Job Listing Cards --- */
.job-card {
    background: var(--bg-card);
    border: 1px solid var(--border-color);
    border-left: 3px solid var(--brand-blue);
    border-radius: 8px;
    padding: 20px 24px;
    margin-bottom: 14px;
    transition: border-color 0.15s ease;
}
.job-card:hover {
    border-color: var(--border-hover);
    border-left-color: var(--brand-cyan);
}
.job-title { 
    font-size: 1.15rem; 
    font-weight: 700; 
    color: #FFFFFF; 
    letter-spacing: -0.01em;
}
.job-company { 
    font-size: 0.92rem; 
    color: var(--brand-blue); 
    font-weight: 600; 
    margin-top: 2px;
}
.job-meta { 
    color: var(--text-secondary); 
    font-size: 0.85rem; 
    margin-top: 6px; 
}
.job-salary { 
    color: var(--brand-emerald); 
    font-weight: 600; 
}

/* --- Status & Type Badges --- */
.badge {
    display: inline-block;
    padding: 2px 8px;
    border-radius: 4px;
    font-size: 0.72rem;
    font-weight: 700;
    letter-spacing: 0.04em;
    text-transform: uppercase;
    border: 1px solid transparent;
}
.badge-applied { background: #172554; color: #93C5FD; border-color: #1E40AF; }
.badge-screening { background: #2E1065; color: #C4B5FD; border-color: #4C1D95; }
.badge-interviewing { background: #451A03; color: #FCD34D; border-color: #78350F; }
.badge-hired { background: #064E3B; color: #6EE7B7; border-color: #065F46; }
.badge-rejected { background: #450A0A; color: #FCA5A5; border-color: #7F1D1D; }
.badge-active { background: #064E3B; color: #6EE7B7; border-color: #065F46; }
.badge-closed { background: #1F2937; color: #9CA3AF; border-color: #374151; }
.badge-paused { background: #451A03; color: #FCD34D; border-color: #78350F; }
.badge-neutral { background: #1E293B; color: #CBD5E1; border-color: #334155; }

/* --- Skill Badges --- */
.skill-badge {
    display: inline-block;
    background: #0F172A;
    color: #94A3B8;
    padding: 3px 10px;
    border-radius: 4px;
    font-size: 0.78rem;
    font-weight: 600;
    margin: 2px 4px 2px 0;
    border: 1px solid var(--border-color);
}
.skill-badge.mandatory {
    background: #172554;
    color: #93C5FD;
    border-color: #1E40AF;
}

/* --- Connectivity Pill --- */
.conn-pill {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    padding: 3px 10px;
    border-radius: 4px;
    font-size: 0.75rem;
    font-weight: 600;
    letter-spacing: 0.02em;
}
.conn-green { 
    background: #064E3B; 
    color: #6EE7B7; 
    border: 1px solid #065F46; 
}
.conn-amber { 
    background: #451A03; 
    color: #FCD34D; 
    border: 1px solid #78350F; 
}

/* --- Notice Boxes --- */
.info-box {
    background: #111827;
    border: 1px solid #1E3A8A;
    border-left: 3px solid #3B82F6;
    border-radius: 6px;
    padding: 12px 16px;
    color: #BFDBFE;
    font-size: 0.88rem;
    margin-bottom: 12px;
}
.warn-box {
    background: #111827;
    border: 1px solid #78350F;
    border-left: 3px solid #F59E0B;
    border-radius: 6px;
    padding: 12px 16px;
    color: #FDE68A;
    font-size: 0.88rem;
    margin-bottom: 12px;
}
.success-box {
    background: #111827;
    border: 1px solid #065F46;
    border-left: 3px solid #10B981;
    border-radius: 6px;
    padding: 12px 16px;
    color: #A7F3D0;
    font-size: 0.88rem;
    margin-bottom: 12px;
}

/* --- Streamlit Tab Overrides --- */
.stTabs [data-baseweb="tab-list"] {
    gap: 4px;
    background: transparent;
    border-bottom: 1px solid var(--border-color);
    padding-bottom: 2px;
}
.stTabs [data-baseweb="tab"] {
    background: transparent !important;
    border: none !important;
    border-bottom: 2px solid transparent !important;
    border-radius: 0 !important;
    padding: 8px 18px !important;
    color: var(--text-muted) !important;
    font-weight: 600 !important;
    font-size: 0.88rem !important;
}
.stTabs [aria-selected="true"] {
    color: #FFFFFF !important;
    border-bottom: 2px solid var(--brand-blue) !important;
}

/* --- Form Controls & Buttons --- */
.stButton > button {
    border-radius: 6px !important;
    font-weight: 600 !important;
    font-size: 0.88rem !important;
    padding: 6px 18px !important;
    letter-spacing: -0.01em;
    transition: all 0.15s ease !important;
}
div[data-testid="stExpander"] {
    border: 1px solid var(--border-color) !important;
    border-radius: 6px !important;
    background: var(--bg-card) !important;
}
div[data-testid="stDataFrame"] {
    border: 1px solid var(--border-color);
    border-radius: 6px;
}
</style>
"""

st.markdown(CUSTOM_CSS, unsafe_allow_html=True)

# ──────────────────────────────────────────────────────────────────────────────
# HELPER FUNCTIONS
# ──────────────────────────────────────────────────────────────────────────────

def stage_badge(stage):
    """Return HTML badge for application stage."""
    s = str(stage).strip()
    cls_map = {
        "Applied": "badge-applied",
        "Screening": "badge-screening",
        "Interviewing": "badge-interviewing",
        "Hired": "badge-hired",
        "Rejected": "badge-rejected",
    }
    cls = cls_map.get(s, "badge-applied")
    return f'<span class="badge {cls}">{s}</span>'


def status_badge(status):
    """Return HTML badge for job posting status."""
    s = str(status).strip()
    cls_map = {
        "Active": "badge-active",
        "Closed": "badge-closed",
        "Paused": "badge-paused",
    }
    cls = cls_map.get(s, "badge-active")
    return f'<span class="badge {cls}">{s}</span>'


def proficiency_pct(level):
    """Map proficiency level string to a percentage."""
    m = {
        "Beginner": 25,
        "Intermediate": 50,
        "Advanced": 75,
        "Expert": 100,
    }
    return m.get(str(level).strip(), 40)


def render_kpi(label, value, color_class):
    """Render a single KPI metric card."""
    return f"""
    <div class="kpi-card {color_class}">
        <div class="kpi-value">{value}</div>
        <div class="kpi-label">{label}</div>
    </div>
    """


def safe_col(df, col):
    """Case-insensitive column access."""
    for c in df.columns:
        if c.lower() == col.lower():
            return df[c]
    return pd.Series(dtype="object")


def safe_val(row, col, default=""):
    """Case-insensitive single-row value with optional default."""
    if isinstance(row, pd.Series):
        for k in row.index:
            if k.lower() == col.lower():
                val = row[k]
                if pd.isna(val) or val is None:
                    return default
                return val
    elif isinstance(row, dict):
        for k, v in row.items():
            if k.lower() == col.lower():
                if v is None:
                    return default
                return v
    return default


def load_queries():
    """Load Lab 10A queries from JSON file."""
    qpath = os.path.join(os.path.dirname(__file__), "queries.json")
    if os.path.exists(qpath):
        with open(qpath, "r") as f:
            return json.load(f)
    return []


# ──────────────────────────────────────────────────────────────────────────────
# SIDEBAR
# ──────────────────────────────────────────────────────────────────────────────

def render_sidebar():
    with st.sidebar:
        # Logo / branding
        st.markdown("""
        <div style="text-align:center; padding:10px 0 6px 0;">
            <div style="font-size:0.75rem; font-weight:700; color:#3B82F6; letter-spacing:0.1em; text-transform:uppercase;">ENTERPRISE EDITION</div>
            <div style="font-size:1.25rem; font-weight:800; color:#F8FAFC; letter-spacing:-0.02em;">
                Job Portal Platform
            </div>
            <div style="font-size:0.78rem; color:#94A3B8; margin-top:2px;">
                MC212 · Team 9 · DA-IICT
            </div>
        </div>
        """, unsafe_allow_html=True)

        st.markdown("---")

        # ── Database Connection ──
        st.markdown("##### Database Connection")

        db_mode = st.radio("Backend", ["SQLite (Demo)", "PostgreSQL"], index=0, key="db_mode_radio", horizontal=True)

        if db_mode == "PostgreSQL":
            with st.expander("PostgreSQL Settings", expanded=False):
                pg_host = st.text_input("Host", value="localhost", key="pg_host")
                pg_port = st.text_input("Port", value="5432", key="pg_port")
                pg_db = st.text_input("Database", value="job_portal_db", key="pg_db")
                pg_user = st.text_input("User", value="postgres", key="pg_user")
                pg_pass = st.text_input("Password", type="password", key="pg_pass")

            if st.button("Connect to PostgreSQL", use_container_width=True):
                ok, msg = db_manager.connect_postgres(
                    st.session_state.get("pg_host", "localhost"),
                    st.session_state.get("pg_port", "5432"),
                    st.session_state.get("pg_db", "job_portal_db"),
                    st.session_state.get("pg_user", "postgres"),
                    st.session_state.get("pg_pass", ""),
                )
                if ok:
                    st.success(msg)
                else:
                    st.error(msg)
        else:
            if db_manager.mode != "sqlite":
                db_manager.connect_sqlite()

        # Connection indicator
        if db_manager.mode == "postgres":
            st.markdown('<div class="conn-pill conn-green">POSTGRESQL CONNECTED</div>', unsafe_allow_html=True)
        else:
            st.markdown('<div class="conn-pill conn-amber">SQLITE DEMO MODE</div>', unsafe_allow_html=True)

        st.markdown("---")

        # ── Navigation ──
        st.markdown("##### Navigation")

        portal = st.radio(
            "Select Portal",
            [
                "Candidate Portal",
                "Employer Portal",
                "Admin Dashboard",
                "SQL Query Explorer",
            ],
            key="portal_nav",
        )

        st.markdown("---")

        # ── Footer ──
        st.markdown("""
        <div style="text-align:center; padding:8px 0;">
            <div style="font-size:0.75rem; color:#64748B; line-height:1.6;">
                <strong style="color:#94A3B8;">Course:</strong> MC212 — DBMS<br>
                <strong style="color:#94A3B8;">Team 9</strong> · DA-IICT<br>
                <span style="color:#475569;">Sem 3 · 2024-25</span>
            </div>
        </div>
        """, unsafe_allow_html=True)

    return portal


# ──────────────────────────────────────────────────────────────────────────────
# PORTAL 1 — CANDIDATE PORTAL
# ──────────────────────────────────────────────────────────────────────────────

def portal_candidate():
    st.markdown("""
    <div class="header-banner">
        <div class="header-tag">PORTAL / CANDIDATE</div><div class="header-title">Candidate Management</div>
        <div class="header-sub">Search jobs, track applications, setup qualifications & upload resumes</div>
    </div>
    """, unsafe_allow_html=True)

    # ── Active Candidate Context ──
    cands_df, _ = db_manager.execute_query("SELECT CandidateID, Name, ExperienceLevel FROM CANDIDATE ORDER BY CandidateID")
    cand_options = []
    if cands_df is not None and not cands_df.empty:
        cand_options = [f"{safe_val(r, 'candidateid')}: {safe_val(r, 'name')} ({safe_val(r, 'experiencelevel')})" for _, r in cands_df.iterrows()]

    col_hdr1, col_hdr2 = st.columns([3, 1])
    with col_hdr1:
        default_idx = 0
        if "registered_cand_id" in st.session_state:
            for idx, opt in enumerate(cand_options):
                if opt.startswith(st.session_state["registered_cand_id"]):
                    default_idx = idx
                    break
        selected_cand_str = st.selectbox("Active Candidate Profile:", cand_options, index=default_idx, key="cand_active_select")
    with col_hdr2:
        st.markdown("<div style='height:28px;'></div>", unsafe_allow_html=True)
        refresh_btn = st.button("Refresh Data", use_container_width=True)

    cand_id = selected_cand_str.split(":")[0].strip() if selected_cand_str else "CAN-001"

    # ── 4 Main Tabs: Search is Tab 1 ──
    tab_search, tab_setup, tab_apps, tab_preview = st.tabs([
        "Search & Apply Jobs",
        "Profile & Qualifications",
        "My Applications",
        "Public Profile Preview",
    ])

    # ──────────────────────────────────────────────────────────────────────────
    # TAB 1: Search & Apply Jobs
    # ──────────────────────────────────────────────────────────────────────────
    with tab_search:
        st.markdown('<div class="section-header">Explore Available Positions</div>', unsafe_allow_html=True)

        fc1, fc2, fc3, fc4 = st.columns(4)
        with fc1:
            keyword = st.text_input("Keyword / Title", placeholder="e.g. Engineer, Developer", key="cand_kw")
        with fc2:
            loc_df, _ = db_manager.execute_query("SELECT DISTINCT Location FROM JOB_POSTING WHERE Status='Active' ORDER BY Location")
            locs = ["All"] + (loc_df.iloc[:, 0].tolist() if loc_df is not None and not loc_df.empty else [])
            location = st.selectbox("Location", locs, key="cand_loc")
        with fc3:
            min_sal = st.number_input("Minimum Salary (₹)", min_value=0, value=0, step=50000, key="cand_sal")
        with fc4:
            emp_type = st.selectbox("Employment Type", ["All", "Full-time", "Part-time", "Contract", "Internship"], key="cand_type")

        results, err = db_manager.search_jobs(keyword, location, min_sal, emp_type)
        if err:
            st.error(f"Query error: {err}")
        elif results is None or results.empty:
            st.info("No jobs found matching your criteria. Try adjusting the filters.")
        else:
            st.markdown(f"<div class='info-box'>Found <strong>{len(results)}</strong> active position(s)</div>", unsafe_allow_html=True)
            for idx, row in results.iterrows():
                job_id = safe_val(row, "jobid")
                title = safe_val(row, "title")
                company = safe_val(row, "company")
                loc_v = safe_val(row, "location")
                sal_min = safe_val(row, "salarymin")
                sal_max = safe_val(row, "salarymax")
                etype = safe_val(row, "employmenttype")
                seniority = safe_val(row, "senioritylevel")

                with st.expander(f"{title} · {company} · Location: {loc_v} · Salary: ₹{sal_min:,.0f} - ₹{sal_max:,.0f}"):
                    st.write(f"**Job ID:** `{job_id}` | **Seniority:** {seniority} | **Type:** {etype}")
                    j_full, j_skills, j_questions = db_manager.get_job_full_details(job_id)
                    if j_full is not None and not j_full.empty:
                        desc_txt = safe_val(j_full.iloc[0], "description")
                        st.markdown(f"**Description:** {desc_txt}")

                    if j_skills is not None and not j_skills.empty:
                        st.markdown("**Required Skills:**")
                        skill_badges = ""
                        for _, s in j_skills.iterrows():
                            mand = " Mandatory" if safe_val(s, "ismandatory") else "Optional"
                            skill_badges += f'<span class="badge badge-tech">{safe_val(s, "skillname")} ({safe_val(s, "proficiencylevel")}) · {mand}</span> '
                        st.markdown(skill_badges, unsafe_allow_html=True)

                    st.markdown("---")
                    st.markdown("#### Submit Application")

                    # Candidate resumes dropdown
                    cand_res_df, _ = db_manager.get_candidate_resumes(cand_id)
                    if cand_res_df is not None and not cand_res_df.empty:
                        res_map = {f"{safe_val(r, 'versionname')}{' (Default)' if safe_val(r, 'isdefault') else ''}": safe_val(r, 'resumeid') for _, r in cand_res_df.iterrows()}
                        chosen_r_lbl = st.selectbox("Select Your Resume Document", list(res_map.keys()), key=f"apply_res_{job_id}_{cand_id}")
                        chosen_resume_id = res_map[chosen_r_lbl]
                    else:
                        st.warning(f"Notice: Candidate {cand_id} has no uploaded resumes yet. Upload a resume in the 'Profile & Qualifications Setup' tab.")
                        chosen_resume_id = None

                    # Screening questions
                    ans_dict = {}
                    if j_questions is not None and not j_questions.empty:
                        st.markdown("##### Screening Questions")
                        for _, q in j_questions.iterrows():
                            qid = safe_val(q, "questionid")
                            qtext = safe_val(q, "questiontext")
                            qtype = safe_val(q, "questiontype")
                            if qtype == "Yes/No":
                                ans_dict[qid] = st.radio(qtext, ["Yes", "No"], key=f"q_{job_id}_{qid}_{cand_id}")
                            else:
                                ans_dict[qid] = st.text_input(qtext, key=f"q_{job_id}_{qid}_{cand_id}")

                    if st.button("Submit Application", key=f"btn_apply_{job_id}_{cand_id}", type="primary"):
                        if not chosen_resume_id:
                            st.error("Please upload or select a resume before applying.")
                        else:
                            ok, msg = db_manager.submit_application(cand_id, job_id, chosen_resume_id, ans_dict)
                            if ok:
                                st.success(f"{msg}")
                                st.balloons()
                            else:
                                st.error(f"Error: {msg}")

    # ──────────────────────────────────────────────────────────────────────────
    # TAB 2: Profile & Qualifications Setup
    # ──────────────────────────────────────────────────────────────────────────
    with tab_setup:
        st.markdown('<div class="section-header">Candidate Profile & Qualifications</div>', unsafe_allow_html=True)

        setup_action = st.radio(
            "Setup Action:",
            ["Edit Active Profile Qualifications & Details", "Register New Candidate Profile"],
            horizontal=True,
            key="cand_setup_mode"
        )

        if setup_action == "Register New Candidate Profile":
            st.markdown("##### Create a New Candidate Profile")
            with st.form("form_reg_new_candidate_tab"):
                rn1, rn2 = st.columns(2)
                with rn1:
                    new_c_name = st.text_input("Full Name *", placeholder="e.g. Jainil Shah")
                    new_c_email = st.text_input("Email *", placeholder="e.g. jainil@daiict.ac.in")
                    new_c_phone = st.text_input("Phone Number *", placeholder="e.g. +91 9876543210")
                    new_c_loc = st.text_input("Location *", placeholder="e.g. Gandhinagar, India")
                with rn2:
                    new_c_headline = st.text_input("Professional Headline", placeholder="e.g. Full Stack Developer | DBMS")
                    new_c_exp = st.selectbox("Experience Level *", ["Entry-level", "Mid-level", "Senior"], key="reg_exp_tab")
                    new_c_vis = st.selectbox("Profile Visibility *", ["Public", "Anonymous", "Hidden"], key="reg_vis_tab")

                new_c_summary = st.text_area("Bio / Professional Summary", placeholder="Brief intro about yourself...")

                st.markdown("##### Educational Qualification")
                ceq1, ceq2 = st.columns(2)
                with ceq1:
                    new_inst_init = st.text_input("Institution", value="DA-IICT Gandhinagar")
                    new_deg_init = st.text_input("Degree", placeholder="e.g. B.Tech (ICT) / M.Sc (IT)")
                    new_field_init = st.text_input("Field of Study", placeholder="e.g. Information Technology")
                with ceq2:
                    new_gpa_init = st.number_input("GPA (0-10 scale)", min_value=0.0, max_value=10.0, value=8.5, step=0.1)
                    new_sdate_init = st.date_input("Start Date", key="reg_sdate_tab")
                    new_edate_init = st.date_input("End Date", key="reg_edate_tab")

                st.markdown("##### Resume Upload")
                up_resume_init = st.file_uploader("Upload Resume (.pdf, .docx)", type=["pdf", "docx"], key="reg_resume_tab")
                up_vname_init = st.text_input("Resume Version Name", value="Primary Resume 2026")

                btn_register = st.form_submit_button("Create Candidate Profile", type="primary")
                if btn_register:
                    if not new_c_name or not new_c_email or not new_c_phone or not new_c_loc:
                        st.error("Please fill in all mandatory fields.")
                    else:
                        new_id, err = db_manager.register_candidate(new_c_name, new_c_email, new_c_phone, new_c_headline, new_c_summary, new_c_loc, new_c_exp, new_c_vis)
                        if new_id:
                            st.session_state["registered_cand_id"] = new_id
                            if new_deg_init and new_inst_init:
                                db_manager.add_candidate_education(new_id, new_inst_init, new_deg_init, new_field_init, str(new_sdate_init), str(new_edate_init), new_gpa_init)
                            saved_path = f"/uploads/resumes/{new_id}_cv.pdf"
                            if up_resume_init is not None:
                                local_dir = os.path.join(os.path.dirname(__file__), "uploads", "resumes")
                                os.makedirs(local_dir, exist_ok=True)
                                disk_file = os.path.join(local_dir, f"{new_id}_{up_resume_init.name}")
                                with open(disk_file, "wb") as f_out:
                                    f_out.write(up_resume_init.getbuffer())
                                saved_path = f"/uploads/resumes/{new_id}_{up_resume_init.name}"
                            db_manager.add_candidate_resume(new_id, up_vname_init, saved_path, True)

                            st.success(f"New candidate registered successfully with ID: **{new_id}**!")
                            st.balloons()
                            st.rerun()
                        else:
                            st.error(f"Error: Registration failed: {err}")

        else:
            # Edit active profile
            st.caption(f"Currently managing qualifications and profile data for: **{cand_id}**")
            cand_df, _ = db_manager.execute_query("SELECT * FROM CANDIDATE WHERE CandidateID = %s", [cand_id])
            if cand_df is None or cand_df.empty:
                st.warning("Candidate record not found.")
                return
            cand = cand_df.iloc[0]

            # ── 1. Personal Information Section ──
            with st.expander("1. Personal Information & Bio", expanded=True):
                with st.form(f"form_personal_info_{cand_id}"):
                    c1, c2 = st.columns(2)
                    with c1:
                        up_name = st.text_input("Full Name *", value=str(safe_val(cand, 'name', '')))
                        up_email = st.text_input("Email Address *", value=str(safe_val(cand, 'email', '')))
                        up_phone = st.text_input("Phone Number *", value=str(safe_val(cand, 'phone', '')))
                        up_loc = st.text_input("Location / City *", value=str(safe_val(cand, 'location', '')))
                    with c2:
                        up_headline = st.text_input("Professional Headline", value=str(safe_val(cand, 'headline', '')))
                        exp_opts = ["Entry-level", "Mid-level", "Senior"]
                        curr_exp = str(safe_val(cand, 'experiencelevel', 'Entry-level'))
                        exp_idx = exp_opts.index(curr_exp) if curr_exp in exp_opts else 0
                        up_exp = st.selectbox("Experience Level *", exp_opts, index=exp_idx)
                        
                        vis_opts = ["Public", "Anonymous", "Hidden"]
                        curr_vis = str(safe_val(cand, 'profilevisibility', 'Public'))
                        vis_idx = vis_opts.index(curr_vis) if curr_vis in vis_opts else 0
                        up_vis = st.selectbox("Profile Visibility *", vis_opts, index=vis_idx)

                    up_summary = st.text_area("Professional Summary / Bio", value=str(safe_val(cand, 'summary', '')), height=100)

                    btn_save_p = st.form_submit_button("Save Personal Information", type="primary")
                    if btn_save_p:
                        if not up_name or not up_email or not up_phone or not up_loc:
                            st.error("Please fill in all required fields marked with *")
                        else:
                            ok, err = db_manager.update_candidate_profile(cand_id, up_name, up_email, up_phone, up_headline, up_summary, up_loc, up_exp, up_vis)
                            if ok:
                                st.success("Personal information successfully updated in database!")
                                st.rerun()
                            else:
                                st.error(f"Error: Update failed: {err}")

            # ── 2. Job Preferences Section ──
            with st.expander("2. Career & Job Search Preferences", expanded=False):
                pref_df, _ = db_manager.execute_query("SELECT * FROM JOB_PREFERENCE WHERE CandidateID = %s", [cand_id])
                pref = pref_df.iloc[0] if pref_df is not None and not pref_df.empty else None

                with st.form(f"form_pref_{cand_id}"):
                    col_pr1, col_pr2 = st.columns(2)
                    with col_pr1:
                        target_title = st.text_input("Target Job Title *", value=str(safe_val(pref, 'targettitle', 'Software Engineer')))
                        exp_sal = st.number_input("Expected Annual Salary (INR) *", min_value=0, value=int(float(safe_val(pref, 'expectedsalary', 900000) or 900000)), step=50000)
                    with col_pr2:
                        work_models = ["Remote", "Hybrid", "On-site"]
                        curr_wm = str(safe_val(pref, 'preferredworkmodel', 'Hybrid'))
                        wm_idx = work_models.index(curr_wm) if curr_wm in work_models else 1
                        work_model = st.selectbox("Preferred Work Model *", work_models, index=wm_idx)
                        avail_date = st.date_input("Earliest Availability Date *")

                    btn_save_pref = st.form_submit_button("Save Preferences", type="primary")
                    if btn_save_pref:
                        ok, err = db_manager.update_job_preference(cand_id, target_title, exp_sal, work_model, str(avail_date))
                        if ok:
                            st.success("Job preferences updated successfully!")
                            st.rerun()
                        else:
                            st.error(f"Error: Failed to update preferences: {err}")

            # ── 3. Educational Qualifications Section ──
            with st.expander("3. Educational Qualifications (Degrees & GPA)", expanded=True):
                st.markdown("##### Current Education Records")
                edu_df, _ = db_manager.execute_query("""
                    SELECT EducationID, Institution, Degree, FieldOfStudy, StartDate, EndDate, GPA
                    FROM EDUCATION WHERE CandidateID = %s ORDER BY StartDate DESC
                """, [cand_id])

                if edu_df is not None and not edu_df.empty:
                    for _, ed in edu_df.iterrows():
                        ed_id = safe_val(ed, 'educationid')
                        col_e1, col_e2 = st.columns([5, 1])
                        with col_e1:
                            st.markdown(f"""
                            <div class="card" style="margin-bottom:8px;">
                                <strong style="color:#F1F5F9; font-size:1.05rem;">{safe_val(ed, 'degree')} in {safe_val(ed, 'fieldofstudy')}</strong><br>
                                <span style="color:#14B8A6;">{safe_val(ed, 'institution')}</span> &nbsp;·&nbsp; 
                                <span style="color:#94A3B8;">{safe_val(ed, 'startdate')} to {safe_val(ed, 'enddate')}</span> &nbsp;·&nbsp;
                                <span style="color:#F59E0B; font-weight:600;"> GPA: {safe_val(ed, 'gpa')} / 10.0</span>
                            </div>
                            """, unsafe_allow_html=True)
                        with col_e2:
                            st.markdown("<div style='height:8px;'></div>", unsafe_allow_html=True)
                            if st.button("Delete", key=f"del_edu_{ed_id}", type="secondary"):
                                ok, err = db_manager.delete_candidate_education(cand_id, ed_id)
                                if ok:
                                    st.success("Qualification deleted!")
                                    st.rerun()
                                else:
                                    st.error(err)
                else:
                    st.info("No educational qualifications added yet.")

                st.markdown("---")
                st.markdown("##### Add New Qualification")
                with st.form(f"form_add_edu_{cand_id}"):
                    ce1, ce2 = st.columns(2)
                    with ce1:
                        new_inst = st.text_input("Institution / University *", placeholder="e.g. DA-IICT, Gandhinagar")
                        new_deg = st.text_input("Degree *", placeholder="e.g. B.Tech (ICT), M.Sc (IT)")
                        new_field = st.text_input("Field of Study *", placeholder="e.g. Computer Science")
                    with ce2:
                        new_start = st.date_input("Start Date *", key="ed_sdate")
                        new_end = st.date_input("End Date (or Expected) *", key="ed_edate")
                        new_gpa = st.number_input("GPA (0.0 to 10.0 scale) *", min_value=0.0, max_value=10.0, value=8.5, step=0.1)

                    btn_add_edu = st.form_submit_button("Add Qualification", type="primary")
                    if btn_add_edu:
                        if not new_inst or not new_deg or not new_field:
                            st.error("Please fill in institution, degree, and field of study.")
                        else:
                            ok, err = db_manager.add_candidate_education(cand_id, new_inst, new_deg, new_field, str(new_start), str(new_end), new_gpa)
                            if ok:
                                st.success("Qualification added to database!")
                                st.rerun()
                            else:
                                st.error(f"Error: Failed: {err}")

            # ── 4. Employment & Work History Section ──
            with st.expander("4. Employment & Work History", expanded=False):
                st.markdown("##### Recorded Work Experiences")
                exp_df, _ = db_manager.execute_query("""
                    SELECT HistoryID, PreviousCompanyName, JobTitle, StartDate, EndDate, Description
                    FROM EMPLOYMENT_HISTORY WHERE CandidateID = %s ORDER BY StartDate DESC
                """, [cand_id])

                if exp_df is not None and not exp_df.empty:
                    for _, ex in exp_df.iterrows():
                        hist_id = safe_val(ex, 'historyid')
                        col_x1, col_x2 = st.columns([5, 1])
                        with col_x1:
                            st.markdown(f"""
                            <div class="card" style="margin-bottom:8px;">
                                <strong style="color:#F1F5F9; font-size:1.05rem;">{safe_val(ex, 'jobtitle')}</strong><br>
                                <span style="color:#14B8A6;">{safe_val(ex, 'previouscompanyname')}</span> &nbsp;·&nbsp;
                                <span style="color:#94A3B8;">{safe_val(ex, 'startdate')} to {safe_val(ex, 'enddate')}</span><br>
                                <span style="color:#CBD5E1; font-size:0.88rem;">{safe_val(ex, 'description')}</span>
                            </div>
                            """, unsafe_allow_html=True)
                        with col_x2:
                            st.markdown("<div style='height:8px;'></div>", unsafe_allow_html=True)
                            if st.button("Delete", key=f"del_exp_{hist_id}", type="secondary"):
                                ok, err = db_manager.delete_candidate_experience(cand_id, hist_id)
                                if ok:
                                    st.success("Experience record deleted!")
                                    st.rerun()
                                else:
                                    st.error(err)
                else:
                    st.info("No work experience added yet.")

                st.markdown("---")
                st.markdown("##### Add Work Experience")
                with st.form(f"form_add_exp_{cand_id}"):
                    cx1, cx2 = st.columns(2)
                    with cx1:
                        new_comp = st.text_input("Company Name *", placeholder="e.g. Google, TCS, Infosys")
                        new_title = st.text_input("Job Title *", placeholder="e.g. Software Engineer")
                    with cx2:
                        new_exp_start = st.date_input("Start Date *", key="exp_sdate")
                        new_exp_end = st.date_input("End Date *", key="exp_edate")

                    new_desc = st.text_area("Responsibilities & Impact", placeholder="Describe your key deliverables, technologies used...")

                    btn_add_exp = st.form_submit_button("Add Work Experience", type="primary")
                    if btn_add_exp:
                        if not new_comp or not new_title:
                            st.error("Please provide company name and job title.")
                        else:
                            ok, err = db_manager.add_candidate_experience(cand_id, new_comp, new_title, str(new_exp_start), str(new_exp_end), new_desc)
                            if ok:
                                st.success("Work experience added!")
                                st.rerun()
                            else:
                                st.error(f"Error: Failed: {err}")

            # ── 5. Technical Skills Matrix Section ──
            with st.expander("5. Technical Skills Matrix", expanded=True):
                st.markdown("##### Attached Skills")
                sk_df, _ = db_manager.execute_query("""
                    SELECT cs.SkillID, s.SkillName, s.Category, cs.ProficiencyLevel, cs.YearsOfExperience
                    FROM CANDIDATE_SKILL cs
                    JOIN SKILL s ON cs.SkillID = s.SkillID
                    WHERE cs.CandidateID = %s ORDER BY cs.YearsOfExperience DESC
                """, [cand_id])

                if sk_df is not None and not sk_df.empty:
                    for _, sk in sk_df.iterrows():
                        sk_id = safe_val(sk, 'skillid')
                        s_name = safe_val(sk, 'skillname')
                        s_cat = safe_val(sk, 'category')
                        s_lvl = safe_val(sk, 'proficiencylevel')
                        s_yrs = safe_val(sk, 'yearsofexperience')
                        col_sk1, col_sk2 = st.columns([5, 1])
                        with col_sk1:
                            st.markdown(f"""
                            <div style="background:#1E293B; padding:8px 14px; border-radius:8px; margin-bottom:6px; border-left:3px solid #0D9488;">
                                <strong style="color:#F1F5F9;">{s_name}</strong> &nbsp;
                                <span style="color:#94A3B8; font-size:0.85rem;">({s_cat})</span> &nbsp;·&nbsp;
                                <span style="color:#14B8A6; font-weight:600;">{s_lvl}</span> &nbsp;·&nbsp;
                                <span style="color:#F59E0B;">{s_yrs} year(s)</span>
                            </div>
                            """, unsafe_allow_html=True)
                        with col_sk2:
                            if st.button("Remove", key=f"del_sk_{sk_id}", type="secondary"):
                                ok, err = db_manager.remove_candidate_skill(cand_id, sk_id)
                                if ok:
                                    st.success(f"Removed skill {s_name}!")
                                    st.rerun()
                                else:
                                    st.error(err)
                else:
                    st.info("No skills attached to this profile yet.")

                st.markdown("---")
                st.markdown("##### Add / Update Skill in Matrix")
                all_skills_df, _ = db_manager.execute_query("SELECT SkillID, SkillName, Category FROM SKILL ORDER BY Category, SkillName")
                if all_skills_df is not None and not all_skills_df.empty:
                    sk_options = {f"{safe_val(r, 'skillname')} ({safe_val(r, 'category')})": safe_val(r, 'skillid') for _, r in all_skills_df.iterrows()}
                    with st.form(f"form_add_sk_{cand_id}"):
                        csk1, csk2, csk3 = st.columns([2, 1, 1])
                        with csk1:
                            sel_sk_label = st.selectbox("Select Technical Skill", list(sk_options.keys()))
                        with csk2:
                            sel_prof = st.selectbox("Proficiency Level", ["Beginner", "Intermediate", "Advanced"])
                        with csk3:
                            sel_yrs = st.number_input("Years of Exp", min_value=0, max_value=25, value=2, step=1)

                        btn_add_sk = st.form_submit_button("Attach Skill to Profile", type="primary")
                        if btn_add_sk:
                            chosen_sk_id = sk_options[sel_sk_label]
                            ok, err = db_manager.add_candidate_skill(cand_id, chosen_sk_id, sel_prof, int(sel_yrs))
                            if ok:
                                st.success("Skill added/updated in database!")
                                st.rerun()
                            else:
                                st.error(f"Error: Failed: {err}")

            # ── 6. Resume Documents & Uploader ──
            with st.expander("6. Resume Manager", expanded=True):
                res_df, _ = db_manager.execute_query("""
                    SELECT ResumeID, VersionName, FilePath, IsDefault
                    FROM RESUME WHERE CandidateID = %s ORDER BY IsDefault DESC, ResumeID
                """, [cand_id])
                res_count = len(res_df) if res_df is not None else 0

                st.markdown(f"**Uploaded Resumes:** `{res_count} / 5` *(Enforcing SRS Business Constraint BC2)*")

                if res_df is not None and not res_df.empty:
                    for _, r in res_df.iterrows():
                        r_id = safe_val(r, 'resumeid')
                        v_name = safe_val(r, 'versionname')
                        f_path = safe_val(r, 'filepath')
                        is_def = safe_val(r, 'isdefault')

                        col_r1, col_r2, col_r3 = st.columns([4, 1.5, 1])
                        with col_r1:
                            st.markdown(f"""
                            <div style="background:#1E293B; padding:10px 14px; border-radius:8px; margin-bottom:6px; border-left:3px solid {'#22C55E' if is_def else '#475569'};">
                                <strong style="color:#F1F5F9;">{v_name}</strong>
                                {'<span style="background:#065F46; color:#D1FAE5; padding:2px 8px; border-radius:12px; font-size:0.75rem; font-weight:600; margin-left:8px;">DEFAULT</span>' if is_def else ''}<br>
                                <span style="color:#94A3B8; font-size:0.82rem;">File: <code>{f_path}</code></span>
                            </div>
                            """, unsafe_allow_html=True)
                        with col_r2:
                            if not is_def:
                                if st.button(" Set Default", key=f"set_def_{r_id}"):
                                    db_manager.execute_query("UPDATE RESUME SET IsDefault = FALSE WHERE CandidateID = %s", [cand_id], fetch=False)
                                    db_manager.execute_query("UPDATE RESUME SET IsDefault = TRUE WHERE CandidateID = %s AND ResumeID = %s", [cand_id, r_id], fetch=False)
                                    st.success("Default resume updated!")
                                    st.rerun()
                        with col_r3:
                            if st.button("Delete", key=f"del_res_{r_id}", type="secondary"):
                                ok, err = db_manager.delete_candidate_resume(cand_id, r_id)
                                if ok:
                                    st.success("Resume deleted!")
                                    st.rerun()
                                else:
                                    st.error(err)
                else:
                    st.info("No resumes uploaded yet. Upload your first resume below.")

                if res_count < 5:
                    st.markdown("---")
                    st.markdown("##### Upload New Resume Version")
                    with st.form(f"form_upload_resume_{cand_id}"):
                        uploaded_file = st.file_uploader("Select Resume File (.pdf, .docx)", type=["pdf", "docx"], key=f"uploader_{cand_id}")
                        r_vname = st.text_input("Resume Version Name *", placeholder="e.g. Backend Developer Resume (DA-IICT 2026)")
                        r_make_default = st.checkbox("Set as Default Resume for Applications", value=(res_count == 0))

                        btn_upload = st.form_submit_button("Upload & Save Resume to Database", type="primary")
                        if btn_upload:
                            if not r_vname:
                                st.error("Please specify a version name.")
                            else:
                                saved_path = f"/uploads/resumes/{cand_id}_resume_{res_count + 1}.pdf"
                                if uploaded_file is not None:
                                    local_dir = os.path.join(os.path.dirname(__file__), "uploads", "resumes")
                                    os.makedirs(local_dir, exist_ok=True)
                                    disk_file = os.path.join(local_dir, f"{cand_id}_{uploaded_file.name}")
                                    with open(disk_file, "wb") as f_out:
                                        f_out.write(uploaded_file.getbuffer())
                                    saved_path = f"/uploads/resumes/{cand_id}_{uploaded_file.name}"

                                ok, err = db_manager.add_candidate_resume(cand_id, r_vname, saved_path, r_make_default)
                                if ok:
                                    st.success("Resume uploaded and registered in database!")
                                    st.rerun()
                                else:
                                    st.error(f"Error: Failed: {err}")
                else:
                    st.warning("Notice: Maximum limit of 5 resumes reached. Delete an older version to upload a new one.")

    # ──────────────────────────────────────────────────────────────────────────
    # TAB 3: My Applications
    # ──────────────────────────────────────────────────────────────────────────
    with tab_apps:
        st.markdown('<div class="section-header">Application Tracking</div>', unsafe_allow_html=True)
        apps_sql = """
        SELECT a.ApplicationID, j.Title AS JobTitle, c.Name AS Company,
               a.Stage, a.Timestamp, r.VersionName as ResumeVersion
        FROM APPLICATION a
        JOIN JOB_POSTING j ON a.JobID = j.JobID
        JOIN EMPLOYER e ON j.EmployerID = e.EmployerID
        JOIN COMPANY c ON e.CompanyID = c.CompanyID
        JOIN RESUME r ON a.CandidateID = r.CandidateID AND a.ResumeID = r.ResumeID
        WHERE a.CandidateID = %s
        ORDER BY a.Timestamp DESC
        """
        apps_df, err = db_manager.execute_query(apps_sql, [cand_id])

        if err:
            st.error(f"Error: {err}")
        elif apps_df is None or apps_df.empty:
            st.info(f"No applications found for candidate {cand_id}.")
        else:
            st.write(f"Total Applications Submitted: **{len(apps_df)}**")
            for _, app_row in apps_df.iterrows():
                app_id = safe_val(app_row, "applicationid")
                jtitle = safe_val(app_row, "jobtitle")
                comp = safe_val(app_row, "company")
                stg = safe_val(app_row, "stage")
                ts = safe_val(app_row, "timestamp")
                r_ver = safe_val(app_row, "resumeversion")
                badge = stage_badge(stg)

                st.markdown(f"""
                <div class="card" style="margin-bottom:8px;">
                    <div style="display:flex; justify-content:space-between; align-items:center;">
                        <div>
                            <strong style="color:#F1F5F9; font-size:1.1rem;">{jtitle}</strong> &nbsp;·&nbsp;
                            <span style="color:#14B8A6;">{comp}</span><br>
                            <span style="color:#94A3B8; font-size:0.85rem;">App ID: <code>{app_id}</code> &nbsp;·&nbsp; Resume: <code>{r_ver}</code> &nbsp;·&nbsp; Applied: {str(ts)[:16]}</span>
                        </div>
                        <div>
                            {badge}
                        </div>
                    </div>
                </div>
                """, unsafe_allow_html=True)

    # ──────────────────────────────────────────────────────────────────────────
    # TAB 4: Public Profile Preview
    # ──────────────────────────────────────────────────────────────────────────
    with tab_preview:
        st.markdown('<div class="section-header">Public Profile Preview</div>', unsafe_allow_html=True)
        st.caption("This is how recruiters and employers view your credentials on the platform:")

        col_pr_l, col_pr_r = st.columns([1, 2])
        with col_pr_l:
            st.markdown(f"""
            <div class="card" style="text-align:center;">
                
                <div style="font-size:1.3rem; font-weight:700; color:#F8FAFC;">{safe_val(cand, 'name')}</div>
                <div style="color:#14B8A6; font-weight:500; margin-bottom:10px;">{safe_val(cand, 'headline')}</div>
                <div style="color:#94A3B8; font-size:0.85rem; text-align:left; border-top:1px solid #334155; padding-top:10px;">
                    Email: <strong>Email:</strong> {safe_val(cand, 'email')}<br>
                    <strong>Phone:</strong> {safe_val(cand, 'phone')}<br>
                    Location: <strong>Location:</strong> {safe_val(cand, 'location')}<br>
                    <strong>Level:</strong> {safe_val(cand, 'experiencelevel')}<br>
                    <strong>Visibility:</strong> <code>{safe_val(cand, 'profilevisibility')}</code>
                </div>
            </div>
            """, unsafe_allow_html=True)

        with col_pr_r:
            st.markdown("##### Bio & Summary")
            st.write(safe_val(cand, 'summary') or "No summary provided.")

            st.markdown("##### Qualifications")
            edu_v_df, _ = db_manager.execute_query("SELECT Degree, FieldOfStudy, Institution, GPA, StartDate, EndDate FROM EDUCATION WHERE CandidateID = %s", [cand_id])
            if edu_v_df is not None and not edu_v_df.empty:
                for _, ed in edu_v_df.iterrows():
                    st.markdown(f"• **{safe_val(ed, 'degree')} in {safe_val(ed, 'fieldofstudy')}** — {safe_val(ed, 'institution')} (GPA: {safe_val(ed, 'gpa')}/10.0)")
            else:
                st.caption("No education listed.")

            st.markdown("##### Skills")
            sk_v_df, _ = db_manager.execute_query("""
                SELECT s.SkillName, cs.ProficiencyLevel, cs.YearsOfExperience 
                FROM CANDIDATE_SKILL cs JOIN SKILL s ON cs.SkillID = s.SkillID 
                WHERE cs.CandidateID = %s
            """, [cand_id])
            if sk_v_df is not None and not sk_v_df.empty:
                skill_badges = "".join([f'<span class="badge badge-tech">{safe_val(r, "skillname")} ({safe_val(r, "proficiencylevel")})</span> ' for _, r in sk_v_df.iterrows()])
                st.markdown(skill_badges, unsafe_allow_html=True)
            else:
                st.caption("No skills listed.")


# ──────────────────────────────────────────────────────────────────────────────
# PORTAL 2 — EMPLOYER & RECRUITER PORTAL
# ──────────────────────────────────────────────────────────────────────────────

def portal_employer():
    st.markdown("""
    <div class="header-banner">
        <div class="header-tag">PORTAL / EMPLOYER</div><div class="header-title">Employer & Recruiter Operations</div>
        <div class="header-sub">Manage company account, post jobs, inspect applicants & track candidate pipeline</div>
    </div>
    """, unsafe_allow_html=True)

    # ── Active Employer Account Selector ──
    emps_df, _ = db_manager.execute_query("""
        SELECT e.EmployerID, c.Name as CompanyName, e.VerificationStatus, e.CreditsRemaining, sp.TierName
        FROM EMPLOYER e
        JOIN COMPANY c ON e.CompanyID = c.CompanyID
        JOIN SUBSCRIPTION_PLAN sp ON e.PlanID = sp.PlanID
        ORDER BY e.EmployerID
    """)
    emp_options = []
    if emps_df is not None and not emps_df.empty:
        emp_options = [
            f"{safe_val(r, 'employerid')}: {safe_val(r, 'companyname')} ({safe_val(r, 'verificationstatus')} · {safe_val(r, 'creditsremaining')} Credits · {safe_val(r, 'tiername')})"
            for _, r in emps_df.iterrows()
        ]

    col_e_hdr1, col_e_hdr2 = st.columns([3, 1])
    with col_e_hdr1:
        default_e_idx = 0
        if "registered_emp_id" in st.session_state:
            for idx, opt in enumerate(emp_options):
                if opt.startswith(st.session_state["registered_emp_id"]):
                    default_e_idx = idx
                    break
        selected_emp_str = st.selectbox("Active Employer Account:", emp_options, index=default_e_idx, key="emp_active_select")
    with col_e_hdr2:
        st.markdown("<div style='height:28px;'></div>", unsafe_allow_html=True)
        st.button("Refresh Data", key="emp_refresh_btn", use_container_width=True)

    emp_id = selected_emp_str.split(":")[0].strip() if selected_emp_str else "EMP-001"

    # Display active employer status bar
    active_emp_info, _ = db_manager.execute_query("""
        SELECT e.EmployerID, c.Name as CompanyName, c.Industry, c.HQ_Location,
               e.Email, e.Phone, e.VerificationStatus, e.CreditsRemaining, sp.TierName, sp.Price
        FROM EMPLOYER e
        JOIN COMPANY c ON e.CompanyID = c.CompanyID
        JOIN SUBSCRIPTION_PLAN sp ON e.PlanID = sp.PlanID
        WHERE e.EmployerID = %s
    """, [emp_id])

    if active_emp_info is not None and not active_emp_info.empty:
        ae = active_emp_info.iloc[0]
        vstatus = safe_val(ae, 'verificationstatus')
        status_color = "#22C55E" if vstatus == "Verified" else ("#F59E0B" if vstatus == "Pending" else "#EF4444")
        st.markdown(f"""
        <div class="card" style="margin-bottom:15px; border-left:4px solid {status_color};">
            <div style="display:flex; justify-content:space-between; align-items:center; flex-wrap:wrap; gap:10px;">
                <div>
                    <strong style="font-size:1.15rem; color:#F8FAFC;">{safe_val(ae, 'companyname')}</strong> &nbsp;
                    <span style="color:#94A3B8; font-size:0.85rem;">({safe_val(ae, 'industry')} · {safe_val(ae, 'hq_location')})</span><br>
                    <span style="color:#94A3B8; font-size:0.85rem;">Account ID: <code>{safe_val(ae, 'employerid')}</code> · Contact: {safe_val(ae, 'email')}</span>
                </div>
                <div style="text-align:right;">
                    <span style="background:{'#065F46' if vstatus == 'Verified' else '#78350F'}; color:{'#D1FAE5' if vstatus == 'Verified' else '#FDE68A'}; padding:4px 10px; border-radius:12px; font-size:0.8rem; font-weight:600;">
                        {vstatus.upper()}
                    </span> &nbsp;
                    <span style="background:#1E293B; border:1px solid #334155; color:#F1F5F9; padding:4px 10px; border-radius:12px; font-size:0.8rem; font-weight:600;">
                        Credits: {safe_val(ae, 'creditsremaining')} Credits Remaining
                    </span> &nbsp;
                    <span style="color:#14B8A6; font-size:0.85rem; font-weight:600;">Plan: {safe_val(ae, 'tiername')}</span>
                </div>
            </div>
        </div>
        """, unsafe_allow_html=True)

    tab_post, tab_manage, tab_ats, tab_register_emp = st.tabs([
        "Post New Job",
        "Manage Postings",
        "Applicant Tracking (ATS)",
        "Register New Company",
    ])

    # ──────────────────────────────────────────────────────────────────────────
    # TAB 1: Post New Job
    # ──────────────────────────────────────────────────────────────────────────
    with tab_post:
        st.markdown('<div class="section-header">Create a New Job Posting</div>', unsafe_allow_html=True)

        st.markdown("""
        <div class="warn-box">
            <strong>Notice:</strong> Credit Notice:</strong> Publishing a job will deduct <strong>1 credit</strong> from your employer account.
            Ensure your account is Verified and has sufficient credits.
        </div>
        """, unsafe_allow_html=True)

        col_l, col_r = st.columns(2)
        with col_l:
            job_title = st.text_input("Job Title *", key="jp_title", placeholder="e.g. Senior Backend Engineer")
            job_loc = st.text_input("Location *", key="jp_loc", value="Ahmedabad, India")
            job_type = st.selectbox("Employment Type *", ["Full-time", "Part-time", "Contract", "Internship"], key="jp_type")
            job_seniority = st.selectbox("Seniority Level *", ["Entry-level", "Mid-level", "Senior", "Lead", "Director"], key="jp_seniority")

        with col_r:
            sal_min = st.number_input("Minimum Salary (₹) *", min_value=0, value=600000, step=50000, key="jp_salmin")
            sal_max = st.number_input("Maximum Salary (₹) *", min_value=0, value=1200000, step=50000, key="jp_salmax")
            expiry_date = st.date_input("Expiry Date *", key="jp_expiry")

            all_skills_df, _ = db_manager.execute_query("SELECT SkillID, SkillName FROM SKILL ORDER BY SkillName")
            if all_skills_df is not None and not all_skills_df.empty:
                skill_opts = [f"{safe_val(r, 'skillid')} — {safe_val(r, 'skillname')}" for _, r in all_skills_df.iterrows()]
            else:
                skill_opts = []
            selected_skills = st.multiselect("Required Skills", skill_opts, key="jp_skills")

        job_desc = st.text_area("Job Description *", key="jp_desc", height=120, placeholder="Describe the role, responsibilities, and qualifications...")

        st.markdown("**Custom Screening Questions** (up to 5 per job)")
        num_q = st.slider("Number of questions", 0, 5, 1, key="jp_numq")
        questions_list = []
        for i in range(num_q):
            qc1, qc2 = st.columns([3, 1])
            with qc1:
                qt = st.text_input(f"Question {i+1}", key=f"jpq_text_{i}", placeholder="e.g. How many years of experience with PostgreSQL?")
            with qc2:
                qtype = st.selectbox(f"Type {i+1}", ["Text", "Yes/No", "Multiple Choice"], key=f"jpq_type_{i}")
            if qt:
                questions_list.append((qt, qtype))

        if st.button("Publish Job Posting (Deducts 1 Credit)", type="primary", use_container_width=True, key="btn_post_job"):
            if not job_title or not job_desc:
                st.error("Please fill in Job Title and Description.")
            elif sal_max < sal_min:
                st.error("Maximum salary cannot be lower than minimum salary.")
            else:
                skills_data = []
                for s in selected_skills:
                    sid = s.split(" — ")[0]
                    skills_data.append((sid, "Intermediate", True))

                ok, msg = db_manager.post_new_job(
                    emp_id, job_title, job_desc, job_loc, job_type,
                    job_seniority, sal_min, sal_max, str(expiry_date),
                    skills_data, questions_list,
                )
                if ok:
                    st.markdown(f'<div class="success-box">{msg}</div>', unsafe_allow_html=True)
                    st.balloons()
                    st.rerun()
                else:
                    st.error(f"Error: {msg}")

    # ──────────────────────────────────────────────────────────────────────────
    # TAB 2: Manage Postings
    # ──────────────────────────────────────────────────────────────────────────
    with tab_manage:
        st.markdown('<div class="section-header">Active & Past Job Listings</div>', unsafe_allow_html=True)
        st.caption(f"Showing all job postings published by Account: **{emp_id}**")

        jobs_sql = """
        SELECT j.JobID, j.Title, j.Location, j.EmploymentType, j.SalaryMin, j.SalaryMax,
               j.Status, j.PostDate,
               (SELECT COUNT(*) FROM APPLICATION a WHERE a.JobID = j.JobID) AS ApplicantCount
        FROM JOB_POSTING j
        WHERE j.EmployerID = %s
        ORDER BY j.PostDate DESC
        """
        jobs_df, err = db_manager.execute_query(jobs_sql, [emp_id])

        if err:
            st.error(f"Error: {err}")
        elif jobs_df is None or jobs_df.empty:
            st.info("No job postings found for this employer. Click on 'Post New Job' to create one!")
        else:
            html_rows = ""
            for _, jr in jobs_df.iterrows():
                jid = safe_val(jr, "jobid")
                jtitle = safe_val(jr, "title")
                jloc = safe_val(jr, "location")
                jtype = safe_val(jr, "employmenttype")
                jstatus = safe_val(jr, "status")
                jcount = safe_val(jr, "applicantcount")
                jsal_min = safe_val(jr, "salarymin")
                jsal_max = safe_val(jr, "salarymax")
                badge = status_badge(jstatus)

                html_rows += f"""
                <tr>
                    <td style="padding:10px 14px; color:#94A3B8; font-weight:600;">{jid}</td>
                    <td style="padding:10px 14px; color:#F1F5F9; font-weight:600;">{jtitle}</td>
                    <td style="padding:10px 14px; color:#94A3B8;">{jloc}</td>
                    <td style="padding:10px 14px; color:#94A3B8;">{jtype}</td>
                    <td style="padding:10px 14px;"><span class="job-salary">₹{jsal_min:,.0f}–₹{jsal_max:,.0f}</span></td>
                    <td style="padding:10px 14px; text-align:center; font-weight:700; color:#F1F5F9;">{jcount}</td>
                    <td style="padding:10px 14px;">{badge}</td>
                </tr>
                """

            st.markdown(f"""
            <div style="overflow-x:auto;">
            <table style="width:100%; border-collapse:separate; border-spacing:0; border:1px solid #334155; border-radius:12px; overflow:hidden;">
                <thead>
                    <tr style="background:linear-gradient(135deg, #1E3A8A, #0D9488);">
                        <th style="padding:12px 14px; color:#FFF; text-align:left; font-size:0.85rem;">Job ID</th>
                        <th style="padding:12px 14px; color:#FFF; text-align:left; font-size:0.85rem;">Title</th>
                        <th style="padding:12px 14px; color:#FFF; text-align:left; font-size:0.85rem;">Location</th>
                        <th style="padding:12px 14px; color:#FFF; text-align:left; font-size:0.85rem;">Type</th>
                        <th style="padding:12px 14px; color:#FFF; text-align:left; font-size:0.85rem;">Salary</th>
                        <th style="padding:12px 14px; color:#FFF; text-align:center; font-size:0.85rem;">Applicants</th>
                        <th style="padding:12px 14px; color:#FFF; text-align:left; font-size:0.85rem;">Status</th>
                    </tr>
                </thead>
                <tbody>
                    {html_rows}
                </tbody>
            </table>
            </div>
            """, unsafe_allow_html=True)

            st.markdown("---")
            st.markdown("**Listing Actions**")
            ac1, ac2, ac3 = st.columns(3)
            with ac1:
                action_jid = st.selectbox("Select Job to Change Status", [safe_val(r, "jobid") for _, r in jobs_df.iterrows()], key="emp_action_jid")
            with ac2:
                if st.button("Pause Posting", key="btn_pause"):
                    _, e = db_manager.execute_query("UPDATE JOB_POSTING SET Status='Paused' WHERE JobID=%s", [action_jid], fetch=False)
                    if e:
                        st.error(e)
                    else:
                        st.success(f"Job {action_jid} paused.")
                        st.rerun()
            with ac3:
                if st.button("Close Posting", key="btn_close"):
                    _, e = db_manager.execute_query("UPDATE JOB_POSTING SET Status='Closed' WHERE JobID=%s", [action_jid], fetch=False)
                    if e:
                        st.error(e)
                    else:
                        st.success(f"Job {action_jid} closed.")
                        st.rerun()

    # ──────────────────────────────────────────────────────────────────────────
    # TAB 3: Applicant Tracking System (ATS)
    # ──────────────────────────────────────────────────────────────────────────
    with tab_ats:
        st.markdown('<div class="section-header">Applicant Tracking System (ATS)</div>', unsafe_allow_html=True)
        st.caption(f"Review candidates and advance hiring stages for Account: **{emp_id}**")

        ats_jobs_df, _ = db_manager.execute_query(
            "SELECT JobID, Title FROM JOB_POSTING WHERE EmployerID = %s ORDER BY PostDate DESC", [emp_id]
        )
        if ats_jobs_df is not None and not ats_jobs_df.empty:
            job_opts = [f"{safe_val(r, 'jobid')} — {safe_val(r, 'title')}" for _, r in ats_jobs_df.iterrows()]
            sel_job = st.selectbox("Select Job Posting to Review Applicants", job_opts, key="ats_sel_job")
            sel_job_id = sel_job.split(" — ")[0] if sel_job else None

            if sel_job_id:
                applicants_df, err = db_manager.get_job_applicants(sel_job_id)
                if err:
                    st.error(f"Error fetching applicants: {err}")
                elif applicants_df is None or applicants_df.empty:
                    st.info(f"No candidates have applied to Job {sel_job_id} yet.")
                else:
                    st.markdown(f"<div class='info-box'>Total Applicants: <strong>{len(applicants_df)}</strong></div>", unsafe_allow_html=True)
                    for _, app in applicants_df.iterrows():
                        aid = safe_val(app, "applicationid")
                        cname = safe_val(app, "candidatename")
                        cemail = safe_val(app, "email")
                        cphone = safe_val(app, "phone")
                        clevel = safe_val(app, "experiencelevel")
                        stg = safe_val(app, "stage")
                        ts = safe_val(app, "timestamp")
                        rpath = safe_val(app, "resumepath")
                        topgpa = safe_val(app, "topgpa")
                        badge = stage_badge(stg)

                        with st.expander(f"{cname} · Stage: {stg} · Top GPA: {topgpa or 'N/A'}"):
                            c1, c2 = st.columns(2)
                            with c1:
                                st.write(f"**Application ID:** `{aid}`")
                                st.write(f"**Email:** {cemail} | **Phone:** {cphone}")
                                st.write(f"**Experience Rating:** {clevel}")
                                st.write(f"**Applied At:** {str(ts)[:16]}")
                                st.write(f"**Resume File:** `{rpath}`")

                            with c2:
                                st.markdown("##### Advance Hiring Stage")
                                stage_opts = ['Applied', 'Reviewed', 'Shortlisted', 'Interviewing', 'Offered', 'Hired', 'Rejected']
                                curr_idx = stage_opts.index(stg) if stg in stage_opts else 0
                                new_stage = st.selectbox("New Stage", stage_opts, index=curr_idx, key=f"ats_stage_{aid}")
                                if st.button("Update Stage", key=f"btn_upstage_{aid}", type="primary"):
                                    _, err = db_manager.update_application_stage(aid, new_stage)
                                    if err:
                                        st.error(err)
                                    else:
                                        st.success(f"Application {aid} moved to {new_stage}!")
                                        st.rerun()

                            # Show Screening answers
                            ans_df, _ = db_manager.get_applicant_answers(aid)
                            if ans_df is not None and not ans_df.empty:
                                st.markdown("##### Candidate's Answers to Screening Questions:")
                                for _, a in ans_df.iterrows():
                                    st.markdown(f"• **{safe_val(a, 'questiontext')}**: `{safe_val(a, 'answertext')}`")
        else:
            st.info("No job postings found for this employer.")

    # ──────────────────────────────────────────────────────────────────────────
    # TAB 4: Register New Company / Employer Account
    # ──────────────────────────────────────────────────────────────────────────
    with tab_register_emp:
        st.markdown('<div class="section-header">Register a New Company & Employer Account</div>', unsafe_allow_html=True)
        st.caption("Create a new corporate account in the database. A unique CompanyID and EmployerID will be assigned with posting credits.")

        # Load available subscription plans
        plans_df, _ = db_manager.execute_query("SELECT PlanID, TierName, PostingLimit, Credits, Price FROM SUBSCRIPTION_PLAN ORDER BY Price")
        plan_options = {}
        if plans_df is not None and not plans_df.empty:
            for _, pl in plans_df.iterrows():
                plan_options[f"{safe_val(pl, 'tiername')} (₹{safe_val(pl, 'price'):,.0f} · {safe_val(pl, 'credits')} Credits)"] = safe_val(pl, 'planid')

        with st.form("form_register_new_employer"):
            st.markdown("##### 1. Corporate Profile Details")
            c1, c2 = st.columns(2)
            with c1:
                new_cname = st.text_input("Company Full Name *", placeholder="e.g. Reliance Jio Infocomm")
                new_trade = st.text_input("Trade / Brand Name", placeholder="e.g. Jio")
                new_ind = st.selectbox("Industry *", ["IT", "FinTech", "E-Commerce", "AI", "Cloud", "Telecom", "Healthcare"])
            with c2:
                new_web = st.text_input("Company Website", placeholder="https://www.company.com")
                new_hq = st.text_input("Headquarters Location *", value="Ahmedabad, India")
                new_desc = st.text_area("About the Company", placeholder="Leading tech and communications enterprise...", height=70)

            st.markdown("##### 2. Employer Account & Credentials")
            e1, e2 = st.columns(2)
            with e1:
                new_emp_email = st.text_input("Official Corporate Email *", placeholder="careers@company.com")
                new_emp_phone = st.text_input("Corporate Contact Phone *", placeholder="+91 79 1234 5678")
            with e2:
                sel_plan_lbl = st.selectbox("Select Subscription Tier *", list(plan_options.keys()))
                sel_plan_id = plan_options[sel_plan_lbl] if plan_options else "PLN-01"

            st.markdown("##### 3. Account Administrator / Recruiter")
            u1, u2 = st.columns(2)
            with u1:
                admin_name = st.text_input("Admin / Lead Recruiter Name", placeholder="e.g. Rahul Sharma")
            with u2:
                admin_email = st.text_input("Recruiter Email", placeholder="e.g. rahul.sharma@company.com")

            btn_reg_emp = st.form_submit_button("Register Company & Activate Account", type="primary")
            if btn_reg_emp:
                if not new_cname or not new_ind or not new_hq or not new_emp_email or not new_emp_phone:
                    st.error("Please fill in all required fields marked with *")
                else:
                    new_eid, new_cid, err = db_manager.register_employer(
                        new_cname, new_trade, new_ind, new_web, new_hq, new_desc,
                        sel_plan_id, new_emp_email, new_emp_phone, admin_name, admin_email
                    )
                    if err:
                        st.error(f"Registration failed: {err}")
                    else:
                        st.session_state["registered_emp_id"] = new_eid
                        st.success(f"Company **{new_cname}** successfully registered! Assigned Employer ID: **{new_eid}** (Company ID: {new_cid})")
                        st.balloons()
                        st.info("The new employer account is now active and selected in the dropdown above!")
                        st.rerun()


# ──────────────────────────────────────────────────────────────────────────────
# PORTAL 3 — ADMIN & ANALYTICS DASHBOARD
# ──────────────────────────────────────────────────────────────────────────────

def portal_admin():
    st.markdown("""
    <div class="header-banner">
        <div class="header-tag">PORTAL / OPERATIONS</div><div class="header-title">Platform Operations & Analytics</div>
        <div class="header-sub">Platform oversight, employer approvals & performance insights</div>
    </div>
    """, unsafe_allow_html=True)

    # ── KPI Cards Row ──
    kpis = db_manager.get_kpis()

    k1, k2, k3, k4 = st.columns(4)
    with k1:
        st.markdown(render_kpi("Total Candidates", f"{kpis['candidates']:,}", "blue"), unsafe_allow_html=True)
    with k2:
        st.markdown(render_kpi("Active Jobs", f"{kpis['active_jobs']:,}", "green"), unsafe_allow_html=True)
    with k3:
        st.markdown(render_kpi("Applications", f"{kpis['applications']:,}", "amber"), unsafe_allow_html=True)
    with k4:
        st.markdown(render_kpi("Verified Employers", f"{kpis['verified_employers']:,}", "purple"), unsafe_allow_html=True)

    st.markdown("<br>", unsafe_allow_html=True)

    tab_approvals, tab_reports, tab_insights = st.tabs([
        "Employer Approvals",
        "Analytics Reports",
        "Platform Insights",
    ])

    # ── Tab 1: Employer Approvals ──
    with tab_approvals:
        st.markdown('<div class="section-header">Pending Employer Verifications</div>', unsafe_allow_html=True)

        pending_sql = """
        SELECT e.EmployerID, e.Email, e.VerificationStatus, c.Name AS CompanyName,
               c.Industry, c.HQ_Location, sp.TierName
        FROM EMPLOYER e
        JOIN COMPANY c ON e.CompanyID = c.CompanyID
        JOIN SUBSCRIPTION_PLAN sp ON e.PlanID = sp.PlanID
        WHERE e.VerificationStatus = 'Pending'
        """
        pending_df, err = db_manager.execute_query(pending_sql)

        if err:
            st.error(f"Error: {err}")
        elif pending_df is None or pending_df.empty:
            st.markdown('<div class="success-box">No pending employer verifications. All caught up!</div>', unsafe_allow_html=True)
        else:
            for _, p in pending_df.iterrows():
                eid = safe_val(p, "employerid")
                eemail = safe_val(p, "email")
                cname = safe_val(p, "companyname")
                ind = safe_val(p, "industry")
                hqloc = safe_val(p, "hq_location")
                tier = safe_val(p, "tiername")

                st.markdown(f"""
                <div class="card" style="border-left:4px solid #F59E0B;">
                    <div style="display:flex; justify-content:space-between; flex-wrap:wrap;">
                        <div>
                            <div style="font-size:1.1rem; font-weight:700; color:#F8FAFC;">{cname}</div>
                            <div style="color:#94A3B8; font-size:0.88rem; margin-top:4px;">
                                Email: {eemail} &nbsp;·&nbsp; Industry: {ind} &nbsp;·&nbsp; Location: {hqloc}
                            </div>
                            <div style="color:#64748B; font-size:0.82rem; margin-top:2px;">
                                ID: {eid} &nbsp;·&nbsp; Credits: Tier: {tier}
                            </div>
                        </div>
                        <div>
                            <span class="badge badge-screening">Pending</span>
                        </div>
                    </div>
                </div>
                """, unsafe_allow_html=True)

                bc1, bc2, _ = st.columns([1, 1, 4])
                with bc1:
                    if st.button("Approve", key=f"approve_{eid}"):
                        _, e = db_manager.execute_query(
                            "UPDATE EMPLOYER SET VerificationStatus='Verified' WHERE EmployerID=%s", [eid], fetch=False
                        )
                        if e:
                            st.error(e)
                        else:
                            st.success(f"Employer {eid} approved!")
                            st.rerun()
                with bc2:
                    if st.button("Reject", key=f"reject_{eid}"):
                        _, e = db_manager.execute_query(
                            "UPDATE EMPLOYER SET VerificationStatus='Rejected' WHERE EmployerID=%s", [eid], fetch=False
                        )
                        if e:
                            st.error(e)
                        else:
                            st.warning(f"Employer {eid} rejected.")
                            st.rerun()

    # ── Tab 2: Analytics Reports ──
    with tab_reports:
        st.markdown('<div class="section-header">Analytics Reports</div>', unsafe_allow_html=True)

        # Revenue by Tier
        st.markdown("##### Revenue by Subscription Tier")
        rev_df, _ = db_manager.execute_query("""
            SELECT sp.TierName, COUNT(e.EmployerID) AS Subscribers, SUM(sp.Price) AS TotalRevenue
            FROM SUBSCRIPTION_PLAN sp
            JOIN EMPLOYER e ON sp.PlanID = e.PlanID
            GROUP BY sp.TierName
        """)
        if rev_df is not None and not rev_df.empty:
            rev_chart = rev_df.copy()
            tier_col = None
            rev_col = None
            for c in rev_chart.columns:
                if c.lower() == "tiername":
                    tier_col = c
                if c.lower() == "totalrevenue":
                    rev_col = c
            if tier_col and rev_col:
                rev_chart = rev_chart.set_index(tier_col)
                st.bar_chart(rev_chart[[rev_col]])
            else:
                st.dataframe(rev_df, use_container_width=True)

        col_a, col_b = st.columns(2)

        with col_a:
            # Top-paying jobs per industry (Lab 10A Q21)
            st.markdown("##### Top-Paying Jobs by Industry")
            top_pay_df, _ = db_manager.execute_query("""
                SELECT j.Title, c.Industry, j.SalaryMax
                FROM JOB_POSTING j
                JOIN EMPLOYER e ON j.EmployerID = e.EmployerID
                JOIN COMPANY c ON e.CompanyID = c.CompanyID
                WHERE j.Status = 'Active'
                ORDER BY j.SalaryMax DESC
                LIMIT 10
            """)
            if top_pay_df is not None and not top_pay_df.empty:
                st.dataframe(top_pay_df, use_container_width=True, hide_index=True)

        with col_b:
            # Unfilled jobs (no applications)
            st.markdown("##### Jobs with No Applications")
            unfilled_df, _ = db_manager.execute_query("""
                SELECT j.JobID, j.Title, j.Location, j.PostDate
                FROM JOB_POSTING j
                WHERE j.Status = 'Active'
                AND j.JobID NOT IN (SELECT DISTINCT JobID FROM APPLICATION)
            """)
            if unfilled_df is not None and not unfilled_df.empty:
                st.dataframe(unfilled_df, use_container_width=True, hide_index=True)
            else:
                st.info("All active jobs have received at least one application.")

        # Application Stage Distribution
        st.markdown("##### Application Stage Distribution")
        stage_df, _ = db_manager.execute_query("""
            SELECT Stage, COUNT(*) AS Count FROM APPLICATION GROUP BY Stage
        """)
        if stage_df is not None and not stage_df.empty:
            stage_chart = stage_df.copy()
            s_col = None
            c_col = None
            for c in stage_chart.columns:
                if c.lower() == "stage":
                    s_col = c
                if c.lower() == "count":
                    c_col = c
            if s_col and c_col:
                stage_chart = stage_chart.set_index(s_col)
                st.bar_chart(stage_chart[[c_col]])
            else:
                st.dataframe(stage_df, use_container_width=True)

    # ── Tab 3: Platform Insights ──
    with tab_insights:
        st.markdown('<div class="section-header">Platform Insights</div>', unsafe_allow_html=True)

        col_i1, col_i2 = st.columns(2)

        with col_i1:
            # Applications per Company
            st.markdown("##### Applications per Company")
            apc_df, _ = db_manager.execute_query("""
                SELECT c.Name AS Company, COUNT(a.ApplicationID) AS Applications
                FROM APPLICATION a
                JOIN JOB_POSTING j ON a.JobID = j.JobID
                JOIN EMPLOYER e ON j.EmployerID = e.EmployerID
                JOIN COMPANY c ON e.CompanyID = c.CompanyID
                GROUP BY c.Name
                ORDER BY Applications DESC
                LIMIT 10
            """)
            if apc_df is not None and not apc_df.empty:
                apc_chart = apc_df.copy()
                comp_col = None
                apps_col = None
                for c in apc_chart.columns:
                    if c.lower() == "company":
                        comp_col = c
                    if c.lower() == "applications":
                        apps_col = c
                if comp_col and apps_col:
                    apc_chart = apc_chart.set_index(comp_col)
                    st.bar_chart(apc_chart[[apps_col]])
                else:
                    st.dataframe(apc_df, use_container_width=True)

        with col_i2:
            # Candidate Skills Distribution
            st.markdown("##### Top Candidate Skills")
            csd_df, _ = db_manager.execute_query("""
                SELECT s.SkillName, COUNT(cs.CandidateID) AS Candidates
                FROM CANDIDATE_SKILL cs
                JOIN SKILL s ON cs.SkillID = s.SkillID
                GROUP BY s.SkillName
                ORDER BY Candidates DESC
                LIMIT 10
            """)
            if csd_df is not None and not csd_df.empty:
                csd_chart = csd_df.copy()
                sk_col = None
                cd_col = None
                for c in csd_chart.columns:
                    if c.lower() == "skillname":
                        sk_col = c
                    if c.lower() == "candidates":
                        cd_col = c
                if sk_col and cd_col:
                    csd_chart = csd_chart.set_index(sk_col)
                    st.bar_chart(csd_chart[[cd_col]])
                else:
                    st.dataframe(csd_df, use_container_width=True)

        # Salary Range Analysis
        st.markdown("##### Salary Range Analysis by Employment Type")
        sal_df, _ = db_manager.execute_query("""
            SELECT EmploymentType,
                   ROUND(AVG(SalaryMin)) AS AvgMinSalary,
                   ROUND(AVG(SalaryMax)) AS AvgMaxSalary,
                   COUNT(*) AS JobCount
            FROM JOB_POSTING
            WHERE Status = 'Active'
            GROUP BY EmploymentType
        """)
        if sal_df is not None and not sal_df.empty:
            st.dataframe(sal_df, use_container_width=True, hide_index=True)


# ──────────────────────────────────────────────────────────────────────────────
# PORTAL 4 — LAB 10A SQL QUERY EXPLORER
# ──────────────────────────────────────────────────────────────────────────────

def portal_sql_explorer():
    st.markdown("""
    <div class="header-banner">
        <div class="header-tag">ENGINE / DATABASE</div><div class="header-title">Lab 10A SQL Query Explorer</div>
        <div class="header-sub">Execute and explore all 30 Lab 10A queries interactively</div>
    </div>
    """, unsafe_allow_html=True)

    queries = load_queries()

    if not queries:
        st.error("Could not load queries.json. Make sure it exists in the app directory.")
        return

    # Query selector
    q_options = [f"Q{q['number']:02d} — {q['description'][:80]}..." if len(q['description']) > 80 else f"Q{q['number']:02d} — {q['description']}" for q in queries]
    selected_idx = st.selectbox("Select a Lab 10A Query", range(len(q_options)), format_func=lambda i: q_options[i], key="sql_q_select")

    selected_q = queries[selected_idx]

    # Description
    st.markdown(f"""
    <div class="info-box">
        <strong>Query {selected_q['number']}:</strong> {selected_q['description']}
    </div>
    """, unsafe_allow_html=True)

    # SQL editor area
    st.markdown('<div class="sql-editor">', unsafe_allow_html=True)
    sql_text = st.text_area("SQL", value=selected_q["sql"], height=180, key="sql_editor", label_visibility="collapsed")
    st.markdown('</div>', unsafe_allow_html=True)

    ec1, ec2 = st.columns([1, 4])
    with ec1:
        run_btn = st.button("Execute Query", type="primary", use_container_width=True, key="btn_run_q")

    if run_btn:
        t0 = time.time()
        result_df, err = db_manager.execute_query(sql_text)
        elapsed = time.time() - t0

        if err:
            st.error(f"Error: Query Error: {err}")
        elif result_df is not None:
            rc1, rc2 = st.columns(2)
            with rc1:
                st.markdown(f'<div class="success-box">Query executed successfully in <strong>{elapsed:.3f}s</strong></div>', unsafe_allow_html=True)
            with rc2:
                st.markdown(f'<div class="info-box">Rows returned: <strong>{len(result_df)}</strong></div>', unsafe_allow_html=True)

            if not result_df.empty:
                st.dataframe(result_df, use_container_width=True, hide_index=True)
            else:
                st.info("Query returned no rows.")
        else:
            st.markdown(f'<div class="success-box">Statement executed in <strong>{elapsed:.3f}s</strong> (no rows returned)</div>', unsafe_allow_html=True)

    # ── Custom SQL Console ──
    st.markdown("---")
    st.markdown('<div class="section-header">Custom SQL Console</div>', unsafe_allow_html=True)

    custom_sql = st.text_area("Write your own SQL query:", height=140, key="custom_sql", placeholder="SELECT * FROM CANDIDATE LIMIT 10;")

    cc1, cc2 = st.columns([1, 4])
    with cc1:
        custom_run = st.button("Run Custom SQL", type="secondary", use_container_width=True, key="btn_custom_sql")

    if custom_run and custom_sql.strip():
        t0 = time.time()
        cdf, cerr = db_manager.execute_query(custom_sql.strip())
        elapsed = time.time() - t0

        if cerr:
            st.error(f"Error: Error: {cerr}")
        elif cdf is not None:
            st.markdown(f'<div class="success-box">Executed in <strong>{elapsed:.3f}s</strong> · {len(cdf)} row(s)</div>', unsafe_allow_html=True)
            if not cdf.empty:
                st.dataframe(cdf, use_container_width=True, hide_index=True)
        else:
            st.markdown(f'<div class="success-box">Statement executed in <strong>{elapsed:.3f}s</strong></div>', unsafe_allow_html=True)


# ──────────────────────────────────────────────────────────────────────────────
# MAIN ENTRY POINT
# ──────────────────────────────────────────────────────────────────────────────

def main():
    portal = render_sidebar()

    if portal == "Candidate Portal":
        portal_candidate()
    elif portal == "Employer Portal":
        portal_employer()
    elif portal == "Admin Dashboard":
        portal_admin()
    elif portal == "SQL Query Explorer":
        portal_sql_explorer()


if __name__ == "__main__":
    main()
