"""Diagnose the 'film' look: render the same view with different shading ingredients switched off.

    blender -b <blend> --python film_test.py -- <out_dir> <tag> <mode>

modes: importer   = FBX-importer wiring as saved (MG colour -> Specular IOR Level)
       gamelike   = R metallic, G gloss, B AO (preview_wiring)
       diffuse    = albedo only (specular 0, metallic 0)           <- shows the pure albedo
       nospec     = importer wiring but Specular IOR Level 0
       noao       = game-like without the AO multiply
       nometal    = game-like with metallic 0
"""
import os
import sys

import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import blender_scene as bs  # noqa: E402
import preview_wiring as PW  # noqa: E402

args = sys.argv[sys.argv.index("--") + 1:]
OUT, TAG, MODE = os.path.abspath(args[0]), args[1], args[2]
os.makedirs(OUT, exist_ok=True)

for m in bpy.data.materials:
    if not m.use_nodes:
        continue
    nt = m.node_tree
    bsdf = next((n for n in nt.nodes if n.type == "BSDF_PRINCIPLED"), None)
    if bsdf is None:
        continue
    if MODE == "matte":
        PW.gamelike(m)
    elif MODE in ("gamelike", "noao", "nometal"):
        PW.gamelike(m)
        if MODE == "noao":
            for l in list(nt.links):
                if l.to_node.type == "MIX" or (l.from_node.type == "MIX" and l.to_node == bsdf):
                    pass
            mix = next((n for n in nt.nodes if n.type == "MIX"), None)
            if mix:
                mix.inputs["Factor"].default_value = 0.0
        if MODE == "nometal":
            for l in list(nt.links):
                if l.to_node == bsdf and l.to_socket.name == "Metallic":
                    nt.links.remove(l)
            bsdf.inputs["Metallic"].default_value = 0.0
    elif MODE == "diffuse":
        for l in list(nt.links):
            if l.to_node == bsdf and l.to_socket.name in ("Specular IOR Level", "Metallic"):
                nt.links.remove(l)
        bsdf.inputs["Specular IOR Level"].default_value = 0.0
        bsdf.inputs["Metallic"].default_value = 0.0
    elif MODE == "nospec":
        for l in list(nt.links):
            if l.to_node == bsdf and l.to_socket.name == "Specular IOR Level":
                nt.links.remove(l)
        bsdf.inputs["Specular IOR Level"].default_value = 0.0

if MODE == "matte":
    PW.soften_world()
for o in [o for o in bpy.data.objects if o.type == "CAMERA"]:
    bpy.data.objects.remove(o, do_unlink=True)
bs.setup_render(700, 700)
for name, tgt, sc_, d in (("closeup", (0, 0, 1.62), 0.85, (0.45, -0.88, 0.1)),):
    cam = bs.setup_camera(target=Vector(tgt), ortho_scale=sc_, direction=d, distance=4)
    bs.render_to(os.path.join(OUT, "%s_%s.png" % (TAG, name)), cam)
    bpy.data.objects.remove(cam, do_unlink=True)
print("RENDERED", MODE)
