"""Shared Blender helpers for part-level kitbashing of DSW (Dune: Spice Wars) Male01/Female01 characters.

Import from a Blender script:
    import sys, os; sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
    import dsw_parts as P

Conventions (learned the hard way):
  * A "component" is a connected piece of a mesh. Its id is its RANK BY VERTEX COUNT (largest = 0), stable sort,
    computed on the untouched mesh. All specs/galleries use these ids.
  * Every Male01 unit shares one skeleton, so a part copied from any donor keeps its skin weights; it only needs an
    armature modifier pointing at the new rig. Vertex groups are matched by NAME.
  * Rest pose faces world -Y; a body imported with an animation (hmdanim2fbx) faces world -X.
"""
import json
import math
import os

import bmesh
import bpy
from mathutils import Matrix, Vector


# ----------------------------------------------------------------- components / mesh edits
def components(obj):
    """Connected components as vertex-index lists, largest first (ties keep mesh order)."""
    bm = bmesh.new()
    bm.from_mesh(obj.data)
    bm.verts.ensure_lookup_table()
    seen, comps = set(), []
    for v in bm.verts:
        if v.index in seen:
            continue
        stack, comp = [v], []
        seen.add(v.index)
        while stack:
            x = stack.pop()
            comp.append(x.index)
            for e in x.link_edges:
                o = e.other_vert(x)
                if o.index not in seen:
                    seen.add(o.index)
                    stack.append(o)
        comps.append(comp)
    bm.free()
    return sorted(comps, key=len, reverse=True)


def comp_info(obj, comp):
    """Size, world bbox and the three heaviest bones of one component (for listings)."""
    gname = {g.index: g.name for g in obj.vertex_groups}
    w = {}
    pts = []
    for i in comp:
        v = obj.data.vertices[i]
        pts.append(obj.matrix_world @ v.co)
        for g in v.groups:
            w[gname[g.group]] = w.get(gname[g.group], 0.0) + g.weight
    tot = sum(w.values()) or 1.0
    lo = [min(p[k] for p in pts) for k in range(3)]
    hi = [max(p[k] for p in pts) for k in range(3)]
    top = sorted(w.items(), key=lambda kv: -kv[1])[:3]
    return dict(verts=len(comp), lo=lo, hi=hi, centre=[(a + b) / 2 for a, b in zip(lo, hi)],
                bones=[[n, round(100 * x / tot)] for n, x in top])


def delete_verts(obj, idx, invert=False):
    """Delete the given vertex indices (invert=True: keep only them)."""
    idx = set(idx)
    bm = bmesh.new()
    bm.from_mesh(obj.data)
    bm.verts.ensure_lookup_table()
    bmesh.ops.delete(bm, geom=[v for v in bm.verts if (v.index in idx) != invert], context="VERTS")
    bm.to_mesh(obj.data)
    bm.free()


def inflate(obj, vert_ids, dist):
    """Push vertices out along their normals (thicker armour). Vertices on the x=0 seam only move in y/z, otherwise
    the two mirrored halves of a chest plate separate and a white line opens down the middle."""
    bm = bmesh.new()
    bm.from_mesh(obj.data)
    bm.normal_update()
    bm.verts.ensure_lookup_table()
    for i in vert_ids:
        v = bm.verts[i]
        n = v.normal.copy()
        if abs(v.co.x) < 0.004:
            n.x = 0.0
            n.normalize()
        v.co += n * dist
    bm.to_mesh(obj.data)
    bm.free()


def nudge(obj, scale=1.0, pivot=(0, 0, 0), offset=(0, 0, 0), rot_y_deg=0.0):
    """Scale about a pivot, optionally tilt about the front-back (Y) axis through the pivot, then move.
    Done on mesh data in REST pose (before mirroring) so both sides match and weights stay valid."""
    piv = Vector(pivot)
    m = (Matrix.Translation(Vector(offset)) @ Matrix.Translation(piv) @ Matrix.Rotation(math.radians(rot_y_deg), 4, "Y")
         @ Matrix.Scale(scale, 4) @ Matrix.Translation(-piv))
    obj.data.transform(m)


