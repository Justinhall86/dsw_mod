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
ARM = args[args.index("--arm") + 1] if "--arm" in args else None     # strip | <donor unit>
LEG = args[args.index("--leg") + 1] if "--leg" in args else None     # <donor unit>
HEAD = args[args.index("--head") + 1] if "--head" in args else "Duncan"
ALBEDO = args[args.index("--albedo") + 1] if "--albedo" in args else None
NAME = args[args.index("--name") + 1] if "--name" in args else HEAD + "_Commando" + ("_" + COLLAR if COLLAR else "")
PROJ = os.path.dirname(HERE)
SHOTS = os.path.join(PROJ, "02_progress_photos", "05_duncan_commando")
os.makedirs(SHOTS, exist_ok=True)
PACK = [4, 5, 6, 7, 41, 42, 43, 44]   # Commando backpack comps (gallery ids)


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
if ALBEDO:   # repainted vest back (08_paint_vest_back.py)
    for m in base.data.materials:
        if m and m.use_nodes:
            bs.wire_textures(m, {"Base Color": os.path.abspath(ALBEDO)})
comps = P.components(base)
P.delete_verts(base, [i for k in PACK for i in comps[k]])

HAND_BONES = ("Wrist", "Finger", "Thumb", "Forearm")


def is_hand(inf, xmin=0.55):
    """Gloves, cuffs, knuckle plates and studs: wrist/finger/forearm-weighted pieces out at the hands."""
    b = inf["bones"][0][0] if inf["bones"] else ""
    return abs(inf["centre"][0]) > xmin and inf["centre"][2] > 0.85 and any(k in b for k in HAND_BONES)


def is_lower_leg(inf):
    return inf["hi"][2] < 0.72 and inf["centre"][2] < 0.45 and abs(inf["centre"][0]) < 0.4


def graft(donor, pred, name, min_verts=8, max_verts=420):
    obj, drig = import_unit(donor)
    cs = P.components(obj)
    keep = [c for c in cs if min_verts <= len(c) <= max_verts and pred(P.comp_info(obj, c))]
    P.delete_verts(obj, [i for c in keep for i in c], invert=True)
    obj.name, obj.data.name = name, name + "Mesh"
    obj.parent = rig
    for m in obj.modifiers:
        if m.type == "ARMATURE": m.object = rig
    bpy.data.objects.remove(drig, do_unlink=True)
    print("GRAFT", name, "comps", len(keep), "tris", len(obj.data.polygons))
    return obj


def drop_comps(pred, label):
    gone = [i for c in P.components(base) if pred(P.comp_info(base, c), c) for i in c]
    P.delete_verts(base, gone)
    print("REMOVED", label, len(gone), "verts")


limbs = []
if ARM:
    # the bulky gauntlet: silver forearm plates (elbow-weighted, 57v each) + knuckle guards + studs
    drop_comps(lambda inf, c: len(c) < 80 and abs(inf["centre"][0]) > 0.45 and inf["bones"]
               and inf["bones"][0][0].endswith("ElbowJ"), "forearm plates")
    if ARM == "strip":
        drop_comps(lambda inf, c: len(c) <= 50 and is_hand(inf), "knuckle guards + studs")
    else:
        drop_comps(lambda inf, c: len(c) < 200 and is_hand(inf), "commando hands")
        limbs.append(graft(ARM, lambda inf: is_hand(inf, 0.5), ARM + "Hands"))
if LEG:
    boots = graft(LEG, is_lower_leg, LEG + "Boots", min_verts=15)
    top = max((boots.matrix_world @ v.co).z for v in boots.data.vertices)
    legcut = top - float(args[args.index('--tuck') + 1]) if '--tuck' in args else top - 0.05   # pants tuck into the boot
    pants = max(P.components(base), key=lambda c: len(c) if min(base.data.vertices[i].co.z for i in c) < 0.05 else 0)
    P.delete_verts(base, [i for i in pants if base.data.vertices[i].co.z < legcut])
    drop_comps(lambda inf, c: is_lower_leg(inf) or (inf["hi"][2] < 0.7 and abs(inf["centre"][0]) < 0.4 and inf["centre"][2] < 0.62
               and inf["bones"] and "Knee" in inf["bones"][0][0]), "knee pads + soles")
    print("LEG cut pants below z %.2f" % legcut)
    limbs.append(boots)
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
head, hrig = import_unit(HEAD)
head.name, head.data.name = HEAD + "Head", HEAD + "HeadMesh"
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
bb = [bs.model_bounds(o) for o in bpy.data.objects if o.type == 'MESH']
lo = Vector((0, 0, min(b[0].z for b in bb))); top = max(b[1].z for b in bb); centre = Vector((0, 0, (lo.z + top) / 2)); scale = (top - lo.z) * 1.1


def shot(tag, d, target=None, ortho=None, size=(600, 800)):
    bs.setup_render(*size)
    cam = bs.setup_camera(target=target or centre, ortho_scale=ortho or scale, direction=d, distance=(ortho or scale) * 2.5)
    bs.render_to(os.path.join(SHOTS, "%s_%s.png" % (NAME, tag)), cam)
    bpy.data.objects.remove(cam, do_unlink=True)


for tag, d in (("front", (0, -1, 0)), ("tq", (0.7, -0.7, 0)), ("back", (0, 1, 0))):
    shot(tag, d)
nk = Vector((0, 0, 1.68))
for tag, d in (("arm", (0, -1, 0)), ("arm_top", (0.3, -0.3, 1))):
    shot(tag, d, target=Vector((0.6, 0, 1.12)), ortho=0.65, size=(500, 500))
for tag, d in (("legs", (0, -1, 0)), ("legs_side", (1, -0.3, 0)), ("legs_back", (0, 1, 0))):
    shot(tag, d, target=Vector((0, 0, 0.42)), ortho=0.95, size=(500, 500))
for tag, d in (("neck_front", (0, -1, 0)), ("neck_tq", (0.7, -0.7, 0.1)), ("neck_side", (1, 0, 0.05)), ("neck_back", (0, 1, 0))):
    shot(tag, d, target=nk, ortho=0.7, size=(500, 500))
shot("start", (0.7, -0.7, 0), size=(1000, 1300))
bpy.ops.wm.save_as_mainfile(filepath=os.path.join(PROJ, "03_blender", NAME + ".blend"), compress=True)
