"""
animfix.py -- animation reimport tool (Blender-exported FBX -> repackager-ready).

Mode 1 (FBX fix): prepare a Blender-exported animation FBX for the repackager
    python animfix.py blender_export.fbx reference_anim.hmd [--rig Male01]
    -> Anim_<rig>_<animname>.fbx  (place under Anim/<rig>/ in the resources)

    - strips mesh/materials/skin (animation-only FBX, like the game originals)
    - snaps all curve keys to the exact 30fps KTime grid, resampling if needed
    - names the AnimationStack after the reference animation
    - normalizes GlobalSettings headers (axis/units, no PreRotation injection)

Mode 2 (event injection): after repackaging, restore/edit animation events
    python animfix.py --inject-events repackaged.hmd reference_anim.hmd
    python animfix.py --inject-events repackaged.hmd --event 11:hit --event 40:sound
    - rewrites the HMD's event table (a .bak backup is kept)
    - --event overrides the reference (frame:name); omit reference to only use
      --event entries

Curves are copied as-is otherwise: animation locals are self-contained, so
Blender's bone-frame quirks do not apply (unlike meshes/bind poses).
"""

from __future__ import annotations

import math
import struct
import sys

import numpy as np

from fbx_binary import Long, Node, read_fbx, write_fbx
import hmd_reader as H

KTIME_PER_SEC = 46186158000
FPS = 30
DT = KTIME_PER_SEC // FPS

STRIP_OBJECTS = {"Geometry", "Material", "Texture", "Video", "Pose", "Deformer"}

GS_FORCE = {
    "UpAxis": 2, "UpAxisSign": 1, "FrontAxis": 2, "FrontAxisSign": 1,
    "CoordAxis": 0, "CoordAxisSign": 1, "OriginalUpAxis": 2,
    "OriginalUpAxisSign": 1,
}
GS_FORCE_D = {"UnitScaleFactor": 100.0, "OriginalUnitScaleFactor": 100.0}


