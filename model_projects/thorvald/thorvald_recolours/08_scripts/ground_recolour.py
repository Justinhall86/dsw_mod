"""Ground-unit palette v1 (owner, 2026-11-13; Gemini palette): cool gunmetal plate, charcoal cloth, matte copper
for all oxblood/rust cloth + trim.  Recolours COPIES of each unit's game CharMOD folder; originals untouched.

    python ground_recolour.py <out_root>
"""
import glob, os, shutil, sys
import numpy as np
from PIL import Image, ImageDraw, ImageFilter
import json

T = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
UNITS = {
    "Male01_ThorvaldTrooper": T + "/thorvald_trooper/06_game_ready/CharMOD/Male01_ThorvaldTrooper",   # v14: Iron Guard legs
    "Male01_ThorvaldRanged": T + "/thorvald_ranged/06_game_ready/CharMOD/Male01_ThorvaldRanged",   # v3: Trooper legs
    "Male01_ThorvaldDemolition": T + "/thorvald_demolition/Final/game_files/CharMOD/Male01_ThorvaldDemolition",
    "Male01_ThorvaldElite": T + "/thorvald_elite/06_game_ready/CharMOD/Male01_ThorvaldElite",   # v3b: H2f4 antenna helmet
    "Male01_ThorvaldSwornSword": T + "/thorvald_sworn_sword/06_game_ready/CharMOD/Male01_ThorvaldSwornSword",
    "Male01_ThorvaldKarlin": T + "/thorvald_hero_1/Final/game_files/CharMOD/Male01_ThorvaldKarlin",
}
SKIP = ("Base_", "Face_", "Katana_")          # skin and blades keep their paint

def hx(h): return np.array([int(h[i:i + 2], 16) for i in (1, 3, 5)], float)
# value -> colour stops for neutrals (cloth darkest, plate mid, edge highlights light)
GREY = [(0.00, hx("#121415")), (0.05, hx("#1A1C1D")), (0.12, hx("#2A3439")),
        (0.24, hx("#3E464B")), (0.40, hx("#53565B")), (1.00, hx("#A4A8AD"))]
CU_DEEP, CU = hx("#9B593C"), hx("#B87333")

def ramp(v, stops):
    xs = np.array([s[0] for s in stops]); out = np.empty(v.shape + (3,))
    for c in range(3): out[..., c] = np.interp(v, xs, [s[1][c] for s in stops])
    return out

def recolour(rgb):
    f = rgb.astype(float) / 255
    mx, mn = f.max(-1), f.min(-1); v = mx; s = np.where(mx > 0, (mx - mn) / np.maximum(mx, 1e-6), 0)
    r, g, b = f[..., 0], f[..., 1], f[..., 2]
    warm = (r >= g) & (g >= b - 0.02) & (s > 0.45) & (v > 0.10)          # red-orange hues: oxblood, rust, copper
    out = ramp(v, GREY)
    t = np.clip((v - 0.12) / 0.45, 0, 1)[..., None]                         # darker rust -> deep copper, bright -> copper
    shade = np.clip(0.62 + 0.9 * v, 0.62, 1.15)[..., None]
    cu = (CU_DEEP * (1 - t) + CU * t) * shade
    out[warm] = cu[warm]
    recolour.warm = warm
    return np.clip(out, 0, 255).astype(np.uint8)

MASKS = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "04_textures", "ground_masks")

def leg_copper(rgb_src, out, polys):
    """Force leg-armour faces (ground_leg_masks.py) to matte copper, shaded from the original value."""
    h, w = out.shape[:2]
    m = Image.new("L", (w, h), 0); d = ImageDraw.Draw(m)
    for poly in polys: d.polygon([(u * w, (1 - v) * h) for u, v in poly], fill=255)
    m = np.asarray(m.filter(ImageFilter.MaxFilter(5))) > 127
    v = rgb_src.astype(float).max(-1) / 255
    t = np.clip((v - 0.03) / 0.30, 0, 1)[..., None]
    cu = (CU_DEEP * (1 - t) + CU * t) * np.clip(0.55 + 2.2 * v, 0.55, 1.12)[..., None]
    out[m] = np.clip(cu[m], 0, 255).astype(np.uint8)

TONE = os.path.join(os.path.dirname(MASKS), "ground_tone_masks")
WEAPONS = ("RavagerLeaderSniper", "Bazooka", "Canister", "Glaive")
STYLE = os.environ.get("WEAPON_STYLE", "A")      # A: nickel panels + brass details | B: dark steel bands + brass edges

def raster(polys, w, h, grow=3):
    m = Image.new("L", (w, h), 0); d = ImageDraw.Draw(m)
    for poly in polys: d.polygon([(u * w, (1 - v) * h) for u, v in poly], fill=255)
    return np.asarray(m.filter(ImageFilter.MaxFilter(grow))) > 127

