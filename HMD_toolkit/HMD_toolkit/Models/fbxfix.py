"""
fbxfix.py -- normalize a Blender-exported FBX for the game's HMD repackager.

Workflow: game HMD -> hmd2fbx.py -> import in Blender -> edit mesh ->
          File > Export > FBX (Up: Z, Forward: Y) -> fbxfix.py -> repackager.

Because hmd2fbx.py already pre-mirrors the scene for the game's left-handed
pipeline and Blender preserves matrices through import/export, the geometry
and skeleton need no further conversion. What this tool does:

1. GlobalSettings: forces the axis/unit header combination that makes BOTH
   Heaps axis-conversion code paths inject no PreRotation, and keeps the
   legacy unit-scale path at factor 1 (UpAxis=2, FrontAxis=2, scale 100/100).
2. Strips baked animation nodes (AnimationStack/Layer/CurveNode/Curve) that
   Blender exports by default -- animations stay HMD-side.
3. Strips Blender's optional "_end" leaf bones (unskinned, childless) so no
   phantom joints reach the HMD.
4. Validates: root models should have no rotation (a +/-90deg X there means
   the scene went through a Y-up import/export -- re-export with Up=Z from a
   current hmd2fbx file); warns if vertices use more than 3 bone influences
   (the game keeps the strongest 3 and renormalizes).
5. Rebuilds Definitions counts.

Usage: python fbxfix.py input.fbx [output.fbx]   (default: input_fixed.fbx)
"""

from __future__ import annotations

import sys

import numpy as np

from fbx_binary import Node, read_fbx, write_fbx

ANIM_TYPES = {"AnimationStack", "AnimationLayer", "AnimationCurveNode", "AnimationCurve"}
D4 = np.diag([-1.0, 1.0, 1.0, 1.0])

GS_FORCE = {  # name: (type, label, flags, value)
    "UpAxis": ("int", "Integer", "", 2),
    "UpAxisSign": ("int", "Integer", "", 1),
    "FrontAxis": ("int", "Integer", "", 2),
    "FrontAxisSign": ("int", "Integer", "", 1),
    "CoordAxis": ("int", "Integer", "", 0),
    "CoordAxisSign": ("int", "Integer", "", 1),
    "OriginalUpAxis": ("int", "Integer", "", 2),
    "OriginalUpAxisSign": ("int", "Integer", "", 1),
    "UnitScaleFactor": ("double", "Number", "", 100.0),
    "OriginalUnitScaleFactor": ("double", "Number", "", 100.0),
}


def props70(node: Node) -> dict:
    out = {}
    for ch in node.children:
        if ch.name == "Properties70":
            for p in ch.children:
                out[p.props[0]] = p
    return out


def obj_name(o: Node) -> str:
    return o.props[1].split("\x00")[0] if len(o.props) > 1 and isinstance(o.props[1], str) else ""


