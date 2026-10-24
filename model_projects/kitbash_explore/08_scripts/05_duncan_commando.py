"""Duncan x Commando-no-pack: Commando body, backpack removed, neck wrap (cowl) removed, Duncan's head on top.

    blender -b --python 05_duncan_commando.py -- [--cut 1.62]

Commando's 'scarf' is TWO things: the cowl is the top of its vest component (cut above --cut) and the black
face mask + neck collar are part of its HEAD faces (gone when the head is swapped).  Duncan's own scarf is a
separate component and is never imported (only his head-weighted faces are).
"""
import os, sys
import bmesh, bpy
from mathutils import Vector
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.dirname(HERE))), ".claude", "skills", "dsw-part-kitbash", "scripts"))
import blender_scene as bs, dsw_parts as P
from dsw_core import script_args
from units import paths

args = script_args()
CUT = float(args[args.index("--cut") + 1]) if "--cut" in args else 1.62
COLLARS = {   # key -> (donor unit, component ids from 06_collar_probe.py)
    "gurney": ("Gurney", [13, 14, 26, 27]),
    "houseguard": ("HouseGuard", [16, 17]),
    "aramsham": ("Aramsham", [23, 24, 50, 51, 52, 53]),
}
COLLAR = args[args.index("--collar") + 1] if "--collar" in args else None
CSCALE = float(args[args.index("--cscale") + 1]) if "--cscale" in args else 1.0
CDROP = float(args[args.index("--cdrop") + 1]) if "--cdrop" in args else 0.0
STRIP = "--strip" in args           # drop the silver thigh plates and the belt pouch
PLATE_X = float(args[args.index("--plate-x") + 1]) if "--plate-x" in args else 0.215
NAME = "Duncan_Commando" + ("_" + COLLAR if COLLAR else "") + ("_clean" if STRIP else "")
PROJ = os.path.dirname(HERE)
SHOTS = os.path.join(PROJ, "02_progress_photos", "05_duncan_commando")
os.makedirs(SHOTS, exist_ok=True)
PACK = [4, 5, 6, 7, 41, 42, 43, 44]   # Commando backpack comps (gallery ids)
PLATE_Z = (0.52, 1.25)                # thigh plate height band
POUCH = [24]                          # silver belt pouch at the hip (gallery id)


def import_unit(key):
    before = {o.name for o in bpy.data.objects}
    fbx, wanted = paths(key)
    bpy.ops.import_scene.fbx(filepath=fbx)
    new = [o for o in bpy.data.objects if o.name not in before]
    for o in list(new):
        if o.name.split(".")[0] in bs.JUNK_NAMES and o.type in ("MESH", "CAMERA", "LIGHT"):
            bpy.data.objects.remove(o, do_unlink=True); new.remove(o)
    body = max([o for o in new if o.type == "MESH"], key=lambda o: len(o.data.polygons))
    rig = [o for o in new if o.type == "ARMATURE"][0]
    for m in body.data.materials:
        if m and m.use_nodes: bs.wire_textures(m, wanted)
    return body, rig


def dominant(obj):
    names = {g.index: g.name for g in obj.vertex_groups}
    return {v.index: names[max(v.groups, key=lambda x: x.weight).group] for v in obj.data.vertices if v.groups}


def keep_faces(obj, pred):
    dom = dominant(obj)
    bm = bmesh.new(); bm.from_mesh(obj.data); bm.faces.ensure_lookup_table()
    kill = [f for f in bm.faces if not pred([dom.get(v.index) for v in f.verts])]
    bmesh.ops.delete(bm, geom=kill, context="FACES")
    bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")
    bm.to_mesh(obj.data); bm.free(); obj.data.update()


bs.reset_scene()
base, rig = import_unit("Commando")
base.name, base.data.name, rig.name = "CommandoBody", "CommandoBodyMesh", "Armature"
comps = P.components(base)
trousers = set(comps[0])
if STRIP:   # thigh plates are outer faces of the trouser component (root, gallery id 0): beyond |x| PLATE_X inside the PLATE_Z band
    bm = bmesh.new(); bm.from_mesh(base.data); bm.verts.ensure_lookup_table(); bm.faces.ensure_lookup_table()
    outer = [f for f in bm.faces if all(v.index in trousers for v in f.verts)
             and abs(f.calc_center_median().x) > PLATE_X and PLATE_Z[0] < f.calc_center_median().z < PLATE_Z[1]]
    print("thigh plate faces removed", len(outer))
    gone = [bm.verts[i] for k in PACK + POUCH for i in comps[k]]     # indices are all from the ORIGINAL mesh
    bmesh.ops.delete(bm, geom=outer, context="FACES")
    for _ in range(8):   # the cut leaves sawtooth tips on the trouser leg: peel faces hanging by one edge or corner
        bm.faces.ensure_lookup_table()
        tips = [f for f in bm.faces if all(v.index in trousers for v in f.verts) and PLATE_Z[0] - 0.1 < f.calc_center_median().z < PLATE_Z[1] + 0.05
                and abs(f.calc_center_median().x) > 0.08 and sum(e.is_boundary for e in f.edges) >= 2]
        if not tips: break
        bmesh.ops.delete(bm, geom=tips, context="FACES")
    bmesh.ops.delete(bm, geom=[v for v in gone if v.is_valid], context="VERTS")
    bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")
    bm.to_mesh(base.data); bm.free(); base.data.update()
