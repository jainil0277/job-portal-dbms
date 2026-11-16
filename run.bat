@echo off
echo ==========================================================
echo  Starting DA-IICT MC212 Team-9 Job Portal Database GUI    
echo  Repository: https://github.com/jainil0277/job-portal-dbms
echo ==========================================================

cd /d "%~dp0"
python --version >nul 2>&1
if errorlevel 1 (
    echo Error: Python is not installed or not in your PATH.
    echo Please install Python 3.10+ from https://www.python.org/
    pause
    exit /b 1
)

echo Checking dependencies...
python -c "import streamlit" >nul 2>&1
if errorlevel 1 (
    echo Installing dependencies from requirements.txt...
    python -m pip install -r requirements.txt
)

echo Launching Streamlit application...
python -m streamlit run app.py
pause
