@echo off
REM Quick launcher for REAL AI OSINT Tool

title OSINT Investigator Pro v5.0 - REAL AI

echo.
echo ╔════════════════════════════════════════════════════════════════╗
echo ║     OSINT INVESTIGATOR PRO v5.0 - REAL AI                     ║
echo ║     Powered by GPT-4o via Puter Free API                      ║
echo ╚════════════════════════════════════════════════════════════════╝
echo.
echo Starting Real AI OSINT Tool...
echo.

REM Check for requests library
python -c "import requests" 2>nul
if %errorlevel% neq 0 (
    echo [!] Installing required library: requests
    pip install requests
    echo.
)

REM Run the tool
python osint_real_ai.py

REM If Python is not found, try python3
if %errorlevel% neq 0 (
    python3 osint_real_ai.py
)

REM If still failed, show error
if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Python not found!
    echo.
    echo Please install Python from: https://www.python.org/downloads/
    echo Make sure to check "Add Python to PATH" during installation.
    echo.
    pause
)
