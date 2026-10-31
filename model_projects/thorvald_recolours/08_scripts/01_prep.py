"""Convert each asset's HMD models to real FBX and its DDS-behind-.png textures to real PNGs, into 01_input/<asset>/.

    python 01_prep.py [asset ...]
"""
import os
import sys

from PIL import Image

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from assets import ASSETS, REPO, input_dir  # noqa: E402

sys.path.insert(0, os.path.join(REPO, ".claude", "skills", "dsw-vehicle-preview", "scripts"))
import build_previews as BP  # noqa: E402  (convert_model: HMD -> FBX with the multi-part fallback)

TEX_KEYS = ("before", "source", "mgao", "normal", "emissive")

for name in sys.argv[1:] or list(ASSETS):
    a = ASSETS[name]
    out = input_dir(name)
    os.makedirs(out, exist_ok=True)
    for m in a["models"]:
        dst = os.path.join(out, os.path.splitext(m)[0] + ".fbx")
        BP.convert_model(os.path.join(a["dir"], m), dst)
    for k in TEX_KEYS:
        if a.get(k):
            Image.open(os.path.join(a["dir"], a[k])).convert("RGBA").save(os.path.join(out, a[k]))
    print("PREP", name, sorted(os.listdir(out)))
