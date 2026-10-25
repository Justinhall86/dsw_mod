"""Build removal-kitbash variants: base body MINUS parts, with a DONOR head grafted on.

    blender -b --python 03_variants.py -- [V1 V2 ...]

Component ids come from 02_gallery.py (ids = rank by vertex count, deterministic per unit).
Head = faces whose vertices are all dominated by B_HeadJ.  Both pieces share the base's armature.
"""
import importlib
import os
import sys

import bmesh
import bpy
from mathutils import Vector
from mathutils.bvhtree import BVHTree

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.dirname(HERE))),
                                ".claude", "skills", "dsw-part-kitbash", "scripts"))
import blender_scene as bs  # noqa: E402
import dsw_parts as P  # noqa: E402
from dsw_core import script_args  # noqa: E402
from units import material_paths, paths  # noqa: E402

PROJ = os.path.dirname(HERE)
SHOTS = os.path.join(PROJ, "02_progress_photos", "03_variants")
BLENDS = os.path.join(PROJ, "03_blender")

TORSO = ("B_Spine01J", "B_Spine02J", "B_SpineTopJ", "B_lClavicleJ", "B_rClavicleJ", "B_Neck01J")

COLLAR = dict(z_bottom=1.60, top_front=1.692, top_side=1.755, top_back=1.775, rx=0.100, ry=0.096, cy=0.005,
              flare=0.012, open_deg=3.0, thick=0.010, rim=0.012, segs=36, mat_index=0,
              wine_uv=(0.2700, 0.2925, 0.8320, 0.8550),
              gold_uv=(0.2050, 0.2320, 0.3600, 0.3900))  # inside the big blue scarf patch -> solid gold

# Neophyte: short stand collar (jacket collar) around the Idualis02 neck; both UV patches = the Captain's wine mantle texel so it takes the jacket colour
COLLAR_N = dict(z_bottom=1.56, top_front=1.688, top_side=1.715, top_back=1.725, rx=0.068, ry=0.067, cy=0.012, flare=0.006,
                open_deg=5.0, thick=0.007, rim=0.011, segs=32, mat_index=0,
                wine_uv=(0.2700, 0.2925, 0.8320, 0.8550), gold_uv=(0.2050, 0.2320, 0.3600, 0.3900))

# name -> dict(base, donor, remove=[base comp ids], title)
VARIANTS = {
    # N2: legs/boots from the Ginaz Captain body (Mercenary, metal stripped, same Ginaz textures), jacket + sleeves + sash + hands from the Raider,
    # head from Idualis02 (mask left out).  Regions are tagged for the texture script.
    "N2_Neophyte": dict(base="Mercenary", donor="Idualis02", metal=True, drop_above_z=0.98, head_exclude=[5, 8, 21, 22, 25, 26, 33, 34], head_shift_z=-0.044, bun=dict(pos=(0.0, 0.045, 1.951), radii=(0.030, 0.030, 0.034), uv_c=(0.577, 0.467)), neck_extend=(1.666, 1.58, 0.0, 1.72, 0.06), collar=COLLAR_N,
                        remove=[],
                        fill=[dict(donor="Raider", tag="upper", keep_comps=[1, 4, 9, 10, 13, 14, 15, 16, 21, 22],
                                   regions={"tunic": [1, 4], "sleeves": [9, 10], "hands": [13, 14, 15, 16], "bits": [21, 22]})],
                        title="Ginaz Neophyte: Captain legs + Raider jacket/sleeves/sash/hands + Idualis02 head"),
}


def dominant(obj):
    names = {g.index: g.name for g in obj.vertex_groups}
    return {v.index: names[max(v.groups, key=lambda x: x.weight).group] for v in obj.data.vertices if v.groups}


def keep_faces(obj, pred):
    dom = dominant(obj)
    bm = bmesh.new()
    bm.from_mesh(obj.data)
    bm.faces.ensure_lookup_table()
    kill = [f for f in bm.faces if not pred([dom.get(v.index) for v in f.verts])]
    bmesh.ops.delete(bm, geom=kill, context="FACES")
    bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")
    bm.to_mesh(obj.data)
    bm.free()
    obj.data.update()
    return len(kill)


def bisect_above(obj, z, r):
    """Cut the mesh EXACTLY at height z (plane bisect, straight edge) and drop what is above, but only for
    faces near the neck (|x| < r) so shoulders/arms are untouched.  UVs and weights interpolate."""
    bm = bmesh.new()
    bm.from_mesh(obj.data)
    region = [f for f in bm.faces if abs(f.calc_center_median().x) < r and max(v.co.z for v in f.verts) > z]
    geom = list({e for f in region for e in f.edges}) + region + list({v for f in region for v in f.verts})
    bmesh.ops.bisect_plane(bm, geom=geom, plane_co=(0, 0, z), plane_no=(0, 0, 1), clear_outer=True)
    bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")
    bm.to_mesh(obj.data)
    bm.free()
    obj.data.update()


