"""Paint a built drone variant in the House Thorvald palette: polished charcoal and gunmetal, bold copper, oxblood accents.

    python 41_paint.py <spec.json> [variant ...]      (needs 04_textures/<variant>/_geo.npz from 20_build_drone.py)

Writes 04_textures/<variant>/<Material>_{Albedo,MetallicGlossAO,Normal}.png for every material of the variant
(Mat_ThDrone = the drone's own 2048 map set, Mat_ThDrone_<Donor> = a donor's map set at its own size).

How: every texel is baked with the 3D bind-pose (build space) position, normal and dominant bone of the triangle that covers
it (barycentric over the UV triangles), so the paint can be placed in 3D and stays clean whatever the UV layout is.
  1. base: the source albedo's luminance -> two-tone (dark -> charcoal, light panels -> gunmetal), panel detail kept;
  2. the source's saturated accents (Corrino gold trim, donor lights) -> copper, minus hairlines (morphological opening);
  3. the variant's paint rules (spec key "paint", else HOUSE below), applied in order: bold copper straps, oxblood fronts...
  MetallicGlossAO: R metallic and G gloss by class, B ambient occlusion kept from the source, alpha 1 (as the vanilla drone).
  Normal: the source's, unchanged.

Rule keys (all optional; a texel must pass every one given):
  role: copper | oxblood | charcoal | gunmetal | steel       mats: [material-name substrings]   bones: [dominant bone]
  box: [x0,x1,y0,y1,z0,z1]   plane: {n: [nx,ny,nz], range: [lo, hi]} (n . p)   mirror_y: test |y| (default true)
  up: minimum normal z      down: maximum normal z     src: gold | light | dark | accent (class of the source texel)
  soft: edge softness in metres of build space (default 0.008)   strength: 0..1
A paint block may also override a palette colour: "gunmetal": [r, g, b] (sRGB 0..1).
"""
import json
import os
import sys

import numpy as np
from PIL import Image, ImageFilter

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = os.path.abspath(os.path.join(PROJ, "..", "..", ".."))
VEH = os.path.join(REPO, "model_inputs", "Vehicle")
TEX = os.path.join(PROJ, "04_textures")

# sRGB 0..1, sampled from the installed Thorvald units (Heavy Vanguard ThEli textures: charcoal #242527, copper #b36a36)
PAL = {
    "charcoal": np.array([0.115, 0.118, 0.128]),
    "gunmetal": np.array([0.330, 0.338, 0.360]),
    "steel":    np.array([0.46, 0.47, 0.49]),
    "copper":   np.array([0.70, 0.41, 0.21]),
    "oxblood":  np.array([0.40, 0.10, 0.085]),
}
#              metallic, gloss
MG = {"charcoal": (0.45, 0.50), "gunmetal": (0.70, 0.58), "steel": (0.80, 0.55), "copper": (0.92, 0.66), "oxblood": (0.25, 0.42)}

HOUSE = {"rules": []}


# ---------------------------------------------------------------- colour helpers
def lum(c):
    return c[..., :3] @ np.array([0.2126, 0.7152, 0.0722])


def hsv(c):
    r, g, b = c[..., 0], c[..., 1], c[..., 2]
    mx, mn = c[..., :3].max(-1), c[..., :3].min(-1)
    d = mx - mn
    h = np.zeros_like(mx)
    nz = d > 1e-6
    rr = nz & (mx == r)
    gg = nz & (mx == g) & ~rr
    bb = nz & ~rr & ~gg
    h[rr] = ((g - b)[rr] / d[rr]) % 6
    h[gg] = (b - r)[gg] / d[gg] + 2
    h[bb] = (r - g)[bb] / d[bb] + 4
    return h * 60.0, np.where(mx > 1e-6, d / np.maximum(mx, 1e-6), 0), mx


def smooth(a, lo, hi):
    t = np.clip((a - lo) / max(hi - lo, 1e-9), 0, 1)
    return t * t * (3 - 2 * t)


def morph(mask, k, op):
    im = Image.fromarray((np.clip(mask, 0, 1) * 255).astype(np.uint8))
    f = (ImageFilter.MinFilter(k), ImageFilter.MaxFilter(k)) if op == "open" else (ImageFilter.MaxFilter(k), ImageFilter.MinFilter(k))
    return np.asarray(im.filter(f[0]).filter(f[1]), np.float64) / 255.0


def blur(a, r):
    im = Image.fromarray((np.clip(a, 0, 1) * 255).astype(np.uint8))
    return np.asarray(im.filter(ImageFilter.GaussianBlur(r)), np.float64) / 255.0


def dilate_fill(arr, cov, steps=6):
    """Bleed covered texels into the uncovered gutter so mip-maps and bilinear filtering never pull in junk."""
    out = arr.copy()
    m = cov.copy()
    for _ in range(steps):
        acc = np.zeros_like(out)
        cnt = np.zeros(m.shape)
        for dy, dx in ((0, 1), (0, -1), (1, 0), (-1, 0)):
            sm = np.roll(m, (dy, dx), (0, 1))
            acc += np.roll(out, (dy, dx), (0, 1)) * sm[..., None]
            cnt += sm
        grow = (~m) & (cnt > 0)
        out[grow] = acc[grow] / cnt[grow][:, None]
        m = m | grow
    return out


