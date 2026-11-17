"""Warden helmet recolours for the Heavy Vanguard (2026-11-14), Thorvald palette (ground_recolour.py: gunmetal #2A3439/#53565B,
matte copper #9B593C..#B87333, cloth #1A1C1D). Needs panels.json from wd_panels.py (the crest's UV area).
    python wd_recolour.py            -> 04_textures/helmet_study/warden/W1..W4_*.png
Pixel classes of the vanilla Warden albedo: green (visor + top crest), white plates (the hex cheek/side plates), the rest = grey shell.
The crest (the top piece the owner wants gone) is repainted as plain shell so no outline of it stays."""
import json, os, sys
import numpy as np
from PIL import Image, ImageDraw, ImageFilter
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import paths as P
sys.path.insert(0, P.REPO + "/model_projects/thorvald/thorvald_recolours/08_scripts")
import ground_recolour as gr

W = P.WORK + "/warden/"
src = np.asarray(Image.open(P.WARDEN_DIR + "AtreideWarden_Albedo.png").convert("RGBA"))
rgb = src[..., :3].astype(float)
N = rgb.shape[0]
r, g, b = rgb[..., 0], rgb[..., 1], rgb[..., 2]
mx, mn = rgb.max(-1), rgb.min(-1)
v = mx / 255
s = np.where(mx > 0, (mx - mn) / np.maximum(mx, 1), 0)
from PIL import ImageFilter as _F
def soft(a, blur=1.2):
    return np.asarray(Image.fromarray((np.clip(a, 0, 1) * 255).astype(np.uint8)).filter(_F.GaussianBlur(blur))).astype(float) / 255
wgreen = soft(((g / np.maximum(r, 1)) - 1.1) / 0.25 * (g > 40))
wlight = soft(np.clip((v - 0.5) / 0.12, 0, 1) * np.clip((0.26 - s) / 0.1, 0, 1)) * (1 - wgreen)
green = wgreen > 0.5
light = wlight > 0.5
pj = json.load(open(W + "panels.json"))
z1 = pj["meta"]["z1"]
crest = Image.new("L", (N, N), 0)
d = ImageDraw.Draw(crest)
for p in pj["panels"]:
    if p["centre"][2] > z1 - 0.045 and abs(p["centre"][0]) < 0.07:
        for poly in p["uv"]:
            d.polygon([(u * N, (1 - vv) * N) for u, vv in poly], fill=255)
crest = np.asarray(crest.filter(ImageFilter.MaxFilter(5))) > 127
visor = green & ~crest
wvisor = wgreen * (1 - crest)
print("px: crest %d visor %d light %d" % (crest.sum(), visor.sum(), light.sum()))
hx = gr.hx
CU_D, CU_H = hx("#8A4F34"), hx("#B87333")
GM_D, GM_L, SMOKE = hx("#2A3439"), hx("#53565B"), hx("#1B2023")


def shade(base, m, lo=0.6, hi=1.3):
    med = np.median(v[m]) if m.any() else 0.5
    return base * np.clip(v / max(med, 1e-3), lo, hi)[..., None]


def copper(m):
    t = np.clip((v - 0.2) / 0.6, 0, 1)[..., None]
    return (CU_D * (1 - t) + CU_H * t) * np.clip(0.7 + 0.5 * v, 0.7, 1.15)[..., None]


def edges(m, w=3):
    I = Image.fromarray((m * 255).astype(np.uint8))
    return m & ~(np.asarray(I.filter(ImageFilter.MinFilter(w * 2 + 1))) > 127)


def base():
    o = gr.ramp(v * 0.85, gr.GREY)                                 # grey shell -> dark gunmetal
    # crest -> plain shell: flat value + low noise, no painted outline
    rng = np.random.default_rng(1)
    o[crest] = GM_D * (1.0 + 0.06 * rng.standard_normal((crest.sum(), 1)))
    return o


def mix(o, col, w):
    o[:] = o * (1 - w[..., None]) + col * w[..., None]


def smoke_visor(o):
    mix(o, shade(SMOKE, visor, 0.7, 1.6), wvisor)


out = {}
cr = soft(crest.astype(float), 1.5)
o = base(); smoke_visor(o); mix(o, copper(light), wlight)
out["W1_copper_plates"] = o
o = base(); smoke_visor(o); mix(o, shade(GM_L, light), wlight)
tr = soft(edges(light, 3).astype(float), 0.8); mix(o, copper(light), tr)
out["W2_copper_trim"] = o
o = base(); smoke_visor(o); mix(o, shade(GM_L, light), wlight); mix(o, copper(crest) * 0.9, cr)
out["W3_copper_crown"] = o
o = base(); smoke_visor(o); mix(o, shade(GM_L, light), wlight)
out["W4_gunmetal_only"] = o
o = base(); smoke_visor(o); mix(o, shade(GM_L, light), wlight); mix(o, copper(crest) * 0.9, cr)
vr = soft(edges(visor, 4).astype(float), 0.8); mix(o, copper(visor | crest) * 1.05, vr)    # copper frame round the visor
out["W5_copper_visor_frame"] = o
for k, o in out.items():
    Image.fromarray(np.dstack([np.clip(o, 0, 255).astype(np.uint8), src[..., 3]]), "RGBA").save(W + k + ".png")
print(list(out))
