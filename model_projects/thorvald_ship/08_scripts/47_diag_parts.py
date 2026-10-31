# Diagnostic: flat-colour each object, magenta background, ortho views; prints object stats.
# usage: blender -b <blend> --python 47_diag_parts.py -- <out_dir> [views=top,bottom,side,front,rear,tq]
import bpy, sys, os, math, colorsys
from mathutils import Vector

argv = sys.argv[sys.argv.index("--") + 1:]
out = os.path.abspath(argv[0])
views = (argv[1] if len(argv) > 1 else "top,bottom,side,nose,rear,tq,utq").split(",")
os.makedirs(out, exist_ok=True)

meshes = [o for o in bpy.context.scene.objects if o.type == "MESH"]
for o in bpy.context.scene.objects:
    if o.type in ("LIGHT", "CAMERA"):
        bpy.data.objects.remove(o)
lo = Vector((1e9,) * 3); hi = Vector((-1e9,) * 3)
for i, o in enumerate(meshes):
    bb = [o.matrix_world @ Vector(c) for c in o.bound_box]
    olo = Vector([min(v[k] for v in bb) for k in range(3)]); ohi = Vector([max(v[k] for v in bb) for k in range(3)])
    lo = Vector([min(lo[k], olo[k]) for k in range(3)]); hi = Vector([max(hi[k], ohi[k]) for k in range(3)])
    print("OBJ %-28s faces=%5d lo=(%.2f,%.2f,%.2f) hi=(%.2f,%.2f,%.2f)" % ((o.name, len(o.data.polygons)) + tuple(olo) + tuple(ohi)))
    m = bpy.data.materials.new("diag%d" % i); m.use_nodes = True
    r, g, b = colorsys.hsv_to_rgb((i * 0.618) % 1.0, 0.75, 0.9)
    bsdf = m.node_tree.nodes.get("Principled BSDF")
    bsdf.inputs["Base Color"].default_value = (r, g, b, 1); bsdf.inputs["Roughness"].default_value = 0.6
    o.data.materials.clear(); o.data.materials.append(m)
print("BOUNDS lo=(%.2f,%.2f,%.2f) hi=(%.2f,%.2f,%.2f)" % (tuple(lo) + tuple(hi)))
c = (lo + hi) / 2; size = max(hi - lo)
if os.environ.get("DIAG_C"): c = Vector([float(v) for v in os.environ["DIAG_C"].split(",")])

sc = bpy.context.scene
sc.render.engine = "BLENDER_EEVEE" if "BLENDER_EEVEE" in [e.identifier for e in bpy.types.RenderSettings.bl_rna.properties["engine"].enum_items] else "BLENDER_EEVEE_NEXT"
sc.render.resolution_x = sc.render.resolution_y = 900
w = sc.world or bpy.data.worlds.new("W"); sc.world = w; w.use_nodes = True
w.node_tree.nodes["Background"].inputs[0].default_value = (0.5, 0.5, 0.5, 1)
w.node_tree.nodes["Background"].inputs[1].default_value = 1.0
sc.view_settings.view_transform = "Standard"; sc.render.film_transparent = True; sc.render.image_settings.color_mode = "RGBA"
for d in [(0.3, -0.4, 1), (-0.5, 0.6, -0.6), (1, 0.2, 0.3)]:
    ld = bpy.data.lights.new("L", "SUN"); ld.energy = 2.5
    lo_ = bpy.data.objects.new("L", ld); sc.collection.objects.link(lo_)
    lo_.rotation_euler = Vector(d).to_track_quat("Z", "Y").to_euler()
cam_d = bpy.data.cameras.new("C"); cam_d.type = "ORTHO"; zoom = float(os.environ.get("DIAG_ZOOM", "1")); cam_d.ortho_scale = size * 1.15 / zoom
cam = bpy.data.objects.new("C", cam_d); sc.collection.objects.link(cam); sc.camera = cam
V = {"top": (0, -0.0001, 1), "bottom": (0, 0.0001, -1), "side": (0, -1, 0.0), "nose": (-1, 0, 0.0),
     "rear": (1, 0, 0.0), "tq": (-0.7, -0.7, 0.45), "utq": (-0.6, 0.6, -0.5), "rtq": (0.7, -0.7, 0.45)}
for v in views:
    d = Vector(V[v]).normalized()
    cam.location = c + d * size * 3
    cam.rotation_euler = (-d).to_track_quat("-Z", "Y" if abs(d.z) > 0.9 else "Z").to_euler()
    sc.render.filepath = os.path.join(out, "diag_%s.png" % v)
    bpy.ops.render.render(write_still=True)
    import numpy as np
    im = bpy.data.images.load(sc.render.filepath); px = np.empty(len(im.pixels), np.float32); im.pixels.foreach_get(px)
    px = px.reshape(-1, 4); a = px[:, 3:4]; bg = np.array([0.0, 1.0, 0.0], np.float32)
    px[:, :3] = px[:, :3] * a + bg * (1 - a); px[:, 3] = 1.0
    im.pixels.foreach_set(px.ravel()); im.save(); bpy.data.images.remove(im)
print("DIAG_DONE")
