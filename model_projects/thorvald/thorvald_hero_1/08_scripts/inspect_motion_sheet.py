"""Diagnostic motion sheet: every frame (or every Nth) of one action, each mesh object in its own flat colour
(Workbench), so clipping / popping between kitbashed parts is easy to spot. Two steps like 31_make_two_swords_gif.py:

  blender -b --factory-startup --python inspect_motion_sheet.py -- <blend> <action> <out_dir> [step] [view] [cx,cy,cz] [ortho] [res]
  python inspect_motion_sheet.py --assemble <out_dir> [cols]
"""
import os
import sys

if "--assemble" in sys.argv:
    from PIL import Image, ImageDraw
    d = sys.argv[sys.argv.index("--assemble") + 1]
    cols = int(sys.argv[sys.argv.index("--assemble") + 2]) if len(sys.argv) > sys.argv.index("--assemble") + 2 else 8
    fs = sorted(f for f in os.listdir(d) if f.startswith("m_") and f.endswith(".png"))
    ims = [Image.open(os.path.join(d, f)).convert("RGB") for f in fs]
    w, h = ims[0].size
    sheet = Image.new("RGB", (w * cols, h * ((len(ims) + cols - 1) // cols)), (40, 40, 40))
    for i, (f, im) in enumerate(zip(fs, ims)):
        ImageDraw.Draw(im).text((6, 4), f[2:-4], fill=(255, 255, 255))
        sheet.paste(im, ((i % cols) * w, (i // cols) * h))
    sheet.save(os.path.join(d, "sheet.png"))
    print("saved", os.path.join(d, "sheet.png"))
    raise SystemExit
import colorsys

import bpy
from mathutils import Vector

a = sys.argv[sys.argv.index("--") + 1:]
blend, action, out = a[0], a[1], a[2]
step = int(a[3]) if len(a) > 3 else 1
view = a[4] if len(a) > 4 else "tq"
c = Vector([float(v) for v in a[5].split(",")]) if len(a) > 5 else Vector((0, 0, 1.1))
ortho = float(a[6]) if len(a) > 6 else 2.4
res = int(a[7]) if len(a) > 7 else 300
os.makedirs(out, exist_ok=True)
bpy.ops.wm.open_mainfile(filepath=blend)
sc = bpy.context.scene
rig = bpy.data.objects["Rig"]
act = bpy.data.actions[action]
rig.animation_data.action = act
meshes = sorted(o.name for o in bpy.data.objects if o.type == "MESH")
for k, n in enumerate(meshes):
    o = bpy.data.objects[n]
    m = bpy.data.materials.new("flat_" + n)
    m.diffuse_color = (*colorsys.hsv_to_rgb((k * 0.618) % 1, 0.7, 0.95), 1)
    o.data.materials.clear()
    o.data.materials.append(m)
for o in list(bpy.data.objects):
    if o.type in ("CAMERA", "LIGHT"):
        bpy.data.objects.remove(o, do_unlink=True)
sc.render.engine = "BLENDER_WORKBENCH"
sc.display.shading.color_type = "MATERIAL"
sc.display.shading.show_cavity = True
sc.render.resolution_x = sc.render.resolution_y = res
cam = bpy.data.objects.new("Cam", bpy.data.cameras.new("Cam"))
cam.data.type = "ORTHO"
cam.data.ortho_scale = ortho
sc.collection.objects.link(cam)
sc.camera = cam
D = {"front": (0, -1, 0.1), "back": (0, 1, 0.1), "side": (1, 0, 0.1), "lside": (-1, 0, 0.1), "tq": (0.7, -0.7, 0.2),
     "ltq": (-0.7, -0.7, 0.2), "top": (0.1, -0.3, 1)}
f0, f1 = int(act.frame_range[0]), int(act.frame_range[1])
for f in range(f0, f1 + 1, step):
    sc.frame_set(f)
    root = rig.matrix_world @ rig.pose.bones["B_ROOTJ"].head
    cc = Vector((root.x, root.y, 0)) + Vector((c.x, c.y, c.z))   # follow the root so the lunge stays in frame
    cam.location = cc + Vector(D[view]).normalized() * 4
    cam.rotation_euler = (cc - cam.location).to_track_quat("-Z", "Y").to_euler()
    sc.render.filepath = os.path.join(out, "m_%03d.png" % f)
    bpy.ops.render.render(write_still=True)
print("COLOURS", [(n, round((k * 0.618) % 1, 2)) for k, n in enumerate(meshes)])
