"""Convert a DSW vehicle HMD (disguised as .fbx) plus its DDS textures into usable files.

    python 00_convert.py <src_dir> <out_dir> [stem ...]
"""
import os
import sys

from PIL import Image

REPO = r"C:\Users\justi\Python\dsw_mod"
sys.path.insert(0, os.path.join(REPO, "HMD_toolkit", "HMD_toolkit", "Models"))
import hmd2fbx  # noqa: E402

SRC = os.path.abspath(sys.argv[1])
OUT = os.path.abspath(sys.argv[2])
STEMS = sys.argv[3:] or None
os.makedirs(OUT, exist_ok=True)

for name in sorted(os.listdir(SRC)):
    base, ext = os.path.splitext(name)
    if ext.lower() != ".fbx":
        continue
    if STEMS and base not in STEMS:
        continue
    src = os.path.join(SRC, name)
    with open(src, "rb") as fh:
        magic = fh.read(4)
    dst = os.path.join(OUT, base + "_real.fbx")
    if magic[:3] == b"HMD":
        hmd2fbx.convert(src, dst, verbose=False)
        with open(dst, "rb") as fh:
            ok = fh.read(18).startswith(b"Kaydara FBX Binary")
        print("CONVERT %-28s %s" % (base, "ok" if ok else "FAILED"))
        if not ok:
            continue
    else:
        print("SKIP    %-28s already real FBX" % base)
        continue

for name in sorted(os.listdir(SRC)):
    if not name.lower().endswith(".png"):
        continue
    src = os.path.join(SRC, name)
    with open(src, "rb") as fh:
        if fh.read(4) != b"DDS ":
            continue
    dst = os.path.join(OUT, name)
    Image.open(src).convert("RGBA").save(dst)
    print("TEX     %-28s -> %s" % (name, dst))
