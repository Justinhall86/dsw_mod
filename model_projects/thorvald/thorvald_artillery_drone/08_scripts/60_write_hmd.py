"""Write a painted drone variant as game files: two HMDs on the vanilla DroneC rig, textures, prefab, props.

    blender -b --factory-startup --python 60_write_hmd.py -- <variant> [--name ThorvaldDrone] [--geo-only <dir>]
    (cloud session: python 60_write_hmd.py -- <variant>   with the pip `bpy` module)

Output: 06_game_ready/VehMOD/<name>/  (= res/VehMOD/<name>/ in the editor's res tree)
    <name>Base.hmd, <name>Canon.hmd           legs / hull + gun, same split as the vanilla ImperiumDroneBase / ImperiumDroneCanon
    <name>[_Part]_{Albedo,MetallicGlossAO,Normal}.png    one map set per material (real PNG, like the installed Thorvald ship)
    Prefab_<name>.prefab                      the vanilla Prefab_DroneC with our models; MuzzleA/B re-aimed at the new barrel tips
    materials.props, props.json               PBR materials (emissive 0.1 as the vanilla drone), anim path /Anim/DroneC

Why not the toolkit's FBX -> HMD conversion (51_convert_vehicle.py + 53_fix_bind.py): it needs the game's D4X.exe, and it
re-derives the skeleton (the bind-rotation fault 53_fix_bind repairs). Here each HMD is the VANILLA file with only its geometry
and materials replaced (hmd_writer.py reproduces every vanilla vehicle HMD byte for byte):
  * joints, bind poses (transpos), model name/transform and skin are copied unchanged, so the DroneC animations, the deploy
    and the muzzle bones behave exactly as on the Corrino drone;
  * every vanilla vertex that survived the kitbash is copied from the vanilla record (normal, tangent, UV, weights, joint
    indexes) with only its position updated (hmd_vid attribute from 20_build_drone.py);
  * grafted vertices: position/normal mirrored back (x -> -x, hmd2fbx's left-hand pre-mirror), v -> 1 - v, tangent from the
    UV gradient (checked against the vanilla tangents), weights mapped to the HMD's bind slots;
  * triangles (a, b, c) in Blender -> (a, c, b) in the HMD (hmd2fbx reverses winding).
Skinned vehicles with several materials and no skin split are vanilla practice (Chronos, Harvester, Ecaz drone).
"""
import json
import os
import shutil
import struct
import sys

import bpy  # noqa: I001
import numpy as np

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import drone_scene as ds  # noqa: E402
import hmd_writer as HW  # noqa: E402

H = HW.H
sys.path.insert(0, os.path.join(ds.REPO, "HMD_toolkit", "HMD_toolkit", "Models"))
from hmd2fbx import pos_to_mat4  # noqa: E402

argv = sys.argv[sys.argv.index("--") + 1:]
VAR = argv[0]
NAME = argv[argv.index("--name") + 1] if "--name" in argv else "ThorvaldDrone"
GEO_ONLY = "--geo-only" in argv          # check run: <variant>_geo.blend, HMDs only (no textures/prefab), into the scratch dir
RES = "VehMOD/%s" % NAME
OUT = os.path.join(ds.PROJ, "06_game_ready", "VehMOD", NAME)
if GEO_ONLY:
    OUT = os.path.abspath(argv[argv.index("--geo-only") + 1])
TEMPL = {"Base": os.path.join(ds.DRONE_DIR, "ImperiumDroneBase.fbx"), "Canon": os.path.join(ds.DRONE_DIR, "ImperiumDroneCanon.fbx")}
PART_SUFFIX = {"Mat_ThDrone": "", "Mat_ThDrone_Renegade_Frigate": "_Tube", "Mat_ThDrone_DroneTesla": "_Funnel"}
D = np.array([-1.0, 1.0, 1.0])


def mat_suffix(m):
    base = m.split(".")[0]
    return PART_SUFFIX.get(base, "_" + base.replace("Mat_ThDrone_", ""))


def tangents(P, UV, N, tris):
    """Per-vertex tangent from the UV gradient (accumulated over triangles), orthogonalised against the normal."""
    T = np.zeros_like(P)
    for a, b, c in tris:
        e1, e2 = P[b] - P[a], P[c] - P[a]
        d1, d2 = UV[b] - UV[a], UV[c] - UV[a]
        r = d1[0] * d2[1] - d2[0] * d1[1]
        if abs(r) < 1e-12:
            continue
        t = (e1 * d2[1] - e2 * d1[1]) / r
        for i in (a, b, c):
            T[i] += t
    T = T - N * (T * N).sum(1, keepdims=True)
    n = np.linalg.norm(T, axis=1, keepdims=True)
    fallback = np.cross(N, np.array([0.0, 0.0, 1.0]))
    T = np.where(n > 1e-9, T / np.maximum(n, 1e-12), fallback)
    return T