def restore_skeleton(nodes: list, ref_hmd: str, log: dict) -> None:
    """Overwrite bone rest transforms, cluster bind matrices and the bind pose
    with authoritative values from the original HMD (matched by bone name).
    Blender re-derives bone orientations through its own bone representation,
    which silently changes the frames that HMD animations are authored in;
    this puts them back. Blender's mesh, weights and materials are kept."""
    import hmd_reader as H
    from hmd2fbx import pos_to_mat4, mat4_to_euler_xyz_deg

    d = H.load(ref_hmd)
    model = d.models[0]
    skin = model.skin
    if skin is None:
        raise ValueError(f"{ref_hmd} has no skin")
    model_mat = pos_to_mat4(model.position)
    root = next(j for j in skin.joints if j.parent < 0)
    if root.transpos is not None:
        R_conv = pos_to_mat4(root.transpos) @ pos_to_mat4(root.position)
    else:
        # Most vehicle rigs (Kraken, Renegade, Wraith, ...) have a bare B_ROOT with no bind matrix.
        # R_conv = transpos @ global-rest holds for ANY joint that has a bind matrix (for the root the
        # global rest is just its local), so derive it from the first such joint (patched 2026-10-29).
        joints = skin.joints
        gl = []
        for j in joints:
            loc = pos_to_mat4(j.position)
            gl.append(loc @ gl[j.parent] if j.parent >= 0 else loc)
        ji = next((i for i, j in enumerate(joints) if j.transpos is not None), None)
        if ji is None:
            raise ValueError("no joint has a bind matrix; cannot derive Z-up bake")
        R_conv = pos_to_mat4(joints[ji].transpos) @ gl[ji]
    R_conv[3, :3] = 0

    # reference values per joint name
    globals_ = []
    ref = {}
    for ji, j in enumerate(skin.joints):
        local = pos_to_mat4(j.position)
        g = local @ globals_[j.parent] if j.parent >= 0 else local
        globals_.append(g)
        link = (np.linalg.inv(pos_to_mat4(j.transpos)) @ R_conv
                if j.transpos is not None else g)
        ref[j.name] = {
            "local_enc": D4 @ local @ D4,
            "scale": (j.position.sx, j.position.sy, j.position.sz),
            "TL": D4 @ link @ D4,
            "T": D4 @ (model_mat @ np.linalg.inv(link)) @ D4,
        }

    top = {n.name: n for n in nodes}
    objects = top["Objects"]
    conns = [c for c in top["Connections"].children if c.props[0] == "OO"]
    byid = {o.props[0]: o for o in objects.children}
    children = {}
    for c in conns:
        children.setdefault(c.props[2], []).append(c.props[1])

    def set_p70(node, name, ptype, label, flags, values):
        pp = props70(node)
        if name in pp:
            pp[name].props[4:] = list(values)
        else:
            p70 = next((ch for ch in node.children if ch.name == "Properties70"), None)
            if p70 is None:
                p70 = Node("Properties70")
                node.children.insert(0, p70)
            p70.children.append(Node("P", name, ptype, label, flags, *values))

    from array import array
    fixed_bones = 0
    unmatched = []
    bone_by_id = {}
    for o in objects.children:
        if o.name == "Model" and o.props[2] == "LimbNode":
            nm = obj_name(o)
            if nm not in ref:
                unmatched.append(nm)
                continue
            bone_by_id[o.props[0]] = nm
            r = ref[nm]
            m = r["local_enc"]
            t = m[3, :3]
            e = mat4_to_euler_xyz_deg(m)
            set_p70(o, "Lcl Translation", "Lcl Translation", "", "A",
                    [float(t[0]), float(t[1]), float(t[2])])
            set_p70(o, "Lcl Rotation", "Lcl Rotation", "", "A", list(e))
            set_p70(o, "Lcl Scaling", "Lcl Scaling", "", "A",
                    [float(v) for v in r["scale"]])
            fixed_bones += 1

    fixed_clusters = 0
    for o in objects.children:
        if o.name == "Deformer" and o.props[2] == "Cluster":
            bone_nm = None
            for cid in children.get(o.props[0], []):
                if cid in bone_by_id:
                    bone_nm = bone_by_id[cid]
            if bone_nm is None:
                log["warnings"].append(f"cluster {obj_name(o)!r} has no matched bone; left as-is")
                continue
            r = ref[bone_nm]
            for ch in o.children:
                if ch.name == "Transform":
                    ch.props[0] = array("d", r["T"].flatten())
                elif ch.name == "TransformLink":
                    ch.props[0] = array("d", r["TL"].flatten())
            fixed_clusters += 1

    for o in objects.children:
        if o.name == "Pose":
            for pn in o.children:
                if pn.name != "PoseNode":
                    continue
                nid = next((ch.props[0] for ch in pn.children if ch.name == "Node"), None)
                if nid in bone_by_id:
                    for ch in pn.children:
                        if ch.name == "Matrix":
                            ch.props[0] = array("d", ref[bone_by_id[nid]]["TL"].flatten())

    log["skeleton_restored"] = f"{fixed_bones} bones, {fixed_clusters} clusters (ref: {ref_hmd})"
    if unmatched:
        log["warnings"].append(
            f"bones not in reference skeleton (left untouched): {unmatched} -- "
            "new/renamed bones cannot be driven by original animations")
    missing = set(ref) - set(bone_by_id.values())
    if missing:
        log["warnings"].append(f"reference joints missing from FBX: {sorted(missing)}")