def extend_neck(obj, z_max, z_bottom, flare, back_z=None, drop=0.07, bone_from="B_Neck01J", bone_to="B_SpineTopJ"):
    """Extrude the open bottom edge of the neck (boundary edges below z_max) down by `drop` and out by `flare`
    so the neck sinks into the collar instead of floating above it.  New verts: UV copied from their source
    vertex, weights half neck / half upper spine, faces smooth."""
    import math
    bm = bmesh.new()
    bm.from_mesh(obj.data)
    uvl = bm.loops.layers.uv.active
    dl = bm.verts.layers.deform.active
    gi = {g.name: g.index for g in obj.vertex_groups}
    def low(e):
        zmax = max(v.co.z for v in e.verts)
        if zmax < z_max:
            return True
        # the tube's bottom edge slopes up at the back: take those edges too
        return back_z is not None and zmax < back_z and min(v.co.y for v in e.verts) > 0.0
    edges = [e for e in bm.edges if e.is_boundary and low(e)]
    src_uv = {v: v.link_loops[0][uvl].uv.copy() for e in edges for v in e.verts}
    res = bmesh.ops.extrude_edge_only(bm, edges=edges)
    new_v = [g for g in res["geom"] if isinstance(g, bmesh.types.BMVert)]
    new_f = {f for v in new_v for f in v.link_faces}
    # map each new vert to its source (same position before moving)
    olds = list(src_uv)
    for v in new_v:
        src = min(olds, key=lambda o: (o.co - v.co).length)
        r = math.hypot(v.co.x, v.co.y)
        fl = flare if v.co.y < 0.0 else 0.0  # flare only the front: at the back it pokes out of the silhouette
        k = (r + fl) / r if r > 1e-4 else 1.0
        v.co.x *= k
        v.co.y *= k
        v.co.z = min(v.co.z - drop, z_bottom)  # drop, but always at least down to z_bottom (back edge sits higher)
        w = v[dl]
        w.clear()
        w[gi[bone_from]] = 0.5
        w[gi[bone_to]] = 0.5
    skin = src_uv[max(src_uv, key=lambda o: abs(o.co.x))]  # side of the neck's bottom ring = plain skin texel
    obj["neck_skin_uv"] = (skin.x, skin.y)  # reused by neck_backplate so every patch matches
    for f in bm.faces:  # back of the neck below the hairline also samples beard -> plain skin
        c = f.calc_center_median()
        if c.y > 0.0 and c.z < 1.775 and f not in new_f:
            for lp in f.loops:
                lp[uvl].uv = skin
    for f in new_f:
        f.smooth = True
        for lp in f.loops:
            lp[uvl].uv = skin
    bmesh.ops.recalc_face_normals(bm, faces=list(new_f))
    bm.to_mesh(obj.data)
    bm.free()
    obj.data.update()
    return len(edges)


def neck_skin_uv(bm, uvl):
    """One shared plain-skin texel for every neck patch: the vertex nearest the side of the neck under the jaw."""
    target = Vector((0.065, -0.02, 1.72))
    v = min((x for x in bm.verts if x.link_loops), key=lambda x: (x.co - target).length)
    return v.link_loops[0][uvl].uv.copy()


