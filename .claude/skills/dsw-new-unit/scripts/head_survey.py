"""Close-up of every candidate head donor (head + neck only), front and three-quarter, textured.

    blender -b --python head_survey.py -- [Key ...]
"""
import os
import sys

import bmesh
import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import blender_scene as bs  # noqa: E402
from dsw_core import script_args  # noqa: E402
from units import UNITS, paths  # noqa: E402

OUT = os.path.join(os.path.dirname(HERE), "02_progress_photos", "09_heads")
os.makedirs(OUT, exist_ok=True)
keys = script_args() or list(UNITS)
for key in keys:
    fbx, wanted = paths(key)
    bs.reset_scene()
    body, rig = bs.import_model(fbx)
    for mat in body.data.materials:
        if mat and mat.use_nodes:
            for _ in bs.wire_textures(mat, wanted):
                pass
    names = {g.index: g.name for g in body.vertex_groups}
    dom = {v.index: names[max(v.groups, key=lambda x: x.weight).group] for v in body.data.vertices if v.groups}
    bm = bmesh.new()
    bm.from_mesh(body.data)
    kill = [f for f in bm.faces if not all(dom.get(v.index) in ("B_HeadJ", "B_Neck01J") for v in f.verts)]
    bmesh.ops.delete(bm, geom=kill, context="FACES")
    bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")
    bm.to_mesh(body.data)
    bm.free()
    zs = [(body.matrix_world @ v.co).z for v in body.data.vertices]
    cz = (min(zs) + max(zs)) / 2
    bs.setup_world(strength=1.8, color=(0.55, 0.58, 0.64))
    bs.setup_lights(sun_energy=3.0, fill_energy=120)
    bs.setup_render(450, 450)
    for tag, d in (("front", (0, -1, 0.05)), ("tq", (0.75, -0.65, 0.1))):
        cam = bs.setup_camera(target=Vector((0, 0, cz)), ortho_scale=0.42, direction=d, distance=4)
        bs.render_to(os.path.join(OUT, "%s_%s.png" % (key, tag)), cam)
        bpy.data.objects.remove(cam, do_unlink=True)
    print("HEAD", key, "tris", len(body.data.polygons), "z %.2f..%.2f" % (min(zs), max(zs)))