def swap_lr(name):
    if len(name) > 3 and name.startswith("B_") and name[2] in "lr" and name[3].isupper():
        return "B_" + ("r" if name[2] == "l" else "l") + name[3:]
    return name


def mirror_object(src):
    """Copy of src mirrored across x=0: x flipped, faces reversed, B_l*/B_r* vertex groups swapped."""
    m = src.copy()
    m.data = src.data.copy()
    bpy.context.collection.objects.link(m)
    m.data.transform(Matrix.Scale(-1, 4, Vector((1, 0, 0))))
    bm = bmesh.new()
    bm.from_mesh(m.data)
    bmesh.ops.reverse_faces(bm, faces=bm.faces)
    bm.to_mesh(m.data)
    bm.free()
    for vg in m.vertex_groups:
        vg.name = "TMP_" + swap_lr(vg.name)
    for vg in m.vertex_groups:
        vg.name = vg.name[4:]
    m.name = src.name + "_mirror"
    return m


# ----------------------------------------------------------------- donors / materials / rig
def import_donor(blend_path, object_name):
    """Append one object (with its materials and packed images) from another .blend."""
    with bpy.data.libraries.load(blend_path, link=False) as (src, dst):
        if object_name not in src.objects:
            raise SystemExit("object %r not in %s (has: %s)" % (object_name, blend_path, list(src.objects)[:20]))
        dst.objects = [object_name]
    ob = dst.objects[0]
    bpy.context.collection.objects.link(ob)
    return ob


def set_textures(obj, albedo=None, normal=None, mgao=None):
    """Point obj's material texture nodes at replacement images (packed into the .blend). Matches nodes by image name
    (albedo / normal / metallic). Materials are copied first so the donor's other users are not affected.
    Replace ALL maps that carry a feature you remove: a badge painted out of the albedo is still visible as a bump
    in the normal map and as an outline in the gloss/AO map."""
    want = {"albedo": albedo, "normal": normal, "metallic": mgao}
    imgs = {}
    for key, path in want.items():
        if path:
            imgs[key] = bpy.data.images.load(path, check_existing=True)
            imgs[key].pack()
    for slot in obj.material_slots:
        if slot.material is None:
            continue
        mat = slot.material.copy()
        slot.material = mat
        for nd in mat.node_tree.nodes:
            if nd.type == "TEX_IMAGE" and nd.image:
                nm = nd.image.name.lower()
                for key, img in imgs.items():
                    if key in nm:
                        nd.image = img
                        break


def set_albedo(obj, image_path):
    set_textures(obj, albedo=image_path)


def attach_to_rig(obj, rig, world_matrix=None):
    """Replace obj's armature modifiers with one pointing at rig; keep its world placement."""
    wm = world_matrix if world_matrix is not None else obj.matrix_world.copy()
    for md in list(obj.modifiers):
        if md.type == "ARMATURE":
            obj.modifiers.remove(md)
    md = obj.modifiers.new("Armature", "ARMATURE")
    md.object = rig
    obj.parent = rig
    obj.matrix_world = wm


def rest_pose(rig):
    rig.data.pose_position = "REST"
    if rig.animation_data:
        rig.animation_data.action = None


def purge_orphans():
    """Drop 0-user images/materials (the FBX importer leaves unpacked stubs behind)."""
    for coll in (bpy.data.images, bpy.data.materials, bpy.data.meshes):
        for item in list(coll):
            if item.users == 0:
                coll.remove(item)