def neck_backplate(obj, z_top, z_bottom, r_top, r_bottom, a0=-15.0, a1=195.0, segs=18, rows=5,
                   bone_top="B_HeadJ", bone_mid="B_Neck01J", bone_bottom="B_SpineTopJ"):
    """Curved double-sided skin panel around the BACK half of the neck (angles a0..a1, 90 = straight back),
    a little inside the neck surface: hidden where the neck exists, closes any see-through gap where it
    does not.  UV = one plain skin texel from the side of the neck; weights blend head -> neck -> spine."""
    import math
    bm = bmesh.new()
    bm.from_mesh(obj.data)
    uvl = bm.loops.layers.uv.active
    dl = bm.verts.layers.deform.active
    gi = {g.name: g.index for g in obj.vertex_groups}
    for b in (bone_top, bone_mid, bone_bottom):
        if b not in gi:
            gi[b] = obj.vertex_groups.new(name=b).index
    skin = Vector(obj["neck_skin_uv"]) if "neck_skin_uv" in obj else neck_skin_uv(bm, uvl)
    def make_grid(dr):
        grid = []
        for r_i in range(rows + 1):
            t = r_i / rows
            z = z_top + (z_bottom - z_top) * t
            r = r_top + (r_bottom - r_top) * t + dr
            row = []
            for s_i in range(segs + 1):
                a = math.radians(a0 + (a1 - a0) * s_i / segs)
                v = bm.verts.new((r * math.cos(a), r * math.sin(a), z))
                w = v[dl]
                if t < 0.5:
                    w[gi[bone_top]] = 1.0 - 2 * t
                    w[gi[bone_mid]] = 2 * t
                else:
                    w[gi[bone_mid]] = 2 - 2 * t
                    w[gi[bone_bottom]] = 2 * t - 1
                row.append(v)
            grid.append(row)
        return grid

    made = 0
    for dr, flip in ((0.0, False), (-0.001, True)):  # outer side + inner side (own verts): never culled away
        grid = make_grid(dr)
        for r_i in range(rows):
            for s_i in range(segs):
                q = (grid[r_i][s_i], grid[r_i][s_i + 1], grid[r_i + 1][s_i + 1], grid[r_i + 1][s_i])
                f = bm.faces.new(tuple(reversed(q)) if flip else q)
                f.smooth = True
                for lp in f.loops:
                    lp[uvl].uv = skin
                made += 1
    bm.to_mesh(obj.data)
    bm.free()
    obj.data.update()
    return made


def transfer_weights(src, dst):
    """Replace dst's skin weights with src's, interpolated from the nearest src face (Data Transfer).
    A grafted fill then deforms exactly like the base surface it replaces, so it cannot tear away
    from the base's surrounding parts in motion."""
    for g in list(dst.vertex_groups):
        dst.vertex_groups.remove(g)
    for g in src.vertex_groups:
        dst.vertex_groups.new(name=g.name)
    mod = dst.modifiers.new("WeightXfer", "DATA_TRANSFER")
    mod.object = src
    mod.use_vert_data = True
    mod.data_types_verts = {"VGROUP_WEIGHTS"}
    mod.vert_mapping = "POLYINTERP_NEAREST"
    mod.layers_vgroup_select_src = "ALL"
    mod.layers_vgroup_select_dst = "NAME"
    with bpy.context.temp_override(object=dst, active_object=dst, selected_objects=[dst]):
        bpy.ops.object.modifier_move_to_index(modifier=mod.name, index=0)
        bpy.ops.object.modifier_apply(modifier=mod.name)


def calm_weights(obj, strip=("B_lShoulderJ", "B_rShoulderJ", "B_lElbowJ", "B_rElbowJ"), smooth_repeat=4):
    """Torso fill must follow the SPINE, not the arms: drop arm-bone weights, renormalise, then smooth so no
    vertex is yanked differently from its neighbours (that is what folds the chest when an arm swings across)."""
    names = {g.index: g.name for g in obj.vertex_groups}
    for v in obj.data.vertices:
        keep = [(g.group, g.weight) for g in v.groups if names[g.group] not in strip]
        tot = sum(w for _, w in keep)
        for g in list(v.groups):
            obj.vertex_groups[g.group].remove([v.index])
        if tot <= 1e-6:
            obj.vertex_groups["B_SpineTopJ"].add([v.index], 1.0, "REPLACE")
            continue
        for gi, w in keep:
            obj.vertex_groups[gi].add([v.index], w / tot, "REPLACE")
    me = obj.data
    nbr = [[] for _ in me.vertices]
    for e in me.edges:
        a, b = e.vertices
        nbr[a].append(b)
        nbr[b].append(a)
    W = [{g.group: g.weight for g in v.groups} for v in me.vertices]
    for _ in range(smooth_repeat):  # Laplacian smoothing of the weights, factor 0.5
        new = []
        for i, w in enumerate(W):
            if not nbr[i]:
                new.append(w)
                continue
            acc = {}
            for j in nbr[i]:
                for gi, x in W[j].items():
                    acc[gi] = acc.get(gi, 0.0) + x / len(nbr[i])
            mix = {gi: 0.5 * w.get(gi, 0.0) + 0.5 * acc.get(gi, 0.0) for gi in set(w) | set(acc)}
            tot = sum(mix.values()) or 1.0
            new.append({gi: x / tot for gi, x in mix.items() if x / tot > 1e-3})
        W = new
    for i, w in enumerate(W):
        for g in list(me.vertices[i].groups):
            obj.vertex_groups[g.group].remove([i])
        for gi, x in w.items():
            obj.vertex_groups[gi].add([i], x, "REPLACE")