# ---------------------------------------------------------------- sources
def source_dir(mat):
    if mat in ("Mat_ThDrone",):
        return os.path.join(VEH, "Imperial", "DroneI", "preview_textures")
    stem = mat[len("Mat_ThDrone_"):]
    for fac in os.listdir(VEH):
        d = os.path.join(VEH, fac, stem, "preview_textures")
        if os.path.isdir(d):
            return d
    raise SystemExit("no source textures for %s" % mat)


def load(path):
    return np.asarray(Image.open(path).convert("RGBA"), np.float64) / 255.0


# ---------------------------------------------------------------- bake
def bake(g, mi, S):
    P = np.zeros((S, S, 3), np.float32)
    N = np.zeros((S, S, 3), np.float32)
    Bn = np.full((S, S), -1, np.int16)
    cov = np.zeros((S, S), bool)
    bones = list(np.unique(g["bone"]))
    bid = np.array([bones.index(b) for b in g["bone"]], np.int16)
    for i in np.where(g["mat"] == mi)[0]:
        uv = g["uv"][i].astype(np.float64).copy()
        uv[:, 0] -= np.floor(uv[:, 0].min() + 1e-4)
        uv[:, 1] -= np.floor(uv[:, 1].min() + 1e-4)
        xs, ys = uv[:, 0] * S, (1 - uv[:, 1]) * S
        x0, x1 = int(max(0, np.floor(xs.min() - 1))), int(min(S - 1, np.ceil(xs.max() + 1)))
        y0, y1 = int(max(0, np.floor(ys.min() - 1))), int(min(S - 1, np.ceil(ys.max() + 1)))
        if x1 < x0 or y1 < y0:
            continue
        den = (ys[1] - ys[2]) * (xs[0] - xs[2]) + (xs[2] - xs[1]) * (ys[0] - ys[2])
        if abs(den) < 1e-12:
            continue
        gx, gy = np.meshgrid(np.arange(x0, x1 + 1) + 0.5, np.arange(y0, y1 + 1) + 0.5)
        w0 = ((ys[1] - ys[2]) * (gx - xs[2]) + (xs[2] - xs[1]) * (gy - ys[2])) / den
        w1 = ((ys[2] - ys[0]) * (gx - xs[2]) + (xs[0] - xs[2]) * (gy - ys[2])) / den
        w2 = 1 - w0 - w1
        ins = (w0 >= -0.02) & (w1 >= -0.02) & (w2 >= -0.02)
        p = g["pos"][i]
        pos = w0[..., None] * p[0] + w1[..., None] * p[1] + w2[..., None] * p[2]
        sl = (slice(y0, y1 + 1), slice(x0, x1 + 1))
        P[sl][ins] = pos[ins]
        N[sl][ins] = g["nrm"][i]
        Bn[sl][ins] = bid[i]
        cov[sl] |= ins
    return P, N, Bn, cov, bones


# ---------------------------------------------------------------- rules
def rule_mask(r, mat, P, N, Bn, bones, cls, cov):
    m = cov.astype(np.float64)
    soft = r.get("soft", 0.008)
    my = r.get("mirror_y", True)
    Q = P.copy()
    if my:
        Q[..., 1] = np.abs(Q[..., 1])
    if r.get("mats") and not any(s in mat for s in r["mats"]):
        return np.zeros_like(m)
    if r.get("bones"):
        ok = np.isin(Bn, [bones.index(b) for b in r["bones"] if b in bones])
        m = m * ok
    if r.get("box"):
        b = r["box"]
        for ax in range(3):
            lo, hi = b[2 * ax], b[2 * ax + 1]
            m = m * smooth(Q[..., ax], lo - soft, lo + soft) * (1 - smooth(Q[..., ax], hi - soft, hi + soft))
    if r.get("plane"):
        n = np.array(r["plane"]["n"], np.float64)
        d = Q @ n
        lo, hi = r["plane"]["range"]
        m = m * smooth(d, lo - soft, lo + soft) * (1 - smooth(d, hi - soft, hi + soft))
    if "up" in r:
        m = m * smooth(N[..., 2], r["up"] - 0.08, r["up"] + 0.08)
    if "down" in r:
        m = m * (1 - smooth(N[..., 2], r["down"] - 0.08, r["down"] + 0.08))
    if r.get("src"):
        m = m * cls[r["src"]]
    return np.clip(m * r.get("strength", 1.0), 0, 1)


