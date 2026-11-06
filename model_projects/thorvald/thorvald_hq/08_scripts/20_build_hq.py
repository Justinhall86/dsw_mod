"""Blender: assemble the Thorvald HQ from box-cut chunks of vanilla donors, declaratively, and render it.

    blender -b --factory-startup --python 20_build_hq.py -- <spec.json> [--save] [--export]

Spec (see ../01_input/h*.json):
    name      variant name (H1 ...), used for the output file names
    donors    {key: {"fbx": path, "tex": texture-set key}}
    tex       {key: {"albedo", "normal", "mgao", "emissive"}}     paths
    pieces    list of:
        group    object the chunk joins: "Base" (always shown) or "District_<g>_<k>" (shown once slot k of
                 district group g is built: the engine looks these names up in the prefab, StructureModel.hx:80)
        donor    donors key
        box      [[x0,y0,z0],[x1,y1,z1]] in the donor's baked world space (the numbers 12_parts_survey prints);
                 default: everything
        strict   true (default): keep a face only if all its corners are in the box, so big panels never leave spikes
        remove   list of boxes; faces whose centre is in one are dropped (clutter, the parts the new piece replaces)
        scale    number or [sx, sy, sz], about the chunk's bottom centre
        rot      degrees about Z
        at       [x, y, z]: where the chunk's bottom centre goes (a null keeps that coordinate); omitted = it stays put
        mirror   true: mirror in X (normals flipped back)
    shots     optional list of [label, azimuth, elevation, ortho]; default 3/4 + top

Paths may start with "scratch:" (%TEMP%/dsw_vehicle_preview/thv_hq) or "repo:" (the repo root).
Rules from the vehicle builder hold here too: every added element comes from a vanilla model, cut by world-space boxes
(these meshes are hundreds of unwelded islands, so loose-part selection is useless), and baked before cutting.
Writes ../02_progress_photos/02_kitbash/<name>_<label>.png; --save writes ../03_blender/<name>.blend;
--export writes ../05_fbx_export/<name>/<group>.fbx, one per group (each becomes its own HMD in the prefab).
"""
import json
import math
import os
import sys
import tempfile

import bmesh
import bpy
from mathutils import Matrix, Vector

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
sys.path.insert(0, HERE)
import hq_scene as S  # noqa: E402

args = sys.argv[sys.argv.index("--") + 1:]
spec = json.load(open(args[0]))
SCR = os.path.join(tempfile.gettempdir(), "dsw_vehicle_preview", "thv_hq")
OUT = os.path.join(PROJ, "02_progress_photos", "02_kitbash")
os.makedirs(OUT, exist_ok=True)


def path(p):
    if p is None:
        return None
    if p.startswith("scratch:"):
        return os.path.join(SCR, p[8:])
    if p.startswith("repo:"):
        return os.path.join(S.REPO, p[5:])
    return p


def bake_donor(fbx):
    """Import, bake every mesh to world space, join into one object, hide it. Returns the object."""
    before = set(bpy.data.objects)
    bpy.ops.import_scene.fbx(filepath=fbx)
    new = [o for o in bpy.data.objects if o not in before]
    dg = bpy.context.evaluated_depsgraph_get()
    meshes = []
    for o in new:
        if o.type == "MESH":
            me = bpy.data.meshes.new_from_object(o.evaluated_get(dg))
            me.transform(o.matrix_world)
            meshes.append(me)
    for o in new:
        bpy.data.objects.remove(o, do_unlink=True)
    bm = bmesh.new()
    for me in meshes:
        bm.from_mesh(me)
    out = bpy.data.meshes.new("donor_" + os.path.basename(fbx))
    bm.to_mesh(out)
    bm.free()
    return out


def inside(p, box):
    lo, hi = box
    return all(lo[i] <= p[i] <= hi[i] for i in range(3))


def cut(src, pc):
    bm = bmesh.new()
    bm.from_mesh(src)
    box = pc.get("box")
    strict = pc.get("strict", True)
    drop = []
    for f in bm.faces:
        c = f.calc_center_median()
        keep = True
        if box:
            keep = all(inside(v.co, box) for v in f.verts) if strict else inside(c, box)
        if keep and any(inside(c, rb) for rb in pc.get("remove", [])):
            keep = False
        if not keep:
            drop.append(f)
    bmesh.ops.delete(bm, geom=drop, context="FACES")
    bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")
    if not bm.verts:
        bm.free()
        raise SystemExit("piece %r cut nothing" % pc)
    xs = [v.co for v in bm.verts]
    lo = Vector((min(p.x for p in xs), min(p.y for p in xs), min(p.z for p in xs)))
    hi = Vector((max(p.x for p in xs), max(p.y for p in xs), max(p.z for p in xs)))
    anchor = Vector(((lo.x + hi.x) / 2, (lo.y + hi.y) / 2, lo.z))
    s = pc.get("scale", 1.0)
    s = Vector(s if isinstance(s, list) else (s, s, s))
    if pc.get("mirror"):
        s.x = -s.x
    at = Vector([anchor[i] if v is None else v for i, v in enumerate(pc["at"])]) if "at" in pc else anchor
    m = (Matrix.Translation(at)
         @ Matrix.Rotation(math.radians(pc.get("rot", 0.0)), 4, "Z")
         @ Matrix.Diagonal(s.to_4d())
         @ Matrix.Translation(-anchor))
    bmesh.ops.transform(bm, matrix=m, verts=bm.verts)
    if s.x * s.y * s.z < 0:
        bmesh.ops.reverse_faces(bm, faces=bm.faces)
    return bm