def build_collar(obj, p):
    """Model a tall stand-up (mandarin) collar into `obj`: a double-walled shell around the neck, open in a V at the
    front, rising towards the back; the top band samples a gold texel patch, the rest a coat texel patch.

    p: z_bottom, top_front, top_side, top_back, rx, ry, cy (ellipse centre y), flare, open_deg, thick, rim,
       wine_uv (u0, u1, v0, v1), gold_uv (u0, u1, v0, v1), segs, mat_index
    """
    import math
    bm = bmesh.new()
    bm.from_mesh(obj.data)
    uvl = bm.loops.layers.uv.active
    dl = bm.verts.layers.deform.active
    gi = {g.name: g.index for g in obj.vertex_groups}
    segs = p.get("segs", 28)
    a0 = -90.0 + p["open_deg"]
    a1 = 270.0 - p["open_deg"]

    def top_at(a):
        d = abs(((a + 90.0 + 180.0) % 360.0) - 180.0)  # 0 at the front, 180 at the back
        t = max(0.0, min(1.0, (d - p["open_deg"]) / (180.0 - p["open_deg"])))
        side = p["top_front"] + (p["top_side"] - p["top_front"]) * math.sin(min(t * 2, 1.0) * math.pi / 2)
        return side if t < 0.5 else p["top_side"] + (p["top_back"] - p["top_side"]) * math.sin((t - 0.5) * math.pi)

    rows = []  # per wall (outer, inner): list over angle of [bottom, mid, top] verts
    for wall, dr in (("out", 0.0), ("in", -p["thick"])):
        cols = []
        for s_i in range(segs + 1):
            a = a0 + (a1 - a0) * s_i / segs
            top = top_at(a)
            col = []
            for k, z in enumerate((p["z_bottom"], top - p["rim"], top)):
                u = (z - p["z_bottom"]) / max(top - p["z_bottom"], 1e-4)
                rx = p["rx"] + dr + p["flare"] * u
                ry = p["ry"] + dr + p["flare"] * u
                v = bm.verts.new((rx * math.cos(math.radians(a)), p["cy"] + ry * math.sin(math.radians(a)), z))
                w = v[dl]
                if k == 0:
                    w[gi["B_SpineTopJ"]] = 1.0
                else:
                    w[gi["B_SpineTopJ"]] = 0.55
                    w[gi["B_Neck01J"]] = 0.45
                col.append(v)
            cols.append(col)
        rows.append(cols)

    def uv_in(box, fu, fv):
        return (box[0] + (box[1] - box[0]) * fu, box[2] + (box[3] - box[2]) * fv)

    faces = []

    def quad(vs, box, us, vs_):
        f = bm.faces.new(vs)
        f.material_index = p.get("mat_index", 0)
        f.smooth = True
        for lp, fu, fv in zip(f.loops, us, vs_):
            lp[uvl].uv = uv_in(box, fu, fv)
        faces.append(f)

    out, inn = rows
    for s_i in range(segs):
        fu0, fu1 = s_i / segs, (s_i + 1) / segs
        for wall in (out, inn):
            c0, c1 = wall[s_i], wall[s_i + 1]
            quad((c0[0], c1[0], c1[1], c0[1]), p["wine_uv"], (fu0, fu1, fu1, fu0), (0, 0, 1, 1))   # body
            quad((c0[1], c1[1], c1[2], c0[2]), p["gold_uv"], (fu0, fu1, fu1, fu0), (0, 0, 1, 1))   # gold band
        quad((out[s_i][2], out[s_i + 1][2], inn[s_i + 1][2], inn[s_i][2]), p["gold_uv"], (fu0, fu1, fu1, fu0), (1, 1, 0, 0))  # rim
    for end in (0, segs):  # close the two front edges of the V
        o, i = out[end], inn[end]
        quad((o[0], o[1], i[1], i[0]), p["wine_uv"], (0, 1, 1, 0), (0, 0, 1, 1))
        quad((o[1], o[2], i[2], i[1]), p["gold_uv"], (0, 1, 1, 0), (0, 0, 1, 1))
    bmesh.ops.recalc_face_normals(bm, faces=faces)
    bm.to_mesh(obj.data)
    bm.free()
    obj.data.update()
    return len(faces)


def trim_above(obj, z, r):
    """Delete faces with ANY vertex above z, within |x| < r (clean horizontal cut, no slivers left standing)."""
    bm = bmesh.new()
    bm.from_mesh(obj.data)
    kill = [f for f in bm.faces if max(v.co.z for v in f.verts) > z and abs(f.calc_center_median().x) < r]
    bmesh.ops.delete(bm, geom=kill, context="FACES")
    bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")
    bm.to_mesh(obj.data)
    bm.free()
    obj.data.update()
    return len(kill)


