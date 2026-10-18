Set-Location $PSScriptRoot
$Host.UI.RawUI.WindowTitle = "DUNE: SPICE WARS - MOD DEPLOYER"

function Write-Fancy($text, $color) { Write-Host $text -ForegroundColor $color }
function Write-Step($icon, $text) {
    Write-Host ""
    Write-Host "  $icon " -ForegroundColor Yellow -NoNewline
    Write-Host $text -ForegroundColor Cyan
}
function Show-Spinner($task, $scriptBlock) {
    $frames = @("[   *   ]","[  ***  ]","[ ***** ]","[*******]","[ ***** ]","[  ***  ]")
    Write-Host ""
    Write-Host "  " -NoNewline
    $job = Start-Job -ScriptBlock $scriptBlock -ArgumentList $PSScriptRoot
    $i = 0
    while ($job.State -eq 'Running') {
        Write-Host "`r  $($frames[$i % $frames.Count]) $task" -ForegroundColor DarkYellow -NoNewline
        Start-Sleep -Milliseconds 150
        $i++
    }
    Receive-Job $job -ErrorAction SilentlyContinue | Out-Null
    Remove-Job $job -ErrorAction SilentlyContinue
    Write-Host "`r  [  DONE  ] $task" -ForegroundColor Green
}

# ============================================================
#  TITLE SCREEN
# ============================================================
Clear-Host
Write-Host ""
Write-Host ""
Write-Fancy "  ================================================================" DarkYellow
Write-Fancy "  |                                                              |" DarkYellow
Write-Fancy "  |         ____  _   _ _   _ _____                              |" DarkYellow
Write-Fancy "  |        |  _ \| | | | \ | | ____|                             |" DarkYellow
Write-Fancy "  |        | | | | | | |  \| |  _|                               |" DarkYellow
Write-Fancy "  |        | |_| | |_| | |\  | |___                              |" DarkYellow
Write-Fancy "  |        |____/ \___/|_| \_|_____|                             |" DarkYellow
Write-Fancy "  |                                                              |" DarkYellow
Write-Fancy "  |            S P I C E   W A R S   M O D D E R                |" DarkYellow
Write-Fancy "  |                                                              |" DarkYellow
Write-Fancy "  ================================================================" DarkYellow
Write-Host ""
Write-Fancy "           The spice must flow... with YOUR changes!              " White
Write-Host ""
Start-Sleep -Seconds 1

# ============================================================
#  STEP 1: Clean up old files
# ============================================================
Write-Step "1/5" "Clearing old mod files..."
Remove-Item .\res\data.cdb -ErrorAction SilentlyContinue
Remove-Item res*.pak -ErrorAction SilentlyContinue
Write-Fancy "        Old files swept away like sand in the wind!" DarkGray
Start-Sleep -Milliseconds 500

# ============================================================
#  STEP 2: Copy your modded data
# ============================================================
Write-Step "2/5" "Copying your awesome modded data..."
Copy-Item -Path .\data.cdb -Destination .\res
Write-Fancy "        Your changes have been loaded into the system!" DarkGray
Start-Sleep -Milliseconds 500

# ============================================================
#  STEP 3: Compile with Haxe
# ============================================================
Write-Step "3/5" "Compiling the mod builder..."
Show-Spinner "Haxe is preparing..." {
    param($dir)
    Set-Location $dir
    & haxe -hl hxd.fmt.pak.Build.hl -lib heaps -main hxd.fmt.pak.Build 2>&1
}

# ============================================================
#  STEP 4: Build the .pak file
# ============================================================
Write-Step "4/5" "Building your mod package..."
Show-Spinner "Packing everything together..." {
    param($dir)
    Set-Location $dir
    & "C:\HaxeToolkit\hashlink-1.15.0-win\hl.exe" hxd.fmt.pak.Build.hl -diff -out res.compressed1 2>&1
}

# ============================================================
#  STEP 5: Deploy to Steam
# ============================================================
Write-Step "5/5" "Deploying mod to Dune: Spice Wars..."
Copy-Item -Path .\res.compressed1.pak -Destination "C:\Program Files (x86)\Steam\steamapps\common\D4X"
Write-Fancy "        Mod shipped to the game folder!" DarkGray
Start-Sleep -Milliseconds 500

# ============================================================
#  VICTORY SCREEN
# ============================================================
Write-Host ""
Write-Host ""
Write-Fancy "  ================================================================" Green
Write-Fancy "  |                                                              |" Green
Write-Fancy "  |              YOUR MOD IS READY!                              |" Green
Write-Fancy "  |                                                              |" Green
Write-Fancy "  |     res.compressed1.pak has been deployed to Dune!           |" Green
Write-Fancy "  |                                                              |" Green
Write-Fancy "  |          Go launch the game and see your changes!            |" Green
Write-Fancy "  |                                                              |" Green
Write-Fancy "  ================================================================" Green
Write-Host ""
Write-Fancy "     He who controls the spice, controls the universe!            " Yellow
Write-Fancy "                  ...and YOU control the spice now.               " DarkYellow
Write-Host ""
Write-Host ""
Write-Host "  Press any key to exit..." -ForegroundColor Magenta
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")