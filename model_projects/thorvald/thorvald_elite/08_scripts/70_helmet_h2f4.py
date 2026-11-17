"""Heavy Vanguard v3 (owner 2026-11-13): Karlin's H2f4 antenna helmet instead of the kasa hat.
    blender -b 03_blender/v2_final.blend --python 08_scripts/70_helmet_h2f4.py -- [--tag v3a] [--extra-scale 1.0] [--dz 0] [--dy 0]
 - TrooperHat removed; Kit_helmet + Kit_antenna_l/r appended from
   thorvald_hero_1/03_blender/weapons/B_foundry_warlord_hero_H2f4_two_swords.blend, moved B_HeadJ(Karlin) -> B_HeadJ(Elite)
 - fit: smallest scale (+dz/dy) with every CommandoHead vertex behind the face (skull, goggles, hood) inside the shell
   with 4 mm clearance (same search as 62_helmet_build.py); antennae follow the same transform
 - 100 % B_HeadJ; materials Mat_Helmet and Mat_Antenna (the antennae's katana material, renamed: no clash with a sword)
Writes 03_blender/v3_<tag>.blend and close-up renders in 02_progress_photos/40_v3_helmet/<tag>/."""
import bpy, sys, os, math, argparse
from mathutils import Matrix, Vector
from mathutils.bvhtree import BVHTree
ap = argparse.ArgumentParser(); ap.add_argument("--tag", default="v3a"); ap.add_argument("--extra-scale", type=float, default=1.0)
ap.add_argument("--scale", type=float, default=0.0, help="fixed helmet scale (skip the fit search); with --cull-head")
ap.add_argument("--cull-head", action="store_true", help="delete CommandoHead faces poking out of the shell above the rim (hidden hood/goggles)")
ap.add_argument("--dz", type=float, default=0.0); ap.add_argument("--dy", type=float, default=0.0)
a = ap.parse_args(sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else [])
PROJ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
KB = os.path.join(os.path.dirname(PROJ), "thorvald_hero_1", "03_blender", "weapons", "B_foundry_warlord_hero_H2f4_two_swords.blend")
OUT = os.path.join(PROJ, "02_progress_photos", "40_v3_helmet", a.tag); os.makedirs(OUT, exist_ok=True)
rig = next(o for o in bpy.data.objects if o.type == "ARMATURE")
rig.data.pose_position = "REST"; bpy.context.view_layer.update()
E_HEAD = rig.matrix_world @ rig.data.bones["B_HeadJ"].matrix_local
bpy.data.objects.remove(bpy.data.objects["TrooperHat"], do_unlink=True)
with bpy.data.libraries.load(KB, link=False) as (s, d):
    d.objects = ["Kit_helmet", "Kit_antenna_l", "Kit_antenna_r"] + [n for n in s.objects if n in ("Rig", "Armature")][:1]
krig = next(o for o in d.objects if o.type == "ARMATURE")
K_HEAD = krig.matrix_world @ krig.data.bones["B_HeadJ"].matrix_local
parts = [o for o in d.objects if o.type == "MESH"]
M = E_HEAD @ K_HEAD.inverted()
for o in parts:
    bpy.context.scene.collection.objects.link(o)
    for m in list(o.modifiers): o.modifiers.remove(m)
    o.parent = None; o.data.transform(M @ o.matrix_world); o.matrix_world = Matrix.Identity(4)
bpy.data.objects.remove(krig, do_unlink=True)
helm = next(o for o in parts if o.name.startswith("Kit_helmet"))
# skull points: CommandoHead (mask, goggles, hood) behind the face front, above the helmet's lower rim
head = bpy.data.objects["CommandoHead"]
skull = [head.matrix_world @ v.co for v in head.data.vertices]
zlo = min(v.co.z for v in helm.data.vertices)
front = min(p.y for p in skull)
back = [p for p in skull if p.y > front + 0.05 and p.z > zlo + 0.02]
co0 = {o: [v.co.copy() for v in o.data.vertices] for o in parts}
ctr = sum(co0[helm], Vector()) / len(co0[helm]); faces = [tuple(p.vertices) for p in helm.data.polygons]
def outside(s, off):
    bvh = BVHTree.FromPolygons([ctr + (c - ctr) * s + off for c in co0[helm]], faces); n = 0
    for p in back:
        hit, nrm, _, dist = bvh.find_nearest(p, 0.06)
        if hit is not None and ((p - hit).dot(nrm) > 0 or dist < 0.004): n += 1
    return n