def clip_inside(part, base, margin):
    """Push every vertex of `part` that lies OUTSIDE `base`'s surface back under it.

    Ray from the spine axis (0, 0, z) out to the vertex: if the base mesh is hit before the vertex,
    the vertex pokes through -> move it to (hit - margin).  Vertices where no base surface covers
    them (open chest front) are left alone, so no holes open.
    """
    bm = bmesh.new()
    bm.from_mesh(base.data)
    bm.transform(base.matrix_world)
    tree = BVHTree.FromBMesh(bm)
    bm.free()
    inv = part.matrix_world.inverted()
    moved = 0
    for vt in part.data.vertices:
        p = part.matrix_world @ vt.co
        o = Vector((0.0, 0.0, p.z))
        d = p - o
        dist = d.length
        if dist < 1e-4:
            continue
        d.normalize()
        hit, _n, _i, t = tree.ray_cast(o, d, dist + margin)
        if hit is not None and t < dist + margin:
            vt.co = inv @ (o + d * max(t - margin, 0.0))
            moved += 1
    part.data.update()
    return moved


def stitch_nape(obj, z_split, a_lo=8.0, a_hi=172.0, z_hi=1.825, z_lo=0.0, seam_z=1.79):
    """Close the open band at the back of the neck between the head's lower edge and the neck tube's
    upper edge by zipping the two boundary chains together, each side of the x=0 seam separately.

    New faces take the UV of the nearest NECK-chain vertex, so the strip samples plain nape skin.
    """
    import math
    bm = bmesh.new()
    bm.from_mesh(obj.data)
    uvl = bm.loops.layers.uv.active

    def ang(v):
        return math.degrees(math.atan2(v.co.y, v.co.x))

    def side(v):  # which half a seam vertex belongs to: mean x of its faces
        xs = [f.calc_center_median().x for f in v.link_faces]
        return 1 if sum(xs) / len(xs) >= 0 else -1

    bverts = {v for e in bm.edges if e.is_boundary for v in e.verts}
    back = [v for v in bverts if a_lo <= ang(v) <= a_hi]
    made = 0
    for s in (1, -1):
        # lower edge only: the x=0 centre seam is unwelded all the way up the skull - keep just its bottom vertex
        head = sorted([v for v in back if z_split < v.co.z < z_hi and side(v) == s
                       and (abs(v.co.x) > 0.003 or v.co.z < seam_z)], key=ang)
        neck = sorted([v for v in back if z_lo < v.co.z <= z_split and side(v) == s], key=ang)
        if len(head) < 2 or len(neck) < 2:
            continue
        uv_of = {}
        for v in neck:
            uv_of[v] = v.link_loops[0][uvl].uv.copy()
        i = j = 0
        while i < len(head) - 1 or j < len(neck) - 1:  # zipper between the two angle-sorted chains
            adv_head = j >= len(neck) - 1 or (i < len(head) - 1 and ang(head[i + 1]) <= ang(neck[j + 1]))
            if adv_head:
                tri = (head[i], head[i + 1], neck[j])
                i += 1
            else:
                tri = (head[i], neck[j + 1], neck[j])
                j += 1
            try:
                f = bm.faces.new(tri)
            except ValueError:
                continue
            c = f.calc_center_median()
            f.normal_update()
            if f.normal.dot(Vector((c.x, c.y, 0))) < 0:
                f.normal_flip()
            for lp in f.loops:
                src = lp.vert if lp.vert in uv_of else min(neck, key=lambda n: (n.co - lp.vert.co).length)
                lp[uvl].uv = uv_of[src]
            f.smooth = True
            made += 1
    bm.to_mesh(obj.data)
    bm.free()
    obj.data.update()
    return made


def import_unit(key):
    before = {o.name for o in bpy.data.objects}
    fbx, wanted = paths(key)
    bpy.ops.import_scene.fbx(filepath=fbx)
    new = [o for o in bpy.data.objects if o.name not in before]
    for o in list(new):
        if o.name.split(".")[0] in bs.JUNK_NAMES and o.type in ("MESH", "CAMERA", "LIGHT"):
            bpy.data.objects.remove(o, do_unlink=True)
            new.remove(o)
    body = max([o for o in new if o.type == "MESH"], key=lambda o: len(o.data.polygons))
    rig = [o for o in new if o.type == "ARMATURE"][0]
    for mat in body.data.materials:
        if mat and mat.use_nodes:
            bs.wire_textures(mat, material_paths(key, mat.name))
    return body, rig


