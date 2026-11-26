"""Grid sheets of donor buildings (Corrino paint, native size): top, front (-Y) and right (+X) views with a 0.25 m grid,
so kitbash pieces can be picked by coordinate boxes in 33_build_terminal.py specs.

    python 32_donor_grid.py Name [Name ...]

Coordinates are the donor after terminal_scene.village(): prefab scale applied, XY centred, base at z = 0.
Output: ../02_progress_photos/20_donor_grids/<Name>_grid.png
"""
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import terminal_scene as T  # noqa: E402
from mathutils import Vector  # noqa: E402
from PIL import Image, ImageDraw  # noqa: E402

OUT = os.path.join(T.PROJ, "02_progress_photos", "20_donor_grids")
RES = 760
VIEWS = {"top": ((0, 0, 1), (0, 1), (0, 1)), "front": ((0, -1, 0), (0, 2), (0, 2)), "right": ((1, 0, 0), (1, 2), (1, 2))}


def font(sz):
    from PIL import ImageFont
    for f in ("arialbd.ttf", "/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf"):
        try:
            return ImageFont.truetype(f, sz)
        except OSError:
            pass
    return ImageFont.load_default()


def one(name):
    T.reset()
    T.world(sand=False)
    ob = T.village(name, "corrino")
    lo, hi = T.bounds([ob])
    span = max(hi - lo) * 1.15
    ctr = (lo + hi) / 2
    tiles = []
    for v, (d, (ax, ay), _) in VIEWS.items():
        cam = T.camera(ctr, span, d)
        if v == "top":
            cam.rotation_euler = (0, 0, 0)
            cam.location = Vector((ctr.x, ctr.y, 300))
        bpy_scene = __import__("bpy").context.scene
        bpy_scene.render.film_transparent = True
        p = T.render(os.path.join(OUT, "_tiles", "%s_%s.png" % (name, v)), RES, samples=12)
        im = Image.open(p).convert("RGBA")
        bg = Image.new("RGBA", im.size, (52, 54, 58, 255))
        im = Image.alpha_composite(bg, im)
        dr = ImageDraw.Draw(im)
        # screen axes: top view x right / y up; front view x right / z up; right view +y right... (-Y dir for right view)
        hx = {"top": 0, "front": 0, "right": 1}[v]
        hsign = {"top": 1, "front": 1, "right": 1}[v]
        vy = {"top": 1, "front": 2, "right": 2}[v]
        c_h, c_v = ctr[hx], ctr[vy]
        px = lambda w: RES / 2 + (w - c_h) * hsign / span * RES
        py = lambda w: RES / 2 - (w - c_v) / span * RES
        k = -40
        while k <= 40:
            w = k * 0.25
            col = (255, 255, 255, 150) if k % 4 == 0 else (200, 200, 200, 55)
            x, y = px(w), py(w)
            if 0 <= x < RES:
                dr.line([(x, 0), (x, RES)], fill=col, width=1)
                if k % 2 == 0:
                    dr.text((x + 2, 2), "%g" % w, fill=(255, 255, 120), font=font(13))
            if 0 <= y < RES:
                dr.line([(0, y), (RES, y)], fill=col, width=1)
                if k % 2 == 0:
                    dr.text((2, y + 1), "%g" % w, fill=(120, 255, 255), font=font(13))
            k += 1
        dr.text((RES - 260, RES - 26), {"top": "TOP  x right, y up", "front": "FRONT  x right, z up",
                                        "right": "RIGHT  y right, z up"}[v], fill=(255, 255, 255), font=font(16))
        tiles.append(im.convert("RGB"))
    sheet = Image.new("RGB", (RES * 3, RES + 40), (30, 30, 34))
    ImageDraw.Draw(sheet).text((10, 8), "%s  size %.2f x %.2f x %.2f (native, prefab scale applied)" % ((name,) + tuple(hi - lo)),
                               fill=(255, 255, 255), font=font(22))
    for i, t in enumerate(tiles):
        sheet.paste(t, (i * RES, 40))
    p = os.path.join(OUT, "%s_grid.png" % name)
    sheet.save(p)
    print("GRID", p)


for n in T.args():
    one(n)
