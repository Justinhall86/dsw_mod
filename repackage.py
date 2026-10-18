#!/usr/bin/env python3
"""Repackage script for Dune: Spice Wars mods.

Backs up data.cdb with the current version number, then compiles and
deploys the mod via Haxe/Hashlink.
"""

import datetime
import os
import shutil
import subprocess
import sys
import time
from pathlib import Path

SCRIPT_DIR = Path(__file__).parent.resolve()
HL_EXE     = Path(r"C:\HaxeToolkit\hashlink-1.15.0-win\hl.exe")
STEAM_PATH = Path(r"C:\Program Files (x86)\Steam\steamapps\common\D4X")

# ── Update this when you bump your mod version ────────────────────────
VERSION = "1.0.0"
# ─────────────────────────────────────────────────────────────────────

YELLOW = "\033[33m"
CYAN = "\033[36m"
WHITE = "\033[37m"
DARK_GRAY = "\033[90m"
GREEN = "\033[32m"
MAGENTA = "\033[35m"
RESET = "\033[0m"


def _c(text: str, color: str) -> str:
    return f"{color}{text}{RESET}"


def show_step(num: str, text: str) -> None:
    print()
    print(f"  {_c(num, YELLOW)} {_c(text, CYAN)}")


def run_with_spinner(label: str, cmd: list[str]) -> int:
    frames = ["[   *   ]", "[  ***  ]", "[ ***** ]", "[*******]", "[ ***** ]", "[  ***  ]"]
    proc = subprocess.Popen(
        cmd, cwd=SCRIPT_DIR,
        stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
    )
    i = 0
    while proc.poll() is None:
        frame = frames[i % len(frames)]
        print(f"\r  {_c(frame, YELLOW)} {label}", end="", flush=True)
        time.sleep(0.15)
        i += 1
    print(f"\r  {_c('[  DONE  ]', GREEN)} {label}     ")
    return proc.returncode


def title_screen() -> None:
    os.system("cls" if os.name == "nt" else "clear")
    box = [
        "  ================================================================",
        "  |                                                              |",
        r"  |         ____  _   _ _   _ _____                              |",
        r"  |        |  _ \| | | | \ | | ____|                             |",
        r"  |        | | | | | | |  \| |  _|                               |",
        r"  |        | |_| | |_| | |\  | |___                              |",
        r"  |        |____/ \___/|_| \_|_____|                             |",
        "  |                                                              |",
        "  |            S P I C E   W A R S   M O D D E R                |",
        "  |                                                              |",
        "  ================================================================",
    ]
    for line in box:
        print(_c(line, YELLOW))
    print()
    print(_c("           The spice must flow... with YOUR changes!              ", WHITE))
    print()
    time.sleep(1)


def victory_screen() -> None:
    print()
    print()
    box = [
        "  ================================================================",
        "  |                                                              |",
        "  |              YOUR MOD IS READY!                              |",
        "  |                                                              |",
        "  |     res.compressed1.pak has been deployed to Dune!           |",
        "  |                                                              |",
        "  |          Go launch the game and see your changes!            |",
        "  |                                                              |",
        "  ================================================================",
    ]
    for line in box:
        print(_c(line, GREEN))
    print()
    print(_c("     He who controls the spice, controls the universe!            ", YELLOW))
    print(_c("                  ...and YOU control the spice now.               ", YELLOW))
    print()
    print()
    input(_c("  Press Enter to exit...", MAGENTA))


def main() -> None:
    os.chdir(SCRIPT_DIR)

    cdb_src = SCRIPT_DIR / "data.cdb"
    version = VERSION
    timestamp = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")

    title_screen()

    # ------------------------------------------------------------------
    # Step 1: Back up data.cdb with version number
    # ------------------------------------------------------------------
    show_step("1/6", "Backing up data.cdb with version number...")
    backups_dir = SCRIPT_DIR / "backups"
    backups_dir.mkdir(exist_ok=True)
    if cdb_src.exists():
        dest_name = f"data_v{version}_{timestamp}.cdb"
        shutil.copy2(cdb_src, backups_dir / dest_name)
        print(_c(f"        Saved to backups/{dest_name}", DARK_GRAY))
    else:
        print(_c("        Warning: data.cdb not found — skipping backup.", MAGENTA))
    time.sleep(0.5)

    # ------------------------------------------------------------------
    # Step 2: Clean up old files
    # ------------------------------------------------------------------
    show_step("2/6", "Clearing old mod files...")
    old_cdb = SCRIPT_DIR / "res" / "data.cdb"
    if old_cdb.exists():
        old_cdb.unlink()
    for pak in SCRIPT_DIR.glob("res*.pak"):
        pak.unlink()
    print(_c("        Old files swept away like sand in the wind!", DARK_GRAY))
    time.sleep(0.5)

    # ------------------------------------------------------------------
    # Step 3: Copy modded data into res/
    # ------------------------------------------------------------------
    show_step("3/6", "Copying your awesome modded data...")
    res_dir = SCRIPT_DIR / "res"
    res_dir.mkdir(exist_ok=True)
    shutil.copy2(cdb_src, res_dir / "data.cdb")
    print(_c("        Your changes have been loaded into the system!", DARK_GRAY))
    time.sleep(0.5)

    # ------------------------------------------------------------------
    # Step 4: Compile with Haxe
    # ------------------------------------------------------------------
    show_step("4/6", "Compiling the mod builder...")
    rc = run_with_spinner(
        "Haxe is preparing...",
        ["haxe", "-hl", "hxd.fmt.pak.Build.hl", "-lib", "heaps", "-main", "hxd.fmt.pak.Build"],
    )
    if rc != 0:
        print(_c("        ERROR: Haxe compilation failed!", MAGENTA))
        sys.exit(rc)

    # ------------------------------------------------------------------
    # Step 5: Build the .pak file
    # ------------------------------------------------------------------
    show_step("5/6", "Building your mod package...")
    rc = run_with_spinner(
        "Packing everything together...",
        [str(HL_EXE), "hxd.fmt.pak.Build.hl", "-diff", "-out", "res.compressed1"],
    )
    if rc != 0:
        print(_c("        ERROR: .pak build failed!", MAGENTA))
        sys.exit(rc)

    # ------------------------------------------------------------------
    # Step 6: Deploy to Steam
    # ------------------------------------------------------------------
    show_step("6/6", "Deploying mod to Dune: Spice Wars...")
    shutil.copy2(SCRIPT_DIR / "res.compressed1.pak", STEAM_PATH)
    print(_c("        Mod shipped to the game folder!", DARK_GRAY))
    time.sleep(0.5)

    victory_screen()


if __name__ == "__main__":
    main()
