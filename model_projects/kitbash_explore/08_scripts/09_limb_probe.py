"""Limb donor probe: for each unit render its LEFT forearm/hand (x > 0.4) and its LEFT lower leg/foot
(z < 0.55, x > 0) alone, close-up, and list the components there.  Duncan is excluded on purpose.
    blender -b --python 09_limb_probe.py [Unit ...]"""
import json, os, sys
import bpy
from mathutils import Vector
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.dirname(HERE))), ".claude", "skills", "dsw-part-kitbash", "scripts"))
import blender_scene as bs, dsw_parts as P
from dsw_core import script_args
from units import paths
OUT = os.path.join(os.path.dirname(HERE), "02_progress_photos", "07_limb_probe"); os.makedirs(OUT, exist_ok=True)
UNITS = script_args() or ["Commando", "Raider", "Marauder", "Militia", "Bannerjee", "ImperialTrooper", "Otheym",
                          "Feydakin", "Gurney", "HouseGuard", "Aramsham", "Idualis02", "AtreidesSoldier"]
REG = {"arm": (lambda c: c["centre"][0] > 0.40 and c["centre"][2] > 0.9, Vector((0.62, 0, 1.12)), 0.6, [(0, -1, 0), (0.3, -0.3, 1)]),
       "leg": (lambda c: c["centre"][0] > 0.02 and c["centre"][2] < 0.6, Vector((0.17, 0, 0.3)), 0.75, [(0, -1, 0), (1, 0, 0)])}
listing = {}
for key in UNITS:
    bs.reset_scene()
    body, rig = bs.import_model(paths(key)[0])
    for m in body.data.materials:
        if m and m.use_nodes: bs.wire_textures(m, paths(key)[1])
    bs.setup_world(); bs.setup_lights(); bs.setup_render(400, 400)
    comps = P.components(body)
    infos = [P.comp_info(body, c) for c in comps]
    for reg, (pred, tgt, ortho, dirs) in REG.items():
        ids = [i for i, inf in enumerate(infos) if pred(inf)]
        listing["%s_%s" % (key, reg)] = [(i, len(comps[i]), infos[i]["bones"][0][0] if infos[i]["bones"] else "-",
                                          [round(x, 2) for x in infos[i]["lo"]], [round(x, 2) for x in infos[i]["hi"]]) for i in ids]
        part = body.copy(); part.data = body.data.copy(); bpy.context.collection.objects.link(part)
        P.delete_verts(part, [v for i in ids for v in comps[i]], invert=True)
        if reg == "leg":   # big pants+boots components: only show below the knee
            P.delete_verts(part, [v.index for v in part.data.vertices if v.co.z > 0.62])
        body.hide_render = True; part.hide_render = False
        for j, d in enumerate(dirs):
            cam = bs.setup_camera(target=tgt, ortho_scale=ortho, direction=d, distance=4)
            bs.render_to(os.path.join(OUT, "%s_%s_%d.png" % (key, reg, j)), cam); bpy.data.objects.remove(cam, do_unlink=True)
        bpy.data.objects.remove(part, do_unlink=True)
json.dump(listing, open(os.path.join(OUT, "listing.json"), "w"), indent=0)
print("DONE", len(listing))
