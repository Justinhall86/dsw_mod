@echo off
rem Drag & drop a Blender-exported animation .fbx TOGETHER WITH the reference
rem animation .hmd (the original you edited) onto this script.
rem Output: Anim_Male01_<name>.fbx next to the input, ready for the
rem repackager's Anim/Male01/ folder. (For another rig, run animfix.py
rem manually with --rig <name>.)
rem AFTER repackaging, restore events with:
rem   python animfix.py --inject-events repackaged.hmd reference.hmd
if "%~1"=="" (
    echo Drag ^& drop a Blender-exported animation .fbx together with the
    echo original animation .hmd onto this script.
    pause
    exit /b 1
)
python "%~dp0animfix.py" %*
pause
