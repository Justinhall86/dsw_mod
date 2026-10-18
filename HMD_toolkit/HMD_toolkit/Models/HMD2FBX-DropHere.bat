@echo off
rem Drag & drop one or more .hmd files onto this .bat to convert them to .fbx
rem (output lands next to each input file)
if "%~1"=="" (
    echo Drag ^& drop .hmd files onto this script to convert them to .fbx
    pause
    exit /b 1
)
python "%~dp0hmd2fbx.py" %*
if errorlevel 1 (
    echo.
    echo Conversion finished with errors - see messages above.
) else (
    echo.
    echo Done.
)
pause
