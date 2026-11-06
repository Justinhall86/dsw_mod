"""Kitbash: graft Banshee's cannon onto the Thorvald drone where the gimbal was, skinned rigidly to the drone's own B_Canon bone.

    (first: python -c "from PIL import Image; ..." to save the Banshee DDS maps as PNG in 04_textures/banshee/)
    blender -b --python graft_canon.py -- <drone_v2.blend> <Banshee_TRUE_FBX.fbx> <out.blend> [--scale 0.44] [--at 0,0.20,0.55]

Placement is done in the VISIBLE (posed) frame, because that is what the drone looks like.  The cannon's root (the end nearest the body)
goes to --at, its barrel points toward -y like the drone's own cannon, and it is scaled by --scale.  The visible points are then
converted back into rest-pose coordinates with the inverse of the bone's skinning transform, so the armature carries them to exactly
the visible place at the rest frame and the cannon moves with B_Canon in every clip.  Verification: the evaluated graft is compared
with the intended visible points; the largest error is printed.
"""
import os
import sys

import bpy
from mathutils import Matrix, Vector

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
sys.path.insert(0, HERE)
import blender_scene as bs  # noqa: E402

a = sys.argv[sys.argv.index("--") + 1:]
drone_blend, banshee_fbx, out = os.path.abspath(a[0]), os.path.abspath(a[1]), os.path.abspath(a[2])
S = float(a[a.index("--scale") + 1]) if "--scale" in a else 0.44
AT = Vector(tuple(float(x) for x in a[a.index("--at") + 1].split(","))) if "--at" in a else Vector((0.0, 0.20, 0.55))
BONE = "B_Canon"

bpy.ops.wm.open_mainfile(filepath=drone_blend)
scn = bpy.context.scene
scn.frame_set(1)
rig = bpy.data.objects["Armature"]
drone = bpy.data.objects["CombatDrone_Smuggler"]
bpy.context.view_layer.update()

# skinning transform of the bone at rest frame: eval = P * R^-1 * rest  ->  rest = R * P^-1 * eval
R = rig.data.bones[BONE].matrix_local.copy()
P = rig.pose.bones[BONE].matrix.copy()
to_rest = R @ P.inverted()

# ---- the Banshee cannon -------------------------------------------------------------------------------------------------------------
before = set(bpy.data.objects)
bpy.ops.import_scene.fbx(filepath=banshee_fbx)
new = [o for o in bpy.data.objects if o not in before]
bmesh_obj = max([o for o in new if o.type == "MESH" and o.name.startswith("Banshee")], key=lambda o: len(o.data.vertices))
ban_rig = next(o for o in new if o.type == "ARMATURE")
names = {g.index: g.name for g in bmesh_obj.vertex_groups}
canon_v = set()
for v in bmesh_obj.data.vertices:
    if v.groups and names[max(v.groups, key=lambda g: g.weight).group] == BONE:
        canon_v.add(v.index)
print("BANSHEE canon verts", len(canon_v), "of", len(bmesh_obj.data.vertices))

import bmesh  # noqa: E402

dgb = bpy.context.evaluated_depsgraph_get()
evb = bmesh_obj.evaluated_get(dgb)
evbm = evb.to_mesh()
posed = [evb.matrix_world @ v.co for v in evbm.vertices]          # the cannon as it looks (its own rig at its frame 1)
evb.to_mesh_clear()
bm = bmesh.new()
bm.from_mesh(bmesh_obj.data)
for v, pco in zip(bm.verts, posed):
    v.co = pco
bm.verts.ensure_lookup_table()
bm.faces.ensure_lookup_table()
# keep whole connected pieces (islands) whose vertices are mostly weighted to B_Canon: a weld seam along the barrel can carry a
# second bone on some vertices, and a per-face test would drop the barrel's side walls
seen, comps = set(), []
for v0 in bm.verts:
    if v0.index in seen:
        continue
    st, mem = [v0], []
    seen.add(v0.index)
    while st:
        v = st.pop()
        mem.append(v)
        for e in v.link_edges:
            w = e.other_vert(v)
            if w.index not in seen:
                seen.add(w.index)
                st.append(w)
    comps.append(mem)
canon_piece = set()
for c in comps:
    if sum(1 for v in c if v.index in canon_v) * 2 > len(c):
        canon_piece |= {v.index for v in c}
print("BANSHEE cannon pieces: %d of %d islands" % (sum(1 for c in comps if c and c[0].index in canon_piece), len(comps)))
keep = [f for f in bm.faces if f.verts[0].index in canon_piece]
drop = [f for f in bm.faces if f not in keep]
bmesh.ops.delete(bm, geom=drop, context="FACES")
bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")
pts = [v.co.copy() for v in bm.verts]
root = Vector((0.0, 0.0, 0.0))
back = [p for p in pts if p.y > -0.25]
if back:
    root = sum(back, Vector()) / len(back)
