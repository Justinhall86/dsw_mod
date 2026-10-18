@echo off
rem Drag & drop a Blender-exported .fbx TOGETHER WITH the original .hmd onto
rem this script (select both, drop as one). The .hmd is used to restore the
rem skeleton's bone frames so original animations keep working.
rem Output: name_fixed.fbx next to each input .fbx
if "%~1"=="" (
    echo Drag ^& drop a Blender-exported .fbx together with its original .hmd
    pause
    exit /b 1
)
python "%~dp0fbxfix.py" %*
pause
