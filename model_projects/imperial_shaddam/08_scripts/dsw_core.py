"""Shared helpers for the DSW model workshop scripts.

Every script in this folder imports from here so that paths, mesh maths and
rendering behave identically no matter which step you run.

Two groups:

  * Plain-Python helpers (no Blender) - safe to import from a normal python
    process: `dsw_paths`, `meshutil` (connected components), `colorutil`
    (HSV recolour maths), `regionutil` (region classification).
  * Blender-only helpers - must be imported INSIDE Blender:
    `blender_scene` (load a model, set up world/lights/camera, render).

Run `python scripts/dsw_core.py --selftest` to check the paths resolve.
"""
import os
import sys

# --------------------------------------------------------------------------
# paths
# --------------------------------------------------------------------------

HERE = os.path.dirname(os.path.abspath(__file__))

DEFAULTS = {
    # The folder Steam launches the game from.
    "game_dir": r"C:\Program Files (x86)\Steam\steamapps\common\D4X",
    # Old paks go here, never into the game folder.
    "archive_dir": r"C:\Users\justi\OneDrive\Python\dsw_mod\pak_archive",
    # CastleDB / HIDE editor; files that go into the pak live in res\res
    "editor_dir": r"C:\dsw_mod\D4XEditor",
    # Vanilla assets extracted from the game (read-only reference)
    "extr_dir": r"C:\dsw_mod\extr",
    # Peter Quin's HMD Toolkit (pure Python)
    "toolkit_dir": r"C:\Users\justi\OneDrive\Python\dsw_mod\HMD_toolkit\HMD_toolkit",
    # This repo
    "project_dir": r"C:\Users\justi\OneDrive\Python\dsw_mod",
    # Blender 5.2
    "blender": r"C:\Program Files\Blender Foundation\Blender 5.2\blender.exe",
    # Model projects live here
    "model_projects": os.path.join(
        r"C:\Users\justi\OneDrive\Python\dsw_mod", "model_projects"),
}


def cfg(name):
    """Resolve a setting. The env var DSW_<NAME> always wins."""
    return os.environ.get("DSW_" + name.upper(), DEFAULTS[name])


def editor_res():
    """The editor's pak staging folder (files here go into res.compressed1.pak)."""
    return os.path.join(cfg("editor_dir"), "res")


def char_mod_dir():
    """Where CharMOD/<Model> folders live inside the pak staging area."""
    return os.path.join(editor_res(), "res", "CharMOD")


def project_dir(name):
    """Absolute path of a model project folder (created if missing)."""
    p = os.path.join(cfg("model_projects"), name)
    os.makedirs(p, exist_ok=True)
    return p


def blender_cmd():
    """The Blender executable, as a list, ready for subprocess."""
    return [cfg("blender"), "-b"]


def run_blender(script, args=None):
    """Run one of these scripts inside Blender. Returns the exit code."""
    import subprocess
    cmd = blender_cmd() + ["--python", os.path.join(HERE, script)]
    if args:
        cmd += ["--"] + [str(a) for a in args]
    print("RUN", " ".join(cmd))
    return subprocess.call(cmd)


# --------------------------------------------------------------------------
# mesh maths - connected components, no Blender needed
# --------------------------------------------------------------------------

def connected_components(vert_count, polygons):
    """Group vertices into connected components over the polygon graph.

    `polygons` is an iterable of vertex-index tuples.  Returns
    `(order, roots)` where `order` is the list of component roots sorted by
    size (largest first) and `roots` maps a root -> list of vertex indices.

    Works on plain tuples, so it can run outside Blender.
    """
    parent = list(range(vert_count))

    def find(a):
        while parent[a] != a:
            parent[a] = parent[parent[a]]
            a = parent[a]
        return a

    def union(a, b):
        ra, rb = find(a), find(b)
        if ra != rb:
            parent[rb] = ra

    for poly in polygons:
        vs = list(poly)
        for i in range(1, len(vs)):
            union(vs[0], vs[i])

    roots = {}
    for v in range(vert_count):
        roots.setdefault(find(v), []).append(v)
    order = sorted(roots, key=lambda r: -len(roots[r]))
    return order, roots


