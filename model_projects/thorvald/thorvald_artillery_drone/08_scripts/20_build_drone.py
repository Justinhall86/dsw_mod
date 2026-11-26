"""Build a Thorvald artillery-drone variant from the vanilla Corrino drone, KEEPING its rig.

    blender -b --factory-startup --python 20_build_drone.py -- <spec.json> [variant ...] [--diag]
    (cloud session: python 20_build_drone.py -- ...   with the pip `bpy` module)

Output per variant: 03_blender/<name>_geo.blend (two armatures + two skinned meshes, vanilla-textured materials) and
04_textures/<name>/_geo.npz (triangles per material for 41_paint.py).

Why a separate builder (the ship's 20_build_variant.py flattens everything onto one bone): the drone is two skinned HMDs on one
22-bone rig. ImperiumDroneBase = the four legs (B_TopFoot_*/B_MidFoot_*), ImperiumDroneCanon = hull (B_Main), hex lid (B_Head),
gun mount (B_GearCanon*), cover plate (B_GearPlate*) and the twin launchers (B_CanonR/L, muzzle ends on B_CanonR/L_Shoot).
Opening/Closing (deploy), AttackRange (recoil) and Death all move those bones, so every vanilla vertex keeps its weights and
every grafted chunk is skinned (weight 1) to ONE existing bone of the HMD it joins. The cdb change stays one prefab path.

Spaces (measured, see SPEC.md):
  * mesh data = the HMD's raw frame as hmd2fbx writes it (Y up). In the armature's REST position the meshes lie on their back.
  * BUILD space = R @ data, R = [[0,0,-1],[-1,0,0],[0,1,0]]: the BIND pose in Blender world, Z up, front (gun) toward -X,
    launchers raised ~32 deg. The leg armature's rest bones are already in this frame. All boxes in a spec are build space,
    unscaled (the model row's scale 2.1 is applied by the game).

Spec (JSON) per variant:
  _shared (top level): named blocks; {"$": "name", key: override} anywhere in a variant pulls one in
  name, note
  remove:        [{part: canon|base, box: [x0,x1,y0,y1,z0,z1], strict: true, bones: [only faces dominated by these]}]
  remove_bones:  [{part, bones: [...]}]        every face whose verts are all dominated by these bones
  remove:        ... mirror_y: true also removes the box mirrored across Y = 0
  retail:        [{part, box, bones, pivot: [x,y,z], scale: [sx,sy,sz], offset: [dx,dy,dz], clamp: [box], mirror_y: true}]
                 move/scale/clamp host vertices (|y| tested when mirror_y; pivot, offset and clamp y take the vertex's side)
  grafts:        [{donor, box_abs | cyl_abs, strict, min_island_faces, remove_abs, clamp_abs, rot_deg, scale,
                   part, skin, frame: world|barrel, ...}]
     frame world : at [x,y,z] = chunk-centre in build space; mirror: true adds a copy across Y = 0
     frame barrel: chunk is first rotated (rot_deg) so its long axis is +X with the muzzle at +X and its top at +Z, then
                   sides [R, L] each get a copy in that launcher's frame: u = toward B_Canon*_Shoot, w = up, v = outward.
                   at [u, v, w] from the B_Canon* bone head; anchor rear|centre|front on u; length = rescale to this u-extent.
                   skin "B_Canon{S}" ({S} -> R/L); shoot_from: u >= this goes on B_Canon{S}_Shoot (slides on recoil)
"""
import importlib.util
import json
import math
import os
import sys

import bpy  # noqa: I001  (before bmesh: the pip bpy module provides bmesh only after bpy is imported)
import bmesh
import numpy as np
from mathutils import Matrix, Vector

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import drone_scene as ds  # noqa: E402

PROJ, REPO = ds.PROJ, ds.REPO
_sp = importlib.util.spec_from_file_location(
    "ship_builder", os.path.join(REPO, "model_projects", "thorvald", "thorvald_ship", "08_scripts", "20_build_variant.py"))
B = importlib.util.module_from_spec(_sp)
_sp.loader.exec_module(B)          # donor(), import_and_flatten(), cut_box(), cut_cyl(), drop_fragments(), ... (no side effects)
B.VEH = ds.VEH                     # its own REPO guess predates the move under model_projects/thorvald/; functions read VEH at call time