best = None
for s in [0.85 + 0.03 * i for i in range(20)]:
    for dz in (-0.03, -0.015, 0.0, 0.015, 0.03):
        for dy in (-0.02, 0.0, 0.02):
            n = outside(s, Vector((0, dy, dz))); key = (n, s, abs(dz) + abs(dy))
            if best is None or key < best[0]: best = (key, s, Vector((0, dy, dz)))
    if best[0][0] == 0: break
(_, s, off) = best
if a.scale:
    s, off = a.scale, Vector((0, 0, 0.0))
s *= a.extra_scale; off += Vector((0, a.dy, a.dz))
for o in parts:
    for v, c in zip(o.data.vertices, co0[o]): v.co = ctr + (c - ctr) * s + off
    o.data.update()
    o.vertex_groups.clear(); o.vertex_groups.new(name="B_HeadJ").add([v.index for v in o.data.vertices], 1.0, "REPLACE")
    o.parent = rig; md = o.modifiers.new("Armature", "ARMATURE"); md.object = rig
for o in parts:
    for sl in o.material_slots:
        if "Katana" in sl.material.name: sl.material.name = "Mat_Antenna"
        elif "Helmet" in sl.material.name: sl.material.name = "Mat_Helmet"
    o.name = o.name.split(".")[0]
if a.cull_head:
    import bmesh
    bvh = BVHTree.FromPolygons([v.co.copy() for v in helm.data.vertices], [tuple(p.vertices) for p in helm.data.polygons])
    rim = min(v.co.z for v in helm.data.vertices)
    bad = set()
    for v in head.data.vertices:
        p = head.matrix_world @ v.co
        if p.z < rim + 0.012: continue
        hit, nrm, _, dist = bvh.find_nearest(p, 0.08)
        if hit is not None and ((p - hit).dot(nrm) > -0.002): bad.add(v.index)
    bm = bmesh.new(); bm.from_mesh(head.data)
    kill = [f for f in bm.faces if any(v.index in bad for v in f.verts)]
    bmesh.ops.delete(bm, geom=kill, context="FACES"); bm.to_mesh(head.data); bm.free()
    print("CULL head: %d verts poked out, %d faces removed" % (len(bad), len(kill)))
print("FIT scale %.2f offset %s, %d of %d skull points outside; helmet z %.3f-%.3f" % (
    s, tuple(round(x, 3) for x in off), best[0][0], len(back), min(v.co.z for v in helm.data.vertices), max(v.co.z for v in helm.data.vertices)))
try: bpy.ops.file.pack_all()
except RuntimeError as e: print("PACK WARNING", str(e)[:150])
blend = os.path.join(PROJ, "03_blender", "v3_%s.blend" % a.tag)
bpy.ops.wm.save_as_mainfile(filepath=blend); print("SAVED", blend)
# renders: head close-ups + full body, rest pose
sc = bpy.context.scene; sc.render.engine = "BLENDER_EEVEE"; sc.render.film_transparent = False
sc.view_settings.view_transform = "Standard"
sc.world = bpy.data.worlds.new("W"); sc.world.color = (0.62, 0.62, 0.64)
for rot, e in (((0.7, 0.1, 0.5), 4.0), ((1.1, 0, -2.6), 2.0), ((0.9, 0, 2.6), 1.2)):
    L = bpy.data.objects.new("L", bpy.data.lights.new("L", "SUN")); L.data.energy = e; L.rotation_euler = rot; sc.collection.objects.link(L)
cam = bpy.data.objects.new("C", bpy.data.cameras.new("C")); cam.data.type = "ORTHO"; sc.collection.objects.link(cam); sc.camera = cam
hc = E_HEAD.translation + Vector((0, 0, 0.08))
for name, d_, sz, tgt, res in (("head_front", (0, -1, 0.05), 0.75, hc, (600, 600)), ("head_tq", (0.7, -0.7, 0.15), 0.75, hc, (600, 600)),
                               ("head_side", (1, 0, 0.05), 0.75, hc, (600, 600)), ("head_back", (0, 1, 0.1), 0.75, hc, (600, 600)),
                               ("body_tq", (0.7, -0.7, 0.2), 2.6, Vector((0, 0, 1.15)), (600, 800))):
    sc.render.resolution_x, sc.render.resolution_y = res; cam.data.ortho_scale = sz
    dv = Vector(d_).normalized(); cam.location = tgt + dv * 6; cam.rotation_euler = (tgt - cam.location).to_track_quat("-Z", "Y").to_euler()
    sc.render.filepath = os.path.join(OUT, name + ".png"); bpy.ops.render.render(write_still=True)
print("RENDERS", OUT)