def component_index(vert_count, polygons):
    """Like connected_components, but also returns vertex -> component id."""
    order, roots = connected_components(vert_count, polygons)
    comp_of = {}
    for i, root in enumerate(order):
        for v in roots[root]:
            comp_of[v] = i
    return order, roots, comp_of


# --------------------------------------------------------------------------
# colour maths - hue replacement, value compression
# --------------------------------------------------------------------------

def rgb_to_hsv(a):
    """numpy RGB (..., 3) float array -> hue, sat, value in [0,1] / [0,360).

    The modulo MUST wrap the whole term:
        (60 * (((g - b) / d) % 6))     <- correct
        (60 * ((g - b) / d) % 6)       <- WRONG, gives negative hues
    """
    import numpy as np
    a = np.asarray(a, dtype=np.float32)
    mx = a.max(axis=-1)
    mn = a.min(axis=-1)
    d = mx - mn
    r, g, b = a[..., 0], a[..., 1], a[..., 2]
    h = np.zeros_like(mx)
    m = d > 1e-6
    safe = np.maximum(d, 1e-6)
    idx = (mx == r) & m
    h[idx] = (60 * (((g - b) / safe) % 6))[idx]
    idx = (mx == g) & m
    h[idx] = (60 * (((b - r) / safe) + 2))[idx]
    idx = (mx == b) & m
    h[idx] = (60 * (((r - g) / safe) + 4))[idx]
    s = np.where(mx > 1e-6, d / np.maximum(mx, 1e-6), 0.0)
    return h, s, mx


def hsv_to_rgb(h, s, v):
    """numpy hue (deg), sat, value -> RGB (..., 3)."""
    import numpy as np
    h = np.mod(h, 360.0)
    c = v * s
    x = c * (1 - np.abs((h / 60.0) % 2 - 1))
    m = v - c
    z = np.zeros_like(c)
    seg = np.floor(h / 60.0) % 6
    r = np.select([seg == 0, seg == 1, seg == 2, seg == 3, seg == 4, seg == 5],
                  [c, x, z, z, x, c])
    g = np.select([seg == 0, seg == 1, seg == 2, seg == 3, seg == 4, seg == 5],
                  [x, c, c, x, z, z])
    b = np.select([seg == 0, seg == 1, seg == 2, seg == 3, seg == 4, seg == 5],
                  [z, z, x, c, c, x])
    return np.stack([r + m, g + m, b + m], axis=-1)


def recolour_regions(rgb, region_ids, recipe, palette, residual_snap=18.0,
                     keep_value_band=(0.46, 1.32)):
    """Replace the HUE and SATURATION of every region, keep the painted VALUE.

    This is the same idea the game uses for its faction tints: the base texture
    already carries the painted shading, so swapping hue+sat and keeping
    value preserves every crease, shadow and highlight for free.

    `recipe`  : region id -> (palette key, how much of the base hue to keep)
    `palette` : name -> (r, g, b) 0..255

    Returns (new_rgb_float01, new_value_float01).
    """
    import numpy as np
    h, s, v = rgb_to_hsv(rgb)
    out_h, out_s, out_v = h.copy(), s.copy(), v.copy()
    band_lo, band_hi = keep_value_band

    for rid, (name, keep) in recipe.items():
        m = region_ids == rid
        if not m.any():
            continue
        tgt = np.array(palette[name], dtype=np.float32) / 255.0
        th, ts, tv = rgb_to_hsv(tgt.reshape(1, 1, 3))
        th, ts, tv = float(th[0, 0]), float(ts[0, 0]), float(tv[0, 0])

        # hue: the target, optionally blended back toward the base's own hue
        out_h[m] = th if keep <= 0 else (th * (1 - keep) + h[m] * keep) % 360.0

        # saturation: keep a bit of the base's variation so the region does
        # not become a flat sticker
        base_s = s[m]
        out_s[m] = np.clip(ts * (0.55 + 0.75 * (base_s / max(ts, 1e-3))), 0.0, 1.0)

        # value: the base's region value range is far wider than the target
        # colour allows (a cream plate at 250 would turn plum into pink), so
        # the region's robust value range is COMPRESSED onto a band around the
        # target brightness.  Shading survives; the hue stays.
        vals = v[m]
        lo = float(np.percentile(vals, 3))
        hi = float(np.percentile(vals, 97))
        if hi - lo < 1e-3:
            hi = lo + 1e-3
        rel = np.clip((vals - lo) / (hi - lo), 0.0, 1.0)
        rel = 0.18 + 0.82 * rel ** 0.85
        out_v[m] = np.clip(tv * band_lo + rel * (tv * band_hi - tv * band_lo), 0.0, 1.0)

    new_rgb = np.clip(hsv_to_rgb(out_h, out_s, out_v), 0.0, 1.0)

    # residual hue snap: mottled camo patches would keep their old colour, so
    # any pixel further than residual_snap from its target hue is snapped.
    for rid, (name, keep) in recipe.items():
        if name == "skin":
            continue
        m = region_ids == rid
        if not m.any():
            continue
        tgt = np.array(palette[name], dtype=np.float32) / 255.0
        th, ts, _ = rgb_to_hsv(tgt.reshape(1, 1, 3))
        th, ts = float(th[0, 0]), float(ts[0, 0])
        diff = np.abs((out_h[m] - th + 180.0) % 360.0 - 180.0)
        far = diff > residual_snap
        if far.any():
            snapped_h = np.where(far, th, out_h[m])
            snapped_s = np.where(far, np.minimum(out_s[m], ts * 1.15), out_s[m])
            new_rgb[m] = hsv_to_rgb(snapped_h, snapped_s, out_v[m])

    return new_rgb, out_v


