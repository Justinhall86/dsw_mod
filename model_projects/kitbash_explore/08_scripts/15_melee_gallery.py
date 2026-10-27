"""Mount every melee weapon on the Ginaz Captain and render it through the attack clips.

    blender.exe --python 15_melee_gallery.py -- <scene.blend> <out_dir> [--check] [--only Name1,Name2]

  --check   one still per weapon (middle of Duncan_AttackMelee01), into <out_dir>/check/
  (default) every frame (step 2) of each clip, into <out_dir>/<Weapon>/<Clip>/f<NNN>.png

Weapons come from 05_fbx_export/melee/melee_weapons.json (14_melee_textures.py writes it).

Mount rule, the same one 11_sword_anim.py validated on the TallSword, now per weapon:
  * G  = the grip, in mesh-data coordinates.  Where the origin is the grip, G = origin.  Where the origin
         sits on one end (the pommel or the butt), G is 0.10 m in from it along the blade (0.3 of the
         length for a spear).
  * D  = the blade direction: the long-axis side with the larger reach from the origin.  If D is +Y the
         weapon is turned 180 deg about Z so the blade points along -Y.
  * world = T(P) @ Rx(90) @ Rz @ S @ T(-G)  (P = where the grip sits in the rest pose, the TallSword's value)
    The weapon is parented to B_Weapon, so the clips carry it into the hand.
"""
import json
import math
import os
import sys
import traceback

import bmesh
import bpy
from mathutils import Matrix, Vector

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
sys.path.insert(0, HERE)
import blender_scene as bs  # noqa: E402

args = sys.argv[sys.argv.index("--") + 1:]
SCENE = os.path.abspath(args[0])
OUT = os.path.abspath(args[1])
CHECK = "--check" in args
ONLY = args[args.index("--only") + 1].split(",") if "--only" in args else None

MANIFEST = os.path.join(PROJ, "05_fbx_export", "melee", "melee_weapons.json")
ANIM = os.path.join(PROJ, "05_fbx_export", "anim")
CLIPS = ["Duncan_AttackMelee01", "Duncan_AttackMelee02", "Common_AttackMelee03"]
BONE = "B_Weapon"
HAND_POINT = Vector((0.0, 0.03, 0.12))         # grip position in the rest pose (TallSword value)
SCALE = {"Knife01": 0.1, "Knife02": 0.1}       # game meshes are 7.5 m and 9 m long; scaled to ~0.8 m
RX90 = Matrix.Rotation(math.radians(90.0), 4, "X")
RZ180 = Matrix.Rotation(math.pi, 4, "Z")


def mount_transform(name, obj, info):
    """Return (world matrix for the rest pose, grip G, blade direction D, reach) for one weapon."""
    ys = [v.co.y for v in obj.data.vertices]
    lo, hi = min(ys), max(ys)
    length = hi - lo
    up = hi > -lo                              # the longer reach from the origin is the blade
    D = Vector((0.0, 1.0 if up else -1.0, 0.0))
    if min(abs(lo), abs(hi)) < 0.03:           # origin on one end: pommel or butt
        G = D * (0.3 * length if length > 1.8 else 0.10)
    else:                                      # origin is the grip
        G = Vector((0.0, 0.0, 0.0))
    if info.get("grip"):                       # explicit grip point from the manifest
        G = Vector(info["grip"])
    R = RZ180 if up else Matrix.Identity(4)
    S = Matrix.Scale(SCALE.get(name, 1.0), 4)
    M = Matrix.Translation(HAND_POINT) @ RX90 @ R @ S @ Matrix.Translation(-G)
    return M, G, D, (lo, hi)


def ensure_active(rig):
    """The FBX importer needs an active object, or it fails in build_hierarchy."""
    view_layer = bpy.context.view_layer
    view_layer.active_layer_collection = view_layer.layer_collection
    for o in view_layer.objects:
        o.select_set(False)
    rig.select_set(True)
    view_layer.objects.active = rig


def fbx_import(path):
    """Run the FBX importer with a window and 3D-view context, as the GUI needs for its mode_set calls."""
    win = bpy.context.window_manager.windows[0]
    area = next(a for a in win.screen.areas if a.type == "VIEW_3D")
    with bpy.context.temp_override(window=win, area=area):
        bpy.ops.import_scene.fbx(filepath=path)


