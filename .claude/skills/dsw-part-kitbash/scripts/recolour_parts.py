"""Recolour ONLY a donor part's UV islands to a target unit's palette (system python + numpy + Pillow).

  python recolour_parts.py --tex Donor_Albedo.png --uv-json uv_tris.json --keys sardaukar_14 sardaukar_18
                           --ref-tex Target_Albedo.png --ref-keys guard_17 guard_18 --out recoloured_Albedo.png
                           [--lift 0.06] [--accent-hue 0.20 0.55] [--no-accent]

How it works: inside the part's islands every pixel is classified as gold trim, coloured accent (default: green/teal
hue band, e.g. Gurney's stripe) or armour body. Gold and accent take the reference's gold hue/saturation, the body
takes the reference armour's hue/saturation; each pixel keeps its own shading (value), re-centred on the reference
median. --lift brightens the body a little: recoloured parts read darker than the reference once lit.
The rest of the texture is untouched, so the donor's other users are unaffected (the graft gets its own copy).
Textures that are DDS files with a .png name are read fine by Pillow.
"""
import argparse
import json

import numpy as np
from PIL import Image, ImageDraw


def mask_for(tris, keys, size):
    m = Image.new("L", size, 0)
    d = ImageDraw.Draw(m)
    for k in keys:
        for tri in tris[k]:
            d.polygon([(u * size[0], (1 - v) * size[1]) for u, v in tri], fill=255)
    return np.array(m) > 0


def hsv(rgb):
    r, g, b = [rgb[..., i] / 255.0 for i in range(3)]
    mx, mn = np.maximum(np.maximum(r, g), b), np.minimum(np.minimum(r, g), b)
    d = mx - mn
    h = np.zeros_like(mx)
    nz = d > 1e-6
    rm = (mx == r) & nz
    gm = (mx == g) & nz & ~rm
    bm = nz & ~rm & ~gm
    h[rm] = ((g - b)[rm] / d[rm]) % 6
    h[gm] = (b - r)[gm] / d[gm] + 2
    h[bm] = (r - g)[bm] / d[bm] + 4
    return h / 6.0, np.where(mx > 1e-6, d / np.maximum(mx, 1e-6), 0), mx


def to_rgb(h, s, v):
    i = np.floor(h * 6).astype(int) % 6
    f = h * 6 - np.floor(h * 6)
    p, q, t = v * (1 - s), v * (1 - f * s), v * (1 - (1 - f) * s)
    out = np.zeros(h.shape + (3,))
    for k, (a, b, c) in enumerate(((v, t, p), (q, v, p), (p, v, t), (p, q, v), (t, p, v), (v, p, q))):
        sel = i == k
        out[..., 0][sel], out[..., 1][sel], out[..., 2][sel] = a[sel], b[sel], c[sel]
    return (np.clip(out, 0, 1) * 255).astype(np.uint8)


def is_gold(h, s, v):
    return (h > 0.08) & (h < 0.18) & (s > 0.35) & (v > 0.45)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--tex", required=True)
    ap.add_argument("--uv-json", required=True)
    ap.add_argument("--keys", nargs="+", required=True)
    ap.add_argument("--ref-tex", required=True)
    ap.add_argument("--ref-keys", nargs="+", required=True)
    ap.add_argument("--out", required=True)
    ap.add_argument("--lift", type=float, default=0.06)
    ap.add_argument("--accent-hue", type=float, nargs=2, default=(0.20, 0.55))
    ap.add_argument("--no-accent", action="store_true")
    a = ap.parse_args()
    tris = json.load(open(a.uv_json))

    ref = np.array(Image.open(a.ref_tex).convert("RGBA"))
    rm = mask_for(tris, a.ref_keys, (ref.shape[1], ref.shape[0]))
    rh, rs, rv = hsv(ref[..., :3])
    r_gold = is_gold(rh, rs, rv) & rm
    r_body = rm & ~r_gold
    A = [float(np.median(x[r_body])) for x in (rh, rs, rv)]
    G = [float(np.median(x[r_gold])) for x in (rh, rs, rv)] if r_gold.any() else [0.105, 0.56, 0.74]

    src = np.array(Image.open(a.tex).convert("RGBA"))
    pm = mask_for(tris, a.keys, (src.shape[1], src.shape[0]))
    ph, ps, pv = hsv(src[..., :3])
    gold = is_gold(ph, ps, pv) & pm
    accent = (pm & ~gold & (ph > a.accent_hue[0]) & (ph < a.accent_hue[1]) & (ps > 0.15)
              if not a.no_accent else np.zeros_like(pm))
    body = pm & ~gold & ~accent
    nh, ns, nv = ph.copy(), ps.copy(), pv.copy()
    for sel, (th, tsat, tv) in ((body, (A[0], A[1], A[2] + a.lift)), (gold | accent, G)):
        if not sel.any():
            continue
        nh[sel] = th
        ns[sel] = np.clip(tsat * (0.7 + 0.6 * ps[sel] / max(ps[sel].max(), 1e-6)), 0, 1)
        nv[sel] = np.clip(tv + (pv[sel] - np.median(pv[sel])), 0.05, 1.0)
    out = src.copy()
    out[..., :3][pm] = to_rgb(nh, ns, nv)[pm]
    Image.fromarray(out).save(a.out)
    print("recoloured: body %d, gold %d, accent->gold %d px -> %s" % (body.sum(), gold.sum(), accent.sum(), a.out))
    print("reference armour HSV %.3f %.3f %.3f, gold %.3f %.3f %.3f" % (*A, *G))


if __name__ == "__main__":
    main()
