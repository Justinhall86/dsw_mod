#!/usr/bin/env python3
"""Convert every game-HMD-pretending-to-be-FBX under a folder into a TRUE binary FBX.

Game assets extracted from DSW are Heaps HMD files even when they carry an .fbx extension; Blender can't open
those. This finds every *.fbx in the subfolders of a root, detects by content what it really is, and writes
<name>_TRUE_FBX.fbx next to it:
  * HMD model      -> hmd2fbx (mesh + armature + skin + material/texture references)
  * HMD animation  -> hmdanim2fbx on the best-matching rig model from the same folder tree (the rig whose joint
                      names cover the most of the clip's animated bones), so the clip plays on a character
  * already binary FBX -> copied unchanged under the _TRUE_FBX name (so every input has a clearly named output)
  * ASCII FBX      -> reported, not converted (Blender can't read it either; re-export it from the source tool)
Originals are never modified. Existing outputs are skipped unless --force.

Usage:  python hmd_to_true_fbx.py <root> [--force] [--suffix _TRUE_FBX]
"""
import argparse
import os
import shutil
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
from dsw_common import cfg  # noqa: E402

TK = cfg("toolkit_dir")
sys.path.insert(0, os.path.join(TK, "Models"))
sys.path.insert(0, os.path.join(TK, "Animations"))
import hmd_reader as H  # noqa: E402
import hmd2fbx  # noqa: E402
import hmdanim2fbx  # noqa: E402


def kind_of(path):
    head = open(path, "rb").read(32)
    if head.startswith(b"Kaydara FBX Binary"):
        return "binary-fbx"
    if head.lstrip().startswith(b"; FBX"):
        return "ascii-fbx"
    if head[:3] == b"HMD":
        return "hmd"
    return "unknown"


def skin_joints(d):
    for m in d.models:
        if m.skin:
            return {j.name for j in m.skin.joints}
    return set()


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("root")
    ap.add_argument("--force", action="store_true")
    ap.add_argument("--suffix", default="_TRUE_FBX")
    a = ap.parse_args()

    files = []
    for r, dirs, fs in os.walk(a.root):
        if os.path.abspath(r) == os.path.abspath(a.root):
            continue                                   # subfolders only
        for f in sorted(fs):
            if f.lower().endswith(".fbx") and not os.path.splitext(f)[0].endswith(a.suffix):
                files.append(os.path.join(r, f))
    print(f"{len(files)} .fbx files in subfolders of {a.root}\n")

    info = {}
    for p in files:
        k = kind_of(p)
        info[p] = {"kind": k}
        if k == "hmd":
            try:
                d = H.load(p)
                info[p]["data"] = d
                info[p]["is_anim"] = bool(d.animations) and not d.geometries
            except Exception as e:
                info[p]["kind"] = f"unreadable-hmd ({e})"

    models = {p: skin_joints(i["data"]) for p, i in info.items() if i["kind"] == "hmd" and not i.get("is_anim")}
    models = {p: j for p, j in models.items() if j}

    results = []
    for p in files:
        i = info[p]
        stem = os.path.splitext(os.path.basename(p))[0]
        out = os.path.join(os.path.dirname(p), stem + a.suffix + ".fbx")
        rel = os.path.relpath(p, a.root)
        if os.path.exists(out) and not a.force:
            results.append((rel, "skipped (exists)", os.path.basename(out)))
            continue
        try:
            if i["kind"] == "binary-fbx":
                shutil.copy2(p, out)
                results.append((rel, "already a true FBX: copied", os.path.basename(out)))
            elif i["kind"] == "ascii-fbx":
                results.append((rel, "ASCII FBX: NOT converted (re-export as binary from the source tool)", ""))
            elif i["kind"] == "hmd" and not i["is_anim"]:
                hmd2fbx.convert(p, out) if hasattr(hmd2fbx, "convert") and hmd2fbx.convert.__code__.co_argcount >= 2 \
                    else sys.exit("hmd2fbx.convert signature changed")
                results.append((rel, "HMD model -> FBX", os.path.basename(out)))
            elif i["kind"] == "hmd":
                tracks = {o.name for o in i["data"].animations[0].objects}
                top = os.path.relpath(p, a.root).split(os.sep)[0]          # rigs only from the clip's own top-level folder
                scored = sorted(((len(tracks & j), -len(j), mp) for mp, j in models.items()
                                 if os.path.relpath(mp, a.root).split(os.sep)[0] == top), reverse=True)
                if not scored or scored[0][0] == 0:
                    results.append((rel, "HMD animation: no rig model with matching bones found", ""))
                    continue
                cover, _, rig = scored[0]
                hmdanim2fbx.export(rig, p, out)
                results.append((rel, f"HMD animation -> FBX on rig {os.path.basename(rig)} ({cover}/{len(tracks)} tracks matched)",
                                os.path.basename(out)))
            else:
                results.append((rel, f"{i['kind']}: skipped", ""))
        except SystemExit as e:
            results.append((rel, f"FAILED: {e}", ""))
        except Exception as e:
            results.append((rel, f"FAILED: {type(e).__name__}: {e}", ""))

    w = max(len(r[0]) for r in results)
    for rel, status, out in results:
        print(f"{rel:<{w}}  {status}" + (f"  ->  {out}" if out else ""))
    bad = [r for r in results if r[1].startswith(("FAILED", "ASCII", "HMD animation: no"))]
    print(f"\n{len(results) - len(bad)} ok, {len(bad)} need attention")
    sys.exit(1 if bad else 0)


if __name__ == "__main__":
    main()
