"""Gold hardware for the Ginaz units: domed buttons, olive toggles and a rolled collar rim, as REAL geometry with a dedicated metallic material.

Used by 03_variants.py (recipe key "hardware").  Everything lives in ONE extra object, "GinazHardware", so it is one more material slot (Mat_GinazGold)
and one more draw call in the game.

 - Mat_GinazGold textures (64x16, generated here): albedo = radial gradient (bright centre, dark rim: fakes a domed highlight when the vertex UV
   u = normalised distance from the button centre), MetallicGlossAO = R 0.91 metallic / G 0.75 gloss / B 1 AO, normal = flat.
 - Buttons are placed on the real surface: a ray from the front along +y hits the union of the given objects, the dome follows the surface normal.
 - Skin weights are copied from the nearest vertex of the surface that was hit (so a chest button moves with the chest in every clip).
"""
import math
import os

import bmesh
import bpy
import numpy as np
from mathutils import Matrix, Vector
from mathutils.bvhtree import BVHTree

GOLD_MAT = "Mat_GinazGold"


def write_gold_textures(tex_dir):
    os.makedirs(tex_dir, exist_ok=True)
    w, h = 64, 16
    u = np.linspace(0, 1, w)[None, :].repeat(h, 0)
    base = np.array([196, 152, 74], np.float32)
    bright = np.array([236, 196, 112], np.float32)
    dark = np.array([128, 92, 40], np.float32)
    t = np.clip(1.0 - u * 1.15, 0, 1)[..., None]
    col = dark + (base - dark) * np.clip(t * 1.6, 0, 1) + (bright - base) * np.clip((t - 0.62) * 2.6, 0, 1)
    spec = np.exp(-((u - 0.22) / 0.07) ** 2)[..., None]
    col = np.clip(col + spec * np.array([40, 44, 40], np.float32), 0, 255)
    alb = np.concatenate([col, np.full((h, w, 1), 255, np.float32)], -1).astype(np.uint8)
    mg = np.zeros((h, w, 4), np.uint8)
    mg[..., 0] = 232      # metallic
    mg[..., 1] = (150 + 70 * spec[..., 0]).astype(np.uint8)   # gloss, brighter at the highlight
    mg[..., 2] = 255      # AO
    mg[..., 3] = 255
    nm = np.zeros((h, w, 4), np.uint8)
    nm[...] = (128, 128, 255, 255)
    paths = {}
    for name, arr in (("Albedo", alb), ("MetallicGlossAO", mg), ("Normal", nm)):
        p = os.path.join(tex_dir, "GinazGold_%s.png" % name)
        im = bpy.data.images.new("GinazGold_%s_gen" % name, w, h, alpha=True)
        im.pixels.foreach_set((arr[::-1].astype(np.float32) / 255.0).ravel())     # bottom-up rows
        im.filepath_raw = p
        im.file_format = "PNG"
        im.save()
        bpy.data.images.remove(im)
        paths[name] = p
    return paths


def gold_material(tex_dir):
    mat = bpy.data.materials.get(GOLD_MAT)
    if mat:
        return mat
    paths = write_gold_textures(tex_dir)
    mat = bpy.data.materials.new(GOLD_MAT)
    mat.use_nodes = True
    nt = mat.node_tree
    for n in list(nt.nodes):
        nt.nodes.remove(n)
    out = nt.nodes.new("ShaderNodeOutputMaterial")
    bsdf = nt.nodes.new("ShaderNodeBsdfPrincipled")
    bsdf.inputs["Metallic"].default_value = 0.85
    bsdf.inputs["Roughness"].default_value = 0.32
    nt.links.new(bsdf.outputs["BSDF"], out.inputs["Surface"])

    def tex(path, nonc):
        nd = nt.nodes.new("ShaderNodeTexImage")
        img = bpy.data.images.load(path, check_existing=True)
        img.name = os.path.basename(path)
        if nonc:
            img.colorspace_settings.name = "Non-Color"
        nd.image = img
        return nd
    alb = tex(paths["Albedo"], False)
    mg = tex(paths["MetallicGlossAO"], True)
    nrm = tex(paths["Normal"], True)
    nmap = nt.nodes.new("ShaderNodeNormalMap")
    nt.links.new(alb.outputs["Color"], bsdf.inputs["Base Color"])
    nt.links.new(mg.outputs["Color"], bsdf.inputs["Specular IOR Level"])
    nt.links.new(nrm.outputs["Color"], nmap.inputs["Color"])
    nt.links.new(nmap.outputs["Normal"], bsdf.inputs["Normal"])
    return mat


