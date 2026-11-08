"""Four slim deck cannons on the cruiser's shoulders (Atreides tank turret + barrel, antenna dropped),
two per side in tandem, barrels to the bow (-X). UVs go to the flat swatches 68_wreck_paint.py
painted into the cruiser atlas (top = gunmetal, walls = charcoal, chamfers = copper).

    blender -b 03_blender/wreck_painted.blend --python 72_turrets.py -- [scale] [x1,x2] [y]
"""
import importlib, json, math, os, sys
import bpy, bmesh
from mathutils import Matrix, Vector

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
sys.path.insert(0, HERE)
B = importlib.import_module("20_build_variant")
argv = sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else []
SCALE = float(argv[0]) if len(argv) > 0 else 7.0
XS = [float(v) for v in argv[1].split(",")] if len(argv) > 1 else [14.0, 40.0]
YS = float(argv[2]) if len(argv) > 2 else 38.0
SW = json.load(open(os.path.join(PROJ, "04_textures", "cruiser_swatches.json")))
TURRET_BOX = [-0.7, 2.2, -0.45, 0.45, 0.85, 1.75]     # tank turret + ring + barrel, no hull, no antenna

hull = bpy.data.objects["thorvald_cruiser"]
mat = hull.data.materials[0]
rel, stem = B.donor("tank")
objs = B.import_and_flatten(rel, "tank")
B.cut_box(objs, TURRET_BOX, strict=True)
B.drop_small_islands(objs, 0.12)
bpy.ops.object.select_all(action="DESELECT")
for o in objs:
    o.select_set(True)
bpy.context.view_layer.objects.active = objs[0]
if len(objs) > 1:
    bpy.ops.object.join()
tur = bpy.context.view_layer.objects.active
tur.data.transform(tur.matrix_world); tur.matrix_world = Matrix.Identity(4)
mn, mx = B.bounds([tur])
print("TURRET raw bbox", tuple(round(v, 2) for v in mn), tuple(round(v, 2) for v in mx), "faces", len(tur.data.polygons))
# pivot = turret ring centre (the block, not the barrel), bottom at z 0, barrel to -X
block_cx = -0.15
# thicken the barrel (x > 0.95 in the tank frame) so it reads at RTS zoom; length unchanged
bv = [v for v in tur.data.vertices if v.co.x > 1.25]
if bv:
    bz = sum(v.co.z for v in bv) / len(bv)
    for v in bv:
        v.co.y *= 2.0
        v.co.z = bz + (v.co.z - bz) * 2.0
# UVs -> swatches, decided in the tank's own frame (barrel = x > 0.95, muzzle tip = x > 1.9)
if not tur.data.uv_layers:
    tur.data.uv_layers.new(name="UVMap")
while len(tur.data.uv_layers) > 1:
    tur.data.uv_layers.remove(tur.data.uv_layers[-1])
tur.data.uv_layers[0].active = tur.data.uv_layers[0].active_render = True
uvl = tur.data.uv_layers[0].data
for p in tur.data.polygons:
    nz, cx = p.normal.z, p.center.x
    if cx > 2.02:
        key = "copper"
    elif cx > 0.95:
        key = "char"
    elif p.center.z < 1.08:
        key = "copper"                      # turret ring = copper collar
    else:
        key = "gun" if nz > 0.5 else "char"
    for li in p.loop_indices:
        uvl[li].uv = SW[key]
tur.data.transform(Matrix.Translation(Vector((-block_cx, 0, -mn.z))))
tur.data.transform(Matrix.Rotation(math.pi, 4, "Z") @ Matrix.Scale(SCALE, 4))
tur.data.materials.clear(); tur.data.materials.append(mat)

dg = bpy.context.evaluated_depsgraph_get()
made = []
for x in XS:
    for y in (YS, -YS):
        hit, loc, *_ = bpy.context.scene.ray_cast(dg, Vector((x, y, 100)), Vector((0, 0, -1)))
        z = loc.z if hit else 0.0
        t = tur.copy(); t.data = tur.data.copy(); t.name = "turret_%d_%s" % (x, "L" if y > 0 else "R")
        bpy.context.scene.collection.objects.link(t)
        t.location = (x, y, z - 0.2)
        made.append(t)
        print("TURRET at", (x, y, round(z, 2)))
bpy.data.objects.remove(tur)
mn, mx = B.bounds(made[:1])
print("TURRET size (mesh units)", tuple(round(v, 1) for v in (mx - mn)))
bpy.ops.wm.save_as_mainfile(filepath=os.path.join(PROJ, "03_blender", "cruiser_turrets.blend"))
print("TURRETS_OK")