def build_bun(obj, pos, radii, uv_c, rings=8, segs=14, bone="B_HeadJ"):
    """Hand-modelled topknot: a small ellipsoid on the head, 100 % weighted to the head bone, every UV pointing at one hair texel
    (so the hair recolour makes it black like the rest of the hair)."""
    bm = bmesh.new()
    bm.from_mesh(obj.data)
    uvl = bm.loops.layers.uv.active
    dl = bm.verts.layers.deform.active
    gi = {g.name: g.index for g in obj.vertex_groups}[bone]
    res = bmesh.ops.create_uvsphere(bm, u_segments=segs, v_segments=rings, radius=1.0)
    verts = res["verts"]
    for v in verts:
        v.co = Vector((pos[0] + v.co.x * radii[0], pos[1] + v.co.y * radii[1], pos[2] + v.co.z * radii[2]))
        v[dl][gi] = 1.0
    faces = {f for v in verts for f in v.link_faces}
    for f in faces:
        f.smooth = True
        f.material_index = 0
        for lp in f.loops:
            lp[uvl].uv = uv_c
    bm.to_mesh(obj.data)
    bm.free()
    obj.data.update()
    return len(faces)


def tag_regions(obj, comps, regions):
    """Tag vertices with a region id BEFORE any deletion (island ids shift afterwards); texture scripts read the 'reg' attribute."""
    if not regions:
        return
    names = list(regions)
    attr = obj.data.attributes.new("reg", "INT", "POINT")
    vals = [0] * len(obj.data.vertices)
    for ri, n in enumerate(names, 1):
        for k in regions[n]:
            for i in comps[k]:
                vals[i] = ri
    attr.data.foreach_set("value", vals)
    obj["region_names"] = names


