# Blender side of 20_parts_sheet.py: import building FBX(s), split into loose parts, group them into <= MAXG labelled
# groups, render textured + flat-colour (shaded) + id (emission) views.
# usage: blender -b --factory-startup --python 21_parts_blender.py -- <cfg.json>
import bpy, sys, os, json, math
from mathutils import Vector

cfg = json.load(open(sys.argv[sys.argv.index("--") + 1]))
OUT = cfg["out"]; os.makedirs(OUT, exist_ok=True)
PAL = cfg["palette"]; MAXG = len(PAL)
for o in list(bpy.data.objects):
    bpy.data.objects.remove(o)
for f in cfg["fbx"]:
    bpy.ops.import_scene.fbx(filepath=f)
meshes = [o for o in bpy.data.objects if o.type == "MESH"]
bpy.ops.object.select_all(action="DESELECT")
for o in meshes:
    o.select_set(True)
bpy.context.view_layer.objects.active = meshes[0]
if len(meshes) > 1:
    bpy.ops.object.join()
obj = bpy.context.view_layer.objects.active
bpy.ops.object.parent_clear(type="CLEAR_KEEP_TRANSFORM")
bpy.ops.object.transform_apply(location=True, rotation=True, scale=True)
for o in list(bpy.data.objects):
    if o != obj:
        bpy.data.objects.remove(o)

# textured material
mat = bpy.data.materials.new("tex"); mat.use_nodes = True
bsdf = mat.node_tree.nodes["Principled BSDF"]; bsdf.inputs["Roughness"].default_value = 0.75
if cfg.get("albedo"):
    t = mat.node_tree.nodes.new("ShaderNodeTexImage"); t.image = bpy.data.images.load(cfg["albedo"])
    mat.node_tree.links.new(t.outputs["Color"], bsdf.inputs["Base Color"])
else:
    bsdf.inputs["Base Color"].default_value = (0.55, 0.5, 0.42, 1)
obj.data.materials.clear(); obj.data.materials.append(mat)

bb = [obj.matrix_world @ Vector(c) for c in obj.bound_box]
lo = Vector([min(v[k] for v in bb) for k in range(3)]); hi = Vector([max(v[k] for v in bb) for k in range(3)])
ctr = (lo + hi) / 2; size = max(hi - lo); diag = (hi - lo).length
print("BOUNDS", tuple(round(x, 2) for x in lo), tuple(round(x, 2) for x in hi))

sc = bpy.context.scene
ids = [e.identifier for e in bpy.types.RenderSettings.bl_rna.properties["engine"].enum_items]
sc.render.engine = "BLENDER_EEVEE" if "BLENDER_EEVEE" in ids else "BLENDER_EEVEE_NEXT"
sc.render.resolution_x = sc.render.resolution_y = cfg.get("res", 720)
sc.render.film_transparent = True; sc.render.image_settings.color_mode = "RGBA"
sc.view_settings.view_transform = "Standard"
w = bpy.data.worlds.new("W"); sc.world = w; w.use_nodes = True
w.node_tree.nodes["Background"].inputs[0].default_value = (0.6, 0.6, 0.6, 1)
w.node_tree.nodes["Background"].inputs[1].default_value = 0.9
for d in [(0.3, -0.5, 1), (-0.6, 0.5, 0.5)]:
    ld = bpy.data.lights.new("L", "SUN"); ld.energy = 2.6
    lo_ = bpy.data.objects.new("L", ld); sc.collection.objects.link(lo_)
    lo_.rotation_euler = Vector(d).to_track_quat("Z", "Y").to_euler()
cd = bpy.data.cameras.new("C"); cd.type = "ORTHO"; cd.ortho_scale = diag * 1.02
cam = bpy.data.objects.new("C", cd); sc.collection.objects.link(cam); sc.camera = cam
VIEWS = {"front": (-0.7, -0.7, 0.55), "back": (0.7, 0.7, 0.55), "top": (0, -0.0001, 1)}


def shoot(tag, views):
    for v in views:
        d = Vector(VIEWS[v]).normalized()
        cam.location = ctr + d * size * 4
        cam.rotation_euler = (-d).to_track_quat("-Z", "Y").to_euler()
        sc.render.filepath = os.path.join(OUT, "%s_%s.png" % (tag, v))
        bpy.ops.render.render(write_still=True)


shoot("tex", ["front", "back"])

# split into loose parts and group
bpy.ops.object.select_all(action="DESELECT"); obj.select_set(True); bpy.context.view_layer.objects.active = obj
bpy.ops.object.mode_set(mode="EDIT"); bpy.ops.mesh.select_all(action="SELECT")
bpy.ops.mesh.remove_doubles(threshold=0.0005); bpy.ops.mesh.separate(type="LOOSE"); bpy.ops.object.mode_set(mode="OBJECT")
parts = [o for o in bpy.data.objects if o.type == "MESH"]


def box(o):
    b = [o.matrix_world @ Vector(c) for c in o.bound_box]
    return (Vector([min(v[k] for v in b) for k in range(3)]), Vector([max(v[k] for v in b) for k in range(3)]))


info = []
for o in parts:
    a, b = box(o)
    info.append(dict(o=o, lo=a, hi=b, c=(a + b) / 2, d=(b - a).length, faces=len(o.data.polygons)))
info.sort(key=lambda i: -i["d"])
seeds = [i for i in info if i["d"] >= cfg.get("seed_frac", 0.16) * diag][:MAXG] or info[:1]
print("ISLANDS", len(info), "SEEDS", len(seeds))


def dist_to_box(p, s):
    return Vector([max(s["lo"][k] - p[k], 0, p[k] - s["hi"][k]) for k in range(3)]).length


for i in info:
    if i in seeds:
        i["g"] = seeds.index(i); continue
    best = min(range(len(seeds)), key=lambda k: (round(dist_to_box(i["c"], seeds[k]), 3), seeds[k]["d"]))
    i["g"] = best
groups = []
for g, s in enumerate(seeds):
    mem = [i for i in info if i["g"] == g]
    glo = Vector([min(m["lo"][k] for m in mem) for k in range(3)]); ghi = Vector([max(m["hi"][k] for m in mem) for k in range(3)])
    groups.append(dict(letter=chr(65 + g), colour=PAL[g], islands=len(mem), faces=sum(m["faces"] for m in mem),
                       lo=[round(x, 2) for x in glo], hi=[round(x, 2) for x in ghi]))
    for kind in ("flat", "id"):
        m = bpy.data.materials.new("%s%d" % (kind, g)); m.use_nodes = True
        nt = m.node_tree
        col = tuple((c / 255.0) ** 2.2 for c in PAL[g]) + (1,)
        if kind == "flat":
            nt.nodes["Principled BSDF"].inputs["Base Color"].default_value = col
            nt.nodes["Principled BSDF"].inputs["Roughness"].default_value = 0.7
        else:
            e = nt.nodes.new("ShaderNodeEmission"); e.inputs[0].default_value = col
            nt.links.new(e.outputs[0], nt.nodes["Material Output"].inputs["Surface"])
        s.setdefault("mats", {})[kind] = m
for kind in ("flat", "id"):
    for i in info:
        i["o"].data.materials.clear(); i["o"].data.materials.append(seeds[i["g"]]["mats"][kind])
    shoot(kind, ["front", "back", "top"])
json.dump(groups, open(os.path.join(OUT, "groups.json"), "w"), indent=1)
bpy.ops.wm.save_as_mainfile(filepath=os.path.join(OUT, "parts.blend"))
print("PARTS_DONE")
