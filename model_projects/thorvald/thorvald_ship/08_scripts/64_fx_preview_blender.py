import bpy, sys, json, os
from mathutils import Vector
job = json.load(open(sys.argv[sys.argv.index("--") + 1]))
for o in list(bpy.data.objects): bpy.data.objects.remove(o)
me = bpy.data.meshes.new("hull"); me.from_pydata([tuple(v) for v in job["V"]], [], [tuple(t) for t in job["T"]]); me.update()
hull = bpy.data.objects.new("hull", me); bpy.context.scene.collection.objects.link(hull)
def mat(name, col, emit=0.0):
    m = bpy.data.materials.new(name); m.use_nodes = True; b = m.node_tree.nodes["Principled BSDF"]
    b.inputs["Base Color"].default_value = (*col, 1); b.inputs["Roughness"].default_value = 0.8
    if emit: b.inputs["Emission Color"].default_value = (*col, 1); b.inputs["Emission Strength"].default_value = emit
    return m
me.materials.append(mat("hull", (0.33, 0.33, 0.36)))
COL = {"reactor": (1.0, 0.45, 0.05), "light": (1, 1, 1), "trail": (0.1, 0.5, 1.0), "muzzle": (1.0, 0.05, 0.05)}
M = {k: mat(k, c, 2.0) for k, c in COL.items()}
lo = Vector([min(v[k] for v in job["V"]) for k in range(3)]); hi = Vector([max(v[k] for v in job["V"]) for k in range(3)])
size = max(hi - lo)
for mk in job["marks"]:
    r = size * (0.035 * max(0.35, min(mk["s"], 3.0)) if mk["kind"] == "reactor" else 0.014)
    bpy.ops.mesh.primitive_uv_sphere_add(radius=r, location=mk["p"], segments=12, ring_count=8)
    bpy.context.object.data.materials.append(M[mk["kind"]])
    lo = Vector([min(lo[k], mk["p"][k]) for k in range(3)]); hi = Vector([max(hi[k], mk["p"][k]) for k in range(3)])
c = (lo + hi) / 2; size = max(hi - lo)
sc = bpy.context.scene
ids = [e.identifier for e in bpy.types.RenderSettings.bl_rna.properties["engine"].enum_items]
sc.render.engine = "BLENDER_EEVEE" if "BLENDER_EEVEE" in ids else "BLENDER_EEVEE_NEXT"
sc.render.resolution_x = sc.render.resolution_y = 560; sc.view_settings.view_transform = "Standard"
w = bpy.data.worlds.new("W"); sc.world = w; w.use_nodes = True
w.node_tree.nodes["Background"].inputs[0].default_value = (0.08, 0.08, 0.09, 1); w.node_tree.nodes["Background"].inputs[1].default_value = 1
for dd in [(0.3, -0.5, 1), (-0.6, 0.5, 0.5), (0.2, 1, -0.3)]:
    ld = bpy.data.lights.new("L", "SUN"); ld.energy = 2.2; lo_ = bpy.data.objects.new("L", ld); sc.collection.objects.link(lo_)
    lo_.rotation_euler = Vector(dd).to_track_quat("Z", "Y").to_euler()
cd = bpy.data.cameras.new("C"); cd.type = "ORTHO"; cd.ortho_scale = size * 1.25
cam = bpy.data.objects.new("C", cd); sc.collection.objects.link(cam); sc.camera = cam
# raw HMD model space: views named for how a ship sits in it are decided by eye from the sheet; these are axis views
VIEWS = {"top": ((0, 0.0001, 1), "Y"), "side": ((1, 0, 0), "Z"), "rear": ((0, 1, 0), "Z"), "tq": ((0.6, 0.7, 0.45), "Z")}
for k, (d, up) in VIEWS.items():
    d = Vector(d).normalized(); cam.location = c + d * size * 4
    cam.rotation_euler = (-d).to_track_quat("-Z", up).to_euler()
    sc.render.filepath = os.path.join(job["out"], "%s_%s.png" % (job["name"], k)); bpy.ops.render.render(write_still=True)
