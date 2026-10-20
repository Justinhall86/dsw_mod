#!/usr/bin/env python3
"""Build + VERIFY-BY-EXTRACTION + install. For routine deploys prefer the faster
C:\\dsw_mod\\D4XEditor\\res\\repackage.py --quiet [--no-launch]; use this one when you need proof of
exactly what is inside the pak.

Steps (each one fails loudly rather than leaving a half-installed game):
  1. refuse if D4X.exe is running (the game holds the pak open; copying over it corrupts it)
  2. stage the working data.cdb (mod_files) -> <editor>/res/res/data.cdb, delete stale res*.pak
  3. compile Heaps' pak builder with Haxe (in a temp dir) and run it with -diff
  4. extract the new pak and verify every staged file is inside and identical
  5. move the pak currently in the game folder (and any stray res*.pak) to the archive dir
     OUTSIDE the game folder, copy the new one in as res.compressed1.pak, byte-compare the copy

Usage:
  python deploy_pak.py                  # build, verify, install into the game dir
  python deploy_pak.py --dry-run        # build + verify only
  python deploy_pak.py --game-dir X     # install somewhere else (e.g. a sandbox)

Why the numbered name: the game loads res.compressed<N>.pak by number and ignores other names.
Why -diff: the pak holds only what differs from the base game, so it stays small (~12 MB).
"""
import argparse
import datetime
import filecmp
import os
import shutil
import subprocess
import sys
import tempfile

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from dsw_common import cdb_path, cfg, editor_res  # noqa: E402

PAK = "res.compressed1.pak"


def run(cmd, cwd, what):
    r = subprocess.run(cmd, cwd=cwd, capture_output=True, text=True)
    if r.returncode != 0:
        sys.exit(f"{what} failed (exit {r.returncode}):\n{r.stdout}\n{r.stderr}")
    return r.stdout


def process_running(name):
    out = subprocess.run(["tasklist", "/FI", f"IMAGENAME eq {name}"], capture_output=True, text=True).stdout
    return name.lower() in out.lower()


def build(res_dir, workdir):
    for f in os.listdir(res_dir):
        if f.startswith("res") and f.endswith(".pak"):
            os.remove(os.path.join(res_dir, f))
    os.makedirs(os.path.join(res_dir, "res"), exist_ok=True)
    shutil.copy2(cdb_path(), os.path.join(res_dir, "data.cdb"))          # editor view in sync
    shutil.copy2(cdb_path(), os.path.join(res_dir, "res", "data.cdb"))   # what gets packed
    hl_file = os.path.join(workdir, "hxd.fmt.pak.Build.hl")
    haxe = cfg("haxe")
    run([haxe, "-hl", hl_file, "-lib", "heaps", "-main", "hxd.fmt.pak.Build"], res_dir, "haxe compile")
    run([cfg("hl"), hl_file, "-diff", "-out", "res.compressed1"], res_dir, "pak build")
    pak = os.path.join(res_dir, PAK)
    if not os.path.exists(pak):
        sys.exit("pak build reported success but produced no " + PAK)
    return pak, hl_file


def verify(pak, hl_file, res_dir, workdir):
    out = os.path.join(workdir, "extracted")
    shutil.rmtree(out, ignore_errors=True)
    run([cfg("hl"), hl_file, "-out", out, "-x", pak], res_dir, "pak extract")
    src_root = os.path.join(res_dir, "res")
    problems = []
    n = 0
    for root, _, files in os.walk(src_root):
        for f in files:
            src = os.path.join(root, f)
            rel = os.path.relpath(src, src_root)
            dst = os.path.join(out, rel)
            n += 1
            if not os.path.exists(dst):
                problems.append("missing in pak: " + rel)
            elif not filecmp.cmp(src, dst, shallow=False):
                problems.append("differs in pak: " + rel)
    if problems:
        sys.exit("VERIFY FAILED:\n  " + "\n  ".join(problems))
    print(f"verified: {n} files in pak match the staged res/ folder")


