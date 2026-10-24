"""Step 04 - paint the House Ginaz colour design onto the Commando albedo.

The design (model_inputs/house_ginaz_roster.jpg, "COMMANDER" figure) is a deep
plum coat with warm gold trim.  The Commando's own faction-tinted region (the
chest plate + badge, exactly the pixels the game tints for Atreides/Vernius/...)
becomes the plum; the small bright-metal bits (fan vents, buckles, wrist bands)
become the gold trim; the big grey plates become dark plum armour; the scarf and
bodysuit become very dark plum; the brown leather deepens to burgundy-brown.

Method (same idea the game uses for its faction tints): the BASE texture already
carries the painted shading, so the recolour REPLACES HUE + SATURATION and keeps
VALUE.  That preserves every crease, shadow and highlight for free.

Outputs
  04_textures/Commando_House_Albedo.png          new base colour (RGBA)
  04_textures/Commando_House_MetallicGlossAO.png new R=metallic G=gloss B=AO
  04_textures/Commando_House_Normal.png           unchanged copy (for the set)
  04_textures/house_palette.json                  the numbers used, for the record

Run:  python 08_scripts/04_recolour.py
"""
import json
import os
import numpy as np
from PIL import Image

PROJ = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\commando_house"
MODELS = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_inputs\Commando"
TEX = os.path.join(PROJ, "04_textures")

# ---------------------------------------------------------------- palette
# Sampled from the House Ginaz roster art (Commander figure):
#   plum fabric  hue~350  sat~0.36  lit value ~75/255
#   gold trim    hue~33   sat~0.40  lit value ~185/255
# These are the ALBEDO values (the art is a lit render, so the albedo is a bit
# brighter than the painted sample).
HOUSE = {
    "plum":        (104, 54, 66),     # the coat / chest plate  <- hero colour
    "plum_dark":   (42, 26, 33),     # scarf, hood, bodysuit
    "plum_plate":  (72, 42, 52),     # the big grey armour plates
    "gold":        (196, 154, 78),    # trim, buckles, vents, wrist bands
    "leather":     (92, 48, 38),     # the brown vest / belt
    "skin":        (150, 104, 84),    # unchanged-ish
}

# region id -> (target colour, how much of the base's own hue to keep)
RECIPE = {
    1: ("skin", 0.0),        # face / hands : untouched
    2: ("plum_dark", 0.0),   # dark fabric
    3: ("leather", 0.15),    # leather
    4: ("plum", 0.0),        # the faction accent plate  <- the hero colour
    5: ("plum_plate", 0.0),  # big armour plates
    6: ("gold", 0.0),        # small trim -> gold
}

# metallic overrides so the new colours read correctly
METALLIC = {            # region -> (multiply, add) on the metallic channel
    4: (0.30, 0.0),     # plum plate is painted, not metal
    5: (0.55, 0.0),     # plum armour plate
    2: (0.60, 0.0),     # dark fabric
    3: (0.70, 0.0),     # leather
    6: (1.00, 60.0),    # gold: keep it metal, push it bright
}


def rgb_to_hsv(a):
    mx = a.max(axis=-1)
    mn = a.min(axis=-1)
    d = mx - mn
    h = np.zeros_like(mx)
    r, g, b = a[..., 0], a[..., 1], a[..., 2]
    m = d > 1e-6
    idx = (mx == r) & m
    h[idx] = (60 * (((g - b) / np.maximum(d, 1e-6)) % 6))[idx]
    idx = (mx == g) & m
    h[idx] = (60 * (((b - r) / np.maximum(d, 1e-6)) + 2))[idx]
    idx = (mx == b) & m
    h[idx] = (60 * (((r - g) / np.maximum(d, 1e-6)) + 4))[idx]
    s = np.where(mx > 1e-6, d / np.maximum(mx, 1e-6), 0.0)
    return h, s, mx


def hsv_to_rgb(h, s, v):
    h = np.mod(h, 360.0)
    c = v * s
    x = c * (1 - np.abs((h / 60.0) % 2 - 1))
    m = v - c
    z = np.zeros_like(c)
    seg = np.floor(h / 60.0) % 6
    r = np.select([seg == 0, seg == 1, seg == 2, seg == 3, seg == 4, seg == 5], [c, x, z, z, x, c])
    g = np.select([seg == 0, seg == 1, seg == 2, seg == 3, seg == 4, seg == 5], [x, c, c, x, z, z])
    b = np.select([seg == 0, seg == 1, seg == 2, seg == 3, seg == 4, seg == 5], [z, z, x, c, c, x])
    return np.stack([r + m, g + m, b + m], axis=-1)


