"""Atlas for the kitbashed Consignment Terminal (design D5): py -3.14 26_terminal_atlas.py

1024 atlas of four 512 quadrants (UV space, v up):
  (0,1) Guild: gold -> grey, white logo painted out      (1,1) Propaganda: gold/brown -> matte copper
  (0,0) MilitaryBase (tanks, pylons), a little darker    (1,0) paint: hex slab top (left 384 px) + copper strip (right)
Output: ../04_textures/terminal_kitbash/Terminal_Albedo.png
"""
import os
import numpy as np
from PIL import Image, ImageDraw, ImageFilter

HERE = os.path.dirname(os.path.abspath(__file__)); PROJ = os.path.dirname(HERE)
DON = os.path.join(PROJ, "03_blender", "kitbash_donors")
OUT = os.path.join(PROJ, "04_textures", "terminal_kitbash"); os.makedirs(OUT, exist_ok=True)
Q = 512


def hsv(name):
    im = Image.open(os.path.join(DON, name, "albedo.png")).convert("RGB").resize((Q, Q), Image.LANCZOS)
    return im, np.asarray(im.convert("HSV")).astype(np.float32)


# Guild: tower gold -> warm mid grey, logo gone
im, a = hsv("SpacingGuildBranch")
h, s, v = a[..., 0], a[..., 1], a[..., 2]
gold = (h > 8) & (h < 52) & (s > 70) & (v > 50)
near = np.asarray(Image.fromarray((gold * 255).astype(np.uint8)).filter(ImageFilter.MaxFilter(41))) > 0
logo = near & ~gold & (s < 90) & (v > 150)
medv = float(np.median(v[gold]))
rgb = np.asarray(im).astype(np.float32)
g = (np.minimum(v, medv) * 0.60)[..., None] * np.array([1.0, 0.985, 0.95])
rgb[gold] = g[gold]
flat = np.asarray(Image.fromarray(np.clip(rgb, 0, 255).astype(np.uint8)).filter(ImageFilter.GaussianBlur(10))).astype(np.float32)
rgb[logo] = medv * 0.60 * np.array([1.0, 0.985, 0.95])
rgb[~gold] = rgb[~gold] * 0.78 * np.array([0.97, 0.99, 1.04])   # landing pad / rim: darker gunmetal like the paint-over
guild = Image.fromarray(np.clip(rgb * 0.92, 0, 255).astype(np.uint8))

# Propaganda: gold, cream-yellow and brown -> matte copper
im, a = hsv("PropagandaOffice")
h, s, v = a[..., 0], a[..., 1], a[..., 2]
warm = (h > 4) & (h < 52) & (s > 45) & (v > 40)
out = a.copy()
out[..., 0][warm] = 17                             # ~18 deg
out[..., 1][warm] = np.clip(s[warm] * 0.3 + 125, 0, 200)
out[..., 2][warm] = np.clip(v[warm] * 0.6 + 35, 0, 190)
prop = Image.fromarray(out.astype(np.uint8), "HSV").convert("RGB")
CU = tuple(int(c) for c in np.asarray(prop).reshape(-1, 3)[warm.ravel()].mean(0))   # trim copper, reused on the slope
print("trim copper", CU)

mil = Image.open(os.path.join(DON, "MilitaryBase", "albedo.png")).convert("RGB").resize((Q, Q), Image.LANCZOS)
mil = Image.fromarray(np.clip(np.asarray(mil).astype(np.float32) * 0.8, 0, 255).astype(np.uint8))

# paint quadrant: slab top is planar-mapped x,y in [-2.6, 2.6] -> 384 px
rng = np.random.default_rng(7)
P = 384
n = rng.normal(0, 1, (P // 8, P // 8)); n = np.asarray(Image.fromarray(((n * 20) + 128).clip(0, 255).astype(np.uint8)).resize((P, P), Image.BICUBIC)).astype(np.float32) - 128
base = np.full((P, P, 3), (84, 86, 90), np.float32) + n[..., None] * 0.35
slab = Image.fromarray(base.clip(0, 255).astype(np.uint8)); d = ImageDraw.Draw(slab)
R = 2.44; to = lambda x, y: ((x + 2.6) / 5.2 * P, (1 - (y + 2.6) / 5.2) * P)
hexp = [(R * np.cos(np.radians(k * 60)), R * np.sin(np.radians(k * 60))) for k in range(6)]
for k in range(6):                                  # panel seams from the centre to each corner, then the rim
    d.line([to(0, 0), to(*hexp[k])], fill=(58, 60, 64), width=2)
for f, col, w in ((1.0, (48, 50, 54), 7), (0.93, (112, 114, 118), 2), (0.55, (62, 64, 68), 2)):
    d.line([to(x * f, y * f) for x, y in hexp + hexp[:1]], fill=col, width=w)
gx0, gy0 = to(-0.35, -1.75); gx1, gy1 = to(0.95, -2.05)   # dark grate at the foot of the slope
d.rectangle((gx0, gy0, gx1, gy1), fill=(36, 37, 40))
for x in np.arange(gx0, gx1, 5):
    d.line([(x, gy0), (x, gy1)], fill=(60, 61, 64), width=1)
paint = Image.new("RGB", (Q, Q), (50, 52, 56)); paint.paste(slab, (0, Q - P))
cw = Q - P
cn = rng.normal(0, 1, (Q // 6, cw // 6)); cn = np.asarray(Image.fromarray(((cn * 22) + 128).clip(0, 255).astype(np.uint8)).resize((cw, Q), Image.BICUBIC)).astype(np.float32) - 128
cu = np.full((Q, cw, 3), CU, np.float32) * (1 + cn[..., None] / 900) + cn[..., None] * 0.08
paint.paste(Image.fromarray(cu.clip(0, 255).astype(np.uint8)), (P, 0))
# wall-grey strip for the slope trim (top 128 rows of the left 384 px): the hall walls' light concrete grey
wn = rng.normal(0, 1, (16, 48)); wn = np.asarray(Image.fromarray(((wn * 20) + 128).clip(0, 255).astype(np.uint8)).resize((P, Q - P), Image.BICUBIC)).astype(np.float32) - 128
wall = np.full((Q - P, P, 3), (150, 151, 152), np.float32) + wn[..., None] * 0.3
wall[:6] *= 0.7; wall[-6:] *= 0.7
paint.paste(Image.fromarray(wall.clip(0, 255).astype(np.uint8)), (0, 0))

atlas = Image.new("RGB", (Q * 2, Q * 2))
atlas.paste(guild, (0, 0)); atlas.paste(prop, (Q, 0)); atlas.paste(mil, (0, Q)); atlas.paste(paint, (Q, Q))
p = os.path.join(OUT, "Terminal_Albedo.png"); atlas.save(p); print("OK", p)
Image.new("RGB", (Q * 2, Q * 2), (0, 50, 255)).save(os.path.join(OUT, "Terminal_MetallicGlossAO.png"))   # matte, AO 1
Image.new("RGB", (Q * 2, Q * 2), (128, 128, 255)).save(os.path.join(OUT, "Terminal_Normal.png"))
