@echo off
setlocal
set REPO=C:\Users\justi\OneDrive\Python\dsw_mod
set BLENDER="C:\Program Files\Blender Foundation\Blender 5.2\blender.exe"
set UNITS=imperial_aramsham,Imperial_Aramsham.blend;imperial_flamethrower,Imperial_FlameThrower.blend;imperial_houseguard,Imperial_HouseGuard.blend;imperial_lazatiger,Imperial_LazaTiger.blend;imperial_shaddam,Emperor_Shaddam.blend;imperial_sardaukar,Imperial_Sardaukar.blend;imperial_trooper,Imperial_Trooper.blend;imperial_wensicia,Imperial_Wensicia.blend

for /f "tokens=1,2 delims=," %%A in (%UNITS%) do (
    set PROJECT=%%A
    set BLEND=%%B
    set PROJECT_PATH=%REPO%\model_projects\%PROJECT%
    set BLEND_PATH=%PROJECT_PATH%\03_blender\%BLEND%
    set LOG=%PROJECT_PATH%\08_scripts\blender_verify.log
    set ERR=%PROJECT_PATH%\08_scripts\blender_verify_errors.log
    echo VERIFY_START %PROJECT%
    call "%BLENDER%" -b -python scripts/08_verify_blend.py -- %BLEND_PATH% --png > "%LOG%" 2> "%ERR%"
    for /L %I in (1,1,180) do (
        timeout /t 1 >nul
        set /p LINE= < %LOG%
        echo %LINE% | find "PROBLEMS: none" >nul && (
            echo VERIFY_OK %PROJECT%
            goto VERIFY_DONE
        )
        if %I==180 goto VERIFY_TIMEOUT
    )
    :VERIFY_TIMEOUT
    echo VERIFY_FAILED %PROJECT%
    :VERIFY_DONE
)
echo ALL_VERIFY_DONE