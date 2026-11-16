#!/bin/bash
echo "=========================================================="
echo " Starting DA-IICT MC212 Team-9 Job Portal Database GUI... "
echo "=========================================================="
cd "$(dirname "$0")"
/opt/homebrew/bin/python3.11 -m streamlit run app.py
