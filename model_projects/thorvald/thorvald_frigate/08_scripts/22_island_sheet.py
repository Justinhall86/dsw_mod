"""Split a donor into connected islands (parts) and render each part alone, three-quarter view,
with its index, face count, size and bounding box. Output: <outdir>/<donor>_NN.png + <donor>_islands.json.

    blender -b --factory-startup --python 22_island_sheet.py -- <donor> <outdir> [--min 40] [--max 14] [--px 360]

The bbox in the json is in the donor's baked space, so it can be pasted into a graft's box_abs
(use `strict`). Islands fused to the main body come out as one big island: use 30_grid_survey for those.
"""
import importlib, json, os, sys
import bpy, bmesh
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
B = importlib.import_module("20_build_variant")
bs, pw = B.bs, B.pw

argv = sys.argv[sys.argv.index("--") + 1:]
key, outdir = argv[0], os.path.abspath(argv[1])
opt = lambda n, d: type(d)(argv[argv.index(n) + 1]) if n in argv else d
MIN, MAXN, PX = opt("--min", 40), opt("--max", 14), opt("--px", 360)
os.makedirs(outdir, exist_ok=True)

bs.reset_scene()
rel, stem = B.donor(key)
objs = B.import_and_flatten(rel, "d")
bpy.context.view_layer.update()
mat = B.make_material("Mat_d", B.texture_paths(stem), "steel")
B.apply_material(objs, mat)
pw.soften_world()
pw.gamelike(mat)

# collect islands as lists of world-space triangles (one mesh per island)
islands = []
for o in objs:
    bm = bmesh.new(); bm.from_mesh(o.data); bm.verts.ensure_lookup_table()
    seen = set()
    for v0 in bm.verts:
        if v0.index in seen or not v0.link_faces:
            continue
        stack, mem = [v0], []
        seen.add(v0.index)
        while stack:
            cur = stack.pop(); mem.append(cur)
            for e in cur.link_edges:
                ov = e.other_vert(cur)
                if ov.index not in seen:
                    seen.add(ov.index); stack.append(ov)
        faces = {f for v in mem for f in v.link_faces}
        if len(faces) >= MIN:
            islands.append((o, [f.index for f in faces]))
    bm.free()
islands.sort(key=lambda t: -len(t[1]))
islands = islands[:MAXN]

meta = []
for n, (o, fidx) in enumerate(islands):
    bm = bmesh.new(); bm.from_mesh(o.data); bm.faces.ensure_lookup_table()
    keep = set(fidx)
    bmesh.ops.delete(bm, geom=[f for f in bm.faces if f.index not in keep], context="FACES")
    for v in [v for v in bm.verts if not v.link_faces]:
        bm.verts.remove(v)
    me = bpy.data.meshes.new("isl%d" % n); bm.to_mesh(me); bm.free()
    ob = bpy.data.objects.new("isl%d" % n, me)
    bpy.context.scene.collection.objects.link(ob)
    ob.data.materials.append(mat)
    for other in objs:
        other.hide_render = True
    mn, mx = B.bounds([ob])
    c, sz = (mn + mx) / 2, mx - mn
    span = max(sz.x, sz.y, sz.z)
    bs.setup_render(PX, PX)
    bs.setup_world(strength=pw.WORLD_STRENGTH, color=(0.62, 0.62, 0.64))
    bs.setup_lights()
    cam = bs.setup_camera(target=c, ortho_scale=span * 1.35, distance=span * 3)
    cam.location = c + Vector((0.8, -0.8, 0.5)).normalized() * span * 3
    cam.rotation_euler = (c - cam.location).to_track_quat("-Z", "Y").to_euler()
    bs.render_to(os.path.join(outdir, "%s_%02d.png" % (key, n)), cam)
    meta.append({"i": n, "faces": len(fidx), "size": [round(v, 2) for v in sz],
                 "box_abs": [round(v, 3) for v in (mn.x, mx.x, mn.y, mx.y, mn.z, mx.z)]})
    bpy.data.objects.remove(ob, do_unlink=True)
json.dump(meta, open(os.path.join(outdir, key + "_islands.json"), "w"), indent=1)
print("ISLANDS_OK", key, len(meta))
