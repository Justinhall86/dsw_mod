"""
hmdanim2fbx.py -- export an HMD animation onto its rig as an animated FBX.

Produces one FBX containing the model's mesh + armature (via hmd2fbx) plus an
AnimationStack with per-bone Translation/Rotation(/Scale) curves, so the
animation plays on the actual character in Blender.

Conventions (mirroring the model pipeline):
- Curve values are D-conjugated (D = diag(-1,1,1)): tx negated, rotations
  written as euler of D@R@D. The game's left-hand import (tx=-tx, qy=-qy,
  qz=-qz) restores the original animation exactly; Blender sees a consistent
  mirrored-world animation on the mirrored rig.
- Keys at exactly 46186158000/30 KTime units per frame: the game pipeline's
  sampling formula then yields 30 fps.
- Euler curves are continuity-unwrapped (no 360/gimbal jumps between frames).
- Tracked bones' rest (Lcl) transforms are overwritten with frame-0/single
  values: constant curves the game pipeline optimizes away then fall back to
  node defaults with identical values.
- Events ('hit' frames) cannot travel through Blender; they are re-injected
  by animfix at reimport time from the reference animation HMD.

Usage: python hmdanim2fbx.py model.hmd animation.hmd [output.fbx]
"""

from __future__ import annotations

import math
import sys
from array import array

import numpy as np

import hmd_anim as HA
import hmd_reader as H
from fbx_binary import Long, Node, fbx_name, read_fbx, write_fbx
from hmd2fbx import convert, mat4_to_euler_xyz_deg, quat_to_mat3

KTIME_PER_SEC = 46186158000
FPS = 30
DT = KTIME_PER_SEC // FPS  # 1539538600, divisible by 100 (pipeline rounding)

D4 = np.diag([-1.0, 1.0, 1.0, 1.0])


def euler_candidates(m3: np.ndarray):
    """Both XYZ-euler solutions (degrees) of a rotation matrix (row conv)."""
    m = np.identity(4); m[:3, :3] = m3
    x, y, z = mat4_to_euler_xyz_deg(m)
    return [(x, y, z), (x + 180.0, 180.0 - y, z + 180.0)]


def unwrap_to(prev, cand):
    """Shift each component of cand by multiples of 360 to be closest to prev."""
    return tuple(c + 360.0 * round((p - c) / 360.0) for p, c in zip(prev, cand))


def continuous_eulers(rots) -> list:
    """rots: list of 3x3 row-conv rotation matrices -> smooth euler sequence."""
    out = []
    prev = None
    for m3 in rots:
        cands = euler_candidates(m3)
        if prev is None:
            best = cands[0]
        else:
            best, bestd = None, None
            for c in cands:
                cu = unwrap_to(prev, c)
                d = sum(abs(a - b) for a, b in zip(cu, prev))
                if bestd is None or d < bestd:
                    best, bestd = cu, d
        out.append(best)
        prev = best
    return out


def anim_curve(objects, connect, connect_prop, newid, layer_id, bone_id,
               prop_name, chan_name, frames_vals, defaults):
    """Add one AnimationCurveNode (T/R/S) + three AnimationCurves."""
    cn = newid()
    n = objects.add("AnimationCurveNode", cn, fbx_name(chan_name, "AnimCurveNode"), "")
    p70 = n.add("Properties70")
    for axis, dv in zip("XYZ", defaults):
        p70.add("P", f"d|{axis}", "Number", "", "A", float(dv))
    connect(cn, layer_id)
    connect_prop(cn, bone_id, prop_name)
    times = array("q", [f * DT for f in range(len(frames_vals))])
    for ci, axis in enumerate("XYZ"):
        cid = newid()
        c = objects.add("AnimationCurve", cid, fbx_name("", "AnimCurve"), "")
        c.add("Default", float(defaults[ci]))
        c.add("KeyVer", 4008)
        c.add("KeyTime", times)
        c.add("KeyValueFloat", array("f", [v[ci] for v in frames_vals]))
        c.add("KeyAttrFlags", array("i", [8196]))
        c.add("KeyAttrDataFloat", array("f", [0.0, 0.0, 0.0, 0.0]))
        c.add("KeyAttrRefCount", array("i", [len(frames_vals)]))
        connect_prop(cid, cn, f"d|{axis}")


