"""Pose a helmet-study build in the Elite's FightIdle clip and render it exactly like the ground-unit palette sheet
(thorvald_recolours 06_ground_v6: ortho camera fitted to the unit, three suns, albedo only, roughness 0.75), so it can stand in the lineup.
    blender -b ../../03_blender/helmet_study/wd_<TAG>.blend --python wd_lineup.py -- <out prefix>
Writes <prefix>_front.png, _tq.png, _back.png (transparent background).
The clip comes from thorvald_recolours/02_progress_photos/06_ground_v6/Male01_ThorvaldElite_idle.fbx (hmdanim2fbx output)."""
import os, sys, bpy
from mathutils import Vector
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import paths as P

ob = sys.argv[sys.argv.index("--") + 1]
IDLE = P.REPO + "/model_projects/thorvald/thorvald_recolours/02_progress_photos/06_ground_v6/Male01_ThorvaldElite_idle.fbx"
sc = bpy.context.scene
arm = next(o for o in bpy.data.objects if o.type == "ARMATURE" and o.data.bones.get("B_HeadJ"))
arm.data.pose_position = "POSE"
before = set(bpy.data.objects)
bpy.ops.import_scene.fbx(filepath=IDLE)
new = [o for o in bpy.data.objects if o not in before]
src = next(o for o in new if o.type == "ARMATURE")
act = src.animation_data.action
# the idle armature may sit at another world transform; copy local pose per bone for the first frame
f0 = int(act.frame_range[0])
sc.frame_set(f0)
bpy.context.view_layer.update()
for pb in arm.pose.bones:
    sb = src.pose.bones.get(pb.name)
    if sb:
        pb.matrix_basis = sb.matrix_basis.copy()
for o in new:
    bpy.data.objects.remove(o, do_unlink=True)
bpy.context.view_layer.update()
meshes = [o for o in bpy.data.objects if o.type == "MESH" and not o.hide_render]
for o in bpy.data.objects:
    if o.type in ("LIGHT", "CAMERA"):
        bpy.data.objects.remove(o, do_unlink=True)
for mesh in meshes:
    for s in mesh.material_slots:
        m = s.material
        if not m or not m.node_tree:
            continue
        nt = m.node_tree
        img = None
        col = None
        for n in nt.nodes:
            if n.type == "BSDF_PRINCIPLED":
                bc = n.inputs["Base Color"]
                col = tuple(bc.default_value)
                if bc.links and bc.links[0].from_node.type == "TEX_IMAGE":
                    img = bc.links[0].from_node.image
        nt.nodes.clear()
        b = nt.nodes.new("ShaderNodeBsdfPrincipled")
        o = nt.nodes.new("ShaderNodeOutputMaterial")
        nt.links.new(b.outputs[0], o.inputs[0])
        if col and not img:
            b.inputs["Base Color"].default_value = col
        if img:
            t = nt.nodes.new("ShaderNodeTexImage")
            t.image = img
            nt.links.new(t.outputs["Color"], b.inputs["Base Color"])
        b.inputs["Roughness"].default_value = 0.75
sc.render.engine = "BLENDER_EEVEE"
sc.render.resolution_x, sc.render.resolution_y = 500, 650
sc.render.film_transparent = True
sc.view_settings.view_transform = "Standard"
for rot, e in (((0.7, 0.1, 0.5), 4.0), ((1.1, 0, -2.6), 2.0), ((0.9, 0, 2.6), 1.2)):
    L = bpy.data.objects.new("L", bpy.data.lights.new("L", "SUN"))
    L.data.energy = e
    L.rotation_euler = rot
    sc.collection.objects.link(L)
sc.world = bpy.data.worlds.new("W")
sc.world.color = (0.6, 0.6, 0.62)
cam = bpy.data.objects.new("C", bpy.data.cameras.new("C"))
cam.data.type = "ORTHO"
sc.collection.objects.link(cam)
sc.camera = cam
dg = bpy.context.evaluated_depsgraph_get()
ps = []
for mesh in meshes:
    e = mesh.evaluated_get(dg)
    ps += [e.matrix_world @ v.co for v in e.to_mesh().vertices]
    e.to_mesh_clear()
lo = Vector((min(p.x for p in ps), min(p.y for p in ps), min(p.z for p in ps)))
hi = Vector((max(p.x for p in ps), max(p.y for p in ps), max(p.z for p in ps)))
c = (lo + hi) / 2
cam.data.ortho_scale = max(hi.z - lo.z, hi.x - lo.x, hi.y - lo.y) * 1.08
LPAD = float(os.environ.get("LPAD", "0"))
if LPAD:   # samurai pass: fit to the body only (crest/horns/halo left out) and leave LPAD x room so tall crests fit; feet 4 % above the bottom
    ps2 = []
    for mesh in meshes:
        if mesh.name.startswith(("Kit_antenna", "Kit_halo")):
            continue
        e = mesh.evaluated_get(dg)
        ps2 += [e.matrix_world @ v.co for v in e.to_mesh().vertices]
        e.to_mesh_clear()
    lo2 = Vector((min(p.x for p in ps2), min(p.y for p in ps2), min(p.z for p in ps2)))
    hi2 = Vector((max(p.x for p in ps2), max(p.y for p in ps2), max(p.z for p in ps2)))
    h2 = max(hi2.z - lo2.z, hi2.x - lo2.x, hi2.y - lo2.y)
    cam.data.ortho_scale = h2 * LPAD
    c = Vector(((lo2.x + hi2.x) / 2, (lo2.y + hi2.y) / 2, lo2.z - 0.04 * h2 + h2 * LPAD / 2))
hb = arm.pose.bones["B_HeadJ"]
fwd = 1 if (arm.matrix_world @ hb.tail - arm.matrix_world @ hb.head).y > 0 else -1
for v, dv in (("front", (0, -fwd, 0.1)), ("tq", (0.75, -0.75 * fwd, 0.25)), ("back", (0, fwd, 0.1))):
    d = Vector(dv).normalized()
    cam.location = c + d * 8
    cam.rotation_euler = (c - cam.location).to_track_quat("-Z", "Y").to_euler()
    sc.render.filepath = "%s_%s.png" % (ob, v)
    bpy.ops.render.render(write_still=True)
print("OK", ob, "height %.2f" % (hi.z - lo.z))
