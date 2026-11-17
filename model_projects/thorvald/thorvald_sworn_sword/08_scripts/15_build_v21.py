"""Sworn Sword 2.1 (owner 2026-11-13): 2.0e + the S9 domed helmet, horsehair plume and helmet badge; 2.0e's Karlin half-mask kept
(no menpo).  blender -b 03_blender/SwornSword2_2.0e.blend --python 08_scripts/15_build_v21.py
Same body/head in S9 and 2.0e (Trooper v13), so the parts drop in without a refit. Helmet + tail get their own material
Mat_SwornHelm (S9 atlas, rivets removed by 14_helm_tex_v21.py) so 2.0e's Mat_SwornKit atlas stays as it is; the badge's
Mat_Duncan/Mat_Gurney are remapped to 2.0e's own. Writes 03_blender/SwornSword2_2.1.blend + renders 02_progress_photos/40_v21/."""
import bpy, os
from mathutils import Vector
P = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
S9 = os.path.join(P, "03_blender", "SwornSword_S9.blend")
TEX = os.path.join(P, "04_textures", "v2", "2.1")
OUT = os.path.join(P, "02_progress_photos", "40_v21"); os.makedirs(OUT, exist_ok=True)
rig = next(o for o in bpy.data.objects if o.type == "ARMATURE")
before = set(bpy.data.materials)
with bpy.data.libraries.load(S9, link=False) as (s, d):
    d.objects = ["SwornHelmet", "SwornTail", "SwornBadge"]
helm_mat = None
for o in d.objects:
    bpy.context.scene.collection.objects.link(o)
    mw = o.matrix_world.copy(); o.parent = rig; o.matrix_world = mw
    for m in o.modifiers:
        if m.type == "ARMATURE": m.object = rig
    for sl in o.material_slots:
        base = sl.material.name.split(".")[0]
        if base == "Mat_SwornKit":
            if helm_mat is None:
                helm_mat = sl.material; helm_mat.name = "Mat_SwornHelm"
                for n in helm_mat.node_tree.nodes:
                    if n.type == "TEX_IMAGE" and n.image:
                        kind = next((k for k in ("MetallicGlossAO", "Normal", "Albedo") if k in n.image.name or k in n.image.filepath), None)
                        if kind:
                            img = bpy.data.images.load(os.path.join(TEX, "SwornHelm_%s.png" % kind))
                            if kind != "Albedo": img.colorspace_settings.name = "Non-Color"
                            n.image = img
                        print("TEX", n.image.name, kind)
            sl.material = helm_mat
        elif sl.material not in before and base in bpy.data.materials and bpy.data.materials[base] in before:
            sl.material = bpy.data.materials[base]
    print("ADDED", o.name, [sl.material.name for sl in o.material_slots])
for m in [m for m in bpy.data.materials if m.users == 0]: bpy.data.materials.remove(m)
try: bpy.ops.file.pack_all()
except RuntimeError as e: print("PACK WARNING", str(e)[:150])
blend = os.path.join(P, "03_blender", "SwornSword2_2.1.blend"); bpy.ops.wm.save_as_mainfile(filepath=blend); print("SAVED", blend)
sc = bpy.context.scene; sc.render.engine = "BLENDER_EEVEE"; sc.view_settings.view_transform = "Standard"
sc.world = bpy.data.worlds.new("W"); sc.world.color = (0.62, 0.62, 0.64)
for rot, e in (((0.7, 0.1, 0.5), 4.0), ((1.1, 0, -2.6), 2.0), ((0.9, 0, 2.6), 1.2)):
    L = bpy.data.objects.new("L", bpy.data.lights.new("L", "SUN")); L.data.energy = e; L.rotation_euler = rot; sc.collection.objects.link(L)
cam = bpy.data.objects.new("C", bpy.data.cameras.new("C")); cam.data.type = "ORTHO"; sc.collection.objects.link(cam); sc.camera = cam
rig.data.pose_position = "REST"; bpy.context.view_layer.update()
hc = (rig.matrix_world @ rig.data.bones["B_HeadJ"].matrix_local).translation + Vector((0, 0, 0.1))
for name, d_, sz, tgt, res in (("head_front", (0, -1, 0.05), 0.8, hc, (600, 600)), ("head_tq", (0.7, -0.7, 0.15), 0.8, hc, (600, 600)),
                               ("head_side", (1, 0, 0.05), 0.8, hc, (600, 600)), ("head_back", (0, 1, 0.1), 0.8, hc, (600, 600)),
                               ("body_tq", (0.7, -0.7, 0.2), 2.6, Vector((0, 0, 1.15)), (600, 800))):
    sc.render.resolution_x, sc.render.resolution_y = res; cam.data.ortho_scale = sz
    dv = Vector(d_).normalized(); cam.location = tgt + dv * 6; cam.rotation_euler = (tgt - cam.location).to_track_quat("-Z", "Y").to_euler()
    sc.render.filepath = os.path.join(OUT, name + ".png"); bpy.ops.render.render(write_still=True)
