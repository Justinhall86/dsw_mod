"""Round 14 motion pass: re-weight B so armour moves as armour (34_plate_rigidity.py measured the shells, lames and
chest plates crumpling 5-10 cm in the DualSwords attack, which reads as rubber).

  blender -b --factory-startup --python 27_motion_pass.py -- --src hero_S2 --tag S2m [--fan 0.12] [--chest 0.7]
          [--smooth 4] [--cloth-smooth 8]

  * shoulder assembly, per side: Iakin's shell pieces (ClavicleJ/ShoulderJ-dominant, |x| >= 0.12), the shoulder
    insignia and every lame get ONE shared weight set (the mean of the shell's own weights, top 3 bones) - so shell,
    lames and insignia move as one rigid pauldron and can no longer shear apart or crush together
    The shared set keeps only the shell's two strongest non-arm bones (ClavicleJ + SpineTopJ): M1 kept its 12 %
    ShoulderJ share and the shell still sheared 6 cm in the attack (linear blend skinning of a clavicle+arm mix is not
    rigid when the arm swings 90+ degrees); --shell-arm restores it
  * lame fan (--fan, default 0): lame t additionally follows the upper arm by fan*t (B_xShoulderJ). Tried at 0.12 in
    M1: same shear problem, worse (lames 8.6 cm), so off by default
  * gorget (Kit_neck): 80 % toward SpineTopJ 0.6 / Neck01J 0.4, so head turns no longer twist it
  * chest/back plates (SpineTopJ/Spine02J-dominant, |x| < 0.2): optionally pulled toward their own plate's mean by
    --chest (default 0: at 0.7 in M2 the seams between plates split), then smoothed; every seam (vertices coinciding
    at rest across pieces) is welded to one weight set so it cannot open; the chest emblem copies the weights of
    the surface under it
  * everything else on Iakin + bracers + knee plates: --smooth Laplacian passes of the weights within each piece
  * apron and thigh cloth (Kit_apron, Kit_leg_0 hip pieces): --cloth-smooth passes (softer folds, no kinks)
  * declutter (M4; --no-declutter skips it): Iakin's own hands/wrists, hidden under the gauntlets, are removed, and
    near-coincident layers get a real gap (separate()): boot tops 5 mm behind the shin guards, bracers 5 mm over the
    gauntlet cuffs, lame tops 4 mm under the shell and each other, insignia 4 mm proud, the apron 10 mm clear of the
    thighs. These pairs sat within 6 mm at rest and flickered (z-fought) or poked through once skinning moved them.

Reads 03_blender/nudge/B_<src>.blend, writes 03_blender/nudge/B_hero_<tag>.blend (22_mount_two_swords.py
--nudge hero_<tag> mounts the swords on it).
"""
import argparse
import os
import sys
from collections import defaultdict

import bpy
from mathutils.bvhtree import BVHTree
from mathutils.kdtree import KDTree

sys.path.insert(0, r"C:\Users\justi\Python\dsw_mod\.claude\skills\dsw-part-kitbash\scripts")
import dsw_parts as P  # noqa: E402

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
ap = argparse.ArgumentParser()
ap.add_argument("--src", required=True)
ap.add_argument("--tag", required=True)
ap.add_argument("--fan", type=float, default=0.0)
ap.add_argument("--shell-arm", action="store_true",
                help="keep the shell's ShoulderJ share (M1); default drops it: LBS of clavicle+arm shears the shell")
ap.add_argument("--chest", type=float, default=0.0)
ap.add_argument("--smooth", type=int, default=4)
ap.add_argument("--cloth-smooth", type=int, default=8)
ap.add_argument("--no-declutter", action="store_true", help="skip the hidden-hand removal and layer separation (M3)")
a = ap.parse_args(P.script_args())
SRC = os.path.join(PROJ, "03_blender", "nudge", "B_%s.blend" % a.src)
OUT = os.path.join(PROJ, "03_blender", "nudge", "B_hero_%s.blend" % a.tag)

bpy.ops.wm.open_mainfile(filepath=SRC)
rig = bpy.data.objects["Rig"]
pose_mode = rig.data.pose_position
rig.data.pose_position = "REST"
bpy.context.view_layer.update()
body = bpy.data.objects["Iakin_H_Hero_2_00"]


def separate(mover, ref, side, gap, search):
    """Layer separation at rest: every vertex of `mover` within `search` of `ref`'s surface is moved along ref's
    normal until it sits `gap` in front of it (side="front") or behind it (side="behind"). Near-coincident layers
    z-fight (flicker) as soon as skinning moves them a millimetre apart, so they need a real gap."""
    mw, inv = mover.matrix_world, mover.matrix_world.inverted()
    bvh = BVHTree.FromPolygons([ref.matrix_world @ v.co for v in ref.data.vertices],
                               [tuple(q.vertices) for q in ref.data.polygons])
    n_moved = 0
    for v in mover.data.vertices:
        p = mw @ v.co
        h, nrm, _, _ = bvh.find_nearest(p, search)
        if h is None:
            continue
        d = (p - h).dot(nrm)
        if side == "front" and d < gap:
            v.co = inv @ (p + nrm * (gap - d))
            n_moved += 1
        elif side == "behind" and d > -gap:
            v.co = inv @ (p - nrm * (gap + d))
            n_moved += 1
    mover.data.update()
    print("SEPARATE %-18s %-6s %-18s gap %.0f mm: %d verts" % (mover.name, side, ref.name, gap * 1000, n_moved))