R = Matrix(((0, 0, -1), (-1, 0, 0), (0, 1, 0)))
RI = R.transposed()
PARTS = {"base": "ImperiumDroneBase", "canon": "ImperiumDroneCanon"}


def log(*a):
    print("[drone]", *a)


# ---------------------------------------------------------------- host
def load_host():
    """Both vanilla parts (plain bind-pose FBX), renamed. Returns {part: (mesh, armature)}."""
    out = {}
    mat = ds.pbr_mat("Mat_ThDrone", *[os.path.join(ds.DRONE_DIR, "preview_textures", f)
                                      for f in ("albedo.png", "mgao.png", "normal.png")])
    for key, stem in PARTS.items():
        new = ds.import_fbx(os.path.join(ds.DRONE_DIR, "preview_textures", stem + "_real.fbx"))
        arm = next(o for o in new if o.type == "ARMATURE")
        me = next(o for o in new if o.type == "MESH")
        arm.name = "Arm_" + key.capitalize()
        me.name = me.data.name = "ThDrone_" + key.capitalize()
        me.data.materials.clear()
        me.data.materials.append(mat)
        if me.data.uv_layers:
            me.data.uv_layers[0].name = "UVMap"
        # hmd2fbx keeps the HMD's vertex order, so tag each vanilla vertex with its HMD index (+1; grafts join with 0):
        # 60_write_hmd.py then copies the original vertex record (normal, tangent, UV, weights) byte for byte
        att = me.data.attributes.new("hmd_vid", "INT", "POINT")
        att.data.foreach_set("value", list(range(1, len(me.data.vertices) + 1)))
        out[key] = (me, arm)
    return out


def dominant(bm, me):
    """bmesh vert index -> dominant bone name."""
    names = {g.index: g.name for g in me.vertex_groups}
    dl = bm.verts.layers.deform.active
    out = {}
    for v in bm.verts:
        d = v[dl] if dl else {}
        out[v.index] = names.get(max(d.items(), key=lambda kv: kv[1])[0], "NONE") if d else "NONE"
    return out


def inside(p, b):
    return b[0] <= p.x <= b[1] and b[2] <= p.y <= b[3] and b[4] <= p.z <= b[5]


def remove_faces(me, box=None, bones=None, strict=True, mode="all"):
    bm = bmesh.new()
    bm.from_mesh(me.data)
    bm.verts.ensure_lookup_table()
    dom = dominant(bm, me)
    doomed = []
    for f in bm.faces:
        if bones is not None:
            hits = [dom[v.index] in bones for v in f.verts]
            if not (all(hits) if mode == "all" else any(hits)):
                continue
        if box is not None:
            pts = [R @ v.co for v in f.verts] if strict else [R @ f.calc_center_median()]
            if not all(inside(p, box) for p in pts):
                continue
        doomed.append(f)
    bmesh.ops.delete(bm, geom=doomed, context="FACES")
    for v in [v for v in bm.verts if not v.link_faces]:
        bm.verts.remove(v)
    bm.to_mesh(me.data)
    bm.free()
    me.data.update()
    return len(doomed)


def retail(me, r):
    """Move/scale host vertices in a box (build space), optionally only those of some bones."""
    bm = bmesh.new()
    bm.from_mesh(me.data)
    bm.verts.ensure_lookup_table()
    dom = dominant(bm, me)
    box, bones = r.get("box"), r.get("bones")
    piv = Vector(r.get("pivot", (0, 0, 0)))
    sc = Vector(r.get("scale", (1, 1, 1)))
    off = Vector(r.get("offset", (0, 0, 0)))
    my = r.get("mirror_y", False)
    n = 0
    for v in bm.verts:
        if bones and dom[v.index] not in bones:
            continue
        p = R @ v.co
        q = Vector((p.x, abs(p.y), p.z)) if my else p
        if box and not inside(q, box):
            continue
        s = -1.0 if (my and p.y < 0) else 1.0
        pv = Vector((piv.x, piv.y * s, piv.z))
        o = Vector((off.x, off.y * s, off.z))
        d = p - pv
        p2 = pv + Vector((d.x * sc.x, d.y * sc.y, d.z * sc.z)) + o
        if r.get("clamp"):                   # pull vertices back into a box (e.g. blunt a pointed wing tip, no holes)
            c = r["clamp"]
            cy0, cy1 = (c[2], c[3]) if s > 0 else (-c[3], -c[2])
            p2 = Vector((min(max(p2.x, c[0]), c[1]), min(max(p2.y, cy0), cy1), min(max(p2.z, c[4]), c[5])))
        v.co = RI @ p2
        n += 1
    bm.to_mesh(me.data)
    bm.free()
    me.data.update()
    return n


