"""Audit a unit blend against the vanilla quality targets and write a JSON snapshot (use it before AND after an upscale).

    blender -b <blend> --python audit_unit.py -- <out.json> [--label before]

Reports per mesh: triangles, vertices, max bone influences, materials; per material: albedo / MetallicGlossAO / normal sizes and a
health check of every map (a map that is all zero, all one value, or has alpha < 1 is a bug, not a style choice); texel density
(texels per metre, measured from the UV layout vs the world size); and a verdict against TARGETS.

TARGETS come from the vanilla Male01 units: 5-9k triangles (FlameThrower 12k is the ceiling), 1-3 textures sets of 512-2048,
46 joints (+7 whip joints on the Mercenary), at most 3 bone influences per vertex, RGBA alpha 255.
"""
import json
import os
import sys

import bpy
import numpy as np

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import polish_lib as PL  # noqa: E402

TARGETS = dict(tri_floor=5000, tri_ideal=(7000, 9500), tri_ceiling=12000, tex_floor=512, tex_ideal=1024, max_influences=3)

args = sys.argv[sys.argv.index("--") + 1:]
OUT = os.path.abspath(args[0])
LABEL = args[args.index("--label") + 1] if "--label" in args else os.path.splitext(os.path.basename(bpy.data.filepath))[0]


def map_health(arr, kind):
    """arr = (H,W,4) float.  -> list of problems."""
    bad = []
    rgb = arr[..., :3]
    if float(rgb.max()) < 1e-4:
        bad.append("ALL ZERO")
    elif float(rgb.std()) < 1e-4:
        bad.append("FLAT (single value)")
    if float(arr[..., 3].min()) < 0.99:
        bad.append("alpha<1 (min %.2f): the converter keeps it, the game may blend or cut out - ship alpha 255" % float(arr[..., 3].min()))
    if kind == "normal":
        n = rgb * 2 - 1
        ln = np.linalg.norm(n, axis=-1)
        if abs(float(np.median(ln)) - 1.0) > 0.25:
            bad.append("normals not unit length (median %.2f)" % float(np.median(ln)))
        if float(np.median(rgb[..., 2])) < 0.55:
            bad.append("blue channel low (median %.2f): wrong convention or corrupt" % float(np.median(rgb[..., 2])))
    return bad


def texel_density(obj, mi, size):
    """Texels per metre of surface for material slot mi (median over triangles)."""
    me = obj.data
    me.calc_loop_triangles()
    uvl = me.uv_layers.active
    if uvl is None:
        return None
    mw = obj.matrix_world
    dens = []
    for tri in me.loop_triangles:
        if tri.material_index != mi:
            continue
        p = [mw @ me.vertices[v].co for v in tri.vertices]
        uv = [uvl.data[l].uv for l in tri.loops]
        w3 = (p[1] - p[0]).cross(p[2] - p[0]).length * 0.5
        w2 = abs((uv[1][0] - uv[0][0]) * (uv[2][1] - uv[0][1]) - (uv[2][0] - uv[0][0]) * (uv[1][1] - uv[0][1])) * 0.5
        if w3 > 1e-9 and w2 > 1e-12:
            dens.append(size * (w2 / w3) ** 0.5)
    return float(np.median(dens)) if dens else None


def max_influences(obj):
    return max((len([g for g in v.groups if g.weight > 1e-4]) for v in obj.data.vertices), default=0)