def fix_fbx(src: str, ref_hmd: str, rig: str, trim: int = 0,
            name: str = None) -> None:
    """trim: cut all curves to this frame count (0 = keep as exported;
    use when Blender baked padding up to the scene's end frame).
    name: animation name for NEW animations (no HMD original). A reference
    HMD of the same rig is still recommended for the bone-frame sanity check
    (any animation of that rig works -- bone offsets are rig-wide)."""
    ref = ra = None
    if ref_hmd:
        ref = H.load(ref_hmd)
        if not ref.animations:
            raise ValueError(f"{ref_hmd} contains no animation "
                             "(need an animation HMD as reference)")
        ra = ref.animations[0]
    if name is None:
        if ra is None:
            raise ValueError("new animation: pass --name <AnimationName> "
                             "(no reference HMD to take the name from)")
        name = ra.name

    version, nodes = read_fbx(src)
    top = {n.name: n for n in nodes}
    warnings = []

    # ---- GlobalSettings ------------------------------------------------------
    gsp = next(ch for ch in top["GlobalSettings"].children if ch.name == "Properties70")
    seen = set()
    for p in gsp.children:
        nm = p.props[0]
        if nm in GS_FORCE:
            p.props[4:] = [GS_FORCE[nm]]; seen.add(nm)
        elif nm in GS_FORCE_D:
            p.props[4:] = [GS_FORCE_D[nm]]; seen.add(nm)
        elif nm == "CustomFrameRate" and len(p.props) > 4 and float(p.props[4]) not in (30.0, -1.0):
            warnings.append(f"scene frame rate was {p.props[4]}, expected 30 -- "
                            "keys are snapped to 30fps, verify timing in HIDE")
    for nm, v in {**GS_FORCE, **GS_FORCE_D}.items():
        if nm not in seen:
            gsp.children.insert(0, Node("P", nm, "double" if isinstance(v, float) else "int",
                                        "Number" if isinstance(v, float) else "Integer", "", v))

    objects = top["Objects"]
    connections = top["Connections"]

    # ---- strip mesh-side objects ----------------------------------------------
    drop = set()
    for o in objects.children:
        if o.name in STRIP_OBJECTS:
            drop.add(o.props[0])
        elif o.name == "Model" and o.props[2] == "Mesh":
            drop.add(o.props[0])
    objects.children = [o for o in objects.children if o.props[0] not in drop]
    connections.children = [c for c in connections.children
                            if c.props[1] not in drop and c.props[2] not in drop]

    # ---- drop object-level animation tracks -------------------------------------
    # Blender bakes curves for scene objects (armature/root) as well as bones.
    # HMD animations drive objects BY NAME: on original models such tracks are
    # ignored (no matching object), but reimported models contain an 'Armature'
    # node, which the track would rotate/scale wholesale. Bones only.
    model_ids = {o.props[0] for o in objects.children if o.name == "Model"}
    limb_ids = {o.props[0] for o in objects.children
                if o.name == "Model" and o.props[2] == "LimbNode"}
    cn_ids = {o.props[0] for o in objects.children if o.name == "AnimationCurveNode"}
    cn_target = {c.props[1]: c.props[2] for c in connections.children
                 if c.props[0] == "OP" and c.props[1] in cn_ids}
    bad_cn = {cn for cn, tgt in cn_target.items()
              if tgt in model_ids and tgt not in limb_ids}
    if bad_cn:
        bad_curves = {c.props[1] for c in connections.children
                      if c.props[0] == "OP" and c.props[2] in bad_cn}
        byid = {o.props[0]: o for o in objects.children}
        names = sorted({byid[cn_target[cn]].props[1].split("\x00")[0]
                        for cn in bad_cn if cn_target[cn] in byid})
        gone = bad_cn | bad_curves
        objects.children = [o for o in objects.children if o.props[0] not in gone]
        connections.children = [c for c in connections.children
                                if c.props[1] not in gone and c.props[2] not in gone]
        warnings.append(f"dropped object-level (non-bone) animation tracks on: {names} "
                        "-- these would move the whole model on reimported rigs")

    # ---- animation stack -------------------------------------------------------
    stacks = [o for o in objects.children if o.name == "AnimationStack"]
    if not stacks:
        raise ValueError("no AnimationStack found -- export from Blender with the "
                         "Animation checkbox enabled (baked animation)")
    if len(stacks) > 1:
        warnings.append(f"{len(stacks)} animation stacks found; the game uses the first")
    stacks[0].props[1] = name + "\x00\x01AnimStack"

    # ---- snap/resample curves to the 30fps grid ---------------------------------
    n_curves = n_resampled = 0
    max_frame = 0
    for o in objects.children:
        if o.name != "AnimationCurve":
            continue
        byname = {ch.name: ch for ch in o.children}
        if "KeyTime" not in byname:
            continue
        n_curves += 1
        kt = list(byname["KeyTime"].props[0])
        kv = list(byname["KeyValueFloat"].props[0])
        frames = [t / DT for t in kt]
        snapped = [round(f) for f in frames]
        exact = all(abs(f - s) < 1e-6 for f, s in zip(frames, snapped))
        dense = snapped == list(range(snapped[0], snapped[0] + len(snapped)))
        if exact and dense and snapped[0] == 0:
            new_t, new_v = [s * DT for s in snapped], kv
        else:
            # linear resample onto the grid from frame 0 to last key
            n_resampled += 1
            t0, t1 = kt[0], kt[-1]
            last = max(1, round(t1 / DT))
            new_t, new_v = [], []
            j = 0
            for fidx in range(0, last + 1):
                t = fidx * DT
                while j + 1 < len(kt) and kt[j + 1] <= t:
                    j += 1
                if t <= kt[0]:
                    v = kv[0]
                elif t >= kt[-1] or j + 1 >= len(kt):
                    v = kv[-1]
                else:
                    f = (t - kt[j]) / (kt[j + 1] - kt[j])
                    v = kv[j] * (1 - f) + kv[j + 1] * f
                new_t.append(t); new_v.append(v)
        if trim and len(new_v) > trim:
            new_t, new_v = new_t[:trim], new_v[:trim]
        from array import array
        byname["KeyTime"].props[0] = array("q", [Long(t) for t in new_t])
        byname["KeyValueFloat"].props[0] = array("f", new_v)
        if "KeyAttrRefCount" in byname:
            byname["KeyAttrRefCount"].props[0] = array("i", [len(new_v)])
        max_frame = max(max_frame, len(new_v) - 1)

    # ---- bone-frame sanity check vs reference ---------------------------------
    # If Blender's armature Primary/Secondary Bone Axis settings differ between
    # import and export (defaults: Y / X), every bone's local frame comes out
    # rolled and the animation deforms wrongly in game despite looking fine in
    # Blender. Detect: first-frame bone translations should match the reference
    # animation in direction (untouched bones) -- a consistent rotation means
    # rolled frames.
    import hmd_anim as HA_
    ref_tracks = HA_.decode_animation(ref, ra) if ra is not None else {}
    if not ref_tracks:
        warnings.append("no reference HMD: bone-frame sanity check skipped -- "
                        "recommended to pass any animation of this rig")
    byid2 = {o.props[0]: o for o in objects.children}
    devs = []
    for cn, tgt in cn_target.items():
        if cn in bad_cn or tgt not in limb_ids:
            continue
        # find this curve node's property and target bone name
        prop = next((c.props[3] for c in connections.children
                     if c.props[0] == "OP" and c.props[1] == cn and len(c.props) > 3), "")
        if prop != "Lcl Translation":
            continue
        nm = byid2[tgt].props[1].split("\x00")[0]
        rt = ref_tracks.get(nm)
        if rt is None or rt.position is None:
            continue
        comp = {}
        for c in connections.children:
            if c.props[0] == "OP" and c.props[2] == cn:
                cur = byid2.get(c.props[1])
                if cur is not None and cur.name == "AnimationCurve":
                    comp[c.props[3]] = cur
        if len(comp) < 3:
            continue
        v = [comp[f"d|{ax}"] for ax in "XYZ"]
        vals = [next(ch.props[0] for ch in cu.children if ch.name == "KeyValueFloat")[0]
                for cu in v]
        got = np.array([-vals[0], vals[1], vals[2]])   # undo D-conj
        want = np.array(rt.position[0])
        ng, nw = np.linalg.norm(got), np.linalg.norm(want)
        if ng > 0.05 and nw > 0.05:
            cosang = float(np.dot(got, want) / (ng * nw))
            devs.append(math.degrees(math.acos(max(-1.0, min(1.0, cosang)))))
    if devs:
        devs.sort()
        med = devs[len(devs) // 2]
        if med > 10.0:
            warnings.append(
                f"BONE FRAMES DO NOT MATCH THE REFERENCE (median deviation "
                f"{med:.0f} deg over {len(devs)} bones). The game WILL deform "
                "wrongly. Almost always caused by Blender armature bone-axis "
                "settings: re-export with Armature > Primary Bone Axis: Y, "
                "Secondary Bone Axis: X (and import with the same defaults).")

    if ra is not None and max_frame + 1 != ra.frames:
        warnings.append(f"exported animation is {max_frame + 1} frames, reference "
                        f"is {ra.frames} -- fine if you intentionally changed length; "
                        f"if it's scene-range padding, re-run with: --trim {ra.frames} "
                        "(or --trim ref)")

    # ---- rebuild Definitions ------------------------------------------------------
    counts = {}
    for o in objects.children:
        counts[o.name] = counts.get(o.name, 0) + 1
    defs = top.get("Definitions")
    if defs is not None:
        kept = []
        for ot in defs.children:
            if ot.name != "ObjectType":
                kept.append(ot); continue
            if ot.props[0] == "GlobalSettings" or counts.get(ot.props[0]):
                for ch in ot.children:
                    if ch.name == "Count":
                        ch.props[0] = counts.get(ot.props[0], 1)
                kept.append(ot)
        defs.children = kept
        for ch in defs.children:
            if ch.name == "Count":
                ch.props[0] = sum(counts.values()) + 1

    import os
    dst = os.path.join(os.path.dirname(src) or ".", f"Anim_{rig}_{name}.fbx")
    write_fbx(dst, nodes, version)
    print(f"{src} -> {dst}")
    print(f"  animation: {name!r}, curves: {n_curves} ({n_resampled} resampled), "
          f"frames: {max_frame + 1}")
    if ra is not None and ra.events:
        print(f"  REMINDER: after repackaging, inject events: "
              f"python animfix.py --inject-events <repackaged.hmd> {ref_hmd}")
    elif ra is None:
        print("  note: new animation -- add events (if any) after repackaging: "
              "python animfix.py --inject-events <repackaged.hmd> --event frame:name")
    for w in warnings:
        print(f"  WARNING: {w}")
    return dst


# --- event injection into a repackaged HMD -----------------------------------

def inject_events(hmd_path: str, ref_hmd: str = None, extra: list = None,
                  backup: bool = True) -> None:
    events = []
    if ref_hmd:
        ref = H.load(ref_hmd)
        if ref.animations and ref.animations[0].events:
            events = [(e.frame, e.data) for e in ref.animations[0].events]
    if extra:
        events = [(int(f), n) for f, n in (e.split(":", 1) for e in extra)]
    if not events:
        raise ValueError("no events to inject (reference has none and no --event given)")

    buf = open(hmd_path, "rb").read()
    # walk the header with a position-tracking reader up to animation 0's
    # events insertion point (= right after its objects block)
    import io
    r = H.Reader(io.BytesIO(buf))
    d = H.Data()
    f = r.f
    assert f.read(3) == b"HMD"
    r.version = f.read(1)[0]
    dp_ofs = f.tell()
    data_pos = r.i32()
    r.props()
    for _ in range(r.i32()):  # geometries
        r.props(); r.i32(); r.vformat(); r.i32()
        sub = r.byte()
        if sub == 0xFF: sub = r.i32()
        for _ in range(sub): r.i32()
        r.i32(); r.bounds()
    for _ in range(r.i32()):  # materials
        mp = r.props(); r.name(); r.name(); r.byte(); r.byte(); r.f32()
        if mp and "HasExtraTextures" in mp:
            r.name(); r.name()
    for _ in range(r.i32()):  # models
        mp = r.props(); r.name(); r.i32(); r.name(); r.position(); geom = r.i32() - 1
        if geom < 0: continue
        mc = r.byte()
        if mc == 0xFF: mc = r.i32()
        for _ in range(mc): r.i32()
        r.skin()
        if mp:
            if "HasLod" in mp:
                for _ in range(r.i32()): r.i32()
            if "HasCollider" in mp: r.i32()
            if "HasColliders" in mp:
                for _ in range(r.i32()): r.i32()
    n_anims = r.i32()
    if n_anims < 1:
        raise ValueError(f"{hmd_path} contains no animation")
    r.props(); r.name(); r.i32(); r.f32(); r.f32()
    flags_ofs = f.tell()
    flags = r.byte()
    r.i32()
    for _ in range(r.i32()):  # objects
        r.name()
        of = r.byte()
        if of & (1 << 6):  # HasProps
            for _ in range(r.byte()): r.name()
    insert_ofs = f.tell()
    old_end = insert_ofs
    if flags & 2:  # existing events: measure and replace them
        for _ in range(r.i32()):
            r.i32(); r.name()
        old_end = f.tell()

    blk = struct.pack("<i", len(events))
    for fr, name in events:
        nb = name.encode("utf-8")
        blk += struct.pack("<i", fr) + bytes([len(nb)]) + nb

    out = bytearray(buf[:insert_ofs]) + blk + buf[old_end:]
    out[flags_ofs] = flags | 2
    delta = len(blk) - (old_end - insert_ofs)
    struct.pack_into("<i", out, dp_ofs, data_pos + delta)

    if backup:
        import shutil
        shutil.copy(hmd_path, hmd_path + ".bak")
    open(hmd_path, "wb").write(bytes(out))
    print(f"{hmd_path}: events set to {events}"
          + (f" (backup: {hmd_path}.bak)" if backup else " (no backup)"))
    H.load(hmd_path)  # self-check: file still parses
    print("  verification: patched file parses OK")


if __name__ == "__main__":
    args = sys.argv[1:]
    if not args:
        print(__doc__); sys.exit(1)
    if args[0] == "--inject-events":
        rest = args[1:]
        backup = True
        if "--no-backup" in rest:
            backup = False
            rest.remove("--no-backup")
        extra = []
        while "--event" in rest:
            i = rest.index("--event")
            extra.append(rest[i + 1]); del rest[i:i + 2]
        hmd = rest[0]
        ref = rest[1] if len(rest) > 1 else None
        inject_events(hmd, ref, extra, backup)
        sys.exit(0)
    rig = "Male01"
    if "--rig" in args:
        i = args.index("--rig")
        rig = args[i + 1]; del args[i:i + 2]
    trim = 0
    if "--trim" in args:
        i = args.index("--trim")
        trim = args[i + 1]; del args[i:i + 2]
    name = None
    if "--name" in args:
        i = args.index("--name")
        name = args[i + 1]; del args[i:i + 2]
    def _is_hmd(p):
        try:
            with open(p, "rb") as f:
                return f.read(3) == b"HMD"
        except OSError:
            return False
    exts = [a for a in args if a.lower().endswith((".fbx", ".hmd"))]
    fbxs = [a for a in exts if a.lower().endswith(".fbx") and not _is_hmd(a)]
    hmds = [a for a in exts if a.lower().endswith(".hmd") or _is_hmd(a)]
    for a in hmds:
        if a.lower().endswith(".fbx"):
            print(f"note: {a} is HMD content despite its .fbx name -- "
                  "treating it as the reference HMD")
    if not fbxs:
        print("need a Blender-exported .fbx (plus a reference animation .hmd, "
              "or --name <AnimationName> for a brand-new animation)")
        sys.exit(1)
    if not hmds and name is None:
        print("no reference .hmd given: for a NEW animation, pass --name <AnimationName>")
        sys.exit(1)
    if trim == "ref":
        trim = H.load(hmds[0]).animations[0].frames
    fix_fbx(fbxs[0], hmds[0] if hmds else None, rig, int(trim), name)