# ----------------------------------------------------------------- modelled pauldron shell
def build_shell(body, rig, side, p, patches):
    """Model a NEW pauldron over one shoulder: a thick ellipsoid shell over the top/outside of the shoulder joint,
    open toward the neck, flared lower edge, gold rim band (+ optional gold centre ridge).

    p: off (x out, y, z) from the shoulder joint, radii (rx, ry, rz), phi (half-width in deg around the outward axis),
       theta (low, high elevation in deg), seg (n_phi, n_theta), thick, flare, rim_rows, ridge (deg, height) or None,
       w_shoulder_bottom (share of shoulder-bone weight at the rim; top is 100% clavicle).
    patches: {"armour": [u, v], "gold": [u, v], "radius_uv": r} - flat spots of the body's own texture
       (pick_uv_patches.py). Uses body's first material, so colours match the body exactly.
    side: +1 left (x > 0), -1 right."""
    sname = "B_lShoulderJ" if side > 0 else "B_rShoulderJ"
    cname = "B_lClavicleJ" if side > 0 else "B_rClavicleJ"
    S = rig.matrix_world @ rig.data.bones[sname].head_local
    C = S + Vector((side * p["off"][0], p["off"][1], p["off"][2]))
    rx, ry, rz = p["radii"]
    nphi, nth = p["seg"]
    phis = [math.radians(-p["phi"] + 2 * p["phi"] * i / nphi) for i in range(nphi + 1)]
    ths = [math.radians(p["theta"][0] + (p["theta"][1] - p["theta"][0]) * j / nth) for j in range(nth + 1)]
    low = -math.radians(p["theta"][0])

    def surf(phi, th, inset=0.0, lift=0.0):
        fl = 1 + p["flare"] * max(0.0, -th) / max(1e-6, low)
        d = Vector((side * rx * math.cos(th) * math.cos(phi) * fl, ry * math.cos(th) * math.sin(phi) * fl, rz * math.sin(th)))
        n = Vector((d.x / rx ** 2, d.y / ry ** 2, d.z / rz ** 2)).normalized()
        return C + d - n * inset + n * lift, (th - ths[0]) / (ths[-1] - ths[0])

    bm = bmesh.new()
    deform = bm.verts.layers.deform.verify()
    uvl = bm.loops.layers.uv.verify()
    gi = {n: body.vertex_groups[n].index for n in (sname, cname)}

    def vert(co, t):
        v = bm.verts.new(co)
        ws = p["w_shoulder_bottom"] * (1 - t)
        v[deform][gi[cname]] = 1 - ws
        if ws > 0:
            v[deform][gi[sname]] = ws
        return v

    def uv(kind, a, b):
        cu, cv = patches[kind]
        r = patches["radius_uv"]
        return (cu + (a - 0.5) * r, cv + (b - 0.5) * r)

    def face(vs, kind, ab):
        f = bm.faces.new(vs)
        for lp, (a, b) in zip(f.loops, ab):
            lp[uvl].uv = uv(kind, a, b)
        f.smooth = True

    ab4 = [(0, 0), (1, 0), (1, 1), (0, 1)]
    outer = [[vert(*surf(ph, th)) for th in ths] for ph in phis]
    inner = [[vert(*surf(ph, th, inset=p["thick"])) for th in ths] for ph in phis]
    rim = p["rim_rows"]
    for i in range(nphi):
        for j in range(nth):
            kind = "gold" if (j < rim or i < 1 or i >= nphi - 1) else "armour"
            face([outer[i][j], outer[i + 1][j], outer[i + 1][j + 1], outer[i][j + 1]], kind,
                 [(i / nphi, j / nth), ((i + 1) / nphi, j / nth), ((i + 1) / nphi, (j + 1) / nth), (i / nphi, (j + 1) / nth)])
            face([inner[i][j + 1], inner[i + 1][j + 1], inner[i + 1][j], inner[i][j]], "armour", ab4)
    for i in range(nphi):
        for j in (0, nth):
            face([outer[i][j], inner[i][j], inner[i + 1][j], outer[i + 1][j]], "gold", ab4)
    for i in (0, nphi):
        for j in range(nth):
            face([outer[i][j], outer[i][j + 1], inner[i][j + 1], inner[i][j]], "gold", ab4)
    if p.get("ridge"):
        rw, rh = math.radians(p["ridge"][0]), p["ridge"][1]
        rows = [j for j in range(nth + 1) if ths[j] >= math.radians(p["theta"][0] + 8)]
        L = [vert(*surf(-rw, ths[j], lift=0.002)) for j in rows]
        M = [vert(*surf(0.0, ths[j], lift=rh)) for j in rows]
        R = [vert(*surf(rw, ths[j], lift=0.002)) for j in rows]
        for k in range(len(rows) - 1):
            face([L[k], M[k], M[k + 1], L[k + 1]], "gold", ab4)
            face([M[k], R[k], R[k + 1], M[k + 1]], "gold", ab4)
    bmesh.ops.recalc_face_normals(bm, faces=bm.faces)
    me = bpy.data.meshes.new("Shell_%s" % ("L" if side > 0 else "R"))
    bm.to_mesh(me)
    bm.free()
    ob = bpy.data.objects.new(me.name, me)
    bpy.context.collection.objects.link(ob)
    for vg in body.vertex_groups:   # same order -> the deform indices written above line up
        ob.vertex_groups.new(name=vg.name)
    me.materials.append(body.data.materials[0])
    attach_to_rig(ob, rig, Matrix.Identity(4))
    return ob