BASE_PAK = "res.compressed.pak"   # the vanilla game data - never touched


def stray_paks(game_dir):
    """Every res*.pak in the game folder except the base pak and ours.

    The game loads EVERY res*.pak in the folder in alphanumeric order, and later files override
    earlier ones. 'res.compressed1_archived_x.pak' sorts AFTER 'res.compressed1.pak' ('_' > '.'),
    so an old build left in the folder silently overrides the new one."""
    return sorted(f for f in os.listdir(game_dir)
                  if f.lower().startswith("res") and f.lower().endswith(".pak") and f not in (BASE_PAK, PAK))


def install(pak, game_dir, archive_dir, move_strays=False):
    if not os.path.isdir(game_dir):
        sys.exit(f"game dir not found: {game_dir}")
    os.makedirs(archive_dir, exist_ok=True)
    stamp = datetime.datetime.now().strftime("%Y-%m-%d_%H%M%S")
    strays = stray_paks(game_dir)
    if strays and not move_strays:
        sys.exit("other res*.pak files in the game folder would load after/around ours and override it:\n  "
                 + "\n  ".join(strays) + f"\nre-run with --move-strays to move them to {archive_dir}")
    for f in strays:
        shutil.move(os.path.join(game_dir, f), os.path.join(archive_dir, f))
        print("moved stray pak out of the game folder ->", os.path.join(archive_dir, f))
    dest = os.path.join(game_dir, PAK)
    if os.path.exists(dest):
        arch = os.path.join(archive_dir, f"res.compressed1_{stamp}.pak")
        shutil.move(dest, arch)          # archive OUTSIDE the game folder (see stray_paks)
        print("archived old pak ->", arch)
    shutil.copy2(pak, dest)
    if not filecmp.cmp(pak, dest, shallow=False):
        sys.exit("installed pak does not match the built pak!")
    print(f"installed + byte-verified: {dest} ({os.path.getsize(dest):,} bytes)")
    print("game folder paks now:", sorted(f for f in os.listdir(game_dir) if f.lower().endswith(".pak")))


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--game-dir", default=cfg("game_dir"))
    ap.add_argument("--dry-run", action="store_true", help="build and verify, do not install")
    ap.add_argument("--force", action="store_true", help="install even if D4X.exe is running (not advised)")
    ap.add_argument("--archive-dir", default=cfg("archive_dir"),
                    help="where replaced paks go; must NOT be the game folder")
    ap.add_argument("--move-strays", action="store_true",
                    help="move other res*.pak files out of the game folder into --archive-dir")
    ap.add_argument("--install-only", action="store_true",
                    help="skip the build; install the pak already built in the editor res folder")
    a = ap.parse_args()
    if os.path.normcase(os.path.abspath(a.archive_dir)) == os.path.normcase(os.path.abspath(a.game_dir)):
        sys.exit("--archive-dir must not be the game folder (the game loads every res*.pak there)")

    if not a.dry_run and not a.force and process_running("D4X.exe"):
        sys.exit("D4X.exe is running - close the game first, then re-run.")
    if process_running("nw.exe"):
        print("note: nw.exe (the CastleDB editor) is open. If it holds an older data.cdb, "
              "saving there will overwrite our edits - close it without saving.")
    res_dir = editor_res()
    if a.install_only:
        pak = os.path.join(res_dir, PAK)
        if not os.path.exists(pak):
            sys.exit("no built pak at " + pak)
        install(pak, a.game_dir, a.archive_dir, a.move_strays)
        return
    workdir = tempfile.mkdtemp(prefix="dsw_pak_")
    try:
        pak, hl_file = build(res_dir, workdir)
        print(f"built {pak} ({os.path.getsize(pak):,} bytes)")
        verify(pak, hl_file, res_dir, workdir)
        if a.dry_run:
            print("dry run: not installed")
        else:
            install(pak, a.game_dir, a.archive_dir, a.move_strays)
    finally:
        shutil.rmtree(workdir, ignore_errors=True)


if __name__ == "__main__":
    main()