class Surface:
    """Union of rest-pose surfaces (BVH per object) with skin-weight lookup."""

    def __init__(self, objs):
        self.items = []
        for o in objs:
            bm = bmesh.new()
            bm.from_mesh(o.data)
            bm.transform(o.matrix_world)
            tree = BVHTree.FromBMesh(bm)
            names = {g.index: g.name for g in o.vertex_groups}
            self.items.append((o, tree, bm, names))

    def ray(self, origin, direction, maxd=2.0):
        best = None
        for o, tree, bm, names in self.items:
            hit, n, idx, d = tree.ray_cast(origin, direction, maxd)
            if hit is not None and (best is None or d < best[0]):
                best = (d, hit, n, idx, o, bm, names)
        return best

    def weights_at(self, point):
        best = None
        for o, tree, bm, names in self.items:
            loc, n, idx, d = tree.find_nearest(point)
            if loc is not None and (best is None or d < best[0]):
                best = (d, idx, o, bm, names)
        d, idx, o, bm, names = best
        bm.faces.ensure_lookup_table()
        f = bm.faces[idx]
        v = min(f.verts, key=lambda x: (x.co - point).length)
        w = {names[g.group]: g.weight for g in o.data.vertices[v.index].groups if g.weight > 0.01}
        return w


def _basis(n, up=Vector((1, 0, 0))):
    t1 = (up - n * up.dot(n))
    if t1.length < 1e-4:
        t1 = Vector((0, 0, 1)) - n * n.z
    t1.normalize()
    t2 = n.cross(t1).normalized()
    return t1, t2


def add_dome(bm, uvl, center, n, ra, rb, height, segs=10, rings=3):
    """Domed disc (ellipse ra x rb) standing `height` above the surface; UV u = radial distance 0..1 (centre -> rim)."""
    t1, t2 = _basis(n)
    layers = []
    for k in range(rings + 1):
        phi = (math.pi / 2) * k / (rings + 0.0001) if k < rings else math.pi / 2
        r = math.cos(phi)
        z = math.sin(phi) * height
        ring = []
        for s in range(segs if k < rings else 1):
            a = 2 * math.pi * s / segs
            p = center + t1 * (ra * r * math.cos(a)) + t2 * (rb * r * math.sin(a)) + n * z
            ring.append(bm.verts.new(p))
        layers.append((ring, r))
    faces = []
    for k in range(rings - 1):
        a, b = layers[k][0], layers[k + 1][0]
        for s in range(segs):
            faces.append(bm.faces.new((a[s], a[(s + 1) % segs], b[(s + 1) % segs], b[s])))
    apex = layers[-1][0][0]
    last = layers[-2][0]
    for s in range(segs):
        faces.append(bm.faces.new((last[s], last[(s + 1) % segs], apex)))
    for f in faces:
        f.smooth = True
        # outward = along n: flip if needed
        f.normal_update()
        if f.normal.dot(n) < 0:
            f.normal_flip()
    # UVs: radial distance from the centre (0 = bright centre, 1 = dark rim)
    for f in faces:
        for lp in f.loops:
            r = ((lp.vert.co - center) - n * (lp.vert.co - center).dot(n)).length / max(ra, rb)
            lp[uvl].uv = (min(0.04 + r * 0.92, 0.98), 0.5)
    return faces


