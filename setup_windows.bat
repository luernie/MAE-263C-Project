@echo off

REM Check if the venv folder exists
IF EXIST "venv" (
    echo Trying here
    call venv\Scripts\activate.bat
    echo Done

) ELSE (
    python3.10.exe -m venv venv
    call venv\Scripts\activate.bat
    python3.10.exe -m pip install --upgrade pip
    python3.10.exe -m pip install --upgrade pip setuptools
    python3.10.exe -m pip install pyyaml --no-warn-script-location
    python3.10.exe -m pip install ./mechae263C_helpers --no-warn-script-location
    python3.10.exe -m pip install ./dynamixel-controller --no-warn-script-location
    python3.10.exe -m pip install opencv-python
    if errorlevel 1 (
        echo Error: Failed to install opencv-python.
        exit /b 1
    )

    python3.10.exe -m pip install opencv-contrib-python
    if errorlevel 1 (
        echo Error: Failed to install opencv-contrib-python.
        exit /b 1
    )
)

REM Check installed packages
echo Listing installed packages...
@REM call venv\Scripts\activate.bat
pip list


@REM REM Update prompt
@REM set PROMPT=(venv) %PROMPT%

echo Setup completed successfully.