# --------------------------------------------------------------------------
# region classification - the trick that made the recolour work
# --------------------------------------------------------------------------

def classify_regions(albedo, metallic_gloss_ao, tint_mask=None, trim_max_px=420,
                      preset="humanoid"):
    """Split an albedo into material regions by COLOUR, not by UV island.

    Why colour and not UV island: the rasteriser that produced the UV position
    map only covers ~57% of the atlas, so a UV-island classifier leaves large
    unclassified areas.  Classifying the whole texture by colour and then
    flooding the leftovers gives 0 unknown pixels.

    `preset` selects the rule set - see PRESETS below.  The region IDs never
    change, so a palette always means the same thing:
      1 skin   2 dark fabric   3 leather   4 accent   5 armour   6 small trim

    Returns a region id map (uint8).
    """
    import numpy as np
    from collections import deque

    rules = PRESETS.get(preset)
    if rules is None:
        raise SystemExit("unknown preset %r - choose from %s"
                         % (preset, ", ".join(sorted(PRESETS))))

    rgb = albedo[..., :3]
    met = metallic_gloss_ao[..., 0]
    R, G, B = rgb[..., 0], rgb[..., 1], rgb[..., 2]
    mx = rgb.max(axis=2)
    mn = rgb.min(axis=2)
    sat = np.where(mx > 0, (mx - mn) / np.maximum(mx, 1), 0)
    lum = 0.299 * R + 0.587 * G + 0.114 * B

    reg = np.zeros(rgb.shape[:2], dtype=np.uint8)

    # skin: warm, saturated, mid-bright, non-metal
    skin = (R > G + 8) & (G > B + 4) & (sat > 0.20) & (lum > 70) & (met < 90)
    reg[skin] = 1

    # metal: big blobs are armour plate, small ones are trim (split below)
    metal = (met > 100) & (lum > 85) & ~skin
    reg[metal] = 6

    # leather: warm mid brown, non-metal
    leather = (R > G + 6) & (sat > 0.12) & (lum > 28) & (lum < 130) & (met < 100) & ~skin
    reg[leather] = 3

    # dark fabric
    reg[(mx < 60) & (met < 100) & (reg == 0)] = 2

    # leftovers: bright -> armour plate, dim -> dark fabric
    rest = reg == 0
    reg[rest & (lum < 90)] = 2
    reg[rest & (lum >= 90)] = 5

    # the game's own faction-tint region wins over everything it overlaps
    if tint_mask is not None:
        reg[tint_mask] = 4

    # split the metal blobs by SIZE: a large blob is an armour plate, a small
    # one is trim.  Gold must stay a thin accent or the model becomes a gold
    # statue.
    reg = _split_metal_blobs(reg, reg == 6, trim_max_px)
    if tint_mask is not None:
        reg[tint_mask] = 4

    # fill any leftover pixel from its nearest classified neighbour
    reg = _flood_fill_unknown(reg)

    # apply the preset's post-rules (e.g. a creature's hide instead of cloth)
    for fn in rules.get("post", []):
        reg = fn(reg)
    return reg


