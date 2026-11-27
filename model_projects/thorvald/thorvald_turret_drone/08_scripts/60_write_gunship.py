"""Write the painted turret gunship as game files on the Renegade drone rig.

    blender -b --factory-startup --python 60_write_gunship.py -- <variant> [--name ThorvaldGunDrone]
    (cloud session: python 60_write_gunship.py -- <variant>   with the pip `bpy` module)

Output 06_game_ready/VehMOD/<name>/ (res/VehMOD/<name>/):
    <name>.hmd                          the vanilla Ravager_Drone HMD with our geometry and materials (hmd_writer.py)
    <name>_<Part>_{Albedo,MetallicGlossAO,Normal}.png   one map set per material (real PNG)
    Prefab_<name>.prefab                the model + MuzzleA (B_CanonR) / MuzzleB (B_CanonL) at the barrel mouths; the drone attack
                                        combos (Th_Drone_Attack, C_Drone_Attack) fire from MuzzleA/MuzzleB
    materials.props                     PBR, emissive 0.1 (MGAO alpha is 1 everywhere)
    props.json                          hmd.animPaths = ["/VehMOD/<name>/Anim"]: ONLY our level tank clips (50_clips.py, which
                                        must have been run: Anim/ is written there)
Same method as the artillery drone's 60_write_hmd.py (see its docstring): joints and binds copied from vanilla; vanilla vertex
records copied; grafted vertices mirrored back (x -> -x), v flipped, winding reversed, tangents from the UV gradient.
One change to the skeleton DEFAULTS (not the binds): B_Body's default pose is the level hold pose of 50_clips.py, because Idle and
FightIdle carry no B_Body rotation track and the vanilla default has a 6 deg roll.
"""
import importlib.util
import json
import os
import shutil
import struct
import sys

import bpy  # noqa: I001
import numpy as np

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = os.path.abspath(os.path.join(PROJ, "..", "..", ".."))
ART = os.path.join(REPO, "model_projects", "thorvald", "thorvald_artillery_drone", "08_scripts")
sys.path.insert(0, ART)
sys.path.insert(0, HERE)
import hmd_writer as HW  # noqa: E402

H = HW.H
sys.path.insert(0, os.path.join(REPO, "HMD_toolkit", "HMD_toolkit", "Models"))
from hmd2fbx import pos_to_mat4  # noqa: E402

_sp = importlib.util.spec_from_file_location("clips", os.path.join(HERE, "50_clips.py"))
CL = importlib.util.module_from_spec(_sp)
_sp.loader.exec_module(CL)

argv = sys.argv[sys.argv.index("--") + 1:]
VAR = argv[0]
NAME = argv[argv.index("--name") + 1] if "--name" in argv else "ThorvaldGunDrone"
RES = "VehMOD/%s" % NAME
OUT = os.path.join(PROJ, "06_game_ready", "VehMOD", NAME)
VEH = os.path.join(REPO, "model_inputs", "Vehicle")
TEMPL = os.path.join(VEH, "Common", "Ravager_Drone", "Ravager_Drone.fbx")
SUFFIX = {"Harvester": "Hull", "Harvester_chenil": "Tracks", "DroneH": "Turret", "Renegade_Frigate": "Barrels",
          "DroneTesla": "Funnels", "StockDrone": "Hull"}
D = np.array([-1.0, 1.0, 1.0])
MUZZLE_SETBACK = 0.15            # behind the barrel mouth, as the vanilla artillery drone's muzzles


def mat_stem(m):
    base = m.split(".")[0].replace("Mat_ThDrone_", "")
    return "%s_%s" % (NAME, SUFFIX.get(base, base))


def tangents(P, UV, N, tris):
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
    fb = np.cross(N, np.array([0.0, 0.0, 1.0]))
    return np.where(n > 1e-9, T / np.maximum(n, 1e-12), fb)


