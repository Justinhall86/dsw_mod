"""Survey a vehicle: import the FBX and list every connected island with its world bounds.

    blender -b --python survey_islands.py -- <model.fbx|.blend> [--min-verts 8] [--out json]

Used to pick graft donors out of a vanilla model before touching the kitbash target.
"""
import json
import os
import sys
import tempfile

import bmesh
import bpy
from mathutils import Vector

HMD_MODELS = r"C:\Users\justi\Python\dsw_mod\HMD_toolkit\HMD_toolkit\Models"
sys.path.insert(0, HMD_MODELS)

a = sys.argv[sys.argv.index("--") + 1:]
src = os.path.abspath(a[0])
min_verts = int(a[a.index("--min-verts") + 1]) if "--min-verts" in a else 8
out = a[a.index("--out") + 1] if "--out" in a else None

bpy.ops.wm.read_factory_settings(use_empty=True)
if src.lower().endswith(".blend"):
    bpy.ops.wm.open_mainfile(filepath=src)
else:
    with open(src, "rb") as fh:
        head = fh.read(3)
    if head == b"HMD":
        import hmd2fbx
        tmp = tempfile.mktemp(suffix=".fbx")
        hmd2fbx.convert(src, tmp, verbose=False)
        src = tmp
    bpy.ops.import_scene.fbx(filepath=src)
bpy.context.view_layer.update()

meshes = [o for o in bpy.data.objects if o.type == "MESH"]
if not meshes:
    raise SystemExit("no mesh imported")

# bring everything into world space so donor bounds are directly comparable to the target ship
rows = []
for ob in meshes:
    mw = ob.matrix_world
    bm = bmesh.new()
    bm.from_mesh(ob.data)
    bm.verts.ensure_lookup_table()
    seen = set()
    comps = []
    for v in bm.verts:
        if v.index in seen:
            continue
        stack = [v]
        comp = []
        seen.add(v.index)
        while stack:
            cur = stack.pop()
            comp.append(cur)
            for e in cur.link_edges:
                o = e.other_vert(cur)
                if o.index not in seen:
                    seen.add(o.index)
                    stack.append(o)
        comps.append(comp)
    for comp in comps:
        if len(comp) < min_verts:
            continue
        pts = [mw @ vert.co for vert in comp]
        lo = Vector((min(p.x for p in pts), min(p.y for p in pts), min(p.z for p in pts)))
        hi = Vector((max(p.x for p in pts), max(p.y for p in pts), max(p.z for p in pts)))
        cen = (lo + hi) / 2
        size = hi - lo
        # dominant material of the island
        faces = set()
        for vert in comp:
            for f in vert.link_faces:
                faces.add(f.index)
        mats = {}
        for f in bm.faces:
            if f.index in faces:
                mats[f.material_index] = mats.get(f.material_index, 0) + 1
        best = max(mats, key=mats.get) if mats else -1
        mname = ob.material_slots[best].name if 0 <= best < len(ob.material_slots) else "?"
        comps_rows = {"verts": len(comp),
                      "cx": round(cen.x, 2), "cy": round(cen.y, 2), "cz": round(cen.z, 2),
                      "sx": round(size.x, 2), "sy": round(size.y, 2), "sz": round(size.z, 2),
                      "mat": mname}
        rows.append(comps_rows)
    bm.free()

rows.sort(key=lambda r: -r["verts"])
print("MODEL", os.path.basename(src), "meshes", [o.name for o in meshes])
print("%4s %6s  %7s %7s %7s  %6s %6s %6s  %s" % ("#", "verts", "cx", "cy", "cz", "sx", "sy", "sz", "mat"))
for i, r in enumerate(rows):
    print("%4d %6d  %7.2f %7.2f %7.2f  %6.2f %6.2f %6.2f  %s"
          % (i, r["verts"], r["cx"], r["cy"], r["cz"], r["sx"], r["sy"], r["sz"], r["mat"]))
print("TOTAL islands", len(rows))

if out:
    with open(os.path.abspath(out), "w", encoding="utf-8") as fh:
        json.dump({"source": src, "islands": rows}, fh, indent=1)
    print("WROTE", out)