def loose_parts(bm):
    """Yield each connected set of faces (a loose part) of a bmesh."""
    bm.faces.ensure_lookup_table()
    seen = set()
    for f in bm.faces:
        if f.index in seen:
            continue
        stack, comp = [f], []
        seen.add(f.index)
        while stack:
            cur = stack.pop()
            comp.append(cur)
            for e in cur.edges:
                for nb in e.link_faces:
                    if nb.index not in seen:
                        seen.add(nb.index)
                        stack.append(nb)
        yield comp


def drop_parts(obj, label, should_drop):
    """Delete the loose parts for which should_drop(min_y, max_y, width_x, total_length) is true."""
    bm = bmesh.new()
    bm.from_mesh(obj.data)
    total = max(v.co.y for v in bm.verts) - min(v.co.y for v in bm.verts)
    drop = []
    for comp in loose_parts(bm):
        vs = {v for g in comp for v in g.verts}
        ys = [v.co.y for v in vs]
        xs = [v.co.x for v in vs]
        if should_drop(min(ys), max(ys), max(xs) - min(xs), total):
            drop += comp
    print("   %s: dropping %d faces of %d" % (label, len(drop), len(bm.faces)))
    bmesh.ops.delete(bm, geom=drop, context="FACES")
    bm.to_mesh(obj.data)
    bm.free()
    obj.data.update()


def keep_long_parts(obj, min_fraction=0.6):
    """Blade only: drop every loose part shorter than min_fraction of the weapon (the hilt, guard and pommel)."""
    drop_parts(obj, "BLADE ONLY", lambda y0, y1, w, total: y1 - y0 < min_fraction * total)


def drop_flourish(obj, above_y, wider_than):
    """Drop the ornate guard: loose parts that start above above_y and are wider than wider_than (keeps grip, pommel, bar)."""
    drop_parts(obj, "FLOURISH", lambda y0, y1, w, total: y0 > above_y and w > wider_than)


def import_weapon(rig, name, info):
    ensure_active(rig)
    before = set(bpy.data.objects)
    fbx_import(info["fbx"])
    new = [o for o in bpy.data.objects if o not in before]
    meshes = [o for o in new if o.type == "MESH" and not o.name.lower().startswith("cube")]
    if not meshes:
        raise RuntimeError("no mesh in %s" % info["fbx"])
    obj = max(meshes, key=lambda o: len(o.data.vertices))
    obj.parent = None
    for o in new:
        if o is not obj:
            bpy.data.objects.remove(o, do_unlink=True)
    obj.name = name
    obj.data.name = name
    if info.get("blade_only"):
        keep_long_parts(obj)
    if info.get("drop_flourish"):
        drop_flourish(obj, **info["drop_flourish"])
    return obj


def dress(obj, info):
    wanted = {"Base Color": info["Albedo"], "Specular IOR Level": info["MetallicGlossAO"]}
    if info.get("Normal"):
        wanted["Normal"] = info["Normal"]
    for mat in obj.data.materials:
        if mat and mat.use_nodes:
            print("   MAT", mat.name, bs.wire_textures(mat, wanted))


def load_clip(rig, clip):
    ensure_active(rig)
    before = set(bpy.data.objects)
    fbx_import(os.path.join(ANIM, clip + ".fbx"))
    new = [o for o in bpy.data.objects if o not in before]
    action = next(o for o in new if o.type == "ARMATURE").animation_data.action
    for o in new:
        bpy.data.objects.remove(o, do_unlink=True)
    return action


def rest_pose(rig):
    """Mount in the true rest pose: the saved scene keeps a stale posed bone, which would shift every mount."""
    for pb in rig.pose.bones:
        pb.location = Vector((0.0, 0.0, 0.0))
        pb.scale = Vector((1.0, 1.0, 1.0))
        if pb.rotation_mode == "QUATERNION":
            pb.rotation_quaternion = (1.0, 0.0, 0.0, 0.0)
        elif pb.rotation_mode == "AXIS_ANGLE":
            pb.rotation_axis_angle = (0.0, 0.0, 1.0, 0.0)
        else:
            pb.rotation_euler = (0.0, 0.0, 0.0)
    bpy.context.view_layer.update()


def play(rig, action):
    rig.animation_data_create()
    rig.animation_data.action = action
    if getattr(action, "slots", None):
        rig.animation_data.action_slot = action.slots[0]


