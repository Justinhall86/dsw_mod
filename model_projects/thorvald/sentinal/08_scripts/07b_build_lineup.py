"""Step 07b - build ONE .blend containing every variant of a unit side by side.

    blender -b --python 07b_build_lineup.py -- \
        [--project idualis_trooper] [--out IdualisTrooper_all_variants.blend]

Extends 07_build_blend.py to multiple bodies, each with its own texture stem
and its own weapon list taken from the game's prefab:

  * every texture is wired EXPLICITLY per variant (the stock script's
    "first *_Albedo.png in the folder" rule would put variant 01's textures
    on every body)
  * weapon textures are wired explicitly too, or they render MAGENTA
  * the grip comes from the MESH (centroid of the vertices weighted to the
    wrist bone), never from a bone's rest transform
  * bone parenting uses the OPERATOR (parent_set keep_transform), never
    matrix_parent_inverse
  * every image is PACKED, so the .blend is portable

Layout: each body's bbox centre is moved onto its slot on the X axis, then a
camera frames the whole lineup.  Renders landscape shots of the lineup after
saving.
"""
import math
import os
import sys

import bpy
from mathutils import Matrix, Vector

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import blender_scene as bs  # noqa: E402
from dsw_core import cfg, script_args  # noqa: E402

argv = script_args()


def opt(flag, default=None):
    return argv[argv.index(flag) + 1] if flag in argv else default


project = os.path.join(cfg("model_projects"), opt("--project", "idualis_trooper"))
INPUT = os.path.join(project, "01_input")
WPN_DIR = os.path.join(project, "05_fbx_export")
OUT = os.path.join(project, "03_blender",
                   opt("--out", "IdualisTrooper_all_variants.blend"))
SHOTS = os.path.join(project, "02_progress_photos", "04_showcase")

# variant -> (body fbx, texture stem, slot x, [(weapon fbx, bone, name), ...])
VARIANTS = [
    ("Male01_IdualisTrooper01_TRUE_FBX.fbx", "IdualisTrooper01", -1.6,
     [("DoubleKnife_TRUE_FBX.fbx", "B_rWristJ", "Knife_R"),
      ("DoubleKnife_TRUE_FBX.fbx", "B_lWristJ", "Knife_L")]),
    ("Male01_IdualisTrooper02_TRUE_FBX.fbx", "IdualisTrooper02", 0.0,
     [("LongKnife_TRUE_FBX.fbx", "B_rWristJ", "LongKnife")]),
    ("Male01_IdualisTrooper03_TRUE_FBX.fbx", "IdualisTrooper03", 1.6,
     [("MetalBar_TRUE_FBX.fbx", "B_rWristJ", "MetalBar")]),
]

BODY_SOCKETS = ("Base Color", "Specular IOR Level", "Normal")
SUFFIX = {"Base Color": "_Albedo.png",
          "Specular IOR Level": "_MetallicGlossAO.png",
          "Normal": "_Normal.png"}


# ---- helpers -------------------------------------------------------------
img_cache = {}


def load_image(path):
    p = os.path.abspath(path)
    if p not in img_cache:
        img = bpy.data.images.load(p, check_existing=False)
        img.name = os.path.basename(p)
        img_cache[p] = img
    return img_cache[p]


def wire(material, wanted, label):
    """Point each texture node at the file for its socket (by socket name).

    The image datablock is assigned directly (not re-pointed), so no stale
    packed pixels can survive.
    """
    tree = material.node_tree
    log = []
    for node in [n for n in tree.nodes if n.type == "TEX_IMAGE"]:
        sock = bs.socket_of(node, tree)
        if sock == "Alpha":
            continue
        path = wanted.get(sock)
        if not path:
            log.append((sock, "UNWIRED", node.image.name if node.image else "?"))
            continue
        if not os.path.exists(path):
            log.append((sock, "MISSING", path))
            continue
        node.image = load_image(path)
        log.append((sock, os.path.basename(path), ""))
    for sock, name, extra in log:
        print("   WIRE %-24s %-14s %-38s %s" % (label, sock, name, extra))
    return log


def import_new(path):
    """Import an FBX and return only the objects it added."""
    before = {o.name for o in bpy.data.objects}
    bpy.ops.import_scene.fbx(filepath=os.path.abspath(path))
    bpy.context.view_layer.update()
    return [o for o in bpy.data.objects if o.name not in before]


