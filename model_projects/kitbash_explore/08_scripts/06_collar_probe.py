"""Neck/collar donor probe: for each donor render the non-head components around the neck (z 1.55-1.82, |x|<0.22,
<=200 verts) alone, close-up front + 3/4, and list them.   blender -b --python 06_collar_probe.py"""
import json, os, sys
import bpy
from mathutils import Vector
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.dirname(HERE))), ".claude", "skills", "dsw-part-kitbash", "scripts"))
import blender_scene as bs, dsw_parts as P
from units import paths
OUT = os.path.join(os.path.dirname(HERE), "02_progress_photos", "06_collar_probe"); os.makedirs(OUT, exist_ok=True)
DONORS = ["Gurney", "Bannerjee", "HouseGuard", "ImperialTrooper", "Aramsham", "Otheym", "Feydakin", "Duncan", "Militia", "Marauder", "Raider", "AtreidesSoldier"]
for key in DONORS:
    bs.reset_scene()
    body, rig = bs.import_model(paths(key)[0])
    for m in body.data.materials:
        if m and m.use_nodes: bs.wire_textures(m, paths(key)[1])
    bs.setup_world(); bs.setup_lights(); bs.setup_render(420, 420)
    sel, listing = [], []
    for i, c in enumerate(P.components(body)):
        info = P.comp_info(body, c)
        if len(c) <= 400 and 1.52 <= info["centre"][2] <= 1.82 and abs(info["centre"][0]) < 0.22 and info["bones"] and info["bones"][0][0] != "B_HeadJ":
            sel.append(c); listing.append((i, len(c), info["bones"][0][0], round(info["centre"][2], 2), round(info["centre"][0], 2)))
    print("DONOR", key, listing)
    if not sel: continue
    part = body.copy(); part.data = body.data.copy(); bpy.context.collection.objects.link(part)
    P.delete_verts(part, [i for c in sel for i in c], invert=True)
    body.hide_render = True
    for tag, d in (("f", (0, -1, 0)), ("tq", (0.7, -0.7, 0.3)), ("b", (0, 1, 0))):
        cam = bs.setup_camera(target=Vector((0, 0, 1.66)), ortho_scale=0.5, direction=d, distance=4)
        bs.render_to(os.path.join(OUT, "%s_%s.png" % (key, tag)), cam); bpy.data.objects.remove(cam, do_unlink=True)
