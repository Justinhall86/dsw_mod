"""Round 12 design nudge toward the "Bronze Oni Sentinel" sheet (house_thorvald/images/ref_oni_sentinel_sheet.jpg):
layered, copper-edged flared pauldrons and dark armoured bracers. Both come from the installed thorvald_elite's own
body (object "Gurney" in thorvald_elite/03_blender/v2_final.blend - already house-recoloured, the same donor B's
hands and legs come from), so no hand-modelled parts and no recolour.

  blender -b --factory-startup --python 23_arm_graft.py -- --mode pauldrons|arms [--pauldron-scale 1.25]

  pauldrons (N1): B's own round Iakin pauldron shells -> the Elite's layered pauldron plates + rivet rows.
  arms      (N2): N1, plus B's Iakin sleeves/elbow pads and the hand-built beige forearm bands (round 5) ->
                  the Elite's sleeves and armoured forearms, which join straight onto the Elite gloves B already has.

Reads 03_blender/structure/B_foundry_warlord.blend, writes 03_blender/nudge/B_<mode>.blend + renders under
02_progress_photos/19_oni_nudge/<mode>/. Parts are picked per component by DOMINANT BONE and side (live queries on
the current mesh), never by hardcoded component ids - those go stale as soon as an earlier step deletes vertices.
"""
import argparse
import os
import sys
from collections import defaultdict

import bpy
from mathutils import Vector

sys.path.insert(0, r"C:\Users\justi\Python\dsw_mod\.claude\skills\dsw-part-kitbash\scripts")
import dsw_parts as P  # noqa: E402

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
ELITE = os.path.abspath(os.path.join(PROJ, os.pardir, "thorvald_elite", "03_blender", "v2_final.blend"))
BLEND = os.path.join(PROJ, "03_blender", "structure", "B_foundry_warlord.blend")

ap = argparse.ArgumentParser()
ap.add_argument("--mode", required=True, choices=["pauldrons", "arms"])
ap.add_argument("--pauldron-scale", type=float, default=1.0,
                help="scale the grafted pauldron plates about each shoulder's inner top edge (flare them outward)")
a = ap.parse_args(P.script_args())
tag = a.mode + ("_x%g" % a.pauldron_scale if a.pauldron_scale != 1.0 else "")
OUT_BLEND = os.path.join(PROJ, "03_blender", "nudge", "B_%s.blend" % tag)
OUT_DIR = os.path.join(PROJ, "02_progress_photos", "19_oni_nudge", tag)
os.makedirs(os.path.dirname(OUT_BLEND), exist_ok=True)
os.makedirs(OUT_DIR, exist_ok=True)

SHOULDER = ("ClavicleJ", "ShoulderJ")
LIMB = ("ElbowJ", "ForearmJ")
HAND = ("WristJ", "Finger", "Thumb", "PalmJ")


def comp_table(obj):
    """[(vert ids, dominant bone suffix (side stripped), centre x, x span, vert count)] for every component."""
    gn = {g.index: g.name for g in obj.vertex_groups}
    rows = []
    for idx in P.components(obj):
        acc = defaultdict(float)
        for i in idx:
            for g in obj.data.vertices[i].groups:
                acc[gn[g.group]] += g.weight
        dom = max(acc, key=acc.get) if acc else ""
        dom = dom[3:] if dom[:3] in ("B_l", "B_r") else dom[2:]
        xs = [(obj.matrix_world @ obj.data.vertices[i].co).x for i in idx]
        rows.append((set(idx), dom, (min(xs) + max(xs)) / 2, max(xs) - min(xs), len(idx)))
    return rows


def is_pauldron(dom, cx, span, n, min_cx):
    if abs(cx) < min_cx:
        return False
    if dom.startswith(SHOULDER) and span < 0.35:     # plates; the long sleeve (span ~0.5) is not a pauldron
        return True
    return n <= 9 and dom in ("SpineTopJ",) + SHOULDER  # rivet rows along the plate edges


def is_limb(dom, cx, span, n):
    return abs(cx) >= 0.13 and (dom.startswith(LIMB) or (dom.startswith(SHOULDER) and span >= 0.35))


bpy.ops.wm.open_mainfile(filepath=BLEND)
sc = bpy.context.scene
rig = bpy.data.objects["Rig"]
body = bpy.data.objects["Iakin_H_Hero_2_00"]
action = rig.animation_data.action if rig.animation_data else None
pose_mode = rig.data.pose_position
rig.data.pose_position = "REST"
bpy.context.view_layer.update()

# --- B: drop its own parts ------------------------------------------------------------------------------------
drop = set()
for ids, dom, cx, span, n in comp_table(body):
    if dom.startswith(SHOULDER) and abs(cx) >= 0.2:                   # the round Iakin pauldron shells
        drop |= ids
    if a.mode == "arms" and (is_limb(dom, cx, span, n) or (dom.startswith("WristJ") and abs(cx) >= 0.5)):
        drop |= ids                                                    # sleeves, elbow pads, leftover wrist cuffs
P.delete_verts(body, drop)
print("DROPPED %d Iakin verts" % len(drop))
if a.mode == "arms":
    for side in ("l", "r"):
        o = bpy.data.objects.get("Kit_forearm_%s" % side)
        if o:
            bpy.data.objects.remove(o, do_unlink=True)

# --- Elite: graft its pauldrons (+ arms) ----------------------------------------------------------------------
src = P.import_donor(ELITE, "Gurney")
keep = set()
plates = {1: set(), -1: set()}   # pauldron verts per side, for --pauldron-scale
for ids, dom, cx, span, n in comp_table(src):
    if is_pauldron(dom, cx, span, n, 0.13):
        keep |= ids
        plates[1 if cx > 0 else -1] |= ids
    elif a.mode == "arms" and is_limb(dom, cx, span, n):
        keep |= ids
if a.pauldron_scale != 1.0:
    for side, ids in plates.items():
        cos = [src.data.vertices[i].co for i in ids]
        # pivot: the plates' inner (neck-side) x, top z, mid y - so they grow outward and down, not into the neck
        pivot = Vector((min(c.x * side for c in cos) * side, sum(c.y for c in cos) / len(cos), max(c.z for c in cos)))
        for i in ids:
            v = src.data.vertices[i]
            v.co = pivot + (v.co - pivot) * a.pauldron_scale
P.delete_verts(src, keep, invert=True)
src.name = "Kit_arms" if a.mode == "arms" else "Kit_pauldrons"
src.data.name = src.name + "_mesh"
print("GRAFTED %d Elite verts as %s" % (len(src.data.vertices), src.name))
P.attach_to_rig(src, rig)

rig.data.pose_position = pose_mode
if action is not None:
    rig.animation_data.action = action
bpy.context.view_layer.update()
P.purge_orphans()

P.setup_scene(sc)
cams = P.render_views(sc, OUT_DIR, "B_%s" % tag, "posed")
sc.camera = cams["tq"]
sc.frame_set(sc.frame_start)
bpy.ops.wm.save_as_mainfile(filepath=OUT_BLEND)
print("SAVED", OUT_BLEND)
