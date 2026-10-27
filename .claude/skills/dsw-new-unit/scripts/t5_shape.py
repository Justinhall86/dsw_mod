"""Proportion edits for the T5 Trooper (Gurney upper body): leaner arms and tighter pauldrons, without breaking the mesh.

Every vertex moves by a smooth function of its rest position and its skin weights, so neighbouring islands (plate over sleeve) move together and
nothing tears.  Arms: pulled toward the bone chain (shoulder -> elbow -> wrist -> hand), scaled by the vertex's total arm weight.  Pauldrons: scaled
toward a point above the shoulder joint, ramped in by |x| so the plates still meet the chest.
"""
from mathutils import Vector

ARM = ("Shoulder", "Elbow", "Forearm", "Wrist", "Finger", "Thumb")


def _closest_on_chain(p, chain):
    best, bd = None, 1e9
    for a, b in zip(chain, chain[1:]):
        ab = b - a
        t = max(0.0, min(1.0, (p - a).dot(ab) / ab.length_squared))
        q = a + ab * t
        d = (p - q).length
        if d < bd:
            best, bd = q, d
    return best


def _ramp(a, b, x):
    t = max(0.0, min(1.0, (x - a) / (b - a)))
    return t * t * (3 - 2 * t)


def slim_upper(obj, rig, p):
    mw, mi = obj.matrix_world, obj.matrix_world.inverted()
    names = {g.index: g.name for g in obj.vertex_groups}
    bh = {b.name: rig.matrix_world @ b.head_local for b in rig.data.bones}
    chains = {}
    for s, sg in (("l", 1), ("r", -1)):
        sh, el, wr = bh["B_%sShoulderJ" % s], bh["B_%sElbowJ" % s], bh["B_%sWristJ" % s]
        hand = wr + (wr - el).normalized() * 0.10
        chains[sg] = [sh, el, wr, hand]
    ka, kh = p.get("arm", 0.86), p.get("hand", 0.93)
    kp = p.get("pauldron", 0.90)
    pr = p.get("pauldron_ramp", (0.16, 0.25))
    moved = 0
    for v in obj.data.vertices:
        w = mw @ v.co
        sg = 1 if w.x >= 0 else -1
        arm_w = hand_w = 0.0
        for g in v.groups:
            n = names[g.group]
            if any(k in n for k in ("Finger", "Thumb", "Wrist")):
                hand_w += g.weight
            elif any(k in n for k in ARM):
                arm_w += g.weight
        new = w.copy()
        if arm_w + hand_w > 0.0:
            q = _closest_on_chain(w, chains[sg])
            k = 1.0 - arm_w * (1.0 - ka) - hand_w * (1.0 - kh)
            new = q + (w - q) * k
        # pauldron: scale toward a point just above the shoulder joint, only outboard of the chest
        r = _ramp(pr[0], pr[1], abs(w.x)) * (1.0 if w.z > p.get("pauldron_zmin", 1.38) else 0.0)
        if r > 0.0 and arm_w < 0.5:
            c = bh["B_%sShoulderJ" % ("l" if sg > 0 else "r")] + Vector((0, 0, p.get("pauldron_up", 0.05)))
            kk = 1.0 - r * (1.0 - kp)
            new = c + (new - c) * kk
        if (new - w).length > 1e-6:
            v.co = mi @ new
            moved += 1
    obj.data.update()
    return moved
