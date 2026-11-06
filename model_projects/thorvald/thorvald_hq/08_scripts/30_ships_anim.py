"""Write the Thorvald citadel's ship animation: the four vanilla Arrakeen shuttles (RIG_BaseArrakeen_Ships, joints
J_Ship_01..04) flown on new paths that fit the kitbashed citadel.

    python 30_ships_anim.py          # -> ../06_game_ready/Anim_ThorvaldCitadel_Ships.fbx (an HMD, like the game's)

How: the vanilla Anim_BaseArrakeen_Ships HMD is copied and only its frame block is overwritten, so the header (four
joints, position + rotation tracks, 3501 frames at 30 fps = 116.7 s loop) is exactly the engine's own.
Spaces: paths below are in the kitbash's Blender coordinates (the FBX the HQ is built in). The HMD is the same with X
negated (hmd2fbx mirrors X: Arrakeen's J_Ship_02 binds at HMD x -4.34, its mesh sits at Blender x +4.34), and the rig
node is scaled by RIG_SCALE in the prefab, so rig-space = (-x, y, z) / RIG_SCALE.
Ship nose = joint-local -Z (measured from the vanilla tracks: mean local direction of travel (-0.02, 0, -1)).
A parked-off ship is moved to x = -1e6, which is how the vanilla animation hides ship 4.
Check it with 31_ships_preview.py (toolkit hmdanim2fbx round trip, rendered over the citadel).
"""
import math
import os
import shutil
import sys

import numpy as np

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = os.path.abspath(os.path.join(PROJ, "..", "..", ".."))
sys.path.insert(0, os.path.join(REPO, "HMD_toolkit", "HMD_toolkit", "Animations"))
import hmd_anim as HA  # noqa: E402
import hmd_reader as H  # noqa: E402

SRC = os.path.join(REPO, "model_inputs", "Structure", "Base", "Arrakeen", "Anim_BaseArrakeen_Ships.fbx")
OUT = os.path.join(PROJ, "06_game_ready", "Anim_ThorvaldCitadel_Ships.fbx")
RIG_SCALE = 3.5          # prefab scale of the rig node: the vanilla shuttles are ~2 m long, specks at RTS zoom
FPS = 30.0
HIDE = (-1.0e6, 0.0, 0.0)

PAD = (15.8, 9.7, 0.05)          # outpost ground pad at the foot of the hangar (part 773)
DECK = (7.6, 3.4, 9.2)           # hangar roof deck (parts 455-458, flat top at 9.14)
CENTRE = (0.0, -1.0)             # citadel centre for the patrols


def smooth(u):
    u = min(1.0, max(0.0, u))
    return u * u * (3 - 2 * u)


def lerp(a, b, u):
    return tuple(a[i] + (b[i] - a[i]) * u for i in range(3))


def visit(t, t0, approach, spot, depart, t_in=10.0, t_wait=22.0, t_out=10.0):
    """Fly from approach to spot (eased), sit, fly to depart; hidden outside [t0, t0 + total]."""
    t -= t0
    if t < 0 or t > t_in + t_wait + t_out:
        return None
    if t < t_in:
        u = smooth(t / t_in)
        p = lerp(approach, spot, u)
        return (p[0], p[1], spot[2] + (approach[2] - spot[2]) * (1 - u) ** 2)   # flattens out before touchdown
    if t < t_in + t_wait:
        return spot
    u = smooth((t - t_in - t_wait) / t_out)
    p = lerp(spot, depart, u)
    return (p[0], p[1], spot[2] + (depart[2] - spot[2]) * u ** 2)                # lifts first, then pulls away


def circle(t, radius, alt, period, phase, direction=1):
    a = direction * 2 * math.pi * t / period + phase
    return (CENTRE[0] + radius * math.cos(a), CENTRE[1] + radius * math.sin(a), alt + 0.8 * math.sin(3 * a))


def ship_paths(n_frames):
    loop = n_frames / FPS
    out = {k: [] for k in ("J_Ship_01", "J_Ship_02", "J_Ship_03", "J_Ship_04")}
    for f in range(n_frames):
        t = f / FPS
        out["J_Ship_01"].append(visit(t, 6.0, (55.0, 40.0, 26.0), PAD, (40.0, -38.0, 24.0)))
        out["J_Ship_01"][-1] = out["J_Ship_01"][-1] or visit(t, 64.0, (52.0, -30.0, 26.0), PAD, (30.0, 52.0, 24.0))
        out["J_Ship_02"].append(visit(t, 30.0, (-40.0, 45.0, 30.0), DECK, (45.0, 30.0, 30.0), t_wait=30.0))
        out["J_Ship_03"].append(circle(t, 27.0, 17.0, loop / 2, 0.0, 1))
        out["J_Ship_04"].append(circle(t, 21.0, 11.0, loop / 3, math.pi, -1))
    return out


