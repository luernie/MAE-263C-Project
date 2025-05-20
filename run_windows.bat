@echo off
call venv\Scripts\activate.bat

if errorlevel 1 (
    echo Error: Failed to activate virtual environment.
    exit /b 1
)

venv\Scripts\python.exe camera.py

if errorlevel 1 (
    echo Error: Failed to run camera.py.
    exit /b 1
)

@REM python3.10.exe minilab2_hardware.py