def bone_head(arm_base, name):
    """Rest head of a bone in BUILD space (the leg armature's rest bones are in build space)."""
    return arm_base.matrix_world @ arm_base.data.bones[name].head_local


# ---------------------------------------------------------------- grafts
def donor_material(stem):
    d = os.path.join(B.VEH, os.path.dirname(stem.replace("/", os.sep)), "preview_textures")
    name = "Mat_ThDrone_" + os.path.basename(stem)
    return ds.pbr_mat(name, os.path.join(d, "albedo.png"), os.path.join(d, "mgao.png"), os.path.join(d, "normal.png"))


def cut_chunk(g, idx):
    rel, stem = B.donor(g["donor"])
    objs = B.import_and_flatten(rel, "g%d_%s" % (idx, g["donor"]))
    bpy.context.view_layer.update()
    st = g.get("strict", True)
    if g.get("cyl_abs"):
        kept, total = B.cut_cyl(objs, g["cyl_abs"], st)
    else:
        kept, total = B.cut_box(objs, g["box_abs"], st)
    if kept == 0:
        raise SystemExit("graft %s cut kept 0 faces" % g["donor"])
    if g.get("clamp_abs"):
        x0, x1, y0, y1, z0, z1 = g["clamp_abs"]
        B.xform(objs, lambda p: Vector((min(max(p.x, x0), x1), min(max(p.y, y0), y1), min(max(p.z, z0), z1))))
    for rb in g.get("remove_abs", []):
        B.remove_box_strict(objs, rb)
    if g.get("min_island_faces", 8):
        B.drop_fragments(objs, g.get("min_island_faces", 8))
    objs = [o for o in objs if len(o.data.polygons)]
    # one object per chunk
    if len(objs) > 1:
        with bpy.context.temp_override(active_object=objs[0], object=objs[0], selected_editable_objects=objs,
                                       selected_objects=objs):
            bpy.ops.object.join()
    ch = objs[0]
    mat = donor_material(stem)
    ch.data.materials.clear()
    ch.data.materials.append(mat)
    for p in ch.data.polygons:
        p.material_index = 0
    if ch.data.uv_layers:
        ch.data.uv_layers.active.name = "UVMap"
    # centre, scale, rotate in the donor frame
    mn, mx = B.bounds([ch])
    c = (mn + mx) / 2
    sc = g.get("scale", 1.0)
    sc = [sc] * 3 if not isinstance(sc, list) else sc
    rot = g.get("rot_deg", [0, 0, 0])
    rm = (Matrix.Rotation(math.radians(rot[2]), 4, "Z") @ Matrix.Rotation(math.radians(rot[1]), 4, "Y")
          @ Matrix.Rotation(math.radians(rot[0]), 4, "X"))
    B.xform([ch], lambda p: rm @ Vector(((p.x - c.x) * sc[0], (p.y - c.y) * sc[1], (p.z - c.z) * sc[2])))
    if g.get("length"):
        mn, mx = B.bounds([ch])
        k = g["length"] / (mx.x - mn.x)
        B.xform([ch], lambda p: p * k)
    mn, mx = B.bounds([ch])
    log("  graft %-12s kept %5d/%5d -> %.2f x %.2f x %.2f" % (g["donor"], kept, total, *(mx - mn)))
    return ch


def flip_y(ch):
    B.xform([ch], lambda p: Vector((p.x, -p.y, p.z)))
    B.recalc_normals([ch])


