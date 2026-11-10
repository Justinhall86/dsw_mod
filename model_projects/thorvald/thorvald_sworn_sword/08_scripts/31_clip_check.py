"""Count kit / wrap verts that end up inside the body during real clips (every 2nd frame), so the tail clearance and
weights can be tuned by number.  Inside = nearest body surface point's normal faces away from the vertex.

    blender -b --python 31_clip_check.py -- <SwornSword_TAG.blend> [clip ...]
"""
import os
import sys

import bpy
from mathutils.bvhtree import BVHTree

HERE = os.path.dirname(os.path.abspath(__file__))
args = sys.argv[sys.argv.index("--") + 1:]
BLEND = os.path.abspath(args[0])
ANIM = os.path.join(HERE, os.pardir, os.pardir, "thorvald_trooper", "05_fbx_export", "anim")
clips = args[1:] or ["Common_Run", "Common_AttackMelee01", "Common_AttackMelee02", "Common_FightIdle",
                     "Common_FightHitFront"]
BODY = ("Gurney", "TrooperNeck", "CommandoHead", "DuncanFill_legs")
TEST = {"SwornTail": None, "SwornWrap": None, "SwornSash": None, "SwornMask": None, "SwornHelmet": None}
tot = {}
for clip in clips:
    bpy.ops.wm.open_mainfile(filepath=BLEND)
    sc = bpy.context.scene
    rig = bpy.data.objects["Armature"]
    before = set(bpy.data.objects)
    bpy.ops.import_scene.fbx(filepath=os.path.join(ANIM, clip + ".fbx"))
    new = [o for o in bpy.data.objects if o not in before]
    action = next(o for o in new if o.type == "ARMATURE").animation_data.action
    rig.animation_data_create()
    rig.animation_data.action = action
    if getattr(action, "slots", None):
        rig.animation_data.action_slot = action.slots[0]
    for o in new:
        bpy.data.objects.remove(o, do_unlink=True)
    f0, f1 = int(action.frame_range[0]), int(action.frame_range[1])
    worst = {k: (0, 0, 0.0) for k in TEST}
    for f in range(f0, f1 + 1, 2):
        sc.frame_set(f)
        deps = bpy.context.evaluated_depsgraph_get()
        bv, bf = [], []
        for n in BODY:
            o = bpy.data.objects[n].evaluated_get(deps)
            m = o.to_mesh()
            base = len(bv)
            bv += [o.matrix_world @ v.co for v in m.vertices]
            bf += [tuple(base + i for i in p.vertices) for p in m.polygons]
            o.to_mesh_clear()
        bvh = BVHTree.FromPolygons(bv, bf)
        for n in TEST:
            o = bpy.data.objects[n].evaluated_get(deps)
            m = o.to_mesh()
            ins, deep = 0, 0.0
            for v in m.vertices:
                p = o.matrix_world @ v.co
                hit, nrm, _, d = bvh.find_nearest(p, 0.08)
                if hit is not None and (p - hit).dot(nrm) < 0:
                    ins += 1
                    deep = max(deep, d)
            o.to_mesh_clear()
            if ins > worst[n][0]:
                worst[n] = (ins, f, deep)
    for n, (ins, f, deep) in worst.items():
        print("CLIP %-22s %-16s worst frame %3d: %4d verts inside (deepest %.1f cm)" % (clip, n, f, ins, deep * 100))
        tot[n] = tot.get(n, 0) + ins
print("TOTAL", tot)