print("BANSHEE cannon: %d faces, root (%.3f %.3f %.3f), y %.3f..%.3f" % (
    len(bm.faces), root.x, root.y, root.z, min(p.y for p in pts), max(p.y for p in pts)))

# visible target for each vertex, then back to rest-pose coordinates
intended = []
for v in bm.verts:
    e = AT + (v.co - root) * S
    intended.append(e.copy())
    v.co = (to_rest @ e.to_4d()).to_3d()
# winding: a barrel is a tube whose normals must point away from its axis (the axis runs along y through AT in the visible frame).
# The rest->visible map is a rigid rotation (det 1), so the rest normals transform with the same matrix.  If most faces point in,
# reverse the whole shell (back-face culling in the game would hide an inward tube).
VIS = P @ R.inverted()
inward = outward = 0
for f in bm.faces:
    cv = VIS @ f.calc_center_median().to_4d()
    nv = VIS.to_3x3() @ f.normal
    rad = Vector((cv.x, 0.0, cv.z - AT.z))
    if rad.length < 1e-4:
        continue
    if nv.dot(rad) > 0:
        outward += 1
    else:
        inward += 1
print("CANON winding before fix: outward %d inward %d" % (outward, inward))
if inward > outward:
    bmesh.ops.reverse_faces(bm, faces=bm.faces[:])
    print("CANON winding: reversed the whole shell")

mesh = bpy.data.meshes.new("BansheeCanon")
bm.to_mesh(mesh)
bm.free()
mesh.update()
graft = bpy.data.objects.new("BansheeCanon", mesh)
bpy.context.collection.objects.link(graft)
vg = graft.vertex_groups.new(name=BONE)
vg.add(list(range(len(mesh.vertices))), 1.0, "REPLACE")
graft.parent = rig
mod = graft.modifiers.new("Armature", "ARMATURE")
mod.object = rig

# material: Banshee's own cannon texture (PNG copies of its DDS files in 04_textures/banshee)
tex_dir = os.path.join(PROJ, "04_textures", "banshee")
wired = {"alb": os.path.join(tex_dir, "Banshee_Albedo.png"),
         "mga": os.path.join(tex_dir, "Banshee_MetallicGlossAOEmiss.png"),
         "nrm": os.path.join(tex_dir, "Banshee_Normal.png")}      # converted from DDS beforehand (see README in the script header)
mat = bpy.data.materials.new("Mat_BansheeCanon")
mat.use_nodes = True
mat.use_nodes = True
nt = mat.node_tree
bsdf = next(n for n in nt.nodes if n.type == "BSDF_PRINCIPLED")
alb_n = nt.nodes.new("ShaderNodeTexImage")
alb_n.image = bpy.data.images.load(wired["alb"], check_existing=False)
alb_n.location = (-520, 300)
nt.links.new(alb_n.outputs["Color"], bsdf.inputs["Base Color"])
nrm_n = nt.nodes.new("ShaderNodeTexImage")
nrm_n.image = bpy.data.images.load(wired["nrm"], check_existing=False)
nrm_n.image.colorspace_settings.name = "Non-Color"
nrm_n.location = (-520, -200)
nmap = nt.nodes.new("ShaderNodeNormalMap")
nmap.location = (-250, -200)
nt.links.new(nrm_n.outputs["Color"], nmap.inputs["Color"])
nt.links.new(nmap.outputs["Normal"], bsdf.inputs["Normal"])
bsdf.inputs["Roughness"].default_value = 0.5
mesh.materials.append(mat)

# remove the imported Banshee objects (its armature, mesh and the Cube helper)
for o in new:
    bpy.data.objects.remove(o, do_unlink=True)

# ---- verify: the evaluated graft must sit where it was meant to -----------------------------------------------------------------------
bpy.context.view_layer.update()
scn.frame_set(1)
dg = bpy.context.evaluated_depsgraph_get()
ev = graft.evaluated_get(dg)
evm = ev.to_mesh()
got = [ev.matrix_world @ v.co for v in evm.vertices]
ev.to_mesh_clear()
errs = [(g - e).length for g, e in zip(got, intended)]
ys = [g.y for g in got]
zs = [g.z for g in got]
print("GRAFT verts %d  max skin error %.6f m  visible y %.3f..%.3f  z %.3f..%.3f" % (len(mesh.vertices), max(errs), min(ys), max(ys), min(zs), max(zs)))
print("GRAFT visible root target", tuple(round(c, 3) for c in AT), "scale", S)

bpy.ops.wm.save_as_mainfile(filepath=out, compress=True)
print("SAVED", out)