def frame_cam(rig, cam):
    pel = rig.matrix_world @ rig.pose.bones["B_ROOTJ"].head
    cam.location = Vector((pel.x - 4, pel.y - 3.6, pel.z + 0.55))
    cam.rotation_euler = (Vector((pel.x, pel.y, pel.z + 0.25)) - cam.location).to_track_quat("-Z", "Y").to_euler()


def render(sc, path):
    os.makedirs(os.path.dirname(path), exist_ok=True)
    sc.render.filepath = path
    bpy.ops.render.render(write_still=True)


def purge(obj, images_before, materials_before):
    mesh = obj.data
    mats = list(mesh.materials)
    bpy.data.objects.remove(obj, do_unlink=True)
    bpy.data.meshes.remove(mesh)
    for m in mats:
        if m and m not in materials_before and m.users == 0:
            bpy.data.materials.remove(m)
    for img in list(bpy.data.images):
        if img not in images_before and img.users == 0:
            bpy.data.images.remove(img)
    for me in list(bpy.data.meshes):
        if me.users == 0:
            bpy.data.meshes.remove(me)


def main():
    bpy.ops.wm.open_mainfile(filepath=SCENE)
    print("OPENED", SCENE)

    rig = bpy.data.objects["Armature"]
    for o in [o for o in bpy.data.objects if o.type == "CAMERA"]:
        bpy.data.objects.remove(o, do_unlink=True)
    old_sword = bpy.data.objects.get("TallSword")
    if old_sword is not None:
        bpy.data.objects.remove(old_sword, do_unlink=True)

    sc = bs.setup_render(540, 540)
    sc.render.film_transparent = False
    cd = bpy.data.cameras.new("anim_cam")
    cam = bpy.data.objects.new("anim_cam", cd)
    bpy.context.collection.objects.link(cam)
    cd.type, cd.ortho_scale = "ORTHO", 4.0      # wide enough for the 2.2 m spears and halberd
    sc.camera = cam

    actions = {c: load_clip(rig, c) for c in CLIPS}
    print("CLIPS", {c: (int(a.frame_range[0]), int(a.frame_range[1])) for c, a in actions.items()})
    manifest = json.load(open(MANIFEST))
    names = ONLY or sorted(manifest)

    for name in names:
        info = manifest[name]
        images_before = set(bpy.data.images)
        materials_before = set(bpy.data.materials)
        obj = None
        try:
            rig.animation_data_create()
            rig.animation_data.action = None
            sc.frame_set(0)
            rest_pose(rig)
            obj = import_weapon(rig, name, info)
            dress(obj, info)
            M, G, D, (lo, hi) = mount_transform(name, obj, info)
            pb = rig.pose.bones[BONE]
            obj.parent = rig
            obj.parent_type = "BONE"
            obj.parent_bone = BONE
            obj.matrix_parent_inverse = Matrix.Translation((0.0, -pb.bone.length, 0.0))
            bpy.context.view_layer.update()
            obj.matrix_world = M
            bpy.context.view_layer.update()
            print("MOUNT %-16s reach %.3f..%.3f  G %s  D %s" % (
                name, lo, hi, tuple(round(c, 3) for c in G), tuple(round(c, 1) for c in D)))

            if CHECK:
                play(rig, actions[CLIPS[0]])
                f0, f1 = (int(v) for v in actions[CLIPS[0]].frame_range)
                sc.frame_set((f0 + f1) // 2)
                frame_cam(rig, cam)
                render(sc, os.path.join(OUT, "check", name + ".png"))
            else:
                for clip in CLIPS:
                    play(rig, actions[clip])
                    f0, f1 = (int(v) for v in actions[clip].frame_range)
                    d = os.path.join(OUT, name, clip)
                    for f in range(f0, f1 + 1, 2):
                        sc.frame_set(f)
                        frame_cam(rig, cam)
                        render(sc, os.path.join(d, "f%03d.png" % f))
                    print("   CLIP", clip, f0, f1)
        except Exception:
            traceback.print_exc()
        finally:
            rig.animation_data.action = None
            if obj is not None:
                purge(obj, images_before, materials_before)
        print("DONE", name)

    print("GALLERY DONE")


def run_and_quit():
    try:
        main()
    except Exception:
        traceback.print_exc()
    finally:
        print("quitting Blender")
        bpy.ops.wm.quit_blender()
    return None


if bpy.app.background:
    run_and_quit()
else:
    # The FBX importer's mode_set needs a window context, which only exists once the GUI is up.
    bpy.app.timers.register(run_and_quit, first_interval=3.0)
