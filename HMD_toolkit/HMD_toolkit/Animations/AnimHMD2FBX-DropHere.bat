@echo off
rem Drag & drop animation .hmd files TOGETHER WITH at least one model (rig)
rem .hmd onto this script - or drop a whole folder containing both.
rem Models and animations are told apart automatically; each animation is
rem paired with the rig that best covers its bone tracks.
rem Output: model_animation.fbx next to the model file.
if "%~1"=="" (
    echo Drag ^& drop animation .hmd files together with a model .hmd
    echo ^(or a folder containing both^) onto this script.
    pause
    exit /b 1
)
python "%~dp0hmdanim2fbx.py" %*
pause
