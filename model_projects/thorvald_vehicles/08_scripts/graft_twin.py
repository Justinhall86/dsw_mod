"""Mount TWO Banshee cannons on top of the drone's wings, near the body, each skinned rigidly to its own wing bone.

    blender -b --python graft_twin.py -- <drone_nogimbal.blend> <Banshee_TRUE_FBX.fbx> <out.blend> [--scale 0.8] [--x 0.42] [--albedo path.png]

Placement is measured, not guessed: for each wing the script reads the posed (visible) top surface of the wing in a band around |x| = --x,
sits the cannon on it (its underside slightly sunk in), points the barrel forward (-y) and lets the muzzle stand a little past the leading
edge.  Visible points are converted to rest-pose coordinates through the wing bone's skinning transform (rest = R * P^-1 * visible), so
each cannon follows its wing in every clip.  The cannon on the -x side is the mirror image (x flipped, faces reversed).

Also writes 04_textures/banshee/cannon_uv.json (the cannon's UV polygons) for the recolour step.
"""
import json
import os
import sys

import bmesh
import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
sys.path.insert(0, HERE)

a = sys.argv[sys.argv.index("--") + 1:]
drone_blend, banshee_fbx, out = os.path.abspath(a[0]), os.path.abspath(a[1]), os.path.abspath(a[2])
S = float(a[a.index("--scale") + 1]) if "--scale" in a else 0.8
XC = float(a[a.index("--x") + 1]) if "--x" in a else 0.42
TEX = os.path.join(PROJ, "04_textures", "banshee")
ALB = os.path.abspath(a[a.index("--albedo") + 1]) if "--albedo" in a else os.path.join(TEX, "Banshee_Albedo.png")

bpy.ops.wm.open_mainfile(filepath=drone_blend)
scn = bpy.context.scene
scn.frame_set(1)
rig = bpy.data.objects["Armature"]
drone = bpy.data.objects["CombatDrone_Smuggler"]
bpy.context.view_layer.update()


def posed(obj):
    dg = bpy.context.evaluated_depsgraph_get()
    ev = obj.evaluated_get(dg)
    me = ev.to_mesh()
    pts = [ev.matrix_world @ v.co for v in me.vertices]
    ev.to_mesh_clear()
    return pts


# ---- the drone's wings, as seen --------------------------------------------------------------------------------------------------
dnames = {g.index: g.name for g in drone.vertex_groups}
dom = {}
for v in drone.data.vertices:
    if v.groups:
        dom[v.index] = dnames[max(v.groups, key=lambda g: g.weight).group]
dpts = posed(drone)
wings = {}
for bone in ("B_WingL", "B_WingR"):
    pts = [dpts[i] for i, d in dom.items() if d == bone]
    side = 1.0 if sum(p.x for p in pts) / len(pts) > 0 else -1.0
    band = [p for p in pts if abs(abs(p.x) - XC) < 0.08]
    wings[bone] = dict(side=side, top=max(p.z for p in band), ymin=min(p.y for p in band), ymax=max(p.y for p in band))
    print("WING %s side %+d  band top z %.3f  y %.3f..%.3f" % (bone, side, wings[bone]["top"], wings[bone]["ymin"], wings[bone]["ymax"]))

# ---- the Banshee cannon (posed), centred on its root ---------------------------------------------------------------------------------
before = set(bpy.data.objects)
bpy.ops.import_scene.fbx(filepath=banshee_fbx)
new = [o for o in bpy.data.objects if o not in before]
ban = max([o for o in new if o.type == "MESH" and o.name.startswith("Banshee")], key=lambda o: len(o.data.vertices))
bnames = {g.index: g.name for g in ban.vertex_groups}
canon_v = {v.index for v in ban.data.vertices if v.groups and bnames[max(v.groups, key=lambda g: g.weight).group] == "B_Canon"}
bpts = posed(ban)
bm0 = bmesh.new()
bm0.from_mesh(ban.data)
for v, p in zip(bm0.verts, bpts):
    v.co = p
seen, comps = set(), []
for v0 in bm0.verts:
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
piece = set()
for c in comps:
    if sum(1 for v in c if v.index in canon_v) * 2 > len(c):
        piece |= {v.index for v in c}