def build():
    S.reset()
    mats = {k: S.material(k, **{kk: path(vv) for kk, vv in v.items()}) for k, v in spec["tex"].items()}
    donors = {k: (bake_donor(path(v["fbx"])), mats[v["tex"]]) for k, v in spec["donors"].items()}
    groups = {}
    for pc in spec["pieces"]:
        src, mat = donors[pc["donor"]]
        bm = cut(src, pc)
        g = groups.setdefault(pc["group"], (bmesh.new(), []))
        if mat not in g[1]:
            g[1].append(mat)
        # every face of this chunk uses its donor's material slot in the group
        idx = g[1].index(mat)
        for f in bm.faces:
            f.material_index = idx
        tmp = bpy.data.meshes.new("tmp")
        bm.to_mesh(tmp)
        bm.free()
        g[0].from_mesh(tmp)
        bpy.data.meshes.remove(tmp)
    objs = {}
    for name, (bm, ms) in groups.items():
        me = bpy.data.meshes.new(name)
        bm.to_mesh(me)
        bm.free()
        for m in ms:
            me.materials.append(m)
        ob = bpy.data.objects.new(name, me)
        bpy.context.scene.collection.objects.link(ob)
        objs[name] = ob
        print("GROUP", name, "verts", len(me.vertices), "tris", sum(len(p.vertices) - 2 for p in me.polygons))
    for src, _ in donors.values():
        bpy.data.meshes.remove(src)
    return objs


def render(objs):
    lo, hi = S.bounds(list(objs.values()))
    print("SIZE x %.1f y %.1f z %.1f" % tuple(hi - lo))
    c = (lo + hi) / 2
    c.z = (hi.z - lo.z) * 0.3
    span = max(hi.x - lo.x, hi.y - lo.y)
    cam = S.lights_and_camera(c, span * 1.25)
    for label, az, el, ortho in spec.get("shots", [["3q", -60, 40, 1.25], ["top", -90, 89.5, 1.15]]):
        cam.data.ortho_scale = span * ortho
        S.shoot(cam, c, az, el, os.path.join(OUT, "%s_%s.png" % (spec["name"], label)), px=(1400, 1050))
    # the same 3/4 view with only the Base, i.e. the HQ at game start before any district is built
    if any(n.startswith("District_") for n in objs):
        for n, o in objs.items():
            o.hide_render = n.startswith("District_")
        cam.data.ortho_scale = span * 1.25
        S.shoot(cam, c, -60, 40, os.path.join(OUT, "%s_3q_start.png" % spec["name"]), px=(1400, 1050))
        for o in objs.values():
            o.hide_render = False
    if "--growth" in args:   # one still per build stage: core, then each district in group / slot order
        order = sorted(n for n in objs if n.startswith("District_"))
        for i in range(len(order) + 1):
            for n, o in objs.items():
                o.hide_render = n.startswith("District_") and n not in order[:i]
            cam.data.ortho_scale = span * 1.25
            S.shoot(cam, c, -60, 40, os.path.join(OUT, "%s_growth_%d.png" % (spec["name"], i)), px=(900, 675))


objs = build()
render(objs)
if "--save" in args:
    for o in list(bpy.data.objects):
        if o.name in ("Ground", "Cam", "Sun"):
            bpy.data.objects.remove(o, do_unlink=True)
    for im in list(bpy.data.images):     # the donor FBX's own texture paths (not on disk) would stop pack_all
        if not im.packed_file and not os.path.exists(bpy.path.abspath(im.filepath)):
            bpy.data.images.remove(im)
    bpy.ops.file.pack_all()
    bpy.ops.wm.save_as_mainfile(filepath=os.path.join(PROJ, "03_blender", spec["name"] + ".blend"))
    print("SAVED blend")
if "--export" in args:
    od = os.path.join(PROJ, "05_fbx_export", spec["name"])
    os.makedirs(od, exist_ok=True)
    for n, o in objs.items():
        for x in bpy.context.scene.objects:
            x.select_set(x == o)
        bpy.ops.export_scene.fbx(filepath=os.path.join(od, n + ".fbx"), use_selection=True, add_leaf_bones=False,
                                 bake_anim=False, mesh_smooth_type="FACE")
        print("EXPORTED", n)
