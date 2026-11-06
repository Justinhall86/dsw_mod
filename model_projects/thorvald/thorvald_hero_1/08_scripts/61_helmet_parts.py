"""Round 15: part gallery of the head-bone pieces of a helmet donor (from 60_helmet_survey.py's converted FBX), so the
helmet shell can be told apart from face skin, hair, eyes and visor. Flat colour per component + a legend sheet.

  blender -b --factory-startup --python 61_helmet_parts.py -- Warden ImpTrooper ...
  python 61_helmet_parts.py --assemble Warden ImpTrooper ...

Prints COMP <key> <id> verts, centre, size, mean albedo colour. Output 02_progress_photos/30_helmet/parts/.
"""
import colorsys
import json
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
DONOR_DIR = os.path.join(PROJ, "05_fbx_export", "helmet_donors")
OUT = os.path.join(PROJ, "02_progress_photos", "30_helmet", "parts")
VIEWS = ("front", "side", "back")


def hue(k):
    return colorsys.hsv_to_rgb((k * 0.618) % 1, 0.75, 1.0)


if "--assemble" in sys.argv:
    from PIL import Image, ImageDraw
    for key in sys.argv[sys.argv.index("--assemble") + 1:]:
        info = json.load(open(os.path.join(OUT, key + "_comps.json")))
        ims = [Image.open(os.path.join(OUT, "%s_%s.png" % (key, v))).convert("RGB") for v in VIEWS]
        w, h = ims[0].size
        leg_h = 18 * ((len(info) + 2) // 3) + 10
        sheet = Image.new("RGB", (w * 3, h + leg_h), (40, 40, 40))
        for i, im in enumerate(ims):
            sheet.paste(im, (i * w, 0))
        d = ImageDraw.Draw(sheet)
        for n, c in enumerate(info):
            x, y = (n % 3) * w + 6, h + 6 + (n // 3) * 18
            d.rectangle([x, y, x + 12, y + 12], fill=tuple(int(255 * v) for v in hue(n)))
            d.text((x + 18, y), "%d: %dv z%.2f y%.2f rgb%s" % (c["id"], c["n"], c["c"][2], c["c"][1], c["rgb"]),
                   fill=(255, 255, 255))
        sheet.save(os.path.join(OUT, key + "_parts.png"))
        print("saved", os.path.join(OUT, key + "_parts.png"))
    raise SystemExit

import bmesh  # noqa: E402
import bpy  # noqa: E402
from mathutils import Vector  # noqa: E402

sys.path.insert(0, r"C:\Users\justi\Python\dsw_mod\.claude\skills\dsw-part-kitbash\scripts")
import dsw_parts as P  # noqa: E402

os.makedirs(OUT, exist_ok=True)
manifest = json.load(open(os.path.join(DONOR_DIR, "manifest.json")))
for key in sys.argv[sys.argv.index("--") + 1:]:
    info = manifest[key]
    bpy.ops.wm.read_factory_settings(use_empty=True)
    bpy.ops.import_scene.fbx(filepath=info["fbx"])
    sc = bpy.context.scene
    meshes = [o for o in sc.objects if o.type == "MESH"]
    for o in meshes[1:]:
        o.select_set(True)
    for o in meshes:
        o.select_set(True)
    bpy.context.view_layer.objects.active = meshes[0]
    if len(meshes) > 1:
        bpy.ops.object.join()
    o = bpy.context.view_layer.objects.active
    gn = {g.index: g.name for g in o.vertex_groups}
    dom = {v.index: gn[max(v.groups, key=lambda g: g.weight).group] for v in o.data.vertices if v.groups}
    bm = bmesh.new()
    bm.from_mesh(o.data)
    bmesh.ops.delete(bm, geom=[f for f in bm.faces if not all(dom.get(v.index) == "B_HeadJ" for v in f.verts)],
                     context="FACES")
    bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")
    bm.to_mesh(o.data)
    bm.free()
    # mean albedo colour per component (sampled at face-corner UVs)
    imgs = {}
    for slot in o.material_slots:
        alb = next((p for s, p in info["albedos"].items() if s.lower() in slot.material.name.lower()),
                   next(iter(info["albedos"].values())))
        im = bpy.data.images.load(alb, check_existing=True)
        imgs[slot.material.name] = (im, list(im.pixels), im.size[0], im.size[1])
    uv = o.data.uv_layers.active.data
    comps = [c for c in P.components(o) if len(c) >= 4]
    vface = {}
    for p in o.data.polygons:
        for v in p.vertices:
            vface.setdefault(v, p)
    legend, vm = [], {}
    o.data.materials.clear()
    for k, idx in enumerate(comps):
        cols = []
        for i in list(idx)[:: max(1, len(idx) // 40)]:
            p = vface.get(i)
            if p is None:
                continue
            l = p.loop_indices[0]
            im, px, W, H = imgs[list(imgs)[min(p.material_index, len(imgs) - 1)]]
            u, v = uv[l].uv
            x, y = int((u % 1) * (W - 1)), int((v % 1) * (H - 1))
            j = 4 * (y * W + x)
            cols.append(px[j:j + 3])
        rgb = [int(255 * sum(c[t] for c in cols) / max(len(cols), 1)) for t in range(3)]
        ps = [o.matrix_world @ o.data.vertices[i].co for i in idx]
        c = sum(ps, Vector()) / len(ps)
        legend.append({"id": k, "n": len(idx), "c": [round(x, 3) for x in c], "rgb": rgb})
        m = bpy.data.materials.new("c%d" % k)
        m.diffuse_color = (*hue(k), 1)
        o.data.materials.append(m)
        for i in idx:
            vm[i] = k
        print("COMP %s %d n=%d c=(%.3f,%.3f,%.3f) rgb=%s" % (key, k, len(idx), c.x, c.y, c.z, rgb))
    for p in o.data.polygons:
        p.material_index = vm.get(p.vertices[0], 0)
    json.dump(legend, open(os.path.join(OUT, key + "_comps.json"), "w"))
    ps = [o.matrix_world @ v.co for v in o.data.vertices]
    lo = Vector([min(p[i] for p in ps) for i in range(3)])
    hi = Vector([max(p[i] for p in ps) for i in range(3)])
    cc = (lo + hi) / 2
    sc.render.engine = "BLENDER_WORKBENCH"
    sc.display.shading.color_type = "MATERIAL"
    sc.render.resolution_x = sc.render.resolution_y = 360
    cam = bpy.data.objects.new("Cam", bpy.data.cameras.new("Cam"))
    cam.data.type = "ORTHO"
    cam.data.ortho_scale = max(hi - lo) * 1.3
    sc.collection.objects.link(cam)
    sc.camera = cam
    for v, d in zip(VIEWS, ((0, -1, 0), (1, 0, 0), (0, 1, 0))):
        cam.location = cc + Vector(d) * 3
        cam.rotation_euler = (cc - cam.location).to_track_quat("-Z", "Y").to_euler()
        sc.render.filepath = os.path.join(OUT, "%s_%s.png" % (key, v))
        bpy.ops.render.render(write_still=True)