def build():
    ob = bpy.data.objects["ThDrone_Body"]
    me = ob.data
    d = HW.load(TEMPL)
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
    recs, key_of, loop_h, new_idx = [], {}, np.zeros(len(me.loops), np.int64), []
    for l in range(len(me.loops)):
        v = lv[l]
        key = ("v", int(v)) if vid[v] > 0 else ("n", int(v), tuple(np.round(cn[l], 3)), tuple(np.round(uvl[l], 5)))
        h = key_of.get(key)
        if h is None:
            h = len(recs)
            key_of[key] = h
            co = np.array(me.vertices[v].co) * D
            if vid[v] > 0:
                r = dict(van[vid[v] - 1])
                if np.abs(np.array(r["position"]) - co).max() > 1e-7:
                    r["position"] = tuple(co)
            else:
                ws = sorted(((gr.weight, gname[gr.group]) for gr in me.vertices[v].groups if gname[gr.group] in bind_of), reverse=True)[:3]
                if not ws:
                    raise SystemExit("vertex %d has no bound bone" % v)
                tot = sum(w for w, _ in ws)
                nrm = cn[l] * D
                r = {"position": tuple(co), "normal": tuple(nrm / max(np.linalg.norm(nrm), 1e-12)), "tangent": (0.0, 0.0, 0.0),
                     "uv": (float(uvl[l][0]), float(1.0 - uvl[l][1])),
                     "weights": tuple([w / tot for w, _ in ws] + [0.0] * (3 - len(ws))),
                     "indexes": tuple([bind_of[n] for _, n in ws] + [0] * (4 - len(ws)))}
                new_idx.append(h)
            recs.append(r)
        loop_h[l] = h
    groups, order = {}, []
    for t in me.loop_triangles:
        m = me.materials[t.material_index].name.split(".")[0]
        a, b, c = (loop_h[x] for x in t.loops)
        groups.setdefault(m, []).append((a, c, b))
        if m not in order:
            order.append(m)
    order = [m.name.split(".")[0] for m in me.materials if m.name.split(".")[0] in groups]
    if new_idx:
        P = np.array([r["position"] for r in recs])
        T = tangents(P, np.array([r["uv"] for r in recs]), np.array([r["normal"] for r in recs]), [t for m in order for t in groups[m]])
        for h in new_idx:
            recs[h]["tangent"] = tuple(T[h])
    vb = bytearray()
    for r in recs:
        vb += struct.pack("<3f3f3f2f3f", *r["position"], *r["normal"], *r["tangent"], *r["uv"], *r["weights"])
        vb += bytes(r["indexes"])
    big = len(recs) > 0x10000
    ib, counts = bytearray(), []
    for m in order:
        flat = [i for tri in groups[m] for i in tri]
        ib += struct.pack("<%d%s" % (len(flat), "I" if big else "H"), *flat)
        counts.append(len(flat))
    P = np.array([r["position"] for r in recs])
    g.vertexCount, g.vertexPosition, g.indexCounts, g.indexPosition = len(recs), 0, counts, len(vb)
    g.bounds = tuple(float(x) for x in np.concatenate([P.min(0), P.max(0)]))
    d.data = bytes(vb + ib)
    d.materials = [H.Material(["HasExtraTextures"], "Mat_" + mat_stem(m), "%s/%s_Albedo.png" % (RES, mat_stem(m)), "None",
                              "%s/%s_MetallicGlossAO.png" % (RES, mat_stem(m)), "%s/%s_Normal.png" % (RES, mat_stem(m))) for m in order]
    model.materials = list(range(len(order)))
    # level default pose for B_Body (Idle/FightIdle have no B_Body rotation track)
    pos0, rot0 = CL.hold_pose()
    jb = next(j for j in model.skin.joints if j.name == "B_Body")
    print("B_Body default pose: (%.4f %.4f %.4f | %.4f %.4f %.4f) -> pos %s, no rotation" % (
        jb.position.x, jb.position.y, jb.position.z, jb.position.qx, jb.position.qy, jb.position.qz, np.round(pos0, 4)))
    jb.position = H.Position(pos0[0], pos0[1], pos0[2], 0.0, 0.0, 0.0, jb.position.sx, jb.position.sy, jb.position.sz)
    path = os.path.join(OUT, NAME + ".hmd")
    n = HW.write(d, path)
    print("HMD %s: %d verts (%d grafted), tris per material %s, %d bytes" % (
        os.path.basename(path), len(recs), len(new_idx), {mat_stem(m): c // 3 for m, c in zip(order, counts)}, n))
    return path, order, recs


def muzzle_local(hmd, recs, side):
    """Barrel mouth of B_Canon<side> in that bone's local frame (via its inverse bind), set back MUZZLE_SETBACK along the barrel."""
    d = HW.load(hmd)
    sk = d.models[0].skin
    j = next(j for j in sk.joints if j.name == "B_Canon%s" % side)
    M = pos_to_mat4(j.transpos)
    pts = np.array([r["position"] for r in recs if r["weights"][0] > 0.5 and r["indexes"][0] == j.bind])
    # barrel axis = the long axis of the barrel vertices (raw model space)
    c = pts.mean(0)
    u = np.linalg.svd(pts - c)[2][0]
    tip_dir = u if np.dot(u, np.array([0, 0, 1.0])) > 0 else -u      # raw +Z = the drone's front (Blender -X)
    s = (pts - c) @ tip_dir
    mouth = pts[s > s.max() - 0.03].mean(0)
    mz = mouth - tip_dir * MUZZLE_SETBACK
    loc = (np.append(mz, 1.0) @ M)[:3]
    axis_local = np.append(tip_dir, 0.0) @ M
    return loc, mouth, axis_local[:3]


def main():
    bpy.ops.wm.open_mainfile(filepath=os.path.join(PROJ, "03_blender", "variants", VAR + ".blend"))
    anim = os.path.join(OUT, "Anim")
    if not os.path.isdir(anim):
        raise SystemExit("run 50_clips.py first (it writes %s)" % anim)
    for f in os.listdir(OUT):                            # rewrite everything except the clips
        p = os.path.join(OUT, f)
        if f != "Anim":
            os.remove(p)
    hmd, order, recs = build()
    tex = os.path.join(PROJ, "04_textures", VAR)
    for m in order:
        for s in ("Albedo", "MetallicGlossAO", "Normal"):
            shutil.copyfile(os.path.join(tex, "%s_%s.png" % (m, s)), os.path.join(OUT, "%s_%s.png" % (mat_stem(m), s)))
    mp = {"mode": "PBR", "blend": "None", "shadows": True, "culling": "Back", "depthTest": "Less", "colorMask": 15,
          "enableStencil": False, "emissive": 0.1}
    with open(os.path.join(OUT, "materials.props"), "w", encoding="utf-8", newline="\n") as f:
        json.dump({"materials": {"PBR": {"Mat_" + mat_stem(m): dict(mp) for m in order}}}, f, indent="\t")
    with open(os.path.join(OUT, "props.json"), "w", encoding="utf-8", newline="\n") as f:
        json.dump({"hmd.animPaths": ["/%s/Anim" % RES]}, f, indent="\t")
    # prefab: model + the artillery drone's muzzle objects (same names the attack combos use), re-targeted
    van = json.load(open(os.path.join(VEH, "Imperial", "DroneI", "Prefab_DroneC.prefab")))
    kids = [{"type": "model", "name": NAME, "source": "%s/%s.hmd" % (RES, NAME)}]
    kids += [c for c in van["children"] if c.get("type") == "camera"]
    for mname, side in (("MuzzleA", "R"), ("MuzzleB", "L")):
        src = next(c for c in van["children"] if c.get("name") == mname)
        obj = json.loads(json.dumps(src))
        loc, mouth, tip = muzzle_local(hmd, recs, side)
        obj.pop("x", None), obj.pop("y", None), obj.pop("z", None)
        for k, v in zip("xyz", loc):
            if abs(v) > 1e-4:
                obj[k] = round(float(v), 4)
        con = next(x for x in obj["children"] if x.get("type") == "constraint")
        con["object"] = mname
        con["target"] = "%s.B_ROOT.B_Body.B_Canon%s" % (NAME, side)
        kids.append(obj)
        print("%s on B_Canon%s: bone-local %s (mouth raw %s, barrel axis in bone-local %s)" % (mname, side, np.round(loc, 3), np.round(mouth, 3), np.round(tip, 2)))
    with open(os.path.join(OUT, "Prefab_%s.prefab" % NAME), "w", encoding="utf-8", newline="\n") as f:
        json.dump({"type": "prefab", "children": kids}, f, indent="\t")
        f.write("\n")
    print("FILES", sorted(os.listdir(OUT)), sorted(os.listdir(anim)))


main()