def basis(fwd, up):
    """Orthonormal columns [fwd, up', fwd x up'] (up' = up made perpendicular to fwd)."""
    f = np.array(fwd, float)
    f /= np.linalg.norm(f)
    u = np.array(up, float) - f * np.dot(up, f)
    u /= np.linalg.norm(u)
    return np.column_stack([f, u, np.cross(f, u)])


def mat_to_quat(m):
    w = math.sqrt(max(0.0, 1 + m[0, 0] + m[1, 1] + m[2, 2])) / 2
    x = math.copysign(math.sqrt(max(0.0, 1 + m[0, 0] - m[1, 1] - m[2, 2])) / 2, m[2, 1] - m[1, 2])
    y = math.copysign(math.sqrt(max(0.0, 1 - m[0, 0] + m[1, 1] - m[2, 2])) / 2, m[0, 2] - m[2, 0])
    z = math.copysign(math.sqrt(max(0.0, 1 - m[0, 0] - m[1, 1] + m[2, 2])) / 2, m[1, 0] - m[0, 1])
    return (x, y, z, w)


def quat_to_mat(q):
    x, y, z, w = q
    return np.array([[1 - 2 * (y * y + z * z), 2 * (x * y - z * w), 2 * (x * z + y * w)],
                     [2 * (x * y + z * w), 1 - 2 * (x * x + z * z), 2 * (y * z - x * w)],
                     [2 * (x * z - y * w), 2 * (y * z + x * w), 1 - 2 * (x * x + y * y)]])


def main():
    d, a, tracks = HA.load_animation(SRC)
    paths = ship_paths(a.frames)
    # which local axis is "up" for these meshes: read it off the vanilla bind (ships sit level at frame 0)
    q0 = tracks["J_Ship_01"].rotation[0]
    up_local = quat_to_mat(q0).T @ np.array([0.0, 0.0, 1.0])
    local = basis((0.0, 0.0, -1.0), up_local)         # nose, up, side in the joint's own frame
    print("up_local", np.round(up_local, 3))
    for name, tr in tracks.items():          # self-check: rebuilding each vanilla bind from its own heading
        r0 = quat_to_mat(tr.rotation[0])
        err = np.abs(basis(r0 @ np.array([0.0, 0.0, -1.0]), (0, 0, 1)) @ local.T - r0).max()
        print("bind check", name, "max error %.3f" % err)

    new = {}
    for name, pts in paths.items():
        pos, rot = [], []
        heading = np.array([1.0, 0.0, 0.0])
        rig = [None if p is None else np.array((-p[0], p[1], p[2])) / RIG_SCALE for p in pts]   # Blender -> HMD
        for i, p in enumerate(rig):
            if p is None:
                pos.append(HIDE)
                rot.append(tracks[name].rotation[0])
                continue
            nxt = rig[min(i + 8, len(rig) - 1)]
            prv = rig[max(i - 8, 0)]
            if nxt is not None and prv is not None:
                v = nxt - prv
                v[2] *= 0.3                        # pitch only a little on climbs and descents
                if np.linalg.norm(v[:2]) > 0.01:
                    heading = v / np.linalg.norm(v)
            q = mat_to_quat(basis(heading, (0.0, 0.0, 1.0)) @ local.T)   # local nose/up -> heading/world up
            if q[3] < 0:                            # the format stores qx, qy, qz; qw is derived as >= 0
                q = tuple(-c for c in q)
            pos.append(tuple(float(c) for c in p))
            rot.append(q)
        new[name] = (pos, rot)

    # overwrite the frame block in a copy of the vanilla file
    buf = bytearray(open(SRC, "rb").read())
    singles = [o for o in a.objects if o.has("SingleFrame")]
    assert not singles, "vanilla ships have no single-frame tracks"
    import struct
    base = len(buf) - len(d.data)          # a.dataPosition counts from the start of the data section
    assert bytes(buf[base:]) == bytes(d.data)
    pos_ = base + a.dataPosition
    for f in range(a.frames):
        for o in a.objects:
            p, q = new[o.name][0][f], new[o.name][1][f]
            struct.pack_into("<3f", buf, pos_, *p)
            struct.pack_into("<3f", buf, pos_ + 12, *q[:3])
            pos_ += 24
    os.makedirs(os.path.dirname(OUT), exist_ok=True)
    open(OUT, "wb").write(buf)
    # read it back through the toolkit decoder
    _, _, back = HA.load_animation(OUT)
    for name, tr in back.items():
        vis = [p for p in tr.position if p[0] > -1e5]
        print(name, "visible %.0f%% of the loop" % (100 * len(vis) / len(tr.position)),
              "z %.1f..%.1f m" % (min(p[2] for p in vis) * RIG_SCALE, max(p[2] for p in vis) * RIG_SCALE))
    print("WROTE", OUT, len(buf), "bytes (vanilla", os.path.getsize(SRC), ")")


if __name__ == "__main__":
    main()
