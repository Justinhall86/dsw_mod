"""Probe: Commando comp 1 (cowl + vest) - where does the neck wrap end?  Renders neck close-ups with cuts at several heights."""
import os, sys
import bmesh, bpy
from mathutils import Vector
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.dirname(HERE))), ".claude", "skills", "dsw-part-kitbash", "scripts"))
import blender_scene as bs, dsw_parts as P
from units import paths
OUT = os.path.join(os.path.dirname(HERE), "02_progress_photos", "04_scarf_probe"); os.makedirs(OUT, exist_ok=True)
bs.reset_scene()
body, rig = bs.import_model(paths("Commando")[0])
for m in body.data.materials:
    if m and m.use_nodes: bs.wire_textures(m, paths("Commando")[1])
comps = P.components(body)
c1 = comps[1]
zs = sorted(body.data.vertices[i].co.z for i in c1)
print("comp1 z min/max", zs[0], zs[-1], "n", len(zs))
import collections
h = collections.Counter(round(z*20)/20 for z in zs); print(sorted(h.items()))
bs.setup_world(); bs.setup_lights(); bs.setup_render(500, 500)
# keep body minus pack, head comps hidden by deleting head-dominant faces is not needed; just crop camera at neck
pack = [i for k in (4,5,6,7,41,42,43,44) for i in comps[k]]
P.delete_verts(body, pack)
comps = P.components(body)  # reindex
for cut in (None, 1.62, 1.66, 1.70):
    ob = body.copy(); ob.data = body.data.copy(); bpy.context.collection.objects.link(ob)
    if cut is not None:
        # delete c1 verts above cut: find comp containing most-top vertex
        cs = P.components(ob)
        big = [c for c in cs if len(c) > 300 and max(ob.data.vertices[i].co.z for i in c) > 1.7][0]
        P.delete_verts(ob, [i for i in big if ob.data.vertices[i].co.z > cut])
    body.hide_render = True; ob.hide_render = False
    for tag, d in (("f", (0, -1, 0)), ("tq", (0.7, -0.7, 0.1)), ("b", (0, 1, 0))):
        cam = bs.setup_camera(target=Vector((0, 0, 1.65)), ortho_scale=0.7, direction=d, distance=4)
        bs.render_to(os.path.join(OUT, "cut_%s_%s.png" % (cut, tag)), cam); bpy.data.objects.remove(cam, do_unlink=True)
    bpy.data.objects.remove(ob, do_unlink=True)
