"""Classify a unit's faces as METAL from its MetallicGlossAO map (R = metallic) and render a debug view.

    blender -b --python 04_metal_map.py -- <UnitKey> [--thr 0.5]

Metal faces are painted red, everything else grey, front + back.  Prints per-component metal share so
whole metal islands (plates, discs) can be told apart from metal trim inside fabric islands.
"""
import os
import sys

import bpy
import numpy as np
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.dirname(HERE))),
                                ".claude", "skills", "dsw-part-kitbash", "scripts"))
import blender_scene as bs  # noqa: E402
import dsw_parts as P  # noqa: E402
from dsw_core import script_args  # noqa: E402
from units import material_paths, paths  # noqa: E402



def load_px(path):
    img = bpy.data.images.load(path, check_existing=True)
    w, h = img.size
    a = np.array(img.pixels[:], dtype=np.float32).reshape(h, w, 4)
    return a


def face_metal(obj, key):
    """Mean metallic (R of MetallicGlossAO) per face, sampled at the face's loop UVs + centre."""
    me = obj.data
    uv = me.uv_layers.active.data
    maps = {}
    for mi, mat in enumerate(me.materials):
        maps[mi] = load_px(material_paths(key, mat.name)["Specular IOR Level"])
    out = np.zeros(len(me.polygons), dtype=np.float32)
    for p in me.polygons:
        px = maps[p.material_index]
        h, w = px.shape[:2]
        uvs = [uv[li].uv for li in p.loop_indices]
        c = sum((Vector(u) for u in uvs), Vector((0, 0))) / len(uvs)
        vals = []
        for u in uvs + [c]:
            x = int((u[0] % 1.0) * (w - 1))
            y = int((u[1] % 1.0) * (h - 1))
            vals.append(px[y, x, 0])
        out[p.index] = float(np.median(vals))
    return out


if __name__ == "__main__":
    args = script_args()
    key = args[0]
    thr = float(args[args.index("--thr") + 1]) if "--thr" in args else 0.5
    OUT = os.path.join(os.path.dirname(HERE), "02_progress_photos", "04_metal", key)
    os.makedirs(OUT, exist_ok=True)
    bs.reset_scene()
    body, rig = bs.import_model(paths(key)[0])
    metal = face_metal(body, key)
    print("METAL faces %d / %d (thr %.2f)" % ((metal > thr).sum(), len(metal), thr))
    np.save(os.path.join(OUT, "face_metal.npy"), metal)

    # per component share
    comps = P.components(body)
    v2c = {}
    for ci, comp in enumerate(comps):
        for v in comp:
            v2c[v] = ci
    share = {}
    for p in body.data.polygons:
        ci = v2c[p.vertices[0]]
        a = share.setdefault(ci, [0, 0])
        a[0] += metal[p.index] > thr
        a[1] += 1
    for ci in sorted(share):
        m, n = share[ci]
        if m and n >= 6:
            info = P.comp_info(body, comps[ci])
            print(" #%d faces %d metal %.0f%% %s z %.2f x %.2f y %.2f"
                  % (ci, n, 100 * m / n, info["bones"][0][0], info["centre"][2], info["centre"][0], info["centre"][1]))

    red = bpy.data.materials.new("METAL")
    red.diffuse_color = (1, 0.05, 0.05, 1)
    red.use_nodes = True
    red.node_tree.nodes["Principled BSDF"].inputs["Base Color"].default_value = (1, 0.05, 0.05, 1)
    grey = bpy.data.materials.new("OTHER")
    grey.use_nodes = True
    grey.node_tree.nodes["Principled BSDF"].inputs["Base Color"].default_value = (0.6, 0.6, 0.6, 1)
    body.data.materials.clear()
    body.data.materials.append(grey)
    body.data.materials.append(red)
    for p in body.data.polygons:
        p.material_index = 1 if metal[p.index] > thr else 0
    bs.setup_world(strength=1.8, color=(0.55, 0.58, 0.64))
    bs.setup_lights(sun_energy=3.0, fill_energy=120)
    bs.setup_render(500, 700)
    for tag, d in (("front", (0, -1, 0)), ("back", (0, 1, 0))):
        cam = bs.frame_camera_on(body, margin=1.1, direction=d)
        bs.render_to(os.path.join(OUT, "metal_%s.png" % tag), cam)
        bpy.data.objects.remove(cam, do_unlink=True)
