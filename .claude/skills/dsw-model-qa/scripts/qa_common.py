"""Shared helpers for the dsw-model-qa scripts (run inside Blender or with the bpy module via bl.py)."""
import os
import sys

import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
SKILLS = os.path.dirname(os.path.dirname(HERE))
REPO = os.path.dirname(os.path.dirname(SKILLS))
sys.path.insert(0, os.path.join(SKILLS, "dsw-new-unit", "scripts"))
import blender_scene as bs  # noqa: E402,F401  (render / camera helpers)
import preview_wiring as PW  # noqa: E402  (matte, game-like material wiring)


def args():
    return sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else []


def opt(a, name, default=None, cast=str):
    return cast(a[a.index(name) + 1]) if name in a else default


def opts(a, name):
    """All values of a repeatable option (--clip X --clip Y)."""
    return [a[i + 1] for i, x in enumerate(a) if x == name]


def drop_objects(substrings):
    """Remove objects whose name contains any substring (a weapon in its rest pose at the feet, helpers).  Removed, not hidden:
    scene.ray_cast still hits hide_render objects."""
    for o in list(bpy.data.objects):
        if o.type == "MESH" and any(s in o.name for s in substrings):
            bpy.data.objects.remove(o, do_unlink=True)


def meshes():
    return [o for o in bpy.data.objects if o.type == "MESH" and not o.hide_render]


def bounds(objs=None):
    dg = bpy.context.evaluated_depsgraph_get()
    lo = Vector((9e9,) * 3); hi = Vector((-9e9,) * 3)
    for o in objs or meshes():
        ev = o.evaluated_get(dg); me = ev.to_mesh()
        for v in me.vertices:
            p = ev.matrix_world @ v.co
            lo = Vector(map(min, lo, p)); hi = Vector(map(max, hi, p))
        ev.to_mesh_clear()
    return lo, hi


def rig():
    return next(o for o in bpy.data.objects if o.type == "ARMATURE")


def find_anim_dir(blend_path):
    """<project>/05_fbx_export/anim above the blend (the unit projects' layout)."""
    d = os.path.dirname(os.path.abspath(blend_path))
    for _ in range(6):
        cand = os.path.join(d, "05_fbx_export", "anim")
        if os.path.isdir(cand):
            return cand
        d = os.path.dirname(d)
    return None


def pose_clip(clip, frame, anim_dir):
    """Put the unit's rig into frame `frame` of a clip FBX (Common_Run, Sniper_AttackRange, ... or a full path).
    Blender 5: a layered action needs its slot set, or the rig silently stays in rest pose."""
    path = clip if clip.endswith(".fbx") else os.path.join(anim_dir, clip + ".fbx")
    before = set(bpy.data.objects)
    bpy.ops.import_scene.fbx(filepath=path)
    new = [o for o in bpy.data.objects if o not in before]
    src = next(o for o in new if o.type == "ARMATURE")
    act = src.animation_data.action
    for o in new:
        bpy.data.objects.remove(o, do_unlink=True)
    r = rig(); r.animation_data_create(); r.animation_data.action = act
    if hasattr(r.animation_data, "action_slot") and len(getattr(act, "slots", [])):
        r.animation_data.action_slot = act.slots[0]
    bpy.context.scene.frame_set(int(frame)); bpy.context.view_layer.update()


def matte(culling=True):
    """Game-like preview: matte wiring, neutral world, back faces culled (the game culls them; Blender's default render does not,
    which hides inward-wound faces and see-through holes)."""
    PW.apply_all()
    for m in bpy.data.materials:
        m.use_backface_culling = culling
    for o in [o for o in bpy.data.objects if o.type == "CAMERA"]:
        bpy.data.objects.remove(o, do_unlink=True)