else:
    P.delete_verts(base, [i for k in PACK for i in comps[k]])
# cowl: top of the vest component
big = [c for c in P.components(base) if len(c) > 300 and max(base.data.vertices[i].co.z for i in c) > 1.7][0]
P.delete_verts(base, [i for i in big if base.data.vertices[i].co.z > CUT])
keep_faces(base, lambda ds: "B_HeadJ" not in ds)          # Commando head (mask + neck collar)
# neck collar ring: small pieces (attached to the head until it is cut off) around the neck, weighted to SpineTop/Neck01
ring = []
for c in P.components(base):
    info = P.comp_info(base, c)
    if len(c) <= 40 and info["lo"][2] > 1.58 and info["hi"][2] < 1.80 and max(abs(info["lo"][0]), abs(info["hi"][0])) < 0.16:
        ring += c
print("neck ring verts removed", len(ring))
P.delete_verts(base, ring)
head, hrig = import_unit("Duncan")
head.name, head.data.name = "DuncanHead", "DuncanHeadMesh"
keep_faces(head, lambda ds: all(d == "B_HeadJ" for d in ds) or "B_Neck01J" in ds)   # head + Duncan's own neck ring
DROP = float(args[args.index("--drop") + 1]) if "--drop" in args else 0.065
for v in head.data.vertices:      # seat the neck in the vest opening (rest pose, weights unchanged)
    v.co.z -= DROP
head.parent = rig
for m in head.modifiers:
    if m.type == "ARMATURE": m.object = rig
bpy.data.objects.remove(hrig, do_unlink=True)
if COLLAR:
    dkey, ids = COLLARS[COLLAR]
    col, crig = import_unit(dkey)
    comps = P.components(col)
    P.delete_verts(col, [i for k in ids for i in comps[k]], invert=True)
    col.name, col.data.name = COLLAR + "Collar", COLLAR + "CollarMesh"
    mid = Vector((0, 0.02, 1.66))                      # neck centre, scale about it
    for v in col.data.vertices:
        v.co = mid + (v.co - mid) * CSCALE
        v.co.z -= CDROP
    col.parent = rig
    for m in col.modifiers:
        if m.type == "ARMATURE": m.object = rig
    bpy.data.objects.remove(crig, do_unlink=True)
    print("COLLAR", COLLAR, "tris", len(col.data.polygons))
bpy.context.view_layer.update()
print("TRIS body", len(base.data.polygons), "head", len(head.data.polygons))

bs.setup_world(strength=1.8, color=(0.55, 0.58, 0.64)); bs.setup_lights(sun_energy=3.0, fill_energy=120)
for img in list(bpy.data.images):
    if img.users == 0: bpy.data.images.remove(img)
bs.pack_all_images()
lo, hi = bs.model_bounds(base); hlo, hhi = bs.model_bounds(head)
top = max(hi.z, hhi.z); centre = Vector((0, 0, (lo.z + top) / 2)); scale = (top - lo.z) * 1.1


def shot(tag, d, target=None, ortho=None, size=(600, 800)):
    bs.setup_render(*size)
    cam = bs.setup_camera(target=target or centre, ortho_scale=ortho or scale, direction=d, distance=(ortho or scale) * 2.5)
    bs.render_to(os.path.join(SHOTS, "%s_%s.png" % (NAME, tag)), cam)
    bpy.data.objects.remove(cam, do_unlink=True)


for tag, d in (("front", (0, -1, 0)), ("tq", (0.7, -0.7, 0)), ("back", (0, 1, 0))):
    shot(tag, d)
nk = Vector((0, 0, 1.68))
for tag, d in (("neck_front", (0, -1, 0)), ("neck_tq", (0.7, -0.7, 0.1)), ("neck_side", (1, 0, 0.05)), ("neck_back", (0, 1, 0))):
    shot(tag, d, target=nk, ortho=0.7, size=(500, 500))
shot("start", (0.7, -0.7, 0), size=(1000, 1300))
bpy.ops.wm.save_as_mainfile(filepath=os.path.join(PROJ, "03_blender", NAME + ".blend"), compress=True)