report = dict(label=LABEL, blend=bpy.data.filepath, meshes=[], materials=[], problems=[], notes=[], total_tris=0)
for obj in sorted((o for o in bpy.data.objects if o.type == "MESH"), key=lambda o: o.name):
    me = obj.data
    me.calc_loop_triangles()
    tris = len(me.loop_triangles)
    infl = max_influences(obj)
    report["total_tris"] += tris
    report["meshes"].append(dict(name=obj.name, tris=tris, verts=len(me.vertices), max_influences=infl, materials=[m.name for m in me.materials if m]))
    if infl > TARGETS["max_influences"]:
        report["notes"].append("%s: %d bone influences on a vertex (game limit 3; 12b_assemble_export.py limits and normalises on export)" % (obj.name, infl))
    for mi, mat in enumerate(me.materials):
        if mat is None or not mat.use_nodes:
            continue
        a_node, m_node, n_node = PL.material_images(mat)
        entry = dict(object=obj.name, material=mat.name, slot=mi)
        for kind, node in (("albedo", a_node), ("metallic_gloss_ao", m_node), ("normal", n_node)):
            if node is None or node.image is None:
                entry[kind] = None
                if kind != "normal":
                    report["problems"].append("%s/%s: no %s texture wired" % (obj.name, mat.name, kind))
                continue
            im = node.image
            arr = PL.img_to_array(im) if im.size[0] * im.size[1] <= 4096 * 4096 else None
            bad = map_health(arr, "normal" if kind == "normal" else kind) if arr is not None else ["too large to check"]
            entry[kind] = dict(image=im.name, size=list(im.size), problems=bad)
            if arr is not None and kind == "albedo":
                rgb = arr[..., :3]
                mx, mn = rgb.max(-1), rgb.min(-1)
                entry[kind]["mean_rgb"] = [round(float(x), 4) for x in rgb.reshape(-1, 3).mean(0)]
                entry[kind]["mean_saturation"] = round(float(((mx - mn) / np.maximum(mx, 1e-6)).mean()), 4)
                entry[kind]["sharpness"] = round(float(np.abs(np.diff(rgb.mean(-1), axis=1)).mean() * 100), 4)   # mean |d luminance| per texel x100
            for b in bad:
                report["problems"].append("%s/%s %s: %s" % (obj.name, mat.name, kind, b))
        if a_node is not None and a_node.image is not None:
            entry["texels_per_m"] = texel_density(obj, mi, a_node.image.size[0])
            entry["tris"] = sum(1 for t in me.loop_triangles if t.material_index == mi)
        report["materials"].append(entry)

t = report["total_tris"]
verdict = []
if t < TARGETS["tri_floor"]:
    verdict.append("LOW poly: %d tris (vanilla 5-9k) - add real geometry (collars, hardware, rounder silhouettes)" % t)
elif t > TARGETS["tri_ceiling"]:
    verdict.append("OVER budget: %d tris (ceiling 12k)" % t)
else:
    verdict.append("tri count %d is inside the vanilla range" % t)
for m in report["materials"]:
    for kind in ("albedo",):
        d = m.get(kind)
        if d and max(d["size"]) < TARGETS["tex_floor"]:
            verdict.append("%s/%s albedo %dx%d is below %d" % (m["object"], m["material"], d["size"][0], d["size"][1], TARGETS["tex_floor"]))
        elif d and max(d["size"]) < TARGETS["tex_ideal"]:
            verdict.append("%s/%s albedo %dx%d: candidate for x2" % (m["object"], m["material"], d["size"][0], d["size"][1]))
report["verdict"] = verdict
os.makedirs(os.path.dirname(OUT), exist_ok=True)
with open(OUT, "w", encoding="utf-8") as fh:
    json.dump(report, fh, indent=1)

print("AUDIT", LABEL, "tris", t, "problems", len(report["problems"]))
for m in report["meshes"]:
    print("  mesh %-22s %6d tris %6d verts  influences<=%d" % (m["name"], m["tris"], m["verts"], m["max_influences"]))
for m in report["materials"]:
    sizes = "/".join("-" if not m.get(k) else "%dx%d" % tuple(m[k]["size"]) for k in ("albedo", "metallic_gloss_ao", "normal"))
    d = m.get("texels_per_m")
    print("  mat  %-22s %-22s %-24s %s" % (m["object"], m["material"], sizes, ("%.0f texels/m" % d) if d else ""))
for v in verdict:
    print("  *", v)
for n in report["notes"]:
    print("  note", n)
for p in report["problems"]:
    print("  PROBLEM", p)
