"""(Copied from thorvald_buildings/40_parts_survey.py, labels and camera scaled to the model.)
Blender: list the loose parts of a converted building FBX with bounds and the mean source-albedo colour under them,
and render a top + front view with each part in a flat colour and its index written next to it.

    blender --background --factory-startup --python 40_parts_survey.py -- <fbx> <src_albedo.png> <out_prefix>

Prints PART <i> verts=<n> min=(x,y,z) max=(x,y,z) rgb=(r,g,b) and writes <out_prefix>_front.png / _top.png.
"""
import colorsys
import sys

import bmesh
import bpy
from mathutils import Vector

fbx, albedo, prefix = sys.argv[sys.argv.index("--") + 1:][:3]
bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=fbx)
meshes = [o for o in bpy.context.scene.objects if o.type == "MESH"]
img = bpy.data.images.load(albedo)
W, H = img.size
px = list(img.pixels)


def sample(u, v):
    x, y = int((u % 1) * (W - 1)), int((v % 1) * (H - 1))
    i = (y * W + x) * 4
    return px[i:i + 3]


parts = []
for ob in meshes:
    bpy.context.view_layer.objects.active = ob
    for o in bpy.context.selected_objects:
        o.select_set(False)
    ob.select_set(True)
    bpy.ops.object.mode_set(mode="EDIT")
    bpy.ops.mesh.select_all(action="SELECT")
    bpy.ops.mesh.separate(type="LOOSE")
    bpy.ops.object.mode_set(mode="OBJECT")
    parts += list(bpy.context.selected_objects)

parts.sort(key=lambda o: o.name)
_all = [o.matrix_world @ v.co for o in parts for v in o.data.vertices]
LBL = max(0.25, (max(p.x for p in _all) - min(p.x for p in _all)) / 70)
for i, o in enumerate(parts):
    o.name = "part_%03d" % i
    ws = [o.matrix_world @ v.co for v in o.data.vertices]
    mn = Vector((min(p.x for p in ws), min(p.y for p in ws), min(p.z for p in ws)))
    mx = Vector((max(p.x for p in ws), max(p.y for p in ws), max(p.z for p in ws)))
    uv = o.data.uv_layers.active
    cols = [sample(*uv.data[li].uv) for li in range(0, len(o.data.loops), max(1, len(o.data.loops) // 60))] if uv else []
    rgb = tuple(sum(c[k] for c in cols) / max(1, len(cols)) for k in range(3)) if cols else (0, 0, 0)
    print("PART %d verts=%d min=(%.2f,%.2f,%.2f) max=(%.2f,%.2f,%.2f) rgb=(%.2f,%.2f,%.2f)" %
          ((i, len(o.data.vertices)) + tuple(mn) + tuple(mx) + rgb))
    m = bpy.data.materials.new("c%d" % i)
    m.diffuse_color = colorsys.hsv_to_rgb((i * 0.618) % 1, 0.7, 0.9) + (1,)
    o.data.materials.clear()
    o.data.materials.append(m)
    t = bpy.data.curves.new("t%d" % i, "FONT")
    t.body = str(i)
    t.size = LBL
    to = bpy.data.objects.new("lbl%d" % i, t)
    bpy.context.scene.collection.objects.link(to)
    to.location = (mn + mx) / 2 + Vector((0, 0, (mx.z - mn.z) / 2 + 0.05))
    to.data.materials.append(bpy.data.materials.new("w%d" % i))
    to.data.materials[0].diffuse_color = (0, 0, 0, 1)

allp = [o.matrix_world @ v.co for o in parts for v in o.data.vertices]
c = Vector((sum(p.x for p in allp), sum(p.y for p in allp), sum(p.z for p in allp))) / len(allp)
size = max(max(p.x for p in allp) - min(p.x for p in allp), max(p.y for p in allp) - min(p.y for p in allp)) * 1.2
sc = bpy.context.scene
sc.render.engine = "BLENDER_WORKBENCH"
sc.display.shading.color_type = "MATERIAL"
sc.render.resolution_x = sc.render.resolution_y = 1600
cam = bpy.data.objects.new("cam", bpy.data.cameras.new("cam"))
sc.collection.objects.link(cam)
sc.camera = cam
cam.data.type = "ORTHO"
cam.data.ortho_scale = size
cam.data.clip_end = size * 10
for view, loc, rot in (("top", (c.x, c.y, c.z + size * 2), (0, 0, 0)), ("front", (c.x, c.y - size * 2, c.z), (1.5708, 0, 0))):
    cam.location, cam.rotation_euler = loc, rot
    for o in sc.objects:
        if o.name.startswith("lbl"):
            o.rotation_euler = rot
    sc.render.filepath = "%s_%s.png" % (prefix, view)
    bpy.ops.render.render(write_still=True)