def place_copies(g, ch, arm_base):
    """[(object, {vertex index: bone})] in BUILD space."""
    out = []
    frame = g.get("frame", "world")
    if frame == "world":
        at = Vector(g["at"])
        for sgn in ([1, -1] if g.get("mirror") else [1]):
            cl = B.clone_objs([ch])[0]
            if sgn < 0:
                flip_y(cl)
            mn, mx = B.bounds([cl])
            goal = Vector((at.x, at.y * sgn, at.z))
            t = goal - (mn + mx) / 2
            B.xform([cl], lambda p, t=t: p + t)
            out.append((cl, {i: g["skin"] for i in range(len(cl.data.vertices))}))
        return out
    # barrel frame
    for side in g.get("sides", ["R", "L"]):
        cl = B.clone_objs([ch])[0]
        if side == "L":
            flip_y(cl)                       # the chunk's +Y is 'outward' for R; mirror it for L
        o = bone_head(arm_base, "B_Canon%s" % side)
        sh = bone_head(arm_base, "B_Canon%s_Shoot" % side)
        u = (sh - o).normalized()
        w = (Vector((0, 0, 1)) - u * u.z).normalized()
        v = w.cross(u)                       # -Y for both sides
        out_sign = 1.0 if (v.y * o.y) > 0 else -1.0     # +v must point away from the centre line
        mn, mx = B.bounds([cl])
        anchor = g.get("anchor", "rear")
        ax = mn.x if anchor == "rear" else mx.x if anchor == "front" else (mn.x + mx.x) / 2
        a = g.get("at", [0, 0, 0])
        M = Matrix((u, v * out_sign, w)).transposed()
        sh_from = g.get("shoot_from")
        skin = g["skin"].replace("{S}", side)
        shoot = "B_Canon%s_Shoot" % side
        bones = {}
        for vt in cl.data.vertices:
            loc = Vector((vt.co.x - ax, vt.co.y - (mn.y + mx.y) / 2, vt.co.z - (mn.z + mx.z) / 2))
            bones[vt.index] = shoot if (sh_from is not None and loc.x >= sh_from) else skin
            vt.co = o + M @ (loc + Vector((a[0], a[1], a[2])))
        cl.data.update()
        if (M.determinant() < 0):
            B.recalc_normals([cl])
        out.append((cl, bones))
    return out


def join_into(host_me, chunk, bones):
    """Chunk (build space) -> host data space, skinned 1.0 to its bone(s), joined into the host mesh."""
    for vt in chunk.data.vertices:
        vt.co = RI @ vt.co
    chunk.data.update()
    for vg in list(chunk.vertex_groups):
        chunk.vertex_groups.remove(vg)
    groups = {}
    for i, b in bones.items():
        groups.setdefault(b, []).append(i)
    for b, idx in groups.items():
        chunk.vertex_groups.new(name=b).add(idx, 1.0, "REPLACE")
    for m in list(chunk.modifiers):
        chunk.modifiers.remove(m)
    chunk.parent = None
    chunk.matrix_world = host_me.matrix_world.copy()
    for b in groups:
        if b not in host_me.vertex_groups:
            raise SystemExit("bone %s is not bound in %s" % (b, host_me.name))
    with bpy.context.temp_override(active_object=host_me, object=host_me,
                                   selected_editable_objects=[host_me, chunk], selected_objects=[host_me, chunk]):
        bpy.ops.object.join()


# ---------------------------------------------------------------- dump for painting
def dump_geo(parts, path):
    """Every triangle of both parts in BUILD space (bind pose) with UVs, per material, for 41_paint.py."""
    pos, uv, nrm, mat, bone = [], [], [], [], []
    mats = []
    for key, (me, arm) in parts.items():
        bm = bmesh.new()
        bm.from_mesh(me.data)
        bm.verts.ensure_lookup_table()
        dom = dominant(bm, me)
        bm.free()
        d = me.data
        d.calc_loop_triangles()
        lay = d.uv_layers.active.data
        for t in d.loop_triangles:
            mname = d.materials[t.material_index].name
            if mname not in mats:
                mats.append(mname)
            pos.append([tuple(R @ d.vertices[i].co) for i in t.vertices])
            uv.append([tuple(lay[l].uv) for l in t.loops])
            nrm.append(tuple((R @ t.normal).normalized()))
            mat.append(mats.index(mname))
            bone.append(dom[t.vertices[0]])
    os.makedirs(os.path.dirname(path), exist_ok=True)
    np.savez(path, pos=np.array(pos, np.float32), uv=np.array(uv, np.float32), nrm=np.array(nrm, np.float32),
             mat=np.array(mat, np.int16), mats=np.array(mats), bone=np.array(bone))
    log("DUMP", path, len(pos), "tris", mats)