def armour_tone(out, cats, warm):
    """Two gunmetal shades (owner 2026-11-13): lighter chest/back plate, darker pauldrons/arms/helmet. Plates only:
    copper and the charcoal cloth (max channel < 40) are left alone."""
    h, w = out.shape[:2]
    plate = ~warm & (out.max(-1) >= 40)
    for cat, mul, add in (("light", 1.5, (4, 6, 8)), ("dark", 0.62, (0, 0, 0))):
        if cat not in cats: continue
        sel = raster(cats[cat], w, h) & plate
        out[sel] = np.clip(out[sel].astype(float) * mul + add, 0, 255).astype(np.uint8)

def hx_(h): return np.array([int(h[i:i + 2], 16) for i in (1, 3, 5)], float)
NICKEL, BRASS, STEEL = hx_("#6E767C"), hx_("#A88C3E"), hx_("#1F2529")

def weapon_contrast(out, src, warm):
    """Weapons: copper kept only as small accents -> brass; big copper panels -> nickel (A) or dark steel bands (B);
    a bevel highlight/shadow on every part boundary so the shapes read at RTS zoom."""
    h, w = out.shape[:2]; k = w / 1024
    o = max(5, int(11 * k)) | 1
    wI = Image.fromarray((warm * 255).astype(np.uint8))
    big = warm & (np.asarray(wI.filter(ImageFilter.MinFilter(o)).filter(ImageFilter.MaxFilter(o))) > 127)
    small = warm & ~big
    dense = np.asarray(Image.fromarray((small * 255).astype(np.uint8)).filter(ImageFilter.GaussianBlur(max(1.5, 2.5 * k)))) > 90
    speck = small & ~dense; small = small & dense       # isolated copper specks -> weapon body, not brass
    v = src.astype(float).max(-1) / 255
    def shade(m):
        med = np.median(v[m]) if m.any() else 0.3
        return np.clip(v / max(med, 1e-3), 0.65, 1.35)[..., None]
    f = out.astype(float)
    if STYLE == "A":
        f[big] = (NICKEL * shade(big))[big]
        body = ~warm; f[body] *= 0.82                      # darker body so nickel and brass pop
    else:
        f[big] = (STEEL * shade(big))[big]
        ring = big & ~(np.asarray(Image.fromarray((big * 255).astype(np.uint8)).filter(ImageFilter.MinFilter(max(3, int(5 * k)) | 1))) > 127)
        f[ring] = (BRASS * shade(ring))[ring]
    f[small] = (BRASS * shade(small))[small]
    f[speck] = (STEEL * 1.3 * shade(speck))[speck]
    lab = np.where(big, 1, np.where(small, 2, 0))
    d = max(1, int(2 * k))
    lit = lab != np.roll(np.roll(lab, d, 0), d, 1); dk = lab != np.roll(np.roll(lab, -d, 0), -d, 1)
    f[lit] *= 1.35; f[dk & ~lit] *= 0.7
    out[:] = np.clip(f, 0, 255).astype(np.uint8)

if __name__ == "__main__":
    root = sys.argv[1]
    for m, src in UNITS.items():
        dst = os.path.join(root, m)
        if os.path.exists(dst): shutil.rmtree(dst)
        shutil.copytree(src, dst)
        for p in glob.glob(dst + "/*_Albedo.png"):
            if any(k in os.path.basename(p) for k in SKIP): continue
            im = Image.open(p)
            mat0 = os.path.basename(p)[5:-len("_Albedo.png")]
            if mat0 in WEAPONS and im.size[0] < 512:            # 256 px bazooka: up-rez all three maps first
                for q in glob.glob(p.replace("_Albedo.png", "_*.png")):
                    j = Image.open(q); j.resize((512, 512), Image.LANCZOS).save(q)
                im = Image.open(p)
            a = np.asarray(im.convert("RGBA"))
            rc = recolour(a[..., :3])
            mj = os.path.join(MASKS, m + ".json")
            mat = os.path.basename(p)[5:-len("_Albedo.png")]
            if os.path.exists(mj) and mat in json.load(open(mj)):
                leg_copper(a[..., :3], rc, json.load(open(mj))[mat])
            warm = recolour.warm | (np.abs(rc.astype(int) - CU.astype(int)).max(-1) < 60) & (rc[..., 0] > rc[..., 2] + 40)
            tj = os.path.join(TONE, m + ".json")
            if os.path.exists(tj) and mat in json.load(open(tj)):
                armour_tone(rc, json.load(open(tj))[mat], warm)
            if mat in WEAPONS:
                weapon_contrast(rc, a[..., :3], warm)
            o = np.dstack([rc, a[..., 3]])
            Image.fromarray(o, "RGBA").convert(im.mode).save(p)
        if m == "Male01_ThorvaldElite":
            import subprocess
            subprocess.run([sys.executable, os.path.join(os.path.dirname(os.path.abspath(__file__)), "shield_detail.py"), dst], check=True)
        print("recoloured", m)