if not a.no_declutter:
    # Iakin's own hands and wrists were still under the Gurney gauntlets (Kit_hands): 110 coincident verts each way,
    # the red flicker on the hands in motion. Drop every Iakin piece past the forearm that is hand/wrist-driven.
    gn = {g.index: g.name for g in body.vertex_groups}
    drop = set()
    for idx in P.components(body):
        acc = defaultdict(float)
        for i in idx:
            for g in body.data.vertices[i].groups:
                acc[gn[g.group]] += g.weight
        dom = max(acc, key=acc.get) if acc else ""
        c = sum((body.data.vertices[i].co for i in idx), body.data.vertices[0].co * 0) / len(idx)
        if abs(c.x) > 0.6 and any(k in dom for k in ("Finger", "Thumb", "PalmJ", "WristJ")):
            drop |= set(idx)
    P.delete_verts(body, drop)
    print("HIDDEN HANDS removed %d Iakin verts" % len(drop))
    O = bpy.data.objects
    separate(O["Kit_leg_1"], O["Kit_leg_0"], "behind", 0.005, 0.008)   # boot tops under the shin guards
    separate(O["Kit_apron"], O["Kit_leg_0"], "front", 0.010, 0.025)    # apron clear of the thighs (run stride)
    separate(O["Kit_bracers"], O["Kit_hands"], "front", 0.005, 0.008)  # bracers over the gauntlet cuffs
    for t in (1, 2):
        separate(O["Kit_lame_%d" % t], body, "behind", 0.004, 0.007)     # lame tops tucked under the shell
    separate(O["Kit_lame_2"], O["Kit_lame_1"], "behind", 0.004, 0.007)
    for nm in ("Kit_emblem", "Kit_emblem_shoulder_l", "Kit_emblem_shoulder_r"):
        separate(O[nm], body, "front", 0.004, 0.008)                    # insignia never sink into the plate


def read_w(ob):
    gn = {g.index: g.name for g in ob.vertex_groups}
    return [{gn[g.group]: g.weight for g in v.groups if g.weight > 1e-4} for v in ob.data.vertices]


def write_w(ob, W, idx):
    for i in idx:
        for g in ob.vertex_groups:
            g.remove([i])
        for nm, w in W[i].items():
            g = ob.vertex_groups.get(nm) or ob.vertex_groups.new(name=nm)
            g.add([i], w, "REPLACE")


def norm(d, top=None):
    items = sorted(d.items(), key=lambda t: -t[1])[:top] if top else list(d.items())
    s = sum(w for _, w in items) or 1.0
    return {k: w / s for k, w in items if w / s > 1e-3}


def mean(W, idx, top=3):
    acc = defaultdict(float)
    for i in idx:
        for k, w in W[i].items():
            acc[k] += w
    return norm(acc, top)


def lerp(d0, d1, t):
    keys = set(d0) | set(d1)
    return norm({k: (1 - t) * d0.get(k, 0.0) + t * d1.get(k, 0.0) for k in keys}, 4)


def smooth(ob, W, idx, n, lam=0.5):
    idx = set(idx)
    nb = defaultdict(list)
    for e in ob.data.edges:
        i, j = e.vertices
        if i in idx and j in idx:
            nb[i].append(j)
            nb[j].append(i)
    for _ in range(n):
        new = {}
        for i in idx:
            if nb[i]:
                m = defaultdict(float)
                for j in nb[i]:
                    for k, w in W[j].items():
                        m[k] += w / len(nb[i])
                new[i] = lerp(W[i], m, lam)
        for i, d in new.items():
            W[i] = d


def weld_groups(ob, tol=0.002):
    """Vertices that coincide at rest across separate pieces (the seams between plates). Union-find over a KD-tree."""
    vs = ob.data.vertices
    kd = KDTree(len(vs))
    for i, v in enumerate(vs):
        kd.insert(v.co, i)
    kd.balance()
    par = list(range(len(vs)))

    def find(i):
        while par[i] != i:
            par[i] = par[par[i]]
            i = par[i]
        return i
    for i, v in enumerate(vs):
        for _, j, _ in kd.find_range(v.co, tol):
            par[find(i)] = find(j)
    g = defaultdict(list)
    for i in range(len(vs)):
        g[find(i)].append(i)
    return [m for m in g.values() if len(m) > 1]


def weld(W, groups, locked):
    """Give every seam group ONE weight set so the seam cannot split: a locked member (the rigid pauldron) wins,
    otherwise the members' average."""
    for m in groups:
        lk = [i for i in m if i in locked]
        d = dict(W[lk[0]]) if lk else mean(W, m, 4)
        for i in m:
            W[i] = dict(d)


