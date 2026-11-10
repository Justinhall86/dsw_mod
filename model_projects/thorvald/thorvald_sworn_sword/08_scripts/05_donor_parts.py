"""Every head-bone component of one donor rendered alone (front + side), textured with the donor albedo, with its id.

    blender -b --factory-startup --python 05_donor_parts.py -- <Donor> <out_dir>
"""
import os
import sys

import bmesh
import bpy
from mathutils import Matrix, Vector

sys.path.insert(0, r"D:\dsw_mod\.claude\skills\dsw-part-kitbash\scripts")
import dsw_parts as P  # noqa: E402

DONOR, OUT = sys.argv[sys.argv.index("--") + 1:][:2]
OUT = os.path.abspath(OUT)
os.makedirs(OUT, exist_ok=True)
DON = r"D:\dsw_mod\model_projects\thorvald\thorvald_hero_1\05_fbx_export\helmet_donors"
for o in list(bpy.data.objects):
    bpy.data.objects.remove(o, do_unlink=True)
bpy.ops.import_scene.fbx(filepath=os.path.join(DON, "%s_TRUE_FBX.fbx" % DONOR))
arm = next(o for o in bpy.data.objects if o.type == "ARMATURE")
hb = arm.matrix_world @ arm.data.bones["B_HeadJ"].matrix_local
dm = [o for o in bpy.data.objects if o.type == "MESH"]
for o in bpy.context.view_layer.objects:
    o.select_set(o in dm)
bpy.context.view_layer.objects.active = dm[0]
if len(dm) > 1:
    bpy.ops.object.join()
h = bpy.context.view_layer.objects.active
for m in list(h.modifiers):
    h.modifiers.remove(m)
h.parent = None
h.data.transform(h.matrix_world)
h.matrix_world = Matrix.Identity(4)
gn = {g.index: g.name for g in h.vertex_groups}
dom = {v.index: gn[max(v.groups, key=lambda g: g.weight).group] for v in h.data.vertices if v.groups}
bm = bmesh.new()
bm.from_mesh(h.data)
bmesh.ops.delete(bm, geom=[f for f in bm.faces if not all(dom.get(v.index) == "B_HeadJ" for v in f.verts)],
                 context="FACES")
bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")
bm.to_mesh(h.data)
bm.free()
h.data.transform(Matrix.Translation(-hb.translation))
bpy.data.objects.remove(arm, do_unlink=True)
# albedo from the donor folder
alb = [f for f in os.listdir(DON) if f.startswith(DONOR + "__") and f.endswith("_Albedo.png")]
mat = bpy.data.materials.new("donor")
mat.use_nodes = True
if alb:
    t = mat.node_tree.nodes.new("ShaderNodeTexImage")
    t.image = bpy.data.images.load(os.path.join(DON, alb[0]))
    mat.node_tree.links.new(t.outputs["Color"], mat.node_tree.nodes["Principled BSDF"].inputs["Base Color"])
h.data.materials.clear()
h.data.materials.append(mat)
comps = [c for c in P.components(h) if len(c) >= 4]
sc = bpy.context.scene
P.setup_scene(sc, 360)
cam = bpy.data.objects.new("C", bpy.data.cameras.new("C"))
cam.data.type = "ORTHO"
cam.data.ortho_scale = 0.32
sc.collection.objects.link(cam)
sc.camera = cam
c = Vector((0, -0.02, 0.06))
for k, idx in enumerate(comps):
    info = P.comp_info(h, idx)
    print("COMP %d n=%d lo=%s hi=%s" % (k, len(idx), [round(x, 3) for x in info["lo"]],
                                       [round(x, 3) for x in info["hi"]]))
    ob = bpy.data.objects.new("c%d" % k, h.data.copy())
    sc.collection.objects.link(ob)
    P.delete_verts(ob, idx, invert=True)
    h.hide_render = True
    for vname, d in (("front", (0, -1, 0.05)), ("side", (1, -0.3, 0.05))):
        cam.location = c + Vector(d).normalized() * 3
        cam.rotation_euler = (c - cam.location).to_track_quat("-Z", "Y").to_euler()
        sc.render.filepath = os.path.join(OUT, "%s_c%02d_%s.png" % (DONOR, k, vname))
        bpy.ops.render.render(write_still=True)
    bpy.data.objects.remove(ob, do_unlink=True)
h.hide_render = False
for vname, d in (("all_front", (0, -1, 0.05)), ("all_side", (1, -0.3, 0.05))):
    cam.location = c + Vector(d).normalized() * 3
    cam.rotation_euler = (c - cam.location).to_track_quat("-Z", "Y").to_euler()
    sc.render.filepath = os.path.join(OUT, "%s_%s.png" % (DONOR, vname))
    bpy.ops.render.render(write_still=True)
print("DONE", len(comps))
