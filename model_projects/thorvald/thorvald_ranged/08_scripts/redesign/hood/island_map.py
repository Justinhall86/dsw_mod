"""Head islands in flat colours with their ids written on (front + side), to pick graft pieces.
    python ../bl.py island_map.py -- <out_prefix> <fbx> <id,id,...> [title]
"""
import os, sys, colorsys, json
import bpy
from mathutils import Vector
from bpy_extras.object_utils import world_to_camera_view
R = os.path.abspath(os.path.join(os.path.dirname(os.path.abspath(__file__)), *[".."] * 6, ".claude", "skills"))
sys.path.insert(0, R + "/dsw-part-kitbash/scripts"); sys.path.insert(0, R + "/dsw-new-unit/scripts")
import dsw_parts as P, blender_scene as bs
a = sys.argv[sys.argv.index("--") + 1:]
OUT, FBX, ids = a[0], a[1], [int(x) for x in a[2].split(",")]
bs.reset_scene(); body, rig = bs.import_model(FBX)
for m in [o for o in bpy.data.objects if o.type == "ARMATURE"]:
    pass
comps = P.components(body); me = body.data
v2k = {i: k for k in ids for i in comps[k]}
centres = {k: Vector(P.comp_info(body, comps[k])["centre"]) for k in ids}
me.materials.clear()
for n, k in enumerate(ids):
    m = bpy.data.materials.new("I%d" % k); m.use_nodes = True
    m.node_tree.nodes["Principled BSDF"].inputs["Base Color"].default_value = (*colorsys.hsv_to_rgb((n * 0.618) % 1, 0.65, 0.95), 1)
    me.materials.append(m)
for p in me.polygons:
    k = v2k.get(p.vertices[0]); p.material_index = ids.index(k) if k is not None else 0
P.delete_verts(body, [i for i in range(len(me.vertices)) if i not in v2k])
bs.setup_world(1.0, (0.7, 0.7, 0.7)); bs.setup_lights(3.0, 120)
from PIL import Image, ImageDraw, ImageFont
F = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf", 22)
tiles = []
for tag, d, nudge in (("front", (0, -1, 0.05), Vector((0, -0.3, 0))), ("side", (1, 0, 0.05), Vector((0.3, 0, 0)))):
    bs.setup_render(700, 700)
    cam = bs.setup_camera(target=Vector((0, 0, 1.76)), ortho_scale=0.62, direction=d, distance=4)
    path = "%s_%s.png" % (OUT, tag); bs.render_to(path, cam)
    im = Image.open(path).convert("RGB"); dr = ImageDraw.Draw(im)
    for k, c in centres.items():
        u, v, _ = world_to_camera_view(bpy.context.scene, cam, body.matrix_world @ c)
        dr.text((u * 700, (1 - v) * 700), str(k), fill="black", font=F, anchor="mm", stroke_width=3, stroke_fill="white")
    tiles.append(im); bpy.data.objects.remove(cam, do_unlink=True); os.remove(path)
s = Image.new("RGB", (1400, 740), "white"); s.paste(tiles[0], (0, 40)); s.paste(tiles[1], (700, 40))
ImageDraw.Draw(s).text((10, 6), a[3] if len(a) > 3 else os.path.basename(FBX), fill="black", font=F)
s.save(OUT + ".png"); print("MAPPED", OUT)