def build_part(part, used_mats):
    ob = bpy.data.objects["ThDrone_" + part]
    me = ob.data
    d = HW.load(TEMPL[part])
    g = d.geometries[0]
    van = H.decode_vertices(d, g)
    model = d.models[0]
    bind_of = {j.name: j.bind for j in model.skin.joints if j.bind >= 0}
    gname = {vg.index: vg.name for vg in ob.vertex_groups}
    vid = np.zeros(len(me.vertices), np.int64)
    me.attributes["hmd_vid"].data.foreach_get("value", vid)
    me.calc_loop_triangles()
    cn = np.zeros(len(me.loops) * 3)
    me.corner_normals.foreach_get("vector", cn)
    cn = cn.reshape(-1, 3)
    uvl = np.zeros(len(me.loops) * 2)
    me.uv_layers["UVMap"].data.foreach_get("uv", uvl)
    uvl = uvl.reshape(-1, 2)
    lv = np.zeros(len(me.loops), np.int64)
    me.loops.foreach_get("vertex_index", lv)

    recs, key_of, loop_h = [], {}, np.zeros(len(me.loops), np.int64)
    new_idx = []
    for l in range(len(me.loops)):
        v = lv[l]
        if vid[v] > 0:
            key = ("v", int(v))
        else:
            key = ("n", int(v), tuple(np.round(cn[l], 3)), tuple(np.round(uvl[l], 5)))
        h = key_of.get(key)
        if h is None:
            h = len(recs)
            key_of[key] = h
            co = np.array(me.vertices[v].co) * D
            if vid[v] > 0:
                r = dict(van[vid[v] - 1])
                if np.abs(np.array(r["position"]) - co).max() > 1e-7:      # moved by the kitbash (else keep its exact bytes)
                    r["position"] = tuple(co)
            else:
                ws = sorted(((gr.weight, gname[gr.group]) for gr in me.vertices[v].groups if gname[gr.group] in bind_of),
                            reverse=True)[:3]
                if not ws:
                    raise SystemExit("vertex %d of %s has no bound bone" % (v, part))
                tot = sum(w for w, _ in ws)
                wts = [w / tot for w, _ in ws] + [0.0] * (3 - len(ws))
                idx = [bind_of[n] for _, n in ws] + [0] * (4 - len(ws))
                nrm = cn[l] * D
                nrm = nrm / max(np.linalg.norm(nrm), 1e-12)
                r = {"position": tuple(co), "normal": tuple(nrm), "tangent": (0.0, 0.0, 0.0),
                     "uv": (float(uvl[l][0]), float(1.0 - uvl[l][1])), "weights": tuple(wts), "indexes": tuple(idx)}
                new_idx.append(h)
            recs.append(r)
        loop_h[l] = h

    groups = {}
    for t in me.loop_triangles:
        mname = me.materials[t.material_index].name.split(".")[0]
        a, b, c = (loop_h[x] for x in t.loops)
        groups.setdefault(mname, []).append((a, c, b))       # Blender (a,b,c) -> HMD (a,c,b)
    order = [m for m in used_mats if m in groups]

    # tangents of the grafted vertices (vanilla ones keep theirs)
    if new_idx:
        P = np.array([r["position"] for r in recs])
        UV = np.array([r["uv"] for r in recs])
        N = np.array([r["normal"] for r in recs])
        T = tangents(P, UV, N, [t for m in order for t in groups[m]])
        for h in new_idx:
            recs[h]["tangent"] = tuple(T[h])

    # buffers
    vb = bytearray()
    for r in recs:
        vb += struct.pack("<3f3f3f2f3f", *r["position"], *r["normal"], *r["tangent"], *r["uv"], *r["weights"])
        vb += bytes(r["indexes"])
    big = len(recs) > 0x10000
    ib = bytearray()
    counts = []
    for m in order:
        flat = [i for tri in groups[m] for i in tri]
        ib += struct.pack("<%d%s" % (len(flat), "I" if big else "H"), *flat)
        counts.append(len(flat))
    P = np.array([r["position"] for r in recs])
    g.vertexCount = len(recs)
    g.vertexPosition = 0
    g.indexCounts = counts
    g.indexPosition = len(vb)
    g.bounds = tuple(float(x) for x in np.concatenate([P.min(0), P.max(0)]))
    d.data = bytes(vb + ib)
    d.materials = []
    for m in order:
        stem = NAME + mat_suffix(m)
        d.materials.append(H.Material(["HasExtraTextures"], "Mat_" + stem, "%s/%s_Albedo.png" % (RES, stem), "None",
                                      "%s/%s_MetallicGlossAO.png" % (RES, stem), "%s/%s_Normal.png" % (RES, stem)))
    model.materials = list(range(len(order)))
    path = os.path.join(OUT, "%s%s.hmd" % (NAME, part))
    n = HW.write(d, path)
    print("HMD %s: %d verts (%d grafted), tris per material %s, %d bytes" % (
        os.path.basename(path), len(recs), len(new_idx), dict(zip(order, [c // 3 for c in counts])), n))
    return path, order, model, recs


def muzzle_offsets(canon_hmd, recs_canon):
    """Bone-local position (the prefab Muzzle 'z') of each barrel tip: the farthest grafted/vanilla vertex on the shoot bone
    along the bone's local +Z, measured through the joint's inverse bind (transpos)."""
    d = HW.load(canon_hmd)
    sk = d.models[0].skin
    out = {}
    for side in "RL":
        j = next(j for j in sk.joints if j.name == "B_Canon%s_Shoot" % side)
        M = pos_to_mat4(j.transpos)
        pts = [np.array(r["position"] + (1.0,)) @ M for r in recs_canon
               if r["weights"][0] > 0.5 and r["indexes"][0] == j.bind]
        loc = np.array(pts)[:, :3]
        out[side] = (float(loc[:, 2].max()), loc[:, :2].mean(0).round(3).tolist(), len(pts))
    return out


def main():
    bpy.ops.wm.open_mainfile(filepath=os.path.join(ds.PROJ, "03_blender", "variants", VAR + ("_geo" if GEO_ONLY else "") + ".blend"))
    if os.path.isdir(OUT):
        shutil.rmtree(OUT)
    os.makedirs(OUT)
    used = []
    for part in ("Canon", "Base"):
        for m in bpy.data.objects["ThDrone_" + part].data.materials:
            nm = m.name.split(".")[0]
            if nm not in used:
                used.append(nm)
    results = {p: build_part(p, used) for p in ("Base", "Canon")}
    if GEO_ONLY:
        return

    # textures
    tex = os.path.join(ds.PROJ, "04_textures", VAR)
    mats_all = []
    for m in used:
        stem = NAME + mat_suffix(m)
        mats_all.append("Mat_" + stem)
        for s in ("Albedo", "MetallicGlossAO", "Normal"):
            shutil.copyfile(os.path.join(tex, "%s_%s.png" % (m, s)), os.path.join(OUT, "%s_%s.png" % (stem, s)))

    # props
    van_mp = json.load(open(os.path.join(ds.DRONE_DIR, "materials.props")))["materials"]["PBR"]["Mat_ImperiumDrone"]
    with open(os.path.join(OUT, "materials.props"), "w", encoding="utf-8", newline="\n") as f:
        json.dump({"materials": {"PBR": {m: dict(van_mp) for m in mats_all}}}, f, indent="\t")
    shutil.copyfile(os.path.join(ds.DRONE_DIR, "props.json"), os.path.join(OUT, "props.json"))

    # prefab: the vanilla one, our models, muzzles at the new barrel tips
    pre = json.load(open(os.path.join(ds.DRONE_DIR, "Prefab_DroneC.prefab")))
    ren = {"ImperiumDroneCanon": NAME + "Canon", "ImperiumDroneBase": NAME + "Base"}
    for c in pre["children"]:
        if c.get("type") == "model":
            c["source"] = "%s/%s.hmd" % (RES, ren[c["name"]])
            c["name"] = ren[c["name"]]
    tips = muzzle_offsets(results["Canon"][0], results["Canon"][3])
    van_tips = muzzle_offsets(TEMPL["Canon"], H.decode_vertices(HW.load(TEMPL["Canon"]), HW.load(TEMPL["Canon"]).geometries[0]))
    for c in pre["children"]:
        if c.get("name") in ("MuzzleA", "MuzzleB"):
            side = "R" if c["name"] == "MuzzleA" else "L"
            con = next(x for x in c["children"] if x.get("type") == "constraint")
            con["object"] = c["name"]
            con["target"] = con["target"].replace("ImperiumDroneCanon.", NAME + "Canon.", 1)
            # vanilla keeps the muzzle 0.1 behind... its tip; keep the same set-back from our (longer) tip
            setback = van_tips[side][0] - c.get("z", 0.0)
            c["z"] = round(tips[side][0] - setback, 3)
            print("muzzle %s (%s): vanilla tip %.3f muzzle %.3f -> our tip %.3f muzzle %.3f (xy %s)" % (
                c["name"], side, van_tips[side][0], van_tips[side][0] - setback, tips[side][0], c["z"], tips[side][1]))
    with open(os.path.join(OUT, "Prefab_%s.prefab" % NAME), "w", encoding="utf-8", newline="\n") as f:
        json.dump(pre, f, indent="\t")
        f.write("\n")
    print("FILES", sorted(os.listdir(OUT)))


main()