def side_of(d):
    l = sum(w for k, w in d.items() if k.startswith("B_l"))
    r = sum(w for k, w in d.items() if k.startswith("B_r"))
    return "l" if l > r else "r"


def centre(ob, idx):
    ps = [ob.data.vertices[i].co for i in idx]
    return sum(ps, ps[0] * 0) / len(ps)


def dominant(d):
    return max(d, key=d.get) if d else ""


Wb = read_w(body)
comps = P.components(body)
shell = {"l": [], "r": []}
chest = []
rest = []
for idx in comps:
    m = mean(Wb, idx, None)
    dom = dominant(m)
    dom_s = dom[3:] if dom[:3] in ("B_l", "B_r") else dom[2:]
    c = centre(body, idx)
    if dom_s in ("ClavicleJ", "ShoulderJ") and abs(c.x) >= 0.12:
        shell[side_of(m)].append(idx)
    elif dom_s in ("SpineTopJ", "Spine02J") and abs(c.x) < 0.2:
        chest.append(idx)
    else:
        rest.append(idx)

# --- shoulder assembly -----------------------------------------------------------------------------------------
pauldron = {}
locked = set()
for s in ("l", "r"):
    ids = [i for idx in shell[s] for i in idx]
    m = mean(Wb, ids, None)
    if not a.shell_arm:
        m = {k: w for k, w in m.items() if not k.endswith("ShoulderJ")}
    pauldron[s] = norm(m, 2)
    for i in ids:
        Wb[i] = dict(pauldron[s])
    locked |= set(ids)
    print("PAULDRON %s: %d shell verts -> %s" % (s, len(ids), {k: round(w, 2) for k, w in pauldron[s].items()}))

# --- chest / back plates ---------------------------------------------------------------------------------------
# M2 pulled each chest plate 70 % to its own mean and the seams between plates split open (dark cracks across the
# chest in the attack), so --chest now defaults to 0 and every seam is welded to one weight set after smoothing.
seams = weld_groups(body)
for idx in chest:
    m = mean(Wb, idx)
    for i in idx:
        Wb[i] = lerp(Wb[i], m, a.chest)
for _ in range(2):
    for idx in chest + rest:
        smooth(body, Wb, idx, max(1, a.smooth // 2))
    weld(Wb, seams, locked)
write_w(body, Wb, range(len(Wb)))
print("BODY chest plates %d, other pieces %d smoothed x%d, %d seams welded" % (len(chest), len(rest), a.smooth,
                                                                               len(seams)))

# --- lames (fan) and insignia ------------------------------------------------------------------------------------
for ob in bpy.data.objects:
    if ob.type != "MESH":
        continue
    W = read_w(ob)
    if ob.name.startswith("Kit_lame_"):
        t = int(ob.name.rsplit("_", 1)[1])
        for i, v in enumerate(ob.data.vertices):
            s = "l" if v.co.x > 0 else "r"
            W[i] = lerp(pauldron[s], {"B_%sShoulderJ" % s: 1.0}, a.fan * t)
        write_w(ob, W, range(len(W)))
        print("LAME %s fan %.2f" % (ob.name, a.fan * t))
    elif ob.name.startswith("Kit_emblem_shoulder_"):
        s = ob.name[-1]
        for i in range(len(W)):
            W[i] = dict(pauldron[s])
        write_w(ob, W, range(len(W)))
        print("INSIGNIA %s glued to the pauldron" % ob.name)
    elif ob.name == "Kit_emblem":
        # follows the chest surface under it, vertex by vertex (it was 100 % Spine02J and slid over the plate)
        kd = KDTree(len(body.data.vertices))
        for i, v in enumerate(body.data.vertices):
            kd.insert(v.co, i)
        kd.balance()
        for i, v in enumerate(ob.data.vertices):
            W[i] = dict(Wb[kd.find(v.co)[1]])
        write_w(ob, W, range(len(W)))
        print("EMBLEM chest glued to the surface under it")
    elif ob.name in ("Kit_bracers", "Kit_leg_1"):
        for idx in P.components(ob):
            smooth(ob, W, idx, a.smooth)
        write_w(ob, W, range(len(W)))
    elif ob.name == "Kit_neck":
        # gorget: follows the torso and neck base, not the head (head turns twisted it 7 cm)
        for i in range(len(W)):
            W[i] = lerp(W[i], {"B_SpineTopJ": 0.6, "B_Neck01J": 0.4}, 0.8)
        write_w(ob, W, range(len(W)))
        print("GORGET Kit_neck -> SpineTop/Neck01")
    elif ob.name in ("Kit_apron", "Kit_leg_0"):
        for idx in P.components(ob):
            smooth(ob, W, idx, a.cloth_smooth)
        write_w(ob, W, range(len(W)))
        print("CLOTH %s smoothed x%d" % (ob.name, a.cloth_smooth))

rig.data.pose_position = pose_mode
bpy.context.view_layer.update()
bpy.ops.wm.save_as_mainfile(filepath=OUT)
print("SAVED", OUT)
