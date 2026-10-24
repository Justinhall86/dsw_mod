"""v5 showcase: hero renders of the finished Landsraad Elite (E1) for each weapon variant.

  blender -b --python 08_scripts/v5_08_showcase.py
"""
import os

import bpy
from mathutils import Vector

LE = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\landsraad_elite"
OUT = os.path.join(LE, "02_progress_photos", "16_showcase")
os.makedirs(OUT, exist_ok=True)

# path label -> preview .blend name pattern (filled with the weapon); default = E1
PATHS = {
    "E1": "landsraad_elite_v5_%s_preview.blend",
    "G1": "landsraad_elite_v5_G1_%s_preview.blend",
    "H1": "landsraad_elite_v5_H1_%s_preview.blend",
    "BC": "landsraad_elite_v5_BC_%s_preview.blend",
    "B4": "landsraad_elite_handrolled_B4_%s.blend",
    "R2": "landsraad_elite_handrolled_R2_%s.blend",
    "H2": "landsraad_elite_v5_H2_%s_preview.blend",
    "R2C": "landsraad_elite_v5_R2C_%s_preview.blend",
}
import sys
labels = sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else ["E1"]
for label, w in [(l, w) for l in labels for w in ("halberd", "gun", "bazooka")]:
    bpy.ops.wm.open_mainfile(filepath=os.path.join(LE, "03_blender", PATHS[label] % w))
    sc = bpy.context.scene
    sc.frame_set(sc.frame_start)
    body = bpy.data.objects["LandsraadGuard"]
    bb = [body.matrix_world @ Vector(c) for c in body.bound_box]
    centre = sum(bb, Vector()) / 8
    centre.z = 1.0
    cd = bpy.data.cameras.new("hero")
    cam = bpy.data.objects.new("hero", cd)
    bpy.context.collection.objects.link(cam)
    cam.location = centre + Vector((-3.6, -2.6, 0.9))
    cam.rotation_euler = (centre + Vector((0, 0, 0.05)) - cam.location).to_track_quat("-Z", "Y").to_euler()
    cd.lens = 60
    sc.camera = cam
    sc.render.resolution_x, sc.render.resolution_y = 1200, 1500
    sc.render.filepath = os.path.join(OUT, "landsraad_elite_%s%s_hero.png" % ("" if label == "E1" else label + "_", w))
    bpy.ops.render.render(write_still=True)
