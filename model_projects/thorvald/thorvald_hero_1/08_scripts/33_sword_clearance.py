"""Round 14: how much of each katana blade passes through Karlin's own body, per clip, and how that changes with
blade length and the off-hand sword's mount angle. Only these two knobs ship to the game without custom clips
(the DualSwords clips drive B_Weapon / B_Weapon_L; the prefab sets each sword's constant local offset and model).

  blender -b --factory-startup --python 33_sword_clearance.py -- <two_swords.blend> [--scales 1,0.85,0.75]
          [--rot2 "0,0,0;0,0,20"]   (sword-2 extra rotation, degrees about its grip, local XYZ)

Blade samples (10) run from 0.20 m past the grip (Kit_hands ignored) to the tip; a sample is "inside" when the nearest character surface
(every mesh except the swords) is within 0.08 m and the sample sits behind it (normal dot < -0.004).
Prints, per (scale, rot2), the share of frames with any blade sample inside, and the inside-sample total.
"""
import argparse
import math
import sys

import bpy
from mathutils import Euler, Matrix, Vector
from mathutils.bvhtree import BVHTree

ap = argparse.ArgumentParser()
ap.add_argument("blend")
ap.add_argument("--scales", default="1,0.85,0.75")
ap.add_argument("--rot2", default="0,0,0")
ap.add_argument("--rot1", default="0,0,0", help="sword-1 extra rotation(s), same format as --rot2; swept jointly")
ap.add_argument("--clips", default="DualSwords_Run,DualSwords_AttackMelee01,DualSwords_FightIdle")
a = ap.parse_args(sys.argv[sys.argv.index("--") + 1:])
bpy.ops.wm.open_mainfile(filepath=a.blend)
sc = bpy.context.scene
rig = bpy.data.objects["Rig"]
swords = [bpy.data.objects["Thorvald_Katana"], bpy.data.objects["Thorvald_Katana_2"]]
body = [o for o in bpy.data.objects if o.type == "MESH" and o not in swords and o.name != "Kit_hands"]
GRIP = Vector((0.0, 0.144, 0.0))
ytip = min(v.co.y for v in swords[0].data.vertices)   # the blade runs along -Y from the grip (hilt is +Y)
BLADE = GRIP.y - ytip
scales = [float(s) for s in a.scales.split(",")]
def eul(r):
    return Euler([math.radians(float(v)) for v in r.split(",")]).to_matrix().to_4x4()


rots = [(r1, r2, eul(r1), eul(r2)) for r1 in a.rot1.split(";") for r2 in a.rot2.split(";")]

samples = {}   # clip -> list of (bvh, [sword matrix_world])
for clip in a.clips.split(","):
    act = bpy.data.actions[clip]
    rig.animation_data.action = act
    fr = []
    for f in range(int(act.frame_range[0]), int(act.frame_range[1]) + 1):
        sc.frame_set(f)
        dg = bpy.context.evaluated_depsgraph_get()
        vs, fs = [], []
        for o in body:
            e = o.evaluated_get(dg)
            m = e.to_mesh()
            n0 = len(vs)
            vs += [e.matrix_world @ v.co for v in m.vertices]
            fs += [tuple(n0 + i for i in p.vertices) for p in m.polygons]
            e.to_mesh_clear()
        owner = []
        for o in body:
            owner += [o.name] * len(o.evaluated_get(dg).data.polygons)
        fr.append((f, BVHTree.FromPolygons(vs, fs), [w.matrix_world.copy() for w in swords], owner))
    samples[clip] = fr


def inside(bvh, p):
    hit, n, i, _ = bvh.find_nearest(p, 0.08)
    return i if hit is not None and (p - hit).dot(n) < -0.004 else None


G = Matrix.Translation(GRIP)
for s in scales:
    for r1s, r2s, R1, R2 in rots:
        line = []
        for clip, fr in samples.items():
            for k in (0, 1):
                bad_f, tot, worst, hits = 0, 0, (0, 0), {}
                # samples from 0.20 m past the grip (clear of the gauntlet) to the (scaled) tip; mesh is unscaled
                # in world units, so scaling about the grip shortens the blade without moving the hand
                ys = [GRIP.y - (0.20 + j * (s * BLADE - 0.20) / 9) / s for j in range(10)]
                for f, bvh, mw, owner in fr:
                    M = mw[k] @ G @ (R2 if k == 1 else R1) @ Matrix.Scale(s, 4) @ G.inverted()
                    hs = [inside(bvh, M @ Vector((0.0, y, 0.0))) for y in ys]
                    hs = [owner[h] for h in hs if h is not None]
                    for h in hs:
                        hits[h] = hits.get(h, 0) + 1
                    n = len(hs)
                    bad_f += n > 0
                    tot += n
                    worst = max(worst, (n, f))
                line.append("%s/%s %2d/%2d fr (%3d, worst f%d) %s" % (clip.split("_")[1][:6], "R" if k == 0 else "L",
                            bad_f, len(fr), tot, worst[1],
                            ",".join("%s:%d" % (h.replace("Kit_", "")[:8], c) for h, c in sorted(hits.items(), key=lambda t: -t[1])[:3])))
        print("CLEAR s=%.2f rot1=%s rot2=%s" % (s, r1s, r2s))
        for ln in line:
            print("   " + ln)