def paint_material(g, mi, mat, rules, out_dir):
    src = source_dir(mat)
    alb = load(os.path.join(src, "albedo.png"))
    mga = load(os.path.join(src, "mgao.png"))
    nrm = load(os.path.join(src, "normal.png"))
    S = alb.shape[0]
    if mga.shape[0] != S:
        mga = np.asarray(Image.fromarray((mga * 255).astype(np.uint8)).resize((S, S), Image.LANCZOS), np.float64) / 255
    P, N, Bn, cov, bones = bake(g, mi, S)
    L = lum(alb)
    h, s, v = hsv(alb[..., :3])
    gold = ((h > 20) & (h < 62) & (s > 0.28) & (v > 0.30)).astype(np.float64)
    accent = ((s > 0.35) & (v > 0.22)).astype(np.float64)                    # any saturated light/trim (donor lights)
    accent = np.maximum(accent, gold)
    accent = morph(accent, 3, "close")
    accent = morph(accent, 5, "open")                                         # no hairlines: they vanish at RTS zoom
    cls = {"gold": gold, "accent": accent, "light": smooth(L, 0.38, 0.55), "dark": 1 - smooth(L, 0.18, 0.30)}

    # 1. two-tone base, keeping the source's panel shading as a ratio to its local mean
    local = blur(L, 6) + 0.02
    detail = np.clip(L / local, 0.55, 1.45) ** 0.6
    t = smooth(blur(L, 3), 0.14, 0.62)
    base = (PAL["charcoal"][None, None] * (1 - t)[..., None] + PAL["gunmetal"][None, None] * t[..., None]) * detail[..., None]
    out = base
    roles = {"charcoal": 1 - t, "gunmetal": t}
    # 2. source accents -> copper
    cu = accent
    out = out * (1 - cu[..., None]) + (PAL["copper"] * (0.70 + 0.55 * L)[..., None]) * cu[..., None]
    roles = {k: v * (1 - cu) for k, v in roles.items()}
    roles["copper"] = cu
    roles.setdefault("oxblood", np.zeros_like(cu))
    roles.setdefault("steel", np.zeros_like(cu))
    # 3. rules
    for r in rules:
        m = rule_mask(r, mat, P, N, Bn, bones, cls, cov)
        if not m.any():
            continue
        role = r["role"]
        tone = (0.78 + 0.45 * np.clip(detail - 1, -0.3, 0.3) + 0.25 * (L - 0.45)) if role in ("copper", "oxblood") else detail
        col = PAL[role] * np.clip(tone, 0.55, 1.3)[..., None]
        out = out * (1 - m[..., None]) + col * m[..., None]
        for k in roles:
            roles[k] = roles[k] * (1 - m)
        roles[role] = roles.get(role, 0) + m
        print("   rule %-8s %-28s %6.2f%% of texels" % (role, json.dumps({k: r[k] for k in r if k in ("bones", "mats", "src")})[:28],
                                                      100 * m.sum() / max(cov.sum(), 1)))

    A = np.concatenate([np.clip(out, 0, 1), np.ones((S, S, 1))], -1)
    met = sum(roles[k] * MG[k][0] for k in MG)
    glo = sum(roles[k] * MG[k][1] for k in MG)
    ao = mga[..., 2]
    M = np.stack([met, glo, ao, np.ones((S, S))], -1)
    A[..., :3] = dilate_fill(A[..., :3], cov)
    M[..., :3] = dilate_fill(M[..., :3], cov)
    os.makedirs(out_dir, exist_ok=True)
    for arr, suf in ((A, "Albedo"), (M, "MetallicGlossAO"), (nrm, "Normal")):
        Image.fromarray((np.clip(arr, 0, 1) * 255 + 0.5).astype(np.uint8), "RGBA").save(
            os.path.join(out_dir, "%s_%s.png" % (mat, suf)))
    print("  %s: %d px, covered %.1f%%, copper %.1f%%, oxblood %.1f%%" % (
        mat, S, 100 * cov.mean(), 100 * (roles["copper"] * cov).sum() / max(cov.sum(), 1),
        100 * (roles["oxblood"] * cov).sum() / max(cov.sum(), 1)))


def resolve(obj, shared):
    if isinstance(obj, list):
        return [resolve(x, shared) for x in obj]
    if isinstance(obj, dict):
        if "$" in obj:
            base = dict(shared[obj["$"]])
            base.update({k: v for k, v in obj.items() if k != "$"})
            return resolve(base, shared)
        return {k: resolve(v, shared) for k, v in obj.items()}
    return obj


def main():
    spec = json.load(open(sys.argv[1]))
    shared = spec.get("_shared", {})
    only = sys.argv[2:]
    for v in resolve(spec["variants"], shared):
        if only and v["name"] not in only:
            continue
        paint = v.get("paint", shared.get("paint", HOUSE))
        paint = resolve(paint, shared)
        rules = paint.get("rules", [])
        for k in PAL:                                     # palette overrides, e.g. "gunmetal": [r, g, b]
            if k in paint:
                PAL[k] = np.array(paint[k], np.float64)
        d = os.path.join(TEX, v["name"])
        g = np.load(os.path.join(d, "_geo.npz"))
        print("PAINT", v["name"], list(g["mats"]))
        for mi, mat in enumerate(g["mats"]):
            paint_material(g, mi, str(mat), rules, d)


if __name__ == "__main__":
    main()
