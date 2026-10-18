"""
repack.py -- run the game's repackager LOCALLY to convert one fixed FBX into
its final HMD, without ever touching the user's modding/working directory.

How it works (all inside a throwaway staging folder next to this script):
  1. the ready-for-repackaging FBX is placed in  _stage/res/[res-path/]
  2. D4X.exe (HashLink) is copied INTO the stage from the game's working
     directory (never kept around; pakBuild.hl ships with the toolkit)
  3. the repackager runs with cwd=_stage:
        D4X.exe pakBuild.hl -out res.compressed1
  4. res.compressed1.pak is deleted immediately (not needed)
  5. the converted HMD is taken out of  _stage/res/.tmp/  and moved to its
     final location: --out file, --outdir folder, or (default) next to the
     input FBX
  6. the whole stage -- including the copied D4X.exe -- is deleted: no trace
     is left except the completed HMD

Usage:
  python repack.py fixed.fbx [--out final.hmd | --outdir DIR]
                   [--res-path Anim/Male01]
                   [--workdir <...>/D4XEditor/res | --d4x <path to D4X.exe>]
                   [--keep-stage]
"""

from __future__ import annotations

import os
import shutil
import subprocess
import sys
import time

HERE = os.path.dirname(os.path.abspath(__file__))
TOOLROOT = os.path.dirname(HERE)
sys.path.insert(0, os.path.join(TOOLROOT, "Models"))

D4X_SOURCE_DEFAULT = "C:/Users/Pc/Downloads/NGModding/D4XEditor/res/hl/D4X.exe"
STAGE = os.path.join(HERE, "_stage")


def fs(p):
    return p.replace("\\", "/")


def arg(name, default=None):
    if name in sys.argv:
        return sys.argv[sys.argv.index(name) + 1]
    return default


def resolve_sources(d4x_source=None, workdir=None):
    """Locate the D4X.exe SOURCE (copied fresh into the stage on every run,
    deleted with it) and the toolkit's pakBuild.hl."""
    candidates = []
    if d4x_source:
        candidates.append(d4x_source)
    if workdir:
        candidates.append(os.path.join(workdir, "hl", "D4X.exe"))
    candidates.append(D4X_SOURCE_DEFAULT)
    candidates.append(os.path.join(HERE, "D4X.exe"))  # legacy local copy
    hl_src = next((c for c in candidates if c and os.path.isfile(c)), None)
    if hl_src is None:
        raise SystemExit(
            "D4X.exe not found. Pass --workdir <...>/D4XEditor/res (its "
            "hl/D4X.exe is used) or --d4x <path to D4X.exe>.")
    pb = os.path.join(HERE, "pakBuild.hl")
    if not os.path.isfile(pb):
        raise SystemExit(f"pakBuild.hl missing next to this script: {fs(pb)}")
    return hl_src, pb