def fix(src: str, dst: str, skel_ref: str = None) -> None:
    version, nodes = read_fbx(src)
    top = {n.name: n for n in nodes}
    log = {"warnings": []}

    # ---- 1. GlobalSettings -------------------------------------------------
    gs = top["GlobalSettings"]
    gsp = next(ch for ch in gs.children if ch.name == "Properties70")
    seen = set()
    changed = []
    for p in gsp.children:
        name = p.props[0]
        if name in GS_FORCE:
            seen.add(name)
            want = GS_FORCE[name][3]
            have = p.props[4] if len(p.props) > 4 else None
            if have != want:
                changed.append(f"{name}: {have} -> {want}")
                p.props[4:] = [want]
    for name, (t, lbl, fl, val) in GS_FORCE.items():
        if name not in seen:
            gsp.children.insert(0, Node("P", name, t, lbl, fl, val))
            changed.append(f"{name}: (absent) -> {val}")
    log["globalsettings_changed"] = changed or "none"

    objects = top["Objects"]
    connections = top["Connections"]
    conns = connections.children

    # ---- 2. strip animation nodes -------------------------------------------
    anim_ids = {o.props[0] for o in objects.children if o.name in ANIM_TYPES}
    if anim_ids:
        objects.children = [o for o in objects.children if o.name not in ANIM_TYPES]
        before = len(conns)
        connections.children = [c for c in conns
                                if not (c.props[1] in anim_ids or c.props[2] in anim_ids)]
        conns = connections.children
        log["stripped_animation_nodes"] = f"{len(anim_ids)} objects, {before - len(conns)} connections"

    # ---- build connection maps ----------------------------------------------
    byid = {o.props[0]: o for o in objects.children}
    parents = {}   # child -> [parent ids]  (OO only)
    children = {}  # parent -> [child ids]
    for c in conns:
        if c.props[0] == "OO":
            parents.setdefault(c.props[1], []).append(c.props[2])
            children.setdefault(c.props[2], []).append(c.props[1])

    cluster_bones = set()  # bone model ids referenced by skin clusters
    for o in objects.children:
        if o.name == "Deformer" and o.props[2] == "Cluster":
            for ch_id in children.get(o.props[0], []):
                ob = byid.get(ch_id)
                if ob is not None and ob.name == "Model":
                    cluster_bones.add(ch_id)

    # ---- 3. strip "_end" leaf bones -----------------------------------------
    drop = set()
    for o in objects.children:
        if o.name != "Model" or o.props[2] != "LimbNode":
            continue
        oid = o.props[0]
        if not obj_name(o).endswith("_end") or oid in cluster_bones:
            continue
        has_model_children = any(byid.get(cid) is not None and byid[cid].name == "Model"
                                 for cid in children.get(oid, []))
        if has_model_children:
            continue
        drop.add(oid)
        for cid in children.get(oid, []):  # its NodeAttribute
            ob = byid.get(cid)
            if ob is not None and ob.name == "NodeAttribute":
                drop.add(cid)
    if drop:
        objects.children = [o for o in objects.children if o.props[0] not in drop]
        connections.children = [c for c in connections.children
                                if not (c.props[1] in drop or c.props[2] in drop)]
        log["stripped_leaf_bones"] = len([d for d in drop if byid[d].name == "Model"])

    # ---- 4a. root model rotation check ---------------------------------------
    for o in objects.children:
        if o.name != "Model":
            continue
        if 0 not in parents.get(o.props[0], [0]):
            continue
        pp = props70(o)
        rot = pp.get("Lcl Rotation")
        if rot is not None and any(abs(float(v)) > 0.01 for v in rot.props[4:7]):
            log["warnings"].append(
                f"root model {obj_name(o)!r} has rotation "
                f"{[round(float(v), 3) for v in rot.props[4:7]]} -- expected none. "
                "Re-export from Blender with Up=Z, Forward=Y, from a scene imported "
                "from a current hmd2fbx FBX (do not rotate root objects).")

    # ---- 4b. influence count check --------------------------------------------
    for o in objects.children:
        if o.name != "Deformer" or o.props[2] != "Skin":
            continue
        counts = {}
        for cid in children.get(o.props[0], []):
            cl = byid.get(cid)
            if cl is None or cl.name != "Deformer":
                continue
            for ch in cl.children:
                if ch.name == "Indexes":
                    for vi in ch.props[0]:
                        counts[vi] = counts.get(vi, 0) + 1
        over = sum(1 for v in counts.values() if v > 3)
        if over:
            log["warnings"].append(
                f"{over} vertices have >3 bone influences; the game keeps the "
                "strongest 3 and renormalizes (minor deformation differences).")

    # ---- 4c. restore skeleton from reference HMD -------------------------------
    if skel_ref:
        restore_skeleton(nodes, skel_ref, log)
    else:
        log["warnings"].append(
            "no --skel reference HMD given: bone frames stay as Blender exported "
            "them, which usually breaks original animations. Pass the source HMD "
            "(e.g. drop it together with the FBX).")

    # ---- 5. rebuild Definitions ------------------------------------------------
    counts = {}
    for o in objects.children:
        counts[o.name] = counts.get(o.name, 0) + 1
    defs = top.get("Definitions")
    if defs is not None:
        kept = []
        for ot in defs.children:
            if ot.name != "ObjectType":
                kept.append(ot)
                continue
            tname = ot.props[0]
            if tname == "GlobalSettings":
                kept.append(ot)
                continue
            if counts.get(tname):
                for ch in ot.children:
                    if ch.name == "Count":
                        ch.props[0] = counts[tname]
                kept.append(ot)
        defs.children = kept
        for ch in defs.children:
            if ch.name == "Count":
                ch.props[0] = sum(counts.values()) + 1

    write_fbx(dst, nodes, version)

    print(f"{src} -> {dst}")
    for k, v in log.items():
        if k != "warnings":
            print(f"  {k}: {v}")
    for w in log["warnings"]:
        print(f"  WARNING: {w}")
    if not log["warnings"]:
        print("  no warnings -- ready for the repackager")
    return dst