# --------------------------------------------------------------------------
# region presets
# --------------------------------------------------------------------------
# A preset says how to read a model's albedo into the six standard regions.
# The region IDs never change, so a palette always means the same thing:
#   1 skin   2 dark fabric   3 leather   4 accent   5 armour   6 small trim
#
# To add a preset, copy "humanoid" and adjust the post-rules.  Add it to
# PRESETS and it becomes available as --preset <name>.

PRESETS = {
    "humanoid": {
        "description": "human soldiers - skin, cloth, leather, painted armour, metal trim",
        "post": [],
    },
    "creature": {
        "description": "creatures - hide/fur instead of cloth and leather",
        # a creature's hide is one paintable region: fold the leather and
        # dark-fabric slots together
        "post": [lambda reg: _fold(reg, (2, 3), 2)],
    },
    "vehicle": {
        "description": "vehicles - painted panels and bare metal, no skin or leather",
        "post": [lambda reg: _fold(reg, (1, 3), 5)],
    },
}


def _fold(reg, sources, target):
    """Merge some region ids into one."""
    import numpy as np
    m = np.zeros(reg.shape, dtype=bool)
    for s in sources:
        m |= (reg == s)
    reg[m] = target
    return reg


def _split_metal_blobs(reg, mask, big_max):
    """Label 4-connected components of `mask`; components bigger than
    `big_max` pixels become region 5 (armour plate)."""
    import numpy as np
    from collections import deque
    H, W = mask.shape
    lab = np.zeros((H, W), dtype=bool)
    for sy in range(H):
        for sx in range(W):
            if mask[sy, sx] and not lab[sy, sx]:
                q = deque([(sy, sx)])
                lab[sy, sx] = True
                cells = []
                while q:
                    y, x = q.popleft()
                    cells.append((y, x))
                    for dy, dx in ((1, 0), (-1, 0), (0, 1), (0, -1)):
                        ny, nx = y + dy, x + dx
                        if 0 <= ny < H and 0 <= nx < W and mask[ny, nx] and not lab[ny, nx]:
                            lab[ny, nx] = True
                            q.append((ny, nx))
                if len(cells) > big_max:
                    for (y, x) in cells:
                        reg[y, x] = 5
    return reg


def _flood_fill_unknown(reg):
    """Give every region-0 pixel the region of a touching classified pixel."""
    import numpy as np
    from collections import deque
    H, W = reg.shape
    unfilled = reg == 0
    if not unfilled.any():
        return reg
    seeds = []
    for sy in range(H):
        for sx in range(W):
            if not unfilled[sy, sx]:
                continue
            for dy, dx in ((1, 0), (-1, 0), (0, 1), (0, -1)):
                ny, nx = sy + dy, sx + dx
                if 0 <= ny < H and 0 <= nx < W and reg[ny, nx] != 0:
                    seeds.append((sy, sx, reg[ny, nx]))
                    break
    q = deque(seeds)
    while q:
        y, x, r = q.popleft()
        if reg[y, x] != 0:
            continue
        reg[y, x] = r
        for dy, dx in ((1, 0), (-1, 0), (0, 1), (0, -1)):
            ny, nx = y + dy, x + dx
            if 0 <= ny < H and 0 <= nx < W and reg[ny, nx] == 0:
                q.append((ny, nx))
    return reg


# --------------------------------------------------------------------------
# misc
# --------------------------------------------------------------------------

def script_args():
    """Everything after `--` on the command line (Blender passes these on)."""
    return sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else []


def dds_to_png(src, dst):
    """Game textures are DDS files with a .png extension. Convert for viewing."""
    from PIL import Image
    Image.open(src).convert("RGBA").save(dst)
    return dst


if __name__ == "__main__":
    print("dsw_core self-test")
    for k in DEFAULTS:
        p = cfg(k)
        exists = os.path.exists(p)
        print("  %-16s %-6s %s" % (k, "OK" if exists else "MISSING", p))
    print("  model_projects  %-6s %s"
          % ("OK" if os.path.isdir(cfg("model_projects")) else "MISSING", cfg("model_projects")))
