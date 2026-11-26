"""Village-style lineup: Terminal variants between real Corrino and Atreides village buildings, true size, on sand,
RTS camera, matte. Two zooms per sheet: 'near' (close RTS zoom) and 'far' (default RTS zoom, where thin detail dies).

    python 36_lineup.py <out_name> <variant> [<variant> ...]
      variant = a name in ../03_blender/terminal_native/ (built by 34_build_terminal.py) or _Current (installed D5)

Output: ../02_progress_photos/23_lineups/<out_name>.png (one row per variant: [Corrino neighbours | variant | Atreides neighbours])
"""
import json
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import bpy  # noqa: E402
import terminal_scene as T  # noqa: E402
from mathutils import Vector  # noqa: E402
from PIL import Image, ImageDraw, ImageFont  # noqa: E402

OUT = os.path.join(T.PROJ, "02_progress_photos", "23_lineups")
NB = os.path.join(T.PROJ, "03_blender", "terminal_native")
LEFT = [("PropagandaOffice", "corrino"), ("MilitaryBase", "corrino"), ("Refinery", "corrino")]
RIGHT = [("SupplyDepot", "atreides"), ("ResearchHub", "atreides"), ("WindTrap", "atreides")]
GAP = 0.9


def font(sz):
    for f in ("arialbd.ttf", "/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf"):
        try:
            return ImageFont.truetype(f, sz)
        except OSError:
            pass
    return ImageFont.load_default()


def load_variant(v):
    if v == "_Current":
        return T.village("_Current", "corrino")
    p = os.path.join(NB, v + ".blend")
    with bpy.data.libraries.load(p) as (src, dst):
        dst.objects = ["Thorvald_Starport"]
    ob = dst.objects[0]
    bpy.context.scene.collection.objects.link(ob)
    alb = next(n.image for n in ob.data.materials[0].node_tree.nodes if n.type == "TEX_IMAGE" and n.image.name.endswith("Albedo"))
    tex = os.path.join(T.PROJ, "04_textures", "terminal_native", v)
    ob.data.materials[0] = T.matte_material("pv_" + v, os.path.join(tex, "Terminal_Albedo.png"),
                                            os.path.join(tex, "Terminal_MetallicGlossAO.png"))
    del alb
    T.ground(ob)
    return ob


def row(v):
    T.reset()
    T.world()
    items = [T.village(n, p) for n, p in LEFT] + [load_variant(v)] + [T.village(n, p) for n, p in RIGHT]
    # along the screen-right axis (1, -1)/sqrt2, packed by each footprint's extent along that axis
    axis = Vector((0.7071, -0.7071, 0))
    pos = 0.0
    for i, ob in enumerate(items):
        lo, hi = T.bounds([ob])
        ext = abs(hi.x - lo.x) * 0.7071 + abs(hi.y - lo.y) * 0.7071
        pos += ext / 2
        T.ground(ob, (axis * pos).to_tuple()[:2])
        pos += ext / 2 + GAP
    lo, hi = T.bounds(items)
    c = (lo + hi) / 2
    width = pos - GAP
    T.camera((c.x, c.y, 0.6), width * 1.04)
    near = T.render(os.path.join(OUT, "_tiles", "%s_near.png" % v), 2000, 560, samples=24)
    far = T.render(os.path.join(OUT, "_tiles", "%s_far.png" % v), 760, 213, samples=24)
    return near, far


if __name__ == "__main__":
    a = T.args()
    name, vs = a[0], a[1:]
    rows = [(v,) + row(v) for v in vs]
    W = 2000 + 760 + 30
    H = sum(560 + 40 for _ in rows) + 60
    sheet = Image.new("RGB", (W, H), (30, 30, 34))
    dr = ImageDraw.Draw(sheet)
    dr.text((12, 12), "Lineup, true size. Left: Corrino Propaganda Office, Military Base, Refinery. Centre: Terminal. "
            "Right: Atreides Supply Depot, Research Hub, Windtrap.   Right column: same row at default RTS zoom",
            fill=(255, 255, 255), font=font(22))
    y = 60
    for v, near, far in rows:
        dr.text((12, y + 6), v, fill=(255, 210, 160), font=font(26))
        sheet.paste(Image.open(near).convert("RGB"), (0, y + 40))
        sheet.paste(Image.open(far).convert("RGB"), (2030, y + 40 + (560 - 213) // 2))
        y += 600
    p = os.path.join(OUT, name + ".png")
    sheet.save(p)
    print("LINEUP", p)