def drop_junk(objs):
    """Delete the helper meshes / stray cameras FBX files carry."""
    for o in list(objs):
        if o.name.split(".")[0] in bs.JUNK_NAMES and o.type in ("MESH", "CAMERA", "LIGHT"):
            print("   junk removed: %s (%s)" % (o.name, o.type))
            bpy.data.objects.remove(o, do_unlink=True)
            objs.remove(o)
    return objs


def under(obj, ancestor):
    p = obj.parent
    while p is not None:
        if p is ancestor:
            return True
        p = p.parent
    return False


def raw_centroid(body, bone_name, threshold):
    return bs.hand_centroid(body, bone_name, threshold=threshold)


def grip_on(body, bone_name):
    """Wrist grip point from the DISPLAYED (posed, evaluated) mesh: centroid
    of the vertices whose strongest weight is that bone.

    Two traps this avoids:
      * the raw vertices are the REST pose - variant 01's armature is posed
        (crouched), so a rest-pose grip lands outside the displayed body;
      * bone rest transforms in this rig are not trustworthy at all.
    The armature modifier never changes vertex ORDER or COUNT, so weights are
    read from the original vertices and positions from the evaluated ones.
    """
    dg = bpy.context.evaluated_depsgraph_get()
    ev = body.evaluated_get(dg)
    me = ev.to_mesh()
    try:
        if len(me.vertices) != len(body.data.vertices):
            raise SystemExit("evaluated vertex count differs - cannot map weights")
        groups = {g.name: g.index for g in body.vertex_groups}
        idx = groups.get(bone_name)
        if idx is None:
            raise SystemExit("no vertex group %s on %s" % (bone_name, body.name))
        mw = body.matrix_world
        for t in (0.5, 0.3, 0.15):
            pts = []
            for vs, ve in zip(body.data.vertices, me.vertices):
                bw = max((g.weight for g in vs.groups if g.group == idx),
                         default=-1.0)
                if bw > t:
                    pts.append(mw @ ve.co)
            if pts:
                n = len(pts)
                g = Vector((sum(p.x for p in pts) / n,
                            sum(p.y for p in pts) / n,
                            sum(p.z for p in pts) / n))
                raw = raw_centroid(body, bone_name, t)
                print("   GRIP %-10s thr %.2f n=%d evaluated (%.3f, %.3f, %.3f)"
                      "  rest-pose was (%.3f, %.3f, %.3f)"
                      % (bone_name, t, n, g.x, g.y, g.z,
                         raw.x if raw else 0, raw.y if raw else 0,
                         raw.z if raw else 0))
                return g
    finally:
        ev.to_mesh_clear()
    raise SystemExit("no vertices weighted to %s in %s" % (bone_name, body.name))


# ---- build ---------------------------------------------------------------
bs.reset_scene()
bodies = []
total_tris = 0

for body_file, stem, slot, weapons in VARIANTS:
    print("\n=== VARIANT %s ===" % stem)
    new = drop_junk(import_new(os.path.join(INPUT, body_file)))
    meshes = [o for o in new if o.type == "MESH"]
    rigs = [o for o in new if o.type == "ARMATURE"]
    if not meshes or not rigs:
        raise SystemExit("missing mesh or rig in %s" % body_file)
    body = max(meshes, key=lambda o: len(o.data.polygons))
    rig = rigs[0]
    body.name = stem
    body.data.name = stem + "Mesh"
    rig.name = "Armature_" + stem[-2:]
    print("BODY %s  verts %d tris %d  rig %s bones %d  parent=%s"
          % (body.name, len(body.data.vertices), len(body.data.polygons),
             rig.name, len(rig.data.bones),
             body.parent.name if body.parent else "NONE"))

    # textures: per-variant stem, wired by socket name
    wanted = {s: os.path.join(INPUT, stem + SUFFIX[s]) for s in BODY_SOCKETS}
    for mat in [m for m in body.data.materials if m and m.use_nodes]:
        wire(mat, wanted, stem)

    # layout: move this variant's mesh bbox centre onto its slot
    lo, hi = bs.model_bounds(body)
    dx = slot - (lo.x + hi.x) / 2.0
    for o in new:
        if o is rig or under(o, rig):
            continue
        o.location.x += dx
    rig.location.x += dx
    bpy.context.view_layer.update()
    lo, hi = bs.model_bounds(body)
    print("LAYOUT %s dx %+.3f  bbox x %.2f..%.2f  y %.2f..%.2f  z %.2f..%.2f"
          % (stem, dx, lo.x, hi.x, lo.y, hi.y, lo.z, hi.z))

    # weapons, straight from the prefab's bone constraints
    for wpn_file, bone, wname in weapons:
        print("  WEAPON %s -> bone %s" % (wpn_file, bone))
        wnew = drop_junk(import_new(os.path.join(WPN_DIR, wpn_file)))
        wmeshes = [o for o in wnew if o.type == "MESH"]
        if not wmeshes:
            raise SystemExit("no weapon mesh in %s" % wpn_file)
        w = max(wmeshes, key=lambda o: len(o.data.polygons))
        w.name = wname
        w.data.name = wname + "Mesh"
        print("   weapon tris %d" % len(w.data.polygons))

        wwanted = {s: os.path.join(INPUT, "WeaponTrooper" + SUFFIX[s])
                   for s in BODY_SOCKETS}
        for mat in [m for m in w.data.materials if m and m.use_nodes]:
            wire(mat, wwanted, wname)

        grip = grip_on(body, bone)
        # These weapon meshes have their blade along local -Y (NOT +Z like
        # the Maula rifle in 07_build_blend.py), and the character faces -Y,
        # so IDENTITY rotation already points the blade forward.  (Rotating
        # Rx(-90) as for a +Z-barrel gun lifts the blade straight up - seen
        # and fixed in the lineup render.)
        w.rotation_mode = "XYZ"
        w.matrix_world = Matrix.Translation(grip)
        bpy.context.view_layer.update()
        bs.parent_to_bone(w, rig, bone)
        print("   parented to %s  world %s"
              % (bone, tuple(round(v, 3) for v in w.matrix_world.translation)))
        bpy.context.view_layer.update()
        bb = [w.matrix_world @ Vector(c) for c in w.bound_box]
        print("   weapon bbox x %.2f..%.2f  y %.2f..%.2f  z %.2f..%.2f"
              % (min(b.x for b in bb), max(b.x for b in bb),
                 min(b.y for b in bb), max(b.y for b in bb),
                 min(b.z for b in bb), max(b.z for b in bb)))

    bodies.append(body)
    total_tris += len(body.data.polygons)

