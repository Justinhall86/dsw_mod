"""Step 03 - classify every albedo pixel of the Commando into a material region.

Inputs (04_textures + model_inputs/Commando)
  uv_position.npy / uv_normal.npy / uv_covered.npy   from 02_uv_position_map.py
  Commando_Albedo.png                               base colour
  Commando_MetallicGlossAO.png                      R=metallic, G=gloss, B=AO
  model_work/commando_preview/mask_majority.npy     the game's own faction-tint mask

Region ids (written to 04_textures/region_ids.npy and a colour-coded preview)
  0  outside / unknown
  1  skin              (face, hands)          -> keep
  2  dark fabric       (scarf, bodysuit)       -> dark plum
  3  leather / straps  (brown vest, belt)     -> burgundy leather
  4  accent plate      (the game's tint mask) -> house plum  <- the hero colour
  5  large armour      (forearm / knee pads)  -> house plum armour
  6  small trim        (fan vents, buckles)   -> gold

The big cream/steel plates are the same colour as the trim in the base texture,
so the two are separated by CONNECTED-COMPONENT SIZE: a large blob is armour,
a small one is trim.  Gold must stay a thin accent, otherwise the model turns
into a gold statue.

Run:  python 08_scripts/03_classify_regions.py
"""
import os
from collections import deque

import numpy as np
from PIL import Image

PROJ = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\commando_house"
MODELS = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_inputs\Commando"
PREV = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_work\commando_preview"
TEX = os.path.join(PROJ, "04_textures")

# a metal blob bigger than this is an armour plate, not trim
TRIM_MAX_PX = 420

albedo = np.array(Image.open(os.path.join(MODELS, "Commando_Albedo.png")).convert("RGBA")).astype(np.float32)
rgb = albedo[..., :3]
mg = np.array(Image.open(os.path.join(MODELS, "Commando_MetallicGlossAO.png")).convert("RGBA")).astype(np.float32)
met = mg[..., 0]
gloss = mg[..., 1]

pos = np.load(os.path.join(TEX, "uv_position.npy"))
nrm = np.load(os.path.join(TEX, "uv_normal.npy"))
cov = np.load(os.path.join(TEX, "uv_covered.npy"))
tint = np.load(os.path.join(PREV, "mask_majority.npy"))

R, G, B = rgb[..., 0], rgb[..., 1], rgb[..., 2]
mx = rgb.max(axis=2)
mn = rgb.min(axis=2)
sat = np.where(mx > 0, (mx - mn) / np.maximum(mx, 1), 0)
lum = 0.299 * R + 0.587 * G + 0.114 * B

reg = np.zeros(rgb.shape[:2], dtype=np.uint8)

# --- skin: warm, saturated, mid-bright, non-metal ----------------------
skin = (R > G + 8) & (G > B + 4) & (sat > 0.20) & (lum > 70) & (met < 90)
reg[skin] = 1

# --- metal, split later into trim (6) vs armour plate (5) -------------
metal = (met > 100) & (lum > 85) & ~skin
reg[metal] = 6

# --- 3. leather / straps: warm mid brown, non-metal --------------------
leather = (R > G + 6) & (sat > 0.12) & (lum > 28) & (lum < 130) & (met < 100) & ~skin
reg[leather] = 3

# --- 2. dark fabric ---------------------------------------------------
reg[(mx < 60) & (met < 100) & (reg == 0)] = 2

# --- anything left: bright -> armour plate, dim -> dark fabric ---------
rest = reg == 0
reg[rest & (lum < 90)] = 2
reg[rest & (lum >= 90)] = 5

# --- 4. the game's own faction-tint region (accent plate) -------------
# it wins over everything it overlaps (it is the game's own choice)
reg[tint] = 4

# --- split the metal blobs: big = armour plate (5), small = trim (6) ----
def split_blobs(mask, big_max):
    """Label 4-connected components; components larger than big_max become 5."""
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


split_blobs(reg == 6, TRIM_MAX_PX)
# the tint mask must stay the accent plate
reg[tint] = 4

# --- fill any still-unclassified pixel from its nearest neighbour -------
# (the UV atlas has a few islands the rasteriser could not resolve; a
#  4-connected flood fill gives them the region of the pixels around them)
unfilled = reg == 0
if unfilled.any():
    from collections import deque as dq
    H, W = reg.shape
    # seed: unclassified pixels that touch a classified one
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
    q = dq(seeds)
    while q:
        y, x, r = q.popleft()
        if reg[y, x] != 0:
            continue
        reg[y, x] = r
        for dy, dx in ((1, 0), (-1, 0), (0, 1), (0, -1)):
            ny, nx = y + dy, x + dx
            if 0 <= ny < H and 0 <= nx < W and reg[ny, nx] == 0:
                q.append((ny, nx, r))
    print("filled", int((reg != 0).sum() - (reg != 0).sum()), "->", int((reg != 0).sum()),
          "still unknown:", int((reg == 0).sum()))

np.save(os.path.join(TEX, "region_ids.npy"), reg)

NAMES = {0: "unknown", 1: "skin", 2: "dark fabric", 3: "leather",
         4: "accent plate", 5: "armour plate", 6: "small trim"}
PALETTE = {0: (40, 40, 40), 1: (240, 200, 170), 2: (60, 60, 120),
           3: (200, 140, 90), 4: (230, 60, 230), 5: (90, 160, 220), 6: (250, 250, 90)}

prev = np.zeros(rgb.shape[:2] + (3,), dtype=np.uint8)
for k, col in PALETTE.items():
    prev[reg == k] = col
Image.fromarray(prev).save(os.path.join(PREV, "region_map.png"))

print(f"{'region':14s} {'pixels':>8s}  {'%':>6s}  mean colour")
for k in sorted(NAMES):
    m = reg == k
    if not m.any():
        print(f"{NAMES[k]:14s} {0:8d}")
        continue
    c = rgb[m]
    print(f"{NAMES[k]:14s} {int(m.sum()):8d}  {100*m.mean():5.1f}%  "
          f"({c[:,0].mean():5.1f},{c[:,1].mean():5.1f},{c[:,2].mean():5.1f})")
print("\npreview ->", os.path.join(PREV, "region_map.png"))