def export(model_path: str, anim_path: str, out_path: str) -> None:
    d_anim, anim, tracks = HA.load_animation(anim_path)

    stats = {"tracks": len(tracks), "matched": 0, "skipped": [], "untracked": []}

    def hook(ctx):
        objects = ctx["objects"]
        connect, connect_prop, newid = ctx["connect"], ctx["connect_prop"], ctx["newid"]
        bone_ids = ctx["bone_id_by_name"]
        log = ctx["log"]

        stack_id = newid()
        st = objects.add("AnimationStack", stack_id, fbx_name(anim.name, "AnimStack"), "")
        p70 = st.add("Properties70")
        stop = Long((anim.frames - 1) * DT)
        p70.add("P", "LocalStart", "KTime", "Time", "", Long(0))
        p70.add("P", "LocalStop", "KTime", "Time", "", stop)
        p70.add("P", "ReferenceStart", "KTime", "Time", "", Long(0))
        p70.add("P", "ReferenceStop", "KTime", "Time", "", stop)

        layer_id = newid()
        objects.add("AnimationLayer", layer_id, fbx_name("BaseLayer", "AnimLayer"), "")
        connect(layer_id, stack_id)

        for name, t in tracks.items():
            bid = bone_ids.get(name)
            if bid is None:
                stats["skipped"].append(name)
                continue
            stats["matched"] += 1

            # frame-series in FBX (D-conjugated) space
            n_frames = 1 if t.single else anim.frames
            trans = rot_eulers = scales = None
            if t.position is not None:
                trans = [(-p[0], p[1], p[2]) for p in t.position]
            if t.rotation is not None:
                mats = [D4[:3, :3] @ quat_to_mat3(*q) @ D4[:3, :3] for q in t.rotation]
                rot_eulers = continuous_eulers(mats)
            if t.scale is not None:
                scales = [tuple(s) for s in t.scale]

            # overwrite bone rest with frame-0/single values (defaults for
            # curves the game pipeline optimizes out as constant)
            bone = next(o for o in objects.children
                        if o.name == "Model" and o.props[0] == bid)
            p70b = next(ch for ch in bone.children if ch.name == "Properties70")
            byname = {p.props[0]: p for p in p70b.children}
            if trans is not None and "Lcl Translation" in byname:
                byname["Lcl Translation"].props[4:] = [float(v) for v in trans[0]]
            if rot_eulers is not None and "Lcl Rotation" in byname:
                byname["Lcl Rotation"].props[4:] = [float(v) for v in rot_eulers[0]]
            if scales is not None and "Lcl Scaling" in byname:
                byname["Lcl Scaling"].props[4:] = [float(v) for v in scales[0]]

            if trans is not None:
                anim_curve(objects, connect, connect_prop, newid, layer_id, bid,
                           "Lcl Translation", "T", trans, trans[0])
            if rot_eulers is not None:
                anim_curve(objects, connect, connect_prop, newid, layer_id, bid,
                           "Lcl Rotation", "R", rot_eulers, rot_eulers[0])
            if scales is not None:
                anim_curve(objects, connect, connect_prop, newid, layer_id, bid,
                           "Lcl Scaling", "S", scales, scales[0])

        stats["untracked"] = [n for n in bone_ids if n not in tracks]
        log["animation"] = f"{anim.name}: {anim.frames} frames @ {anim.sampling:g} fps"

    convert(model_path, out_path, verbose=False, scene_hook=hook)

    # post-pass: set 30 fps in GlobalSettings so Blender's scene matches
    version, nodes = read_fbx(out_path)
    gs = next(n for n in nodes if n.name == "GlobalSettings")
    gsp = next(ch for ch in gs.children if ch.name == "Properties70")
    have = {p.props[0]: p for p in gsp.children}
    stop = Long((anim.frames - 1) * DT)
    for name, ptype, lbl, val in [
            ("TimeMode", "enum", "", 6),            # eFrames30
            ("CustomFrameRate", "double", "Number", 30.0),
            ("TimeSpanStart", "KTime", "Time", Long(0)),
            ("TimeSpanStop", "KTime", "Time", stop)]:
        if name in have:
            have[name].props[4:] = [val]
        else:
            gsp.children.append(Node("P", name, ptype, lbl, "", val))
    write_fbx(out_path, nodes, version)

    print(f"{anim_path} + {model_path} -> {out_path}")
    print(f"  animation: {anim.name!r}, {anim.frames} frames @ {anim.sampling:g} fps, "
          f"loop={anim.loop}")
    print(f"  tracks: {stats['matched']}/{stats['tracks']} matched to skeleton")
    if stats["skipped"]:
        print(f"  WARNING: tracks with no bone in this model (dropped): {stats['skipped']}")
    if stats["untracked"]:
        print(f"  note: bones without animation tracks (stay at rest): {stats['untracked']}")
    if anim.events:
        print(f"  events (re-injected at reimport by animfix): "
              f"{[(e.frame, e.data) for e in anim.events]}")


