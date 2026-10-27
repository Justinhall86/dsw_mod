"""Classify every model and texture under model_inputs/Vehicle by its real content, not its name.

    python inventory.py            # file kinds and sizes per vehicle folder
    python inventory.py --models   # also count models inside each HMD (flags multi-part files)

Kinds: HMD (game model, misleadingly named .fbx), FBX (real), DDS (game texture named .png),
PNG (real), GIF. Files under preview_textures/ are skipped: they are our own outputs.
"""
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.abspath(os.path.join(HERE, "..", "..", "..", ".."))
VEH = os.path.join(REPO, "model_inputs", "Vehicle")
WITH_MODELS = "--models" in sys.argv


def kind(path):
    with open(path, "rb") as fh:
        head = fh.read(24)
    if head.startswith(b"HMD"):
        return "HMD"
    if head.startswith(b"Kaydara FBX"):
        return "FBX"
    if head.startswith(b"DDS "):
        return "DDS"
    if head.startswith(b"\x89PNG"):
        return "PNG"
    if head.startswith(b"GIF8"):
        return "GIF"
    return "?"


def model_count(path):
    sys.path.insert(0, os.path.join(REPO, "HMD_toolkit", "HMD_toolkit", "Models"))
    import hmd_reader as H
    d = H.load(path)
    meshes = sum(1 for m in d.models if m.geometry >= 0)
    return "%d models (%d with mesh)" % (len(d.models), meshes)


for faction in sorted(os.listdir(VEH)):
    fdir = os.path.join(VEH, faction)
    if not os.path.isdir(fdir):
        continue
    for veh in sorted(os.listdir(fdir)):
        vdir = os.path.join(fdir, veh)
        if not os.path.isdir(vdir):
            continue
        print("== %s/%s" % (faction, veh))
        for root, _dirs, files in os.walk(vdir):
            if "preview_textures" in root or "preview_frames" in root:
                continue
            for fn in sorted(files):
                p = os.path.join(root, fn)
                if not fn.lower().endswith((".fbx", ".png", ".gif", ".blend")):
                    continue
                rel = os.path.relpath(p, vdir)
                k = kind(p)
                extra = ""
                if WITH_MODELS and k == "HMD":
                    extra = "  " + model_count(p)
                print("   %-55s %-4s %9d%s" % (rel, k, os.path.getsize(p), extra))