if __name__ == "__main__":
    args = [a for a in sys.argv[1:] if a != "--skel"]
    if not args:
        print(__doc__)
        sys.exit(1)
    # any HMD argument (by content -- game exports may be named .fbx) is the
    # skeleton reference; genuine .fbx arguments are inputs
    def _is_hmd(p):
        try:
            with open(p, "rb") as f:
                return f.read(3) == b"HMD"
        except OSError:
            return False
    exts = [a for a in args if a.lower().endswith((".fbx", ".hmd"))]
    refs = [a for a in exts if a.lower().endswith(".hmd") or _is_hmd(a)]
    fbxs = [a for a in exts if a.lower().endswith(".fbx") and not _is_hmd(a)]
    for a in refs:
        if a.lower().endswith(".fbx"):
            print(f"note: {a} is HMD content despite its .fbx name -- "
                  "treating it as the skeleton reference")
    skel = refs[0] if refs else None
    if len(refs) > 1:
        print(f"NOTE: multiple .hmd given, using {skel} as skeleton reference")
    if not fbxs:
        print("no .fbx input given"); sys.exit(1)
    if len(fbxs) == 1:
        out = fbxs[0].rsplit(".", 1)[0] + "_fixed.fbx"
        fix(fbxs[0], out, skel)
    else:
        for f in fbxs:
            try:
                fix(f, f.rsplit(".", 1)[0] + "_fixed.fbx", skel)
            except Exception as e:
                print(f"ERROR fixing {f}: {e}")