def repack(fbx: str, out: str = None, outdir: str = None, res_path: str = "",
           d4x_source: str = None, workdir: str = None,
           keep_stage: bool = False) -> str:
    fbx = os.path.abspath(fbx)
    if not os.path.isfile(fbx):
        raise SystemExit(f"input not found: {fs(fbx)}")
    hl_src, pb = resolve_sources(d4x_source, workdir)

    # ---- 1. fresh local stage --------------------------------------------
    if os.path.isdir(STAGE):
        shutil.rmtree(STAGE)
    res_path = (res_path or "").replace("\\", "/").strip("/")
    dest_dir = os.path.join(STAGE, "res", *res_path.split("/")) \
        if res_path else os.path.join(STAGE, "res")
    os.makedirs(dest_dir, exist_ok=True)
    shutil.copy2(fbx, os.path.join(dest_dir, os.path.basename(fbx)))
    print(f"[1] staged {fs(os.path.basename(fbx))} -> "
          f"{fs(os.path.relpath(dest_dir, STAGE))}/")

    try:
        # ---- 2. copy the exe + HashLink runtime into the stage -------------
        # D4X.exe alone exits with 0xC0000135 (DLL not found): the HashLink
        # host needs libhl.dll and the .hdll modules from the same folder.
        hl = os.path.join(STAGE, "D4X.exe")
        shutil.copy2(hl_src, hl)
        src_dir = os.path.dirname(hl_src)
        n_libs = 0
        for fn in os.listdir(src_dir):
            if fn.lower().endswith((".dll", ".hdll")):
                shutil.copy2(os.path.join(src_dir, fn),
                             os.path.join(STAGE, fn))
                n_libs += 1
        print(f"[2] copied D4X.exe + {n_libs} runtime librar"
              f"{'y' if n_libs == 1 else 'ies'} into the stage "
              "(removed again at the end)")
        cmd = [hl, pb, "-out", "res.compressed1"]
        print(f"    running: D4X.exe pakBuild.hl -out res.compressed1")
        print(f"    cwd: {fs(STAGE)}  (local stage -- your working "
              "directory is not touched)")
        t0 = time.time()
        p = subprocess.run(cmd, cwd=STAGE, capture_output=True, text=True,
                           timeout=1800)
        print(f"    exit code {p.returncode} after {time.time() - t0:.1f}s")
        for line in ((p.stdout or "") + (p.stderr or "")).strip().splitlines()[-10:]:
            print("    |", line)

        # ---- 3. delete the pak immediately --------------------------------
        for fn in os.listdir(STAGE):
            if fn.startswith("res.compressed1"):
                os.remove(os.path.join(STAGE, fn))
                print(f"[3] deleted {fn} (not needed)")

        # ---- 4. harvest the converted HMD from res/.tmp -------------------
        tmp_root = os.path.join(STAGE, "res", ".tmp")
        found = []
        if os.path.isdir(tmp_root):
            for base, _d, files in os.walk(tmp_root):
                for fn in files:
                    if fn.lower().endswith(".hmd"):
                        found.append(os.path.join(base, fn))
        if not found:
            raise SystemExit(
                "no converted HMD appeared in the stage's res/.tmp/ -- see "
                "the repackager output above" +
                ("" if p.returncode == 0 else f" (exit code {p.returncode})"))
        stem = os.path.splitext(os.path.basename(fbx))[0].lower()
        found.sort(key=lambda q: (stem not in os.path.basename(q).lower(),
                                  -os.path.getmtime(q)))
        produced = found[0]
        print(f"[4] converted HMD: "
              f"{fs(os.path.relpath(produced, STAGE))}")

        # ---- 5. move to the designated spot -------------------------------
        final_name = os.path.splitext(os.path.basename(fbx))[0] + ".hmd"
        if out:
            target = os.path.abspath(out)
        elif outdir:
            target = os.path.join(os.path.abspath(outdir), final_name)
        else:
            target = os.path.join(os.path.dirname(fbx), final_name)
        os.makedirs(os.path.dirname(target), exist_ok=True)
        shutil.move(produced, target)
        print(f"[5] final HMD -> {fs(target)}")

        # validate with the toolkit's reader
        import hmd_reader as H
        d = H.load(target)
        info = []
        for a in d.animations:
            info.append(f"animation {a.name!r} ({a.frames} frames, events="
                        f"{[(e.frame, e.data) for e in (a.events or [])]})")
        for m in d.models:
            if m.skin:
                info.append(f"model {m.name!r} ({len(m.skin.joints)} joints)")
        print(f"    validation: parses OK, v{d.version}"
              + (", " + "; ".join(info) if info else ""))
        return target
    finally:
        # ---- 6. delete the rest of the stage -------------------------------
        if keep_stage:
            print(f"    (stage kept for inspection: {fs(STAGE)})")
        elif os.path.isdir(STAGE):
            shutil.rmtree(STAGE, ignore_errors=True)
            print("[6] stage cleaned up -- no trace left (incl. D4X.exe)")


if __name__ == "__main__":
    files = [a for a in sys.argv[1:] if not a.startswith("--")
             and a.lower().endswith(".fbx")]
    if not files:
        print(__doc__)
        sys.exit(1)
    repack(files[0],
           out=arg("--out"),
           outdir=arg("--outdir"),
           res_path=arg("--res-path", ""),
           d4x_source=arg("--d4x"),
           workdir=arg("--workdir"),
           keep_stage="--keep-stage" in sys.argv)
