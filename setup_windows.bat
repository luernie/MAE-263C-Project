@echo off

REM Check if the venv folder exists
IF EXIST "venv" (
    echo Trying here
    call venv\Scripts\activate
    echo Done

) ELSE (
    python -m venv venv
    call venv\Scripts\activate.bat
    python -m pip install --upgrade pip
    python -m pip install --upgrade pip setuptools
    python -m pip install pyyaml --no-warn-script-location
    python -m pip install ./mechae263C_helpers --no-warn-script-location
    python -m pip install ./dynamixel-controller --no-warn-script-location
    
    python -m pip install opencv-python
    if errorlevel 1 (
        echo Error: Failed to install opencv-python.
        exit /b 1
    )

    python -m pip install opencv-contrib-python
    if errorlevel 1 (
        echo Error: Failed to install opencv-contrib-python.
        exit /b 1
    )
)

REM Check installed packages
echo Listing installed packages...
@REM call venv\Scripts\activate.bat
python -m pip list


@REM REM Update prompt
@REM set PROMPT=(venv) %PROMPT%

echo Setup completed successfully.



@REM @echo off

@REM REM Check if the venv folder exists
@REM IF EXIST "venv" (
@REM     echo Trying here
@REM     call venv\Scripts\activate.bat
@REM     echo Done

@REM ) ELSE (
@REM     python3.10.exe -m venv venv
@REM     call venv\Scripts\activate.bat
@REM     python3.10.exe -m pip install --upgrade pip
@REM     python3.10.exe -m pip install --upgrade pip setuptools
@REM     python3.10.exe -m pip install pyyaml --no-warn-script-location
@REM     python3.10.exe -m pip install ./mechae263C_helpers --no-warn-script-location
@REM     python3.10.exe -m pip install ./dynamixel-controller --no-warn-script-location
@REM     python3.10.exe -m pip install opencv-python
@REM     if errorlevel 1 (
@REM         echo Error: Failed to install opencv-python.
@REM         exit /b 1
@REM     )

@REM     python3.10.exe -m pip install opencv-contrib-python
@REM     if errorlevel 1 (
@REM         echo Error: Failed to install opencv-contrib-python.
@REM         exit /b 1
@REM     )
@REM )

@REM REM Check installed packages
@REM echo Listing installed packages...
@REM @REM call venv\Scripts\activate.bat
@REM python3.10.exe -m pip list


@REM @REM REM Update prompt
@REM @REM set PROMPT=(venv) %PROMPT%

@REM echo Setup completed successfully.