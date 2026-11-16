#!/bin/bash
set -e

echo "=========================================================="
echo " Starting DA-IICT MC212 Team-9 Job Portal Database GUI    "
echo " Repository: https://github.com/jainil0277/job-portal-dbms"
echo "=========================================================="

cd "$(dirname "$0")"

# Detect Python command
if command -v python3 &>/dev/null; then
    PY_CMD="python3"
elif command -v python &>/dev/null; then
    PY_CMD="python"
elif [ -f "/opt/homebrew/bin/python3.11" ]; then
    PY_CMD="/opt/homebrew/bin/python3.11"
else
    echo "Error: Python 3 not found on PATH. Please install Python 3.10+."
    exit 1
fi

echo "Using Python: $($PY_CMD --version)"

# Check and install requirements if streamlit is missing
if ! $PY_CMD -c "import streamlit" &>/dev/null; then
    echo "Streamlit not found. Installing dependencies from requirements.txt..."
    $PY_CMD -m pip install -r requirements.txt
fi

echo "Launching Streamlit GUI..."
$PY_CMD -m streamlit run app.py
