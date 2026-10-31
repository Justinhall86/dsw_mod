"""Prepare per-material game textures: real RGBA PNGs, alpha 255, optional downscale.

    python build_game_textures.py <out_dir> <Name>=<albedo.png>,<metallicgloss.png>,<normal.png> [<Name>=...] [--max 1024]

Output files are <out_dir>/<UnitPrefix><Name>_{Albedo,MetallicGlossAO,Normal}.png - copy them into
CharMOD/<Model>/ and point each material at them with convert_model.py --vanilla-material MAT=CharMOD/<Model>/<UnitPrefix><Name>.
Source files may be the game's DDS-named-.png (Pillow reads them).  Albedo = the recoloured one, MG/Normal = the
originals of the donor unit the material came from (a recolour only touches colour).
Why alpha 255 and RGBA: RGB-only PNGs / odd alpha made earlier models render wrong; the working models all ship RGBA.
Why downscale: a 2048 donor texture (Raider) adds 3 x 1.3 MB for a region that is a flat colour.
"""
import argparse
import os

from PIL import Image

ap = argparse.ArgumentParser()
ap.add_argument("out")
ap.add_argument("specs", nargs="+")
ap.add_argument("--max", type=int, default=1024)
ap.add_argument("--prefix", default="Ginaz")
a = ap.parse_args()
os.makedirs(a.out, exist_ok=True)
for spec in a.specs:
    name, paths = spec.split("=", 1)
    for suf, p in zip(("Albedo", "MetallicGlossAO", "Normal"), paths.split(",")):
        im = Image.open(p).convert("RGBA")
        if im.width > a.max:
            im = im.resize((a.max, a.max), Image.LANCZOS)
        r, g, b, _ = im.split()
        im = Image.merge("RGBA", (r, g, b, Image.new("L", im.size, 255)))
        dst = os.path.join(a.out, "%s%s_%s.png" % (a.prefix, name, suf))
        im.save(dst)
        print(dst, im.size)
