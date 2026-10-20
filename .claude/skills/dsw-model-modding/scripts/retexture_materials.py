#!/usr/bin/env python3
"""Per-material texture-path rewriting for HMD files (the toolkit's retexture.py only maps path -> path, so two
materials that the converter wired to the SAME canonical path can't be told apart).

Typical use: a body with a second material (e.g. a sword lifted from a vanilla unit) whose real textures live in the
game's own resources, while the body's textures live in CharMOD/<Name>/.

  python retexture_materials.py <model.hmd> --set Mat_Sword=Character/Atreide/Unit/Soldier/AtreideSoldier01 \
                                           --set Mat_Body=CharMOD/Male01_X/Male01_X
Each --set NAME=BASE points the material's diffuse/specular/normal at BASE_Albedo.png / BASE_MetallicGlossAO.png /
BASE_Normal.png. With no --set it just lists the materials and their paths.
"""
import argparse
import os
import struct
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from dsw_common import cfg  # noqa: E402

sys.path.insert(0, os.path.join(cfg("toolkit_dir"), "Models"))
import hmd_reader as H  # noqa: E402
import retexture as RT  # noqa: E402

SUFFIX = {"diffuse": "_Albedo.png", "specular": "_MetallicGlossAO.png", "normal": "_Normal.png"}


def list_materials(hmd):
    buf = open(hmd, "rb").read()
    d = H.load(hmd)
    _, found = RT.find_texture_strings(buf)
    rows = {}
    for ofs, ln, val, mi, slot in found:
        rows.setdefault(mi, {"name": d.materials[mi].name})[slot] = val
    return rows


def set_material_textures(hmd, assignments):
    """assignments: {material_name: base_path}. Splices the header like retexture.rewrite()."""
    buf = open(hmd, "rb").read()
    d = H.load(hmd)
    dp_ofs, found = RT.find_texture_strings(buf)
    data_pos = struct.unpack_from("<i", buf, dp_ofs)[0]
    names = {i: m.name for i, m in enumerate(d.materials)}
    missing = [n for n in assignments if n not in names.values()]
    if missing:
        sys.exit(f"material(s) not in {hmd}: {missing}; it has {list(names.values())}")
    out = bytearray()
    prev = 0
    changes = []
    for ofs, length, val, mi, slot in found:
        base = assignments.get(names[mi])
        if base is None:
            continue
        new = base.replace("\\", "/").rstrip("/") + SUFFIX[slot]
        if new == val:
            continue
        nb = new.encode("utf-8")
        out += buf[prev:ofs] + bytes([len(nb)]) + nb
        prev = ofs + length
        changes.append((names[mi], slot, val, new))
    out += buf[prev:]
    struct.pack_into("<i", out, dp_ofs, data_pos + len(out) - len(buf))
    open(hmd, "wb").write(bytes(out))
    H.load(hmd)                                   # self-check: the result still parses
    return changes


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("hmd")
    ap.add_argument("--set", action="append", default=[], metavar="NAME=BASE")
    a = ap.parse_args()
    if a.set:
        asg = dict(s.split("=", 1) for s in a.set)
        for c in set_material_textures(a.hmd, asg):
            print("  %s %s: %s -> %s" % c)
    for mi, r in sorted(list_materials(a.hmd).items()):
        print(f"material {mi} {r.pop('name')}: {r}")


if __name__ == "__main__":
    main()