bmesh.ops.delete(bm0, geom=[f for f in bm0.faces if f.verts[0].index not in piece], context="FACES")
bmesh.ops.delete(bm0, geom=[v for v in bm0.verts if not v.link_faces], context="VERTS")
cv = [v.co.copy() for v in bm0.verts]
root = sum([p for p in cv if p.y > -0.25], Vector()) / max(1, len([p for p in cv if p.y > -0.25]))
for v in bm0.verts:
    v.co = (v.co - root) * S                                  # root at the origin, barrel toward -y, scaled
cx = [v.co.x for v in bm0.verts]
cy = [v.co.y for v in bm0.verts]
cz = [v.co.z for v in bm0.verts]
length, half_h = -min(cy), (max(cz) - min(cz)) / 2
print("CANNON x %.3f..%.3f  y %.3f..%.3f  z %.3f..%.3f  (length %.3f m)" % (min(cx), max(cx), min(cy), max(cy), min(cz), max(cz), length))

# UV polygons for the recolour step
uvl = bm0.loops.layers.uv.active
polys = [[(lp[uvl].uv.x, lp[uvl].uv.y) for lp in f.loops] for f in bm0.faces]
json.dump(polys, open(os.path.join(TEX, "cannon_uv.json"), "w"))
print("UV polygons", len(polys))

for o in new:
    bpy.data.objects.remove(o, do_unlink=True)

# ---- material (clean version if the recolour has run) -----------------------------------------------------------------------------------
mat = bpy.data.materials.new("Mat_ThorvaldCannon")
mat.use_nodes = True
nt = mat.node_tree
bsdf = next(n for n in nt.nodes if n.type == "BSDF_PRINCIPLED")
alb = nt.nodes.new("ShaderNodeTexImage")
alb.image = bpy.data.images.load(ALB, check_existing=False)
alb.location = (-520, 300)
nt.links.new(alb.outputs["Color"], bsdf.inputs["Base Color"])
nrm = nt.nodes.new("ShaderNodeTexImage")
nrm.image = bpy.data.images.load(os.path.join(TEX, "Banshee_Normal.png"), check_existing=False)
nrm.image.colorspace_settings.name = "Non-Color"
nrm.location = (-520, -200)
nm = nt.nodes.new("ShaderNodeNormalMap")
nm.location = (-250, -200)
nt.links.new(nrm.outputs["Color"], nm.inputs["Color"])
nt.links.new(nm.outputs["Normal"], bsdf.inputs["Normal"])
bsdf.inputs["Roughness"].default_value = 0.45
print("ALBEDO", ALB)

# ---- two cannons -------------------------------------------------------------------------------------------------------------------------
errs_all = []
for bone, w in wings.items():
    side = w["side"]
    R = rig.data.bones[bone].matrix_local.copy()
    P = rig.pose.bones[bone].matrix.copy()
    to_rest = R @ P.inverted()
    muzzle_y = w["ymin"] - 0.10                      # the muzzle stands a little past the leading edge
    at = Vector((side * XC, muzzle_y + length, w["top"] + half_h * 0.85))    # root of the cannon (rear), centre line height
    bm = bm0.copy()
    intended = []
    for v in bm.verts:
        p = Vector((v.co.x * side, v.co.y, v.co.z))  # the -x cannon is a mirror image
        e = at + p
        intended.append(e)
        v.co = (to_rest @ e.to_4d()).to_3d()
    if side < 0:
        bmesh.ops.reverse_faces(bm, faces=bm.faces[:])
    mesh = bpy.data.meshes.new("Cannon_" + bone)
    bm.to_mesh(mesh)
    bm.free()
    mesh.update()
    mesh.materials.append(mat)
    ob = bpy.data.objects.new("Cannon_" + bone, mesh)
    bpy.context.collection.objects.link(ob)
    vg = ob.vertex_groups.new(name=bone)
    vg.add(list(range(len(mesh.vertices))), 1.0, "REPLACE")
    ob.parent = rig
    md = ob.modifiers.new("Armature", "ARMATURE")
    md.object = rig
    bpy.context.view_layer.update()
    got = posed(ob)
    errs = [(g - e).length for g, e in zip(got, intended)]
    errs_all.append(max(errs))
    print("CANNON %s side %+d at (%.3f %.3f %.3f)  wing top %.3f  visible z %.3f..%.3f  y %.3f..%.3f  max skin error %.6f" % (
        bone, side, at.x, at.y, at.z, w["top"], min(g.z for g in got), max(g.z for g in got), min(g.y for g in got), max(g.y for g in got), max(errs)))
bm0.free()
bpy.ops.wm.save_as_mainfile(filepath=out, compress=True)
print("SAVED", out, "max skin error", max(errs_all))