def build(name, v):
    bs.reset_scene()
    base, rig = import_unit(v["base"])
    base.name, base.data.name = v["base"], v["base"] + "Mesh"
    rig.name = "Armature"
    weight_src = None
    if any(f.get("weights_from_base") for f in v.get("fill", [])):
        weight_src = base.copy()  # the UNCUT base (chest plate still there): skin-weight source for fills
        weight_src.data = base.data.copy()
        weight_src.name = "WeightSource"
        bpy.context.collection.objects.link(weight_src)
        weight_src.hide_render = True
        for m in list(weight_src.modifiers):
            weight_src.modifiers.remove(m)
    comps = P.components(base)
    tag_regions(base, comps, v.get("regions"))
    ids = set(v["remove"])
    for k, comp in enumerate(comps):  # baked-in weapon/scabbard islands (the stick under the feet)
        w = P.comp_info(base, comp)["bones"]
        if w and any(s in w[0][0] for s in ("Weapon", "Scabbard")):
            ids.add(k)
    if v.get("drop_above_z"):  # keep only the lower body of the base (islands whose centre is below this height)
        for k, comp in enumerate(comps):
            if P.comp_info(base, comp)["centre"][2] > v["drop_above_z"]:
                ids.add(k)
    if v.get("metal"):  # every island that is mostly metal (MetallicGlossAO red channel)
        fm = importlib.import_module("04_metal_map").face_metal(base, v["base"])
        v2c = {i: k for k, comp in enumerate(comps) for i in comp}
        share = {}
        for p in base.data.polygons:
            a = share.setdefault(v2c[p.vertices[0]], [0, 0])
            a[0] += fm[p.index] > 0.5
            a[1] += 1
        ids |= {k for k, (m, n) in share.items() if m / n >= 0.6}
    rem = [i for k in sorted(ids) for i in comps[k]]
    P.delete_verts(base, rem)
    cut = keep_faces(base, lambda ds: "B_HeadJ" not in ds)
    if "collar_z" in v:  # trim the base's standing collar to a clean horizontal edge
        bisect_above(base, v["collar_z"], v.get("collar_r", 0.25))
    if "collar" in v:  # hand-modelled stand-up collar (see build_collar)
        print("   collar faces %d" % build_collar(base, v["collar"]))
    if v.get("min_island"):  # scraps the cuts left behind in the upper body
        scraps = [c for c in P.components(base) if len(c) < v["min_island"]
                  and P.comp_info(base, c)["centre"][2] > 1.4]
        P.delete_verts(base, [i for c in scraps for i in c])
    for f in v.get("fill", []):  # donor body region (torso etc.) to cover what the removals opened up
        part, prig = import_unit(f["donor"])
        part.name = part.data.name = "%sFill_%s" % (f["donor"], f.get("tag", "torso"))
        pc = P.components(part)
        tag_regions(part, pc, f.get("regions"))
        if "keep_comps" in f:  # take whole donor islands (e.g. coat panels) instead of a bone region
            P.delete_verts(part, [i for k in f["keep_comps"] for i in pc[k]], invert=True)
        else:
            P.delete_verts(part, [i for k in f.get("exclude", []) for i in pc[k]])
            bones = set(f["bones"])
            keep_faces(part, lambda ds: all(d in bones for d in ds))
        if "zmax" in f:
            trim_above(part, f["zmax"], 9.0)
        sxy = f.get("scale_xy", 1.0)
        if sxy != 1.0:
            for vt in part.data.vertices:
                vt.co.x *= sxy
                vt.co.y *= sxy
        if f.get("clip_inside"):
            n = clip_inside(part, base, f.get("margin", 0.008))
            print("   clip %s: %d verts pushed under the base surface" % (part.name, n))
        if f.get("weights_from_base") and weight_src is not None:
            transfer_weights(weight_src, part)
            print("   %s: skin weights transferred from the uncut base" % part.name)
        if f.get("calm_weights"):
            calm_weights(part)
            print("   %s: arm weights stripped + smoothed" % part.name)
        part.parent = rig
        for m in part.modifiers:
            if m.type == "ARMATURE":
                m.object = rig
        bpy.data.objects.remove(prig, do_unlink=True)
        print("   fill %s faces %d" % (part.name, len(part.data.polygons)))
    if weight_src is not None:
        bpy.data.objects.remove(weight_src, do_unlink=True)
    donor, drig = import_unit(v["donor"])
    donor.name, donor.data.name = v["donor"] + "Head", v["donor"] + "HeadMesh"
    hb = set(v.get("head_bones", ("B_HeadJ",)))
    if v.get("head_exclude"):
        dc = P.components(donor)
        P.delete_verts(donor, [i for k in v["head_exclude"] for i in dc[k]])
    if v.get("head_neck_comps"):  # head + the neck faces of ONLY these donor islands (others flare out)
        dc = P.components(donor)
        neck_v = {i for k in v["head_neck_comps"] for i in dc[k]}
        dom = dominant(donor)
        bm = bmesh.new()
        bm.from_mesh(donor.data)
        kill = []
        for f in bm.faces:
            ds = [dom.get(x.index) for x in f.verts]
            if all(d == "B_HeadJ" for d in ds):
                continue
            if all(x.index in neck_v for x in f.verts):
                back = f.calc_center_median().y > 0.0
                if back:  # whole tube at the BACK, whatever bone it is weighted to (closes the nape)
                    if v.get("flip_neck_back"):
                        f.normal_flip()  # Bannerjee's tube back is wound inward (render-verified: culled = hole)
                    continue
                if all(d in ("B_HeadJ", "B_Neck01J") for d in ds):  # front: neck-weighted faces only
                    continue
            kill.append(f)
        bmesh.ops.delete(bm, geom=kill, context="FACES")
        bmesh.ops.delete(bm, geom=[x for x in bm.verts if not x.link_faces], context="VERTS")
        bm.to_mesh(donor.data)
        bm.free()
    else:
        keep_faces(donor, lambda ds: all(d in hb for d in ds))
    if v.get("head_shift_z"):  # lower the whole head (and its neck tube) in rest pose: shortens a long neck without distorting the face
        for vt in donor.data.vertices:
            vt.co.z += v["head_shift_z"]
        donor.data.update()
        print("   head shifted by %.3f" % v["head_shift_z"])
    if "bun" in v:
        print("   topknot faces %d" % build_bun(donor, **v["bun"]))
    if "stitch_nape" in v:
        print("   nape stitched with %d faces" % stitch_nape(donor, v["stitch_nape"], a_lo=20.0, a_hi=160.0))
    if "neck_extend" in v:
        print("   neck extended from %d edges" % extend_neck(donor, *v["neck_extend"]))
    if "stitch2" in v:  # second zipper: tube's sloped back edge -> top of the neck extension
        zs, zh, zl = v["stitch2"]
        print("   back band stitched with %d faces" % stitch_nape(donor, zs, z_hi=zh, z_lo=zl, seam_z=zh))
    if "neck_double" in v:  # back-of-neck zone: double-sided + plain skin, so no culled holes whatever the winding
        z0, z1 = v["neck_double"]
        bm = bmesh.new()
        bm.from_mesh(donor.data)
        uvl = bm.loops.layers.uv.active
        side_v = max((x for x in bm.verts if z0 < x.co.z < z1 and x.link_loops), key=lambda x: abs(x.co.x))
        skin = side_v.link_loops[0][uvl].uv.copy()
        zone = [f for f in bm.faces if z0 < f.calc_center_median().z < z1 and f.calc_center_median().y > -0.02]
        for f in zone:
            for lp in f.loops:
                lp[uvl].uv = skin
        dup = bmesh.ops.duplicate(bm, geom=zone)
        dfaces = [g for g in dup["geom"] if isinstance(g, bmesh.types.BMFace)]
        for f in dfaces:
            f.normal_flip()
        bm.to_mesh(donor.data)
        bm.free()
        print("   neck zone double-sided: %d faces" % len(zone))
    if "neck_backplate" in v:
        print("   neck backplate faces %d" % neck_backplate(donor, *v["neck_backplate"]))
    if v.get("neck_outward"):  # neck-zone faces must face OUT (game material culls back faces)
        bm = bmesh.new()
        bm.from_mesh(donor.data)
        flipped = 0

        def outness(f):
            c = f.calc_center_median()
            f.normal_update()
            return f.normal.dot(Vector((c.x, c.y, 0.0)))
        # the head's own convention, read off back-of-skull hair faces (object may be mirrored on import)
        ref = [outness(f) for f in bm.faces if f.calc_center_median().z > 1.85 and f.calc_center_median().y > 0.05]
        sign = 1.0 if sum(1 for r in ref if r > 0) >= len(ref) / 2 else -1.0
        print("   neck_outward: reference sign %+d from %d hair faces" % (sign, len(ref)))
        for f in bm.faces:
            c = f.calc_center_median()
            if c.z < 1.79 and (c.x ** 2 + c.y ** 2) ** 0.5 < 0.11:
                if outness(f) * sign < 0:
                    f.normal_flip()
                    flipped += 1
        bm.to_mesh(donor.data)
        bm.free()
        print("   neck faces flipped outward: %d" % flipped)
    if "head_trim" in v:  # drop flared neck/collar lips: low faces that reach far from the neck axis
        zt, rt = v["head_trim"]
        bm = bmesh.new()
        bm.from_mesh(donor.data)
        kill = [f for f in bm.faces if any(x.co.z < zt and (x.co.x ** 2 + x.co.y ** 2) ** 0.5 > rt for x in f.verts)]
        bmesh.ops.delete(bm, geom=kill, context="FACES")
        bmesh.ops.delete(bm, geom=[x for x in bm.verts if not x.link_faces], context="VERTS")
        bm.to_mesh(donor.data)
        bm.free()
        print("   head trim removed %d faces" % len(kill))
    donor.parent = rig
    for m in donor.modifiers:
        if m.type == "ARMATURE":
            m.object = rig
    bpy.data.objects.remove(drig, do_unlink=True)
    bpy.context.view_layer.update()
    print(name, "removed verts", len(rem), "head faces", cut, "donor head tris", len(donor.data.polygons))

    bs.setup_world(strength=1.8, color=(0.55, 0.58, 0.64))
    bs.setup_lights(sun_energy=3.0, fill_energy=120)
    for img in list(bpy.data.images):
        if img.users == 0:
            bpy.data.images.remove(img)
    bs.pack_all_images()
    lo, hi = bs.model_bounds(base)
    hlo, hhi = bs.model_bounds(donor)
    top = max(hi.z, hhi.z)
    centre = Vector((0, 0, (lo.z + top) / 2))
    scale = (top - lo.z) * 1.1
    os.makedirs(SHOTS, exist_ok=True)
    for tag, d in (("front", (0, -1, 0)), ("tq", (0.7, -0.7, 0)), ("back", (0, 1, 0))):
        bs.setup_render(500, 700)
        cam = bs.setup_camera(target=centre, ortho_scale=scale, direction=d, distance=scale * 2.5)
        bs.render_to(os.path.join(SHOTS, "%s_%s.png" % (name, tag)), cam)
        bpy.data.objects.remove(cam, do_unlink=True)
    bs.setup_render(500, 500)
    cam = bs.setup_camera(target=Vector((0, 0, 1.68)), ortho_scale=0.75, direction=(0.5, -0.85, 0.05), distance=4)
    bs.render_to(os.path.join(SHOTS, "%s_head.png" % name), cam)
    bpy.data.objects.remove(cam, do_unlink=True)
    cam = bs.setup_camera(target=centre, ortho_scale=scale, direction=(0.7, -0.7, 0), distance=scale * 2.5)
    bs.setup_render(1000, 1300)
    os.makedirs(BLENDS, exist_ok=True)
    try:
        bpy.ops.wm.save_as_mainfile(filepath=os.path.join(BLENDS, name + ".blend"), compress=True)
    except Exception as e:
        print("save failed", e)


keys = script_args() or list(VARIANTS)
for k in keys:
    build(k, VARIANTS[k])