def classify(paths: list):
    """Split HMD files (detected by magic, any extension) into models and
    animations. Folders are searched recursively. Each entry carries an
    output base directory: <dropped folder>/converted for folder inputs,
    <file's dir>/converted for loose files."""
    import os
    models, anims = [], []
    files = []  # (path, out_base)
    for a in paths:
        if os.path.isdir(a):
            out_base = os.path.join(a, "converted")
            for base, dirs, fns in os.walk(a):
                dirs[:] = [x for x in dirs if x != "converted"]
                files += [(os.path.join(base, fn), out_base) for fn in sorted(fns)]
        else:
            files.append((a, os.path.join(os.path.dirname(a) or ".", "converted")))
    for p, out_base in files:
        try:
            with open(p, "rb") as f:
                if f.read(3) != b"HMD":
                    continue
            d = H.load(p)
        except Exception as e:
            print(f"skipping {p}: {e}")
            continue
        if d.models:
            models.append((p, d))
        elif d.animations:
            anims.append((p, d, out_base))
    return models, anims


def pick_model(models: list, anim_d: H.Data):
    """Best rig for an animation: full track coverage first, then the
    skeleton with the fewest unused bones."""
    need = {o.name for a in anim_d.animations for o in a.objects}
    best = None
    for p, d in models:
        sk = d.models[0].skin
        if sk is None:
            continue
        names = {j.name for j in sk.joints}
        covered = len(need & names)
        key = (covered == len(need), covered, -len(names))
        if best is None or key > best[0]:
            best = (key, p, len(need) - covered)
    return (best[1], best[2]) if best else (None, len(need))


if __name__ == "__main__":
    import os
    args = sys.argv[1:]
    outdir = None
    if "--outdir" in args:
        i = args.index("--outdir")
        outdir = args[i + 1]
        del args[i:i + 2]
    if not args:
        print(__doc__)
        sys.exit(1)
    # explicit form: model.hmd anim.hmd [out.fbx]
    if outdir is None and len(args) in (2, 3) \
            and not any(os.path.isdir(a) for a in args):
        try:
            dm = H.load(args[0])
            da = H.load(args[1])
            if dm.models and da.animations:
                out = args[2] if len(args) > 2 else \
                    os.path.splitext(args[0])[0] + "_" + \
                    os.path.splitext(os.path.basename(args[1]))[0] + ".fbx"
                export(args[0], args[1], out)
                sys.exit(0)
        except Exception:
            pass  # fall through to batch mode
    # batch mode: any mix of files/folders; models and animations auto-detected
    models, anims = classify(args)
    if not models:
        print("no model (rig) HMD found among inputs -- include at least one "
              "model file (e.g. testHMD.hmd) so animations have a skeleton")
        sys.exit(1)
    if not anims:
        print("no animation HMD found among inputs")
        sys.exit(1)
    print(f"found {len(models)} model(s), {len(anims)} animation(s)")
    ok, failed = 0, []
    for p, da, out_base in anims:
        mp, missing = pick_model(models, da)
        if mp is None:
            failed.append((p, "no usable rig"))
            continue
        if missing:
            print(f"NOTE: best rig for {p} ({mp}) is missing {missing} track(s)")
        if outdir is not None:
            out_base = outdir
        os.makedirs(out_base, exist_ok=True)
        out = os.path.join(out_base,
                           os.path.splitext(os.path.basename(p))[0] + ".fbx")
        try:
            export(mp, p, out)
            ok += 1
        except Exception as e:
            failed.append((p, str(e)))
            print(f"ERROR exporting {p}: {e}")
    print(f"\n=== batch done: {ok} exported, {len(failed)} failed ===")
    for p, why in failed:
        print(f"  FAILED {p}: {why}")
    if failed:
        sys.exit(1)