def bone_report(parts):
    for key, (me, arm) in parts.items():
        bm = bmesh.new()
        bm.from_mesh(me.data)
        bm.verts.ensure_lookup_table()
        dom = dominant(bm, me)
        per = {}
        for v in bm.verts:
            per.setdefault(dom[v.index], []).append(tuple(R @ v.co))
        bm.free()
        for b, pts in sorted(per.items()):
            a = np.array(pts)
            log("  %-6s %-18s %5d verts  min %s max %s" % (key, b, len(a), a.min(0).round(2), a.max(0).round(2)))


# ---------------------------------------------------------------- main
def build(v):
    ds.reset()
    parts = load_host()
    arm_base = parts["base"][1]
    for r in v.get("remove_bones", []):
        n = remove_faces(parts[r.get("part", "canon")][0], bones=set(r["bones"]), mode=r.get("mode", "all"))
        log("remove_bones %s: %d faces" % (r["bones"], n))
    for r in v.get("remove", []):
        boxes = [r["box"]]
        if r.get("mirror_y"):
            b = r["box"]
            boxes.append([b[0], b[1], -b[3], -b[2], b[4], b[5]])
        for box in boxes:
            n = remove_faces(parts[r.get("part", "canon")][0], box=box, bones=set(r["bones"]) if r.get("bones") else None,
                             strict=r.get("strict", True), mode=r.get("mode", "all"))
            log("remove %s %s: %d faces" % (box, r.get("bones", ""), n))
    for r in v.get("retail", []):
        n = retail(parts[r.get("part", "canon")][0], r)
        log("retail %s: %d verts" % (r.get("note", r.get("box")), n))
    for i, g in enumerate(v.get("grafts", [])):
        ch = cut_chunk(g, i)
        for cl, bones in place_copies(g, ch, arm_base):
            join_into(parts[g.get("part", "canon")][0], cl, bones)
        bpy.data.objects.remove(ch, do_unlink=True)
    for key, (me, arm) in parts.items():
        me.data.validate()
        log("%s: %d verts %d faces, materials %s" % (me.name, len(me.data.vertices), len(me.data.polygons),
                                                    [m.name for m in me.data.materials]))
    if "--diag" in sys.argv:
        bone_report(parts)
    out_blend = os.path.join(PROJ, "03_blender", "variants", v["name"] + "_geo.blend")
    os.makedirs(os.path.dirname(out_blend), exist_ok=True)
    for o in list(bpy.data.objects):
        if o.name not in [p[0].name for p in parts.values()] + [p[1].name for p in parts.values()]:
            bpy.data.objects.remove(o, do_unlink=True)
    bpy.ops.wm.save_as_mainfile(filepath=out_blend)
    log("SAVED", out_blend)
    dump_geo(parts, os.path.join(PROJ, "04_textures", v["name"], "_geo.npz"))


def resolve(obj, shared):
    """{"$": "name", ...overrides} -> copy of _shared[name] updated with the overrides (recursively)."""
    if isinstance(obj, list):
        return [resolve(x, shared) for x in obj]
    if isinstance(obj, dict):
        if "$" in obj:
            base = dict(shared[obj["$"]])
            base.update({k: v for k, v in obj.items() if k != "$"})
            return resolve(base, shared)
        return {k: resolve(v, shared) for k, v in obj.items()}
    return obj


def main():
    argv = sys.argv[sys.argv.index("--") + 1:]
    spec = json.load(open(argv[0]))
    spec = {"variants": resolve(spec["variants"], spec.get("_shared", {}))}
    only = [a for a in argv[1:] if not a.startswith("--")]
    for v in spec["variants"]:
        if only and v["name"] not in only:
            continue
        log("=" * 60)
        log("BUILDING", v["name"])
        build(v)


if __name__ == "__main__":
    main()