def main():
    base = np.array(Image.open(os.path.join(MODELS, "Commando_Albedo.png")).convert("RGBA")).astype(np.float32)
    mg = np.array(Image.open(os.path.join(MODELS, "Commando_MetallicGlossAO.png")).convert("RGBA")).astype(np.float32)
    reg = np.load(os.path.join(TEX, "region_ids.npy"))

    rgb = base[..., :3] / 255.0
    h, s, v = rgb_to_hsv(rgb)
    met = mg[..., 0] / 255.0
    gloss = mg[..., 1] / 255.0
    ao = mg[..., 2] / 255.0

    out_h = h.copy()
    out_s = s.copy()
    out_v = v.copy()

    for rid, (name, keep) in RECIPE.items():
        m = reg == rid
        if not m.any():
            continue
        tgt = np.array(HOUSE[name], dtype=np.float32) / 255.0
        th, ts, tv = rgb_to_hsv(tgt.reshape(1, 1, 3))
        th, ts, tv = float(th[0, 0]), float(ts[0, 0]), float(tv[0, 0])
        # target hue, optionally blended back toward the base hue
        new_h = th if keep <= 0 else (th * (1 - keep) + h[m] * keep) % 360.0
        # target saturation, but keep a bit of the base's own variation so the
        # region does not become a flat sticker
        base_s = s[m]
        out_h[m] = new_h
        out_s[m] = np.clip(ts * (0.55 + 0.75 * (base_s / max(ts, 1e-3))), 0.0, 1.0)
        # VALUE: the base texture's region value range is far wider than the
        # target colour allows (a cream plate at 250 would turn the plum into
        # pink), so the region's robust value range is COMPRESSED onto a band
        # around the target brightness.  Shading survives, the hue stays.
        vals = v[m]
        lo = float(np.percentile(vals, 3))
        hi = float(np.percentile(vals, 97))
        if hi - lo < 1e-3:
            hi = lo + 1e-3
        rel = np.clip((vals - lo) / (hi - lo), 0.0, 1.0)
        rel = 0.18 + 0.82 * rel ** 0.85            # gentle S-curve, keeps midtones
        band_lo = tv * 0.46
        band_hi = tv * 1.32
        out_v[m] = np.clip(band_lo + rel * (band_hi - band_lo), 0.0, 1.0)

    new_rgb = np.clip(hsv_to_rgb(out_h, out_s, out_v), 0.0, 1.0)

    # --- residual hue snap ----------------------------------------------
    # The base texture has mottled camo-ish patches (green in the chest
    # straps).  A region whose pixels are NOT on the target hue would keep
    # that old colour, so any residual hue further than RESIDUAL_SNAP from
    # its target is snapped onto the target.  Skin is left alone.
    RESIDUAL_SNAP = 18.0
    for rid, (name, keep) in RECIPE.items():
        if name == "skin":
            continue
        m = reg == rid
        if not m.any():
            continue
        tgt = np.array(HOUSE[name], dtype=np.float32) / 255.0
        th, ts, tv = rgb_to_hsv(tgt.reshape(1, 1, 3))
        th = float(th[0, 0])
        cur = out_h[m]
        diff = np.abs((cur - th + 180.0) % 360.0 - 180.0)
        far = diff > RESIDUAL_SNAP
        if far.any():
            # keep the pixel's own value, just fix the hue and calm the sat
            snapped_h = np.where(far, th, cur)
            snapped_s = np.where(far, np.minimum(out_s[m], ts * 1.15), out_s[m])
            new_rgb[m] = hsv_to_rgb(snapped_h, snapped_s, out_v[m])

    # --- metallic --------------------------------------------------------
    for rid, (mul, add) in METALLIC.items():
        m = reg == rid
        met[m] = np.clip(met[m] * mul + add, 0.0, 1.0)
    # gold gets a warmer, brighter gloss so it catches light
    gm = reg == 6
    gloss[gm] = np.clip(gloss[gm] * 1.05, 0.0, 1.0)

    out = np.zeros_like(base)
    out[..., :3] = new_rgb * 255.0
    out[..., 3] = 255.0
    albedo_path = os.path.join(TEX, "Commando_House_Albedo.png")
    Image.fromarray(out.astype(np.uint8), "RGBA").save(albedo_path)

    mg_out = np.zeros_like(mg)
    mg_out[..., 0] = met * 255.0
    mg_out[..., 1] = gloss * 255.0
    mg_out[..., 2] = ao * 255.0
    mg_out[..., 3] = 255.0
    mg_path = os.path.join(TEX, "Commando_House_MetallicGlossAO.png")
    Image.fromarray(mg_out.astype(np.uint8), "RGBA").save(mg_path)

    # the normal map is untouched, but the set needs all three names
    nrm_path = os.path.join(TEX, "Commando_House_Normal.png")
    Image.open(os.path.join(MODELS, "Commando_Normal.png")).convert("RGBA").save(nrm_path)

    with open(os.path.join(TEX, "house_palette.json"), "w", encoding="utf-8") as f:
        json.dump({"palette": HOUSE, "recipe": {str(k): v for k, v in RECIPE.items()},
                   "metallic": {str(k): list(v) for k, v in METALLIC.items()}}, f, indent=1)

    print("wrote", albedo_path)
    print("wrote", mg_path)
    print("wrote", nrm_path)
    for rid, (name, _) in RECIPE.items():
        m = reg == rid
        if not m.any():
            continue
        c = new_rgb[m] * 255
        print(f"  region {rid} {name:11s} n={int(m.sum()):6d} -> mean ({c[:,0].mean():5.1f},"
              f"{c[:,1].mean():5.1f},{c[:,2].mean():5.1f})")


if __name__ == "__main__":
    main()
