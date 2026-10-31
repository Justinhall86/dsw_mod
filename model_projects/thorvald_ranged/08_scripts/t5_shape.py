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
        sj = bh["B_%sShoulderJ" % ("l" if sg > 0 else "r")]
        if r > 0.0 and arm_w >= 0.5 and "pauldron_arm" in p:  # arm-weighted shells over the shoulder: shrink too, fading out down the upper arm
            r *= 1.0 - _ramp(p["pauldron_arm"][0], p["pauldron_arm"][1], (w - sj).length)
        elif arm_w >= 0.5:
            r = 0.0
        if r > 0.0:
            c = sj + Vector((0, 0, p.get("pauldron_up", 0.05)))
            kk = 1.0 - r * (1.0 - kp)
            new = c + (new - c) * kk
        # torso: form-fitting armour.  Narrower (x) and shallower (y) around the spine line, faded in above the sash (z_lo -> z_hi) and
        # faded out on arm-weighted vertices; the upper chest / collar front - where the Gurney cuirass puffs out and makes the unit look
        # hunched - is pulled back hardest (upper_front at z >= upper_z[1]).
        t_ = p.get("torso")
        if t_ and abs(w.x) < t_.get("x_max", 0.34):
            wt = 1.0 - min(1.0, arm_w + hand_w)
            t = _ramp(t_["z"][0], t_["z"][1], w.z) * wt
            if "x_fade" in t_:  # fade out toward x_max instead of stopping dead there (no step where the torso meets the shoulder)
                t *= 1.0 - _ramp(t_["x_fade"], t_["x_max"], abs(w.x))
            if t > 0.0:
                yc = t_.get("yc", 0.02)
                kx = 1.0 - t * (1.0 - t_["kx"])
                if new.y < yc:
                    ky_ = t_["ky_front"] - _ramp(t_["upper_z"][0], t_["upper_z"][1], w.z) * (t_["ky_front"] - t_["upper_front"])
                else:
                    ky_ = t_["ky_back"]
                ky = 1.0 - t * (1.0 - ky_)
                new = Vector((new.x * kx, yc + (new.y - yc) * ky, new.z))
        # chest front flattened: whatever sticks out in front of a plane (y_plane(z)) is pulled back toward it by k(z) - the pec bulge and the
        # lower plate's forward tip (the "beak" over the belt).  Knots (z, y_plane, k) are interpolated; faded out sideways and on arm vertices.
        cf = p.get("chest_flat")
        if cf and abs(w.x) < cf["x_max"]:
            kn = cf["knots"]
            if kn[0][0] <= w.z <= kn[-1][0]:
                for (z0, y0, k0), (z1, y1, k1) in zip(kn, kn[1:]):
                    if z0 <= w.z <= z1:
                        f = (w.z - z0) / (z1 - z0) if z1 > z0 else 0.0
                        yp, kk = y0 + f * (y1 - y0), k0 + f * (k1 - k0)
                        break
                s = (1.0 - _ramp(cf["x_fade"], cf["x_max"], abs(w.x))) * (1.0 - min(1.0, arm_w + hand_w))
                if new.y < yp and s > 0.0:
                    new = Vector((new.x, yp + (new.y - yp) * (1.0 - s * (1.0 - kk)), new.z))
        if (new - w).length > 1e-6:
            v.co = mi @ new
            moved += 1
    obj.data.update()
    return moved
