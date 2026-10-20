#!/usr/bin/env python3
"""Recompute vertex normals + tangents of an HMD in place (positions, UVs, weights, triangles untouched).

Symptom this fixes: the model animates fine in game but renders solid BLACK, whatever the textures.
Cause seen on the Ginaz Swordmaster: 84% of vertices had zero-length normals after a Blender cleanup
(clearing custom-normal data before FBX export), so the lighting had nothing to work with.
check_hmd.py reports this as "bad normals".

Normals: area-weighted face normals, smoothed across vertices sharing a position (so UV seams don't
show), using the HMD triangle winding (verified on vanilla + toolkit-converted models: (b-a)x(c-a) of the
stored triangle order agrees with authored normals ~99%).
Tangents: standard per-triangle UV tangent, Gram-Schmidt against the new normal, unit length.

Usage:  python fix_normals.py <in.hmd> [--out <out.hmd>]   (default: overwrite, keeping <in>.bak)
"""
import argparse
import math
import os
import shutil
import struct
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from dsw_common import cfg  # noqa: E402

sys.path.insert(0, os.path.join(cfg("toolkit_dir"), "Models"))
import hmd_reader as H  # noqa: E402


def norm(v):
    l = math.sqrt(v[0] * v[0] + v[1] * v[1] + v[2] * v[2])
    return (v[0] / l, v[1] / l, v[2] / l) if l > 1e-12 else None


def cross(a, b):
    return (a[1] * b[2] - a[2] * b[1], a[2] * b[0] - a[0] * b[2], a[0] * b[1] - a[1] * b[0])


def sub(a, b):
    return (a[0] - b[0], a[1] - b[1], a[2] - b[2])


def stats(vs, tris):
    zero = sum(1 for v in vs if math.sqrt(sum(c * c for c in v["normal"])) < 0.5)
    agree = tot = 0
    for t in range(0, len(tris) - 2, 3):
        a, b, c = (vs[i]["position"] for i in tris[t:t + 3])
        fn = cross(sub(b, a), sub(c, a))
        tot += 1
        agree += sum(fn[i] * vs[tris[t]]["normal"][i] for i in range(3)) > 0
    return zero, (100.0 * agree / tot if tot else 0.0)


def fix(path, out):
    d = H.load(path)
    raw = bytearray(open(path, "rb").read())
    # locate the data block inside the file
    base = raw.find(d.data[:4096]) if len(d.data) >= 64 else -1
    if base < 0 or raw[base:base + len(d.data)] != d.data:
        sys.exit("could not locate the HMD data block in the file")
    for gi, g in enumerate(d.geometries):
        vf = g.vertexFormat
        if not (vf.has_input("position") and vf.has_input("normal")):
            continue
        vs = H.decode_vertices(d, g)
        tris = [i for sub_ in H.decode_indices(d, g) for i in sub_]
        z0, a0 = stats(vs, tris)
        # area-weighted face normals, accumulated per welded position
        key = lambda p: (round(p[0], 5), round(p[1], 5), round(p[2], 5))
        acc = {}
        tan = [[0.0, 0.0, 0.0] for _ in vs]
        has_uv = vf.has_input("uv")
        for t in range(0, len(tris) - 2, 3):
            i0, i1, i2 = tris[t:t + 3]
            p0, p1, p2 = vs[i0]["position"], vs[i1]["position"], vs[i2]["position"]
            e1, e2 = sub(p1, p0), sub(p2, p0)
            fn = cross(e1, e2)                         # length = 2 * area -> area weighting
            for i in (i0, i1, i2):
                k = key(vs[i]["position"])
                s = acc.setdefault(k, [0.0, 0.0, 0.0])
                s[0] += fn[0]; s[1] += fn[1]; s[2] += fn[2]
            if has_uv:
                u0, u1, u2 = vs[i0]["uv"], vs[i1]["uv"], vs[i2]["uv"]
                du1, dv1 = u1[0] - u0[0], u1[1] - u0[1]
                du2, dv2 = u2[0] - u0[0], u2[1] - u0[1]
                det = du1 * dv2 - du2 * dv1
                if abs(det) > 1e-12:
                    r = 1.0 / det
                    tv = tuple((e1[j] * dv2 - e2[j] * dv1) * r for j in range(3))
                    for i in (i0, i1, i2):
                        for j in range(3):
                            tan[i][j] += tv[j]
        no = vf.input_offset("normal")
        to = vf.input_offset("tangent") if vf.has_input("tangent") else None
        stride = vf.stride * 4
        for vi, v in enumerate(vs):
            n = norm(acc.get(key(v["position"]), (0, 0, 0))) or (0.0, 0.0, 1.0)
            off = base + g.vertexPosition + vi * stride
            struct.pack_into("<3f", raw, off + no * 4, *n)
            v["normal"] = n
            if to is not None:
                t = tan[vi]
                dot = t[0] * n[0] + t[1] * n[1] + t[2] * n[2]
                t = norm((t[0] - n[0] * dot, t[1] - n[1] * dot, t[2] - n[2] * dot))
                if t is None:                          # degenerate UVs: any vector perpendicular to n
                    t = norm(cross(n, (0, 0, 1) if abs(n[2]) < 0.9 else (1, 0, 0)))
                struct.pack_into("<3f", raw, off + to * 4, *t)
        z1, a1 = stats(vs, tris)
        print(f"geometry {gi}: {g.vertexCount} verts | zero-length normals {z0} -> {z1} | "
              f"normals agreeing with triangle facing {a0:.1f}% -> {a1:.1f}%")
    if out == path:
        shutil.copy2(path, path + ".bak")
    with open(out, "wb") as f:
        f.write(raw)
    print("wrote", out)


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("hmd")
    ap.add_argument("--out")
    a = ap.parse_args()
    fix(a.hmd, a.out or a.hmd)


if __name__ == "__main__":
    main()
