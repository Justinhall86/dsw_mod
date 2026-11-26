"""Survey of the faction-skinned village buildings: one tile each, all at ONE camera scale (true in-game size from
the prefab), on sand, RTS camera, matte. Labelled sheet with footprint sizes.

    python 31_village_survey.py [corrino|atreides] [Name ...]     (or blender -b --python 31_village_survey.py -- ...)

Output: <repo>/gallery/buildings/village_faction_survey/survey_<paint>.png, tiles/<paint>_<Name>.png, sizes.json.
Needs 30_village_convert.py first.
"""
import json
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import terminal_scene as T  # noqa: E402
from PIL import Image, ImageDraw, ImageFont  # noqa: E402

a = T.args()
paint = a[0] if a and a[0] in ("corrino", "atreides") else "corrino"
SKIP = {"Airfield"}                          # its HMD carries an 87 m flight-path mesh
names = [n for n in a if n not in ("corrino", "atreides")] or [n for n in sorted(os.listdir(T.VD)) if n not in SKIP]
REPO = T.PROJ
while not os.path.exists(os.path.join(REPO, "CLAUDE.md")):
    REPO = os.path.dirname(REPO)
OUT = os.path.join(REPO, "gallery", "buildings", "village_faction_survey")
TILES = os.path.join(OUT, "tiles")
ORTHO = 7.5                                  # metres across every tile: sizes compare directly
RES = 420


def font(sz):
    for f in ("arialbd.ttf", "DejaVuSans-Bold.ttf", "/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf"):
        try:
            return ImageFont.truetype(f, sz)
        except OSError:
            pass
    return ImageFont.load_default()


sizes = {}
for n in names:
    T.reset()
    T.world()
    try:
        ob = T.village(n, paint)
    except Exception as exc:
        print("FAIL", n, exc)
        continue
    lo, hi = T.bounds([ob])
    sizes[n] = [round(v, 2) for v in (hi - lo)]
    T.camera(((lo + hi) / 2).to_tuple()[:2] + (hi.z * 0.35,), ORTHO)
    T.render(os.path.join(TILES, "%s_%s.png" % (paint, n)), RES, samples=20)
    print("SIZE", n, sizes[n])

cols = 6
rows = (len(sizes) + cols - 1) // cols
sheet = Image.new("RGB", (cols * RES, rows * (RES + 34) + 50), (30, 30, 34))
dr = ImageDraw.Draw(sheet)
dr.text((12, 10), "Vanilla village buildings, %s paint, true in-game size (every tile %.1f m across). '_Current' = installed Terminal D5"
        % (paint, ORTHO), fill=(255, 255, 255), font=font(24))
for i, n in enumerate(sizes):
    r, c = divmod(i, cols)
    x, y = c * RES, 50 + r * (RES + 34)
    sheet.paste(Image.open(os.path.join(TILES, "%s_%s.png" % (paint, n))).convert("RGB"), (x, y + 34))
    dr.text((x + 8, y + 6), "%s  %.1f x %.1f x %.1f" % (n, *sizes[n]), fill=(235, 235, 235), font=font(20))
sheet.save(os.path.join(OUT, "survey_%s.png" % paint))
json.dump(sizes, open(os.path.join(OUT, "sizes.json"), "w"), indent=1)
print("SURVEY_DONE", os.path.join(OUT, "survey_%s.png" % paint))
