"""Before/after of two gap_check runs (same views and clips): which candidates were fixed, which remain, which are new.

    python gap_compare.py <dir_before> <tag_before> <dir_after> <tag_after> <out.png> [--tol 25]

Matching: same pose + angle, centres within --tol px.  Prints a table and writes a sheet: per candidate the before crop and the after crop.
Needs only Pillow (no Blender).
"""
import json
import os
import sys

from PIL import Image, ImageDraw, ImageFont

d0, t0, d1, t1, out = sys.argv[1:6]
tol = int(sys.argv[sys.argv.index("--tol") + 1]) if "--tol" in sys.argv else 25
R0 = json.load(open(os.path.join(d0, t0 + "_gaps.json"))); R1 = json.load(open(os.path.join(d1, t1 + "_gaps.json")))
key = lambda r: (r["pose"], round(r["angle"]))
B = {key(r): r for r in R0}; A = {key(r): r for r in R1}
rows = []
for k in sorted(set(B) | set(A)):
    hb = list(B.get(k, {}).get("holes", [])); ha = list(A.get(k, {}).get("holes", []))
    used = set()
    for h in hb:
        m = next((j for j, g in enumerate(ha) if j not in used and abs(g["x"] - h["x"]) <= tol and abs(g["y"] - h["y"]) <= tol), None)
        if m is None:
            rows.append(("fixed", k, h, None))
        else:
            used.add(m); rows.append(("remains", k, h, ha[m]))
    rows += [("NEW", k, None, g) for j, g in enumerate(ha) if j not in used]
try:
    F = ImageFont.truetype("DejaVuSans-Bold.ttf", 14)
except OSError:
    F = ImageFont.load_default()
cells = []
for st, (pose, ang), hb, ha in rows:
    h = ha or hb
    who = max(h["at"].items(), key=lambda kv: kv[1]["n"])[0] if h["at"] else "?"
    print("%-8s %-26s a%03d  (%d,%d) %4dpx -> %s   %s" % (st, pose, ang, h["x"], h["y"], hb["px"] if hb else 0, ha["px"] if ha else 0, who))
    pair = Image.new("RGB", (480, 240), "white")
    for i, (d, r) in enumerate(((d0, B.get((pose, ang))), (d1, A.get((pose, ang))))):
        if r:
            im = Image.open(os.path.join(d, r["png"])).convert("RGB")
            pair.paste(im.crop((h["x"] - 60, h["y"] - 60, h["x"] + 60, h["y"] + 60)).resize((240, 240), Image.NEAREST), (i * 240, 0))
    col = {"fixed": (80, 220, 80), "remains": (255, 200, 0), "NEW": (255, 60, 60)}[st]
    ImageDraw.Draw(pair).text((4, 4), "%s  %s a%d  %s" % (st, pose[:16], ang, who[:20]), fill=col, font=F, stroke_width=2, stroke_fill="black")
    cells.append(pair)
n = {s: sum(r[0] == s for r in rows) for s in ("fixed", "remains", "NEW")}
print("SUMMARY fixed %d  remains %d  new %d" % (n["fixed"], n["remains"], n["NEW"]))
if cells:
    cols = 4; sheet = Image.new("RGB", (cols * 480, ((len(cells) + cols - 1) // cols) * 240), "white")
    for i, c in enumerate(cells):
        sheet.paste(c, ((i % cols) * 480, (i // cols) * 240))
    sheet.save(out)
