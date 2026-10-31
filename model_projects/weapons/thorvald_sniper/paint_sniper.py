"""Thorvald colours for the sniper: metal -> warm gunmetal (value kept), stock / handguard / foregrip -> rust-ochre like the Ranged chest plate.

    python paint_sniper.py      (after dump_sniper_uv.py)
Writes textures/Thorvald_Sniper_Albedo.png from the vanilla albedo; texels shared by an ochre and a metal face go ochre (SHARED_TO_OCHRE).
"""
import colorsys
import json
import os

import numpy as np
from PIL import Image, ImageDraw

HERE = os.path.dirname(os.path.abspath(__file__))
src = Image.open(os.path.join(HERE, "textures", "RavagerLeaderSniper_Albedo.png")).convert("RGBA")
S = 1024
img = src.resize((S, S), Image.LANCZOS)
uv = json.load(open(os.path.join(HERE, "sniper_uv.json")))


def mask(polys):
    m = Image.new("L", (S, S), 0)
    d = ImageDraw.Draw(m)
    for p in polys:
        d.polygon([(u % 1.0 * S, (1.0 - v % 1.0) * S) for u, v in p], fill=255)
    return np.asarray(m) > 0


mo, mm = mask(uv["ochre"]), mask(uv["metal"])
shared = mo & mm
SHARED_TO_OCHRE = True   # shared texels: the stock's blotches were worse than ochre specks on the receiver
if not SHARED_TO_OCHRE:
    mo &= ~mm
a = np.asarray(img).astype(np.float32) / 255.0
rgb = a[..., :3]
v = rgb.max(-1)
out = rgb.copy()
# metal: neutral grey -> warm gunmetal (50, 46, 42 family), value compressed a little darker
gm = np.array((50, 46, 42), np.float32) / 255.0
vm = 0.10 + v * 0.55
out[~mo] = (gm / gm.max())[None, :] * vm[~mo][:, None]
# ochre: painted rust-ochre, value band 0.20..0.50 keeps the panel shading
oc = np.array((128, 62, 30), np.float32) / 255.0
vo = 0.20 + v * 0.30
out[mo] = (oc / oc.max())[None, :] * vo[mo][:, None]
res = np.concatenate([out, a[..., 3:]], -1)
Image.fromarray((res * 255).clip(0, 255).astype(np.uint8)).save(os.path.join(HERE, "textures", "Thorvald_Sniper_Albedo.png"))
print("PAINT ochre px %d  shared px %d -> %s" % (mo.sum(), shared.sum(), "ochre" if SHARED_TO_OCHRE else "metal"))
