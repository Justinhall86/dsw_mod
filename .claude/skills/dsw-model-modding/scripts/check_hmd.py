#!/usr/bin/env python3
"""Sanity-check a converted HMD before it goes into the pak.

Catches the problems that otherwise only show up in game:
  * texture paths that don't resolve under <editor>/res/res   -> magenta / missing textures
  * no materials.props beside the HMD                          -> model renders BLACK
  * material names missing from materials.props                -> that material renders black
  * skeleton bone names that differ from the rig reference     -> animations don't drive the mesh
  * vertex / triangle counts (budget: vanilla units are ~3-8k verts)

Usage:
  python check_hmd.py <path/to/Model.hmd> [--rig Male01|Female01] [--res-root <editor>/res/res]
Exit code 1 if any ERROR was printed.
"""
import argparse
import json
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from dsw_common import cfg, editor_res  # noqa: E402

sys.path.insert(0, os.path.join(cfg("toolkit_dir"), "Models"))
import hmd_reader as H  # noqa: E402


def skin_joint_names(d):
    for m in d.models:
        if m.skin:
            return [j.name for j in m.skin.joints]
    return []


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("hmd")
    ap.add_argument("--rig", default="Male01")
    ap.add_argument("--res-root", default=os.path.join(editor_res(), "res"))
    a = ap.parse_args()

    errors = 0

    def err(msg):
        nonlocal errors
        errors += 1
        print("ERROR:", msg)

    d = H.load(a.hmd)
    folder = os.path.dirname(os.path.abspath(a.hmd))
    print(f"{a.hmd}: HMD v{d.version}, {len(d.geometries)} geometries, {len(d.materials)} materials, "
          f"{len(d.models)} models")
    for i, g in enumerate(d.geometries):
        print(f"  geometry {i}: {g.vertexCount} verts, {g.indexCount // 3} tris")

    # materials + textures
    # normals: zero-length / inward normals make the model render BLACK in game (Ginaz lesson)
    import fix_normals
    for gi, g in enumerate(d.geometries):
        if g.vertexFormat.has_input("normal"):
            vs = H.decode_vertices(d, g)
            tris = [i for s in H.decode_indices(d, g) for i in s]
            zero, agree = fix_normals.stats(vs, tris)
            print(f"  geometry {gi} normals: {zero} zero-length, {agree:.1f}% agree with triangle facing")
            if zero > g.vertexCount * 0.01 or agree < 90:
                err(f"bad normals in geometry {gi} -> model renders BLACK (run fix_normals.py)")
    # materials.props: optional (the working helmet guard has none - tested 2026-10-18), but when the
    # vanilla model folder ships one its PBR/emissive settings matter - Duncan has "emissive": 1, and
    # rendering without it shows the model DARKER than vanilla (Duncan Modified, 2026-10-19).
    props_path = os.path.join(folder, "materials.props")
    props_names = set()
    if os.path.exists(props_path):
        props_names = set(json.load(open(props_path, encoding="utf-8"))["materials"].get("PBR", {}))
    else:
        print("  note: no materials.props beside the HMD - model may render darker than vanilla if the "
              "vanilla folder ships one (copy it, keyed by HMD material name)")
    for m in d.materials:
        print(f"  material {m.name!r}")
        if props_names and m.name not in props_names:
            err(f"material {m.name!r} not in materials.props {sorted(props_names)}")
        for slot in ("diffuseTexture", "specularTexture", "normalMap"):
            p = getattr(m, slot)
            if not p:
                print(f"    {slot}: (none)")
                continue
            rel = p.replace("\\", "/").lstrip("/")
            ok = os.path.exists(os.path.join(a.res_root, rel)) or os.path.exists(os.path.join(cfg("extr_dir"), rel))
            print(f"    {slot}: {p} {'OK' if ok else 'NOT FOUND'}")
            if not ok:
                err(f"{slot} path {p!r} does not resolve under {a.res_root}")
            elif not p.lower().endswith(".png"):
                err(f"{slot} {p!r} is not a PNG (the game only loads PNG)")
            else:
                full = os.path.join(a.res_root, rel)
                if not os.path.exists(full):
                    continue                  # vanilla game texture (found in the extracted assets, DDS under a .png name)
                with open(full, "rb") as fh:
                    head = fh.read(26)
                if head[:4] == b"\x89PNG" and head[25] != 6:
                    err(f"{slot} {p!r} is not RGBA (PNG color type {head[25]}); "
                        f"working models use RGBA with alpha 255")

    # skeleton vs rig
    rig_path = os.path.join(cfg("toolkit_dir"), "Rigs", a.rig + ".hmd")
    mine = skin_joint_names(d)
    if not mine:
        err("no skin found - the mesh is not skinned to the rig and will not animate")
    elif os.path.exists(rig_path):
        ref = skin_joint_names(H.load(rig_path))
        missing = [n for n in ref if n not in mine]
        extra = [n for n in mine if n not in ref]
        print(f"  skeleton: {len(mine)} joints (rig {a.rig}: {len(ref)})")
        if missing:
            err(f"joints missing vs {a.rig}: {missing[:10]}{'...' if len(missing) > 10 else ''}")
        if extra:
            print(f"  note: extra joints not in {a.rig}: {extra[:10]}")
    print("RESULT:", "FAIL" if errors else "OK")
    sys.exit(1 if errors else 0)


if __name__ == "__main__":
    main()
