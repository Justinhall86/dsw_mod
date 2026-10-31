"""Generate the overnight Th_Ship variant specs (01_input/variants/<name>.json + palette.txt)."""
import copy, json, os
HERE = os.path.dirname(os.path.abspath(__file__)); PROJ = os.path.dirname(HERE)
base = json.load(open(os.path.join(PROJ, "01_input", "ship.json")))["variants"][0]
CYL = [4.215, 1.175, 0.5, -2.3, -0.45, "x"]
DRUM_DISC = [-3.36, -3.40, 0.95, 1.30, 3.90]


def make(name, stretch=1.15, flat=0.8, w=0.95, wz=1.0, tip="tubes", chin=True, side=False, pal="dark", cu="std", note="", root=0.41):
    v = copy.deepcopy(base); v["name"] = name; v["_note"] = note
    v["host_squash"] = [{"slab": "x", "range": [-9, 9], "axis": "x", "scale": stretch},
                        {"slab": "x", "range": [-9, 9], "axis": "z", "scale": flat}]
    v["host_center"] = [0, 0, -0.13 * flat]
    v["host_remove"] = [r for r in v["host_remove"]] + [[0.1, 1.9, 0.36, 0.56, -3, 3], [0.1, 1.9, -0.56, -0.36, -3, 3]]
    kx, kz = stretch / 1.15, flat / 0.8
    gs = []
    for g in v["grafts"]:
        g = copy.deepcopy(g)
        if g["donor"] == "frigate" and g.get("box_abs"):          # side gun rods
            if not side: continue
        if g["donor"] == "frigate" and g.get("cyl_abs") and g["scale"][1] == 0.35:   # old tip tubes, re-added below
            continue
        if g["donor"] == "frigate" and g.get("cyl_abs") and g["scale"][1] in (0.26, 0.75) and g["at"][0] < 0:
            if not chin: continue                                  # chin barrels + housing
        if g["donor"] == "hawk" and g.get("rot_deg") == [0, 0, -90] and g["at"][1] != 0:   # main wings
            g["scale"] = [w, w, w * wz]; g["at"] = [0.6325 * kx, root + 0.92 * w, 0.496 * kz]
            gs.append(g); continue
        g["at"][0] *= kx
        if g["at"][2] is not None: g["at"][2] *= kz
        gs.append(g)
    tipy, tipx, tipz = root + 1.84 * w + 0.06, 0.6 * stretch + 0.35, 0.62 * flat
    if tip == "tubes":
        s = 0.35
        gs.append({"donor": "frigate", "role": "charcoal", "cyl_abs": CYL, "scale": [s * 1.1, s, s], "rot_deg": [0, 0, 180],
                   "at": [tipx, tipy, tipz], "mirror": True, "mirror_axis": "y", "min_island_faces": 6})
    elif tip == "drums":
        gs.append({"donor": "wraith", "role": "drum", "disc_abs": DRUM_DISC, "scale": 0.24, "rot_deg": [0, -90, 0],
                   "at": [tipx - 0.05, tipy + 0.05, tipz], "mirror": True, "mirror_axis": "y", "min_island_faces": 12})
    v["grafts"] = gs
    os.makedirs(os.path.join(PROJ, "01_input", "variants"), exist_ok=True)
    json.dump({"variants": [v]}, open(os.path.join(PROJ, "01_input", "variants", name + ".json"), "w"), indent=2)
    return name, pal, cu, note


V = [
 make("v01_clean_dark", note="S4 cleaned: no side rods, no rear side boxes, wings moved inboard; dark palette"),
 make("v02_clean_twotone", pal="twotone", note="v01 with gunmetal two-tone panels"),
 make("v03_compact_dark", stretch=1.0, w=0.8, wz=1.6, note="shorter body, smaller thicker wings: closer to Hawk/Hammer proportions"),
 make("v04_compact_twotone", stretch=1.0, w=0.8, wz=1.6, pal="twotone", note="v03 two-tone"),
 make("v05_thickwing_heavycu", stretch=1.1, w=0.9, wz=2.2, pal="twotone", cu="heavy", note="chunky armoured wings, copper wing tips + nose collar"),
 make("v06_arrow_nojets", w=0.95, wz=1.5, tip="none", pal="twotone", cu="heavy", note="no tip jets at all: one clean arrow shape, copper wing tips"),
 make("v07_sibling_drums", tip="drums", note="small copper-ringed drums at the tips: family tie to the frigate"),
 make("v08_gunship", stretch=1.0, w=0.8, wz=1.6, side=True, pal="twotone", note="compact with side guns AND chin gun: most weapons"),
 make("v09_stealth", flat=0.68, w=1.0, tip="none", note="flattest and widest, no jets: stealth-fighter read"),
 make("v10_dark_heavycu", cu="heavy", note="v01 with copper wing tips and nose collar"),
 make("v11_arrow_polish", w=0.95, wz=1.5, tip="none", pal="twotone", cu="heavy", root=0.28, note="POLISH of v06: wings seated further inboard (root gap closed)"),
 make("v12_compact_polish", stretch=1.0, w=0.8, wz=1.6, pal="twotone", cu="heavy", root=0.28, note="POLISH of v04: inboard wings + copper tips/collar"),
 make("v13_thick_polish", stretch=1.1, w=0.9, wz=2.2, pal="twotone", cu="heavy", root=0.28, note="POLISH of v05: inboard wings"),
]
open(os.path.join(PROJ, "01_input", "variants", "list.txt"), "w").write("\n".join("%s %s %s|%s" % x for x in V))
print("\n".join(x[0] for x in V))