weapon_tris = sum(len(o.data.polygons) for o in bpy.data.objects
                  if o.type == "MESH" and o not in bodies)
print("\nTRIS bodies %d + weapons %d = %d"
      % (total_tris, weapon_tris, total_tris + weapon_tris))

# ---- world / lights / camera over the whole lineup -----------------------
lo = Vector((1e9, 1e9, 1e9))
hi = Vector((-1e9, -1e9, -1e9))
for b in bodies:
    blo, bhi = bs.model_bounds(b)
    lo = Vector((min(lo.x, blo.x), min(lo.y, blo.y), min(lo.z, blo.z)))
    hi = Vector((max(hi.x, bhi.x), max(hi.y, bhi.y), max(hi.z, bhi.z)))
centre = (lo + hi) / 2
span = max(hi.x - lo.x, hi.y - lo.y, hi.z - lo.z) * 1.18
print("LINEUP bbox x %.2f..%.2f  y %.2f..%.2f  z %.2f..%.2f  ortho %.2f"
      % (lo.x, hi.x, lo.y, hi.y, lo.z, hi.z, span))

bs.setup_world(strength=1.8, color=(0.55, 0.58, 0.64))
bs.setup_lights(sun_energy=3.0, fill_energy=120)
bs.setup_render(1600, 900)
cam = bs.setup_camera(target=centre, ortho_scale=span, direction=(0.55, -0.75, 0.10),
                      distance=span * 2.5)
for r in [o for o in bpy.data.objects if o.type == "ARMATURE"]:
    r.show_in_front = True

# ---- purge orphaned images, then pack ------------------------------------
for img in list(bpy.data.images):
    if img.users == 0:
        bpy.data.images.remove(img)
packed = bs.pack_all_images()
print("packed %d images" % packed)

os.makedirs(os.path.dirname(OUT), exist_ok=True)
bpy.ops.wm.save_as_mainfile(filepath=os.path.abspath(OUT), compress=True)
print("SAVED %s (%.2f MB)" % (OUT, os.path.getsize(OUT) / 1e6))

# ---- lineup showcase renders (landscape, whole group) --------------------
os.makedirs(SHOTS, exist_ok=True)
for name, d in (("lineup_front", (0.0, -1.0, 0.0)),
                ("lineup_three_quarter", (0.7, -0.7, 0.06)),
                ("lineup_back", (0.0, 1.0, 0.0))):
    cam.location = centre + Vector(d).normalized() * span * 2.5
    cam.rotation_euler = (centre - cam.location).to_track_quat("-Z", "Y").to_euler()
    bs.render_to(os.path.join(SHOTS, name + ".png"), cam)
print("DONE")