# ----------------------------------------------------------------- scene / renders
def setup_scene(sc, res=700):
    for o in [o for o in bpy.data.objects if o.type in ("CAMERA", "LIGHT")]:
        bpy.data.objects.remove(o, do_unlink=True)
    w = bpy.data.worlds.new("W")
    sc.world = w
    w.use_nodes = True
    w.node_tree.nodes["Background"].inputs[0].default_value = (0.55, 0.58, 0.64, 1)
    w.node_tree.nodes["Background"].inputs[1].default_value = 1.6
    for nm, kind, en, loc, rot, size in (("Sun", "SUN", 3.5, (0, 0, 5), (52, 0, 35), None),
                                         ("Fill", "AREA", 160, (-1.8, -2.4, 1.8), (68, 0, -40), 3.0),
                                         ("Rim", "AREA", 120, (1.6, 2.6, 2.2), (115, 0, 200), 2.0)):
        ld = bpy.data.lights.new(nm, kind)
        ld.energy = en
        if size:
            ld.size = size
        o = bpy.data.objects.new(nm, ld)
        bpy.context.collection.objects.link(o)
        o.location = loc
        o.rotation_euler = [math.radians(a) for a in rot]
    sc.render.engine = "BLENDER_EEVEE"
    sc.render.resolution_x = sc.render.resolution_y = res
    sc.view_settings.view_transform = "Standard"


# view sets: (name, direction from the target). "rest" faces -Y, "posed" (animated import) faces -X.
VIEWS = {
    "rest": (("front", (0, -1, 0)), ("tq", (-0.9, -1, 0)), ("back", (0, 1, 0))),
    "posed": (("front", (-1, 0, 0)), ("tq", (-1, -0.9, 0)), ("back", (1, 0, 0))),
}
FRAMING = {"close": ((0, 0, 1.6), 0.9), "rest": ((0, 0, 1.4), 1.7), "posed": ((-0.3, 0, 1.2), 2.6)}


def render_views(sc, out_dir, prefix, mode):
    """Ortho renders for mode in close|rest|posed -> <out_dir>/<prefix>_<view>.png. Returns the camera objects."""
    out_dir = os.path.abspath(out_dir)   # relative render paths are resolved against the drive root by Blender
    os.makedirs(out_dir, exist_ok=True)
    centre, scale = FRAMING[mode]
    centre = Vector(centre)
    cams = {}
    for tag, d in VIEWS["posed" if mode == "posed" else "rest"]:
        cd = bpy.data.cameras.new(tag)
        cam = bpy.data.objects.new(tag, cd)
        bpy.context.collection.objects.link(cam)
        cam.location = centre + Vector(d).normalized() * 4
        cam.rotation_euler = (centre - cam.location).to_track_quat("-Z", "Y").to_euler()
        cd.type, cd.ortho_scale = "ORTHO", scale
        sc.camera = cam
        sc.render.filepath = os.path.join(out_dir, "%s_%s.png" % (prefix, tag))
        bpy.ops.render.render(write_still=True)
        cams[tag] = cam
    return cams


def script_args():
    import sys
    return sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else []


def load_json(path):
    with open(path, encoding="utf-8") as f:
        return json.load(f)