def build_hardware(rig, spec, surface_objs, tex_dir):
    """spec: {"buttons": [(x, z, rx, rz, height), ...], "collar_rim": dict(...COLLAR params..., tube=0.0055, a0, a1) or None, "side": "front"}"""
    mat = gold_material(tex_dir)
    me = bpy.data.meshes.new("GinazHardwareMesh")
    hw = bpy.data.objects.new("GinazHardware", me)
    bpy.context.collection.objects.link(hw)
    me.materials.append(mat)
    surf = Surface(surface_objs)
    bm = bmesh.new()
    uvl = bm.loops.layers.uv.new("UVMap")
    dl = bm.verts.layers.deform.verify()
    groups = {}

    def gid(name):
        if name not in groups:
            groups[name] = hw.vertex_groups.new(name=name).index
        return groups[name]

    def weight_faces(faces, wdict_fn):
        done = set()
        for f in faces:
            for v in f.verts:
                if v in done:
                    continue
                done.add(v)
                w = wdict_fn(v.co)
                tot = sum(w.values()) or 1.0
                for k, x in w.items():
                    v[dl][gid(k)] = x / tot

    placed = 0
    for (x, z, ra, rb, height) in spec.get("buttons", []):
        r = surf.ray(Vector((x, -0.6, z)), Vector((0, 1, 0)))
        if r is None:
            print("   button at", x, z, "missed the surface")
            continue
        d, hit, nrm, idx, o, bmo, names = r
        n = nrm.copy()
        if n.y > 0:
            n = -n
        n.normalize()
        c = hit + n * 0.0012
        faces = add_dome(bm, uvl, c, n, ra, rb, height)
        w = surf.weights_at(hit)
        weight_faces(faces, lambda p, w=w: w)
        placed += 1
    rim = spec.get("collar_rim")
    rim_faces = []
    if rim:
        rim_faces = add_collar_rim(bm, uvl, rim)
        w_top = {"B_SpineTopJ": 0.55, "B_Neck01J": 0.45}
        weight_faces(rim_faces, lambda p: w_top)
    bm.to_mesh(me)
    bm.free()
    for f in me.polygons:
        f.use_smooth = True
    hw.parent = rig
    mod = hw.modifiers.new("Armature", "ARMATURE")
    mod.object = rig
    print("   hardware: %d buttons, %d rim faces, %d tris total" % (placed, len(rim_faces), sum(len(p.vertices) - 2 for p in me.polygons)))
    return hw


def add_collar_rim(bm, uvl, p):
    """Rolled tube along the TOP edge of build_collar's shell (same height law top_at), cross-section radius `tube`."""
    segs = max(24, p.get("segs", 36) // 2)
    a0 = -90.0 + p["open_deg"]
    a1 = 270.0 - p["open_deg"]
    tr = p.get("tube", 0.0055)
    sides = 6

    def top_at(a):
        d = abs(((a + 90.0 + 180.0) % 360.0) - 180.0)
        t = max(0.0, min(1.0, (d - p["open_deg"]) / (180.0 - p["open_deg"])))
        side = p["top_front"] + (p["top_side"] - p["top_front"]) * math.sin(min(t * 2, 1.0) * math.pi / 2)
        return side if t < 0.5 else p["top_side"] + (p["top_back"] - p["top_side"]) * math.sin((t - 0.5) * math.pi)

    rows = []
    centres = []
    for i in range(segs + 1):
        a = a0 + (a1 - a0) * i / segs
        ar = math.radians(a)
        rx = p["rx"] - p["thick"] * 0.5 + p["flare"]
        ry = p["ry"] - p["thick"] * 0.5 + p["flare"]
        c = Vector((rx * math.cos(ar), p["cy"] + ry * math.sin(ar), top_at(a) - tr * 0.35))
        # tangent along the path
        a2 = math.radians(a + 0.5)
        rx2, ry2 = rx, ry
        c2 = Vector((rx2 * math.cos(a2), p["cy"] + ry2 * math.sin(a2), top_at(a + 0.5) - tr * 0.35))
        tan = (c2 - c).normalized()
        out = Vector((math.cos(ar), math.sin(ar), 0.0))
        up = Vector((0, 0, 1))
        b = tan.cross(out).normalized() if abs(tan.dot(up)) < 0.95 else up
        nn = b.cross(tan).normalized()
        ring = []
        for s in range(sides):
            th = 2 * math.pi * s / sides
            ring.append(bm.verts.new(c + nn * (tr * math.cos(th)) + b * (tr * 0.9 * math.sin(th))))
        rows.append(ring)
        centres.append(c)
    faces = []
    for i in range(segs):
        for s in range(sides):
            f = bm.faces.new((rows[i][s], rows[i][(s + 1) % sides], rows[i + 1][(s + 1) % sides], rows[i + 1][s]))
            f.smooth = True
            cen = (f.calc_center_median() - centres[i])
            f.normal_update()
            if f.normal.dot(cen) < 0:
                f.normal_flip()
            for lp in f.loops:
                lp[uvl].uv = (0.35 if lp.vert.co.z > centres[i].z else 0.18, 0.5)
            faces.append(f)
    return faces
