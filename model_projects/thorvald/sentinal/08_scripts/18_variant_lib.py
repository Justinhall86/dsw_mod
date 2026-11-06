"""Shared helpers for the five Sentinal variants.

Design notes
------------
* The hull is 194 UNWELDED panel islands, so component IDs are useless and a
  hard box cut can tear a panel in half. Two families of operation:
    - DEFORM: a continuous field applied to EVERY vertex (smoothstep weight),
      so neighbouring panels move by nearly the same amount and no gap opens.
    - ISLAND: rigid per-island operations (delete) keyed on the island's
      centroid, which is safe because an island is never split.
* The FBX's base mesh data is in BIND-POSE space (the Armature modifier
  rotates it at evaluation time). Bake the evaluated positions into the base
  mesh and drop the modifier BEFORE any per-vertex read - see traps.md.
* New hand-modelled geometry reuses the hull's own material; its UVs are
  projected from local space into a real texture rectangle picked from a
  large hull panel, so it picks up the same paint/panel lines as the hull.
"""
import json
import math
import os
import sys

import bmesh
import bpy
from mathutils import Vector

ROOT = r"C:\Users\justi\Python\dsw_mod\model_projects\sentinal"
HOST_FBX = os.path.join(ROOT, "01_input", "Renegade_Frigate_real.fbx")
TEX = os.path.join(ROOT, "04_textures")
HOUSE_ALB = os.path.join(TEX, "Sentinal_Albedo.png")
HOUSE_MGAO = os.path.join(TEX, "Sentinal_MetallicGlossAO.png")
HOUSE_NRM = os.path.join(TEX, "Sentinal_Normal.png")
VANILLA_ALB = os.path.join(ROOT, "01_input", "Renegade_Frigate_Albedo.png")
VANILLA_MGAO = os.path.join(ROOT, "01_input", "Renegade_Frigate_MetallicGlossAOEmiss.png")
VANILLA_NRM = os.path.join(ROOT, "01_input", "Renegade_Frigate_Normal.png")


# ----------------------------------------------------------------- basics
def smoothstep(a, b, x):
    if a == b:
        return 0.0 if x < a else 1.0
    t = (x - a) / (b - a)
    t = max(0.0, min(1.0, t))
    return t * t * (3 - 2 * t)


def scene_tris(objs=None):
    """Total verts/tris over every mesh in the scene (hull + added parts),
    so the tri budget of a variant is visible in the build log."""
    if objs is None:
        objs = [o for o in bpy.context.scene.objects if o.type == "MESH"]
    v = t = 0
    for o in objs:
        me = o.data
        v += len(me.vertices)
        try:
            t += len(me.loop_triangles)
        except Exception:
            t += len(me.polygons)
    return {"verts": v, "tris": t, "meshes": len(objs)}


def bbox_world(objs):
    """World-space bounds of `objs`, forcing an update first.

    Object.bound_box and matrix_world are cached: right after editing mesh
    data or creating objects they still hold the PRE-edit values, so measuring
    without a depsgraph update silently reports the old hull (this cost a
    whole re-render pass - see traps.md).  Evaluated data is used so any
    modifiers are included.
    """
    bpy.context.view_layer.update()
    dg = bpy.context.evaluated_depsgraph_get()
    dg.update()
    mn = Vector((1e9, 1e9, 1e9))
    mx = Vector((-1e9, -1e9, -1e9))
    for o in objs:
        oe = o.evaluated_get(dg)
        for c in oe.bound_box:
            w = oe.matrix_world @ Vector(c)
            for i in range(3):
                mn[i] = min(mn[i], w[i])
                mx[i] = max(mx[i], w[i])
    return mn, mx


def bake_pose(obj):
    """Base data is bind-pose; bake the evaluated (visually correct) shape
    into it and drop the Armature modifier. Parent links are left alone, so
    the armature object's own transform still applies exactly as before."""
    dg = bpy.context.evaluated_depsgraph_get()
    ev = obj.evaluated_get(dg).to_mesh()
    if len(ev.vertices) == len(obj.data.vertices):
        for i, v in enumerate(obj.data.vertices):
            v.co = ev.vertices[i].co
    obj.evaluated_get(dg).to_mesh_clear()
    obj.data.update()
    for mod in list(obj.modifiers):
        if mod.type == "ARMATURE":
            obj.modifiers.remove(mod)


def wire_material(objs, mat_name, albedo, mgao, normal):
    mat = bpy.data.materials.get(mat_name) or bpy.data.materials.new(mat_name)
    mat.use_nodes = True
    nt = mat.node_tree
    for n in list(nt.nodes):
        nt.nodes.remove(n)

    def tex(path, loc, non_color=False):
        nd = nt.nodes.new("ShaderNodeTexImage")
        img = bpy.data.images.load(path, check_existing=False)
        img.pack()
        if non_color:
            img.colorspace_settings.name = "Non-Color"
        nd.image = img
        nd.location = loc
        return nd

    bsdf = nt.nodes.new("ShaderNodeBsdfPrincipled")
    bsdf.location = (-200, 0)
    out = nt.nodes.new("ShaderNodeOutputMaterial")
    out.location = (200, 0)
    nt.links.new(bsdf.outputs["BSDF"], out.inputs["Surface"])
    alb = tex(albedo, (-700, 300))
    nt.links.new(alb.outputs["Color"], bsdf.inputs["Base Color"])
    if mgao and os.path.exists(mgao):
        mga = tex(mgao, (-700, 0), non_color=True)
        nt.links.new(mga.outputs["Color"], bsdf.inputs["Specular IOR Level"])
    if normal and os.path.exists(normal):
        nrm = tex(normal, (-700, -300), non_color=True)
        nmap = nt.nodes.new("ShaderNodeNormalMap")
        nmap.location = (-400, -300)
        nt.links.new(nrm.outputs["Color"], nmap.inputs["Color"])
        nt.links.new(nmap.outputs["Normal"], bsdf.inputs["Normal"])
    for o in objs:
        o.data.materials.clear()
        o.data.materials.append(mat)
    return mat


# ------------------------------------------------------------------ host
class Host:
    """The hull, loaded, baked, centred, and normalised so every operation
    can speak in fractions of the hull's own half-extents (-1 .. 1)."""

    def __init__(self, albedo=HOUSE_ALB, mgao=HOUSE_MGAO, normal=HOUSE_NRM,
                 name="Sentinal"):
        bpy.ops.wm.read_factory_settings(use_empty=True)
        bpy.ops.import_scene.fbx(filepath=HOST_FBX)
        self.objects = list(bpy.context.scene.objects)
        self.mesh = next(o for o in self.objects if o.type == "MESH")
        bake_pose(self.mesh)
        self.root = bpy.data.objects.new(name + "_root", None)
        bpy.context.scene.collection.objects.link(self.root)
        for o in self.objects:
            if o.parent is None and o is not self.root:
                o.parent = self.root
        wire_material([self.mesh], "Mat_" + name, albedo, mgao, normal)
        bpy.context.view_layer.update()
        mn, mx = bbox_world([self.mesh])
        c = (mn + mx) / 2
        self.root.location = self.root.location - c
        bpy.context.view_layer.update()
        self.refresh()
        # The normalisation is captured ONCE. Later ops must keep using these
        # values, or a deform that changes the bounding box would silently
        # shift every subsequent fractional coordinate.
        self.nc = Vector(self.center)
        self.nh = Vector(self.half)

    def refresh(self):
        self.mn, self.mx = bbox_world([self.mesh])
        self.center = (self.mn + self.mx) / 2
        self.half = Vector(((self.mx[i] - self.mn[i]) / 2 for i in range(3)))
        self.size = max(self.mx[i] - self.mn[i] for i in range(3))

    # -- coordinate helpers -------------------------------------------
    def to_frac(self, w):
        return Vector(((w[i] - self.nc[i]) / self.nh[i] for i in range(3)))

    def to_world(self, f):
        return Vector((f[i] * self.nh[i] + self.nc[i] for i in range(3)))

    def to_world_current(self, f):
        """Fractional -> world using the CURRENT bounding box. Use this for
        placing added parts AFTER the hull has been reshaped; the deform ops
        themselves must use `to_frac`/`to_world` (the frozen original)."""
        return Vector((f[i] * self.half[i] + self.center[i] for i in range(3)))

    # -- operations ----------------------------------------------------
    def weight(self, f, box=None, band=None):
        """0..1 blend weight for a fractional coordinate.

        `band` is a single-axis ramp: (axis, w0, w1) -> 0 at w0, 1 at w1.
        `box` is a product over the three axes, each entry being one of:
            None            - this axis does not constrain the weight
            [lo, hi]        - smoothstep rising lo -> hi (swap to invert)
            [lo, hi, edge]  - 1 INSIDE [lo,hi], ramping to 0 over `edge`
                              on both sides (put lo/edge outside the hull so
                              the near side never fades out)
        """
        wt = 1.0
        if band is not None:
            ax, w0, w1 = band
            lo, hi = (w0, w1) if w0 <= w1 else (w1, w0)
            t = smoothstep(lo, hi, f[ax])
            wt *= t if w0 <= w1 else 1.0 - t
        if box is not None:
            for ax, ent in enumerate(box):
                if ent is None:
                    continue
                if len(ent) == 3:
                    lo, hi, edge = ent
                    if lo > hi:
                        lo, hi, edge = hi, lo, -edge
                    wt *= smoothstep(lo, lo + abs(edge), f[ax]) * \
                        (1.0 - smoothstep(hi - abs(edge), hi, f[ax]))
                else:
                    lo, hi = ent
                    wt *= smoothstep(lo, hi, f[ax]) if lo <= hi else \
                        1.0 - smoothstep(hi, lo, f[ax])
        return wt

    def deform(self, scale=(1.0, 1.0, 1.0), delta=(0.0, 0.0, 0.0),
               pivot=(0.0, 0.0, 0.0), shear=None, box=None, band=None):
        """Continuous hull reshape. Everything happens in normalised
        (fractional) space, so `scale` is a fraction of the hull's own
        half-extent and `delta` likewise. `shear` is (axis, sh_axis, factor):
        f[axis] += factor * f[sh_axis] * weight. Neighbouring panels move by
        nearly the same amount (smoothstep weight), so no seam opens."""
        me = self.mesh.data
        mw = self.mesh.matrix_world
        inv = mw.inverted()
        for v in me.vertices:
            f = self.to_frac(mw @ v.co)
            wt = self.weight(f, box=box, band=band)
            if wt <= 0.0:
                continue
            g = Vector(f)
            for i in range(3):
                s = (f[i] - pivot[i]) * scale[i] + pivot[i]
                g[i] = f[i] + (s - f[i]) * wt + delta[i] * wt
            if shear is not None:
                ax, sh, k = shear
                g[ax] += k * f[sh] * wt
            v.co = inv @ self.to_world(g)
        me.update()

    def deform_map(self, fn, box=None, band=None):
        """Escape hatch: fn(frac_vec, weight) -> frac_vec, applied to every
        vertex with a smooth blend weight. `fn` gets a copy and must not
        mutate its argument in place without returning it."""
        me = self.mesh.data
        mw = self.mesh.matrix_world
        inv = mw.inverted()
        for v in me.vertices:
            f = self.to_frac(mw @ v.co)
            wt = self.weight(f, box=box, band=band)
            if wt <= 0.0:
                continue
            g = fn(Vector(f), wt)
            v.co = inv @ self.to_world(g)
        me.update()

    def delete_islands(self, box):
        """Rigid removal: whole unwelded islands whose centroid falls inside
        a fractional box. Returns (n_islands, n_faces) actually removed."""
        me = self.mesh.data
        mw = self.mesh.matrix_world
        idx = self.islands()
        doomed = []
        for isl in idx:
            c = Vector((0, 0, 0))
            for i in isl:
                c += mw @ me.vertices[i].co
            c /= len(isl)
            f = self.to_frac(c)
            if all(box[ax][0] <= f[ax] <= box[ax][1] for ax in range(3)):
                doomed.append(isl)
        doom_verts = {i for isl in doomed for i in isl}
        bm = bmesh.new()
        bm.from_mesh(me)
        bm.faces.ensure_lookup_table()
        dead = [f for f in bm.faces if any(v.index in doom_verts for v in f.verts)]
        n_faces = len(dead)
        for f in dead:
            bm.faces.remove(f)
        for v in [v for v in bm.verts if not v.link_faces]:
            bm.verts.remove(v)
        bm.to_mesh(me)
        bm.free()
        me.update()
        self.refresh()
        return len(doomed), n_faces

    def islands(self):
        me = self.mesh.data
        parent = list(range(len(me.vertices)))

        def find(a):
            while parent[a] != a:
                parent[a] = parent[parent[a]]
                a = parent[a]
            return a

        for e in me.edges:
            a, b = find(e.vertices[0]), find(e.vertices[1])
            if a != b:
                parent[a] = b
        groups = {}
        for i in range(len(me.vertices)):
            groups.setdefault(find(i), []).append(i)
        return list(groups.values())

    def stats(self):
        me = self.mesh.data
        try:
            me.calc_loop_triangles()
        except AttributeError:
            pass
        return {"verts": len(me.vertices), "tris": len(me.loop_triangles),
                "islands": len(self.islands()),
                "size": tuple(round(x, 2) for x in
                              (self.mx[i] - self.mn[i] for i in range(3)))}

    def probe(self, box, label=""):
        """List every island whose centroid falls in a fractional box - run
        this BEFORE a delete so you know exactly what you are about to lose,
        since an unwelded hull gives no other warning."""
        me = self.mesh.data
        mw = self.mesh.matrix_world
        hits = []
        for isl in self.islands():
            c = Vector((0, 0, 0))
            mn = Vector((1e9, 3))
            xs, ys, zs = [], [], []
            for i in isl:
                w = mw @ me.vertices[i].co
                xs.append(w.x)
                ys.append(w.y)
                zs.append(w.z)
                c += w
            c /= len(isl)
            f = self.to_frac(c)
            if all(box[ax][0] <= f[ax] <= box[ax][1] for ax in range(3)):
                hits.append({"n": len(isl),
                             "frac": tuple(round(x, 2) for x in f),
                             "bbox": (round(min(xs), 2), round(max(xs), 2),
                                      round(min(ys), 2), round(max(ys), 2),
                                      round(min(zs), 2), round(max(zs), 2))})
        hits.sort(key=lambda h: -h["n"])
        print(f"PROBE {label}: {len(hits)} islands, "
              f"{sum(h['n'] for h in hits)} verts")
        for h in hits[:40]:
            print("   ", h)
        return hits

    # ---------------------------------------------------- UV / texture
    def uv_mask(self, box, size=512):
        """Rasterise the albedo pixels belonging to faces whose centroid is
        inside a fractional box. This is how a WORLD-space paint instruction
        becomes a TEXTURE-space mask."""
        import numpy as np
        me = self.mesh.data
        mw = self.mesh.matrix_world
        uvs = me.uv_layers.active.data
        mask = np.zeros((size, size), dtype=bool)
        for poly in me.polygons:
            c = self.to_frac(mw @ poly.center)
            if not all(box[ax][0] <= c[ax] <= box[ax][1] for ax in range(3)):
                continue
            pts = []
            for li in poly.loop_indices:
                u, v = uvs[li].uv
                pts.append((u * (size - 1), (1.0 - v) * (size - 1)))
            xs = [p[0] for p in pts]
            ys = [p[1] for p in pts]
            x0, x1 = max(0, int(min(xs))), min(size - 1, int(max(xs)) + 1)
            y0, y1 = max(0, int(min(ys))), min(size - 1, int(max(ys)) + 1)
            if x1 < x0 or y1 < y0:
                continue
            n = len(pts)

            def inside(px, py):
                sign = 0
                for i in range(n):
                    ax_, ay_ = pts[i]
                    bx_, by_ = pts[(i + 1) % n]
                    cr = (bx_ - ax_) * (py - ay_) - (by_ - ay_) * (px - ax_)
                    if abs(cr) < 1e-9:
                        continue
                    s = 1 if cr > 0 else -1
                    if sign == 0:
                        sign = s
                    elif s != sign:
                        return False
                return True

            for yy in range(y0, y1 + 1):
                for xx in range(x0, x1 + 1):
                    if inside(xx + 0.5, yy + 0.5):
                        mask[yy, xx] = True
        return mask


# ------------------------------------------------------ texture storytelling
def _system_python():
    """A python with Pillow installed (Blender's own has none)."""
    import shutil
    for cand in ("python", "py"):
        p = shutil.which(cand)
        if not p:
            continue
        try:
            import subprocess
            r = subprocess.run([p, "-c", "import PIL.Image"], capture_output=True)
            if r.returncode == 0:
                return p
        except Exception:
            pass
    raise RuntimeError("no system python with Pillow found")


def paint_albedo(src_path, out_path, ops, size=512):
    """Delegate the actual painting to 18b_paint.py (system python + Pillow).

    Each op's numpy `mask` is written to a temp .npy so the child process can
    reload it; everything else travels as JSON.
    """
    import json
    import subprocess
    import tempfile

    tmp = tempfile.mkdtemp(prefix="sentinal_paint_")
    spec = []
    for i, op in enumerate(ops):
        op = dict(op)
        m = op.pop("mask", None)
        if m is None:
            import numpy as _np
            m = _np.ones((size, size), dtype=bool)
        mp = os.path.join(tmp, f"mask_{i}.npy")
        import numpy as _np
        _np.save(mp, m)
        op["mask_file"] = mp
        spec.append(op)
    spec_path = os.path.join(tmp, "spec.json")
    with open(spec_path, "w", encoding="utf-8") as fh:
        json.dump(spec, fh)

    painter = os.path.join(_HERE_DIR(), "18b_paint.py")
    py = _system_python()
    r = subprocess.run([py, painter, src_path, out_path, spec_path],
                       capture_output=True, text=True, encoding="utf-8",
                       errors="replace")
    print((r.stdout or "").strip())
    if r.returncode != 0:
        raise RuntimeError("paint failed:\n" + (r.stdout or "") + "\n" +
                           (r.stderr or ""))
    return out_path


def _HERE_DIR():
    return os.path.dirname(os.path.abspath(__file__))



# ------------------------------------------------------- hand-built parts
def _new_mesh_obj(name, verts, faces, collection=None):
    me = bpy.data.meshes.new(name)
    me.from_pydata(verts, [], faces)
    me.update()
    ob = bpy.data.objects.new(name, me)
    (collection or bpy.context.scene.collection).objects.link(ob)
    return ob


def _rect_from_island(host, skip_islands=0):
    """Pick a real texture rectangle from one of the hull's own big panels,
    so added geometry inherits the hull's panel lines and paint. Preference
    goes to the island with the LARGEST usable UV rectangle among the
    biggest islands - a huge island with a 4-pixel UV island would give
    added parts a flat, featureless colour."""
    me = host.mesh.data
    uvs = me.uv_layers.active.data
    best = None
    polys = {}
    for poly in me.polygons:
        polys.setdefault(poly.vertices[0], []).append(poly)
    cands = sorted(host.islands(), key=len, reverse=True)[:60]
    for isl in cands[skip_islands:]:
        us, vs = [], []
        for vidx in isl:
            for poly in polys.get(vidx, ()):
                for li in poly.loop_indices:
                    u, v = uvs[li].uv
                    us.append(u)
                    vs.append(v)
        if len(us) < 4:
            continue
        du, dv = max(us) - min(us), max(vs) - min(vs)
        if du < 0.03 or dv < 0.03:
            continue
        score = du * dv
        if best is None or score > best[0]:
            best = (score, (min(us), min(vs), max(us), max(vs)))
    if best is None:
        return (0.0, 0.0, 1.0, 1.0)
    return best[1]


def _box_verts_faces(size, loc, taper=None, chamfer=0.0):
    sx, sy, sz = size[0] / 2, size[1] / 2, size[2] / 2
    v = []
    for z in (-sz, sz):
        for y in (-sy, sy):
            for x in (-sx, sx):
                v.append(Vector((x, y, z)))
    # 0..3 bottom (z-), 4..7 top (z+); order: --+ x, -+ etc.
    faces = [(0, 1, 3, 2), (4, 6, 7, 5), (0, 4, 5, 1),
             (2, 3, 7, 6), (0, 2, 6, 4), (1, 5, 7, 3)]
    return v, faces


def add_box(host, name, size, loc, rot=(0, 0, 0), taper=None):
    """A solid box. `taper` = (x_scale_top, y_scale_top) shrinks the top face
    to make a wedge/plate."""
    import mathutils
    sx, sy, sz = size[0] / 2, size[1] / 2, size[2] / 2
    tx, ty = taper if taper else (1.0, 1.0)
    verts = [Vector((-sx, -sy, -sz)), Vector((sx, -sy, -sz)),
             Vector((sx, sy, -sz)), Vector((-sx, sy, -sz)),
             Vector((-sx * tx, -sy * ty, sz)), Vector((sx * tx, -sy * ty, sz)),
             Vector((sx * tx, sy * ty, sz)), Vector((-sx * tx, sy * ty, sz))]
    faces = [(3, 2, 1, 0), (4, 5, 6, 7), (0, 1, 5, 4),
             (1, 2, 6, 5), (2, 3, 7, 6), (3, 0, 4, 7)]
    ob = _new_mesh_obj(name, verts, faces)
    ob.rotation_euler = rot
    ob.location = loc
    return ob


def add_cylinder(name, radius, depth, loc, rot=(0, 0, 0), segments=12,
                 hollow=0.0, axis="z"):
    """Solid (or hollow, `hollow` = inner-radius fraction) cylinder along the
    local Z axis; `axis` spins it onto X or Y after construction.

    Ring layout: 0..s-1 outer bottom, s..2s-1 outer top,
    2s..3s-1 inner bottom, 3s..4s-1 inner top (hollow only).
    """
    verts, faces = [], []
    s = segments
    for i in range(s):
        a = 2 * math.pi * i / s
        verts.append(Vector((radius * math.cos(a), radius * math.sin(a), -depth / 2)))
    for i in range(s):
        a = 2 * math.pi * i / s
        verts.append(Vector((radius * math.cos(a), radius * math.sin(a), depth / 2)))
    for i in range(s):
        j = (i + 1) % s
        faces.append((i, j, s + j, s + i))              # outer wall
    if hollow <= 0:
        faces.append(tuple(range(s - 1, -1, -1)))       # bottom cap
        faces.append(tuple(range(s, 2 * s)))            # top cap
    else:
        ri = radius * (1.0 - hollow)
        for i in range(s):
            a = 2 * math.pi * i / s
            verts.append(Vector((ri * math.cos(a), ri * math.sin(a), -depth / 2)))
        for i in range(s):
            a = 2 * math.pi * i / s
            verts.append(Vector((ri * math.cos(a), ri * math.sin(a), depth / 2)))
        ib, it = 2 * s, 3 * s
        for i in range(s):
            j = (i + 1) % s
            faces.append((ib + i, it + i, it + j, ib + j))          # inner wall
            faces.append((i, ib + i, ib + j, j))                    # bottom ring
            faces.append((s + i, s + j, it + j, it + i))            # top ring
    ob = _new_mesh_obj(name, verts, faces)
    e = [0.0, 0.0, 0.0]
    if axis == "x":
        e[1] = math.radians(90)
    elif axis == "y":
        e[0] = math.radians(90)
    ob.rotation_euler = (e[0] + rot[0], e[1] + rot[1], e[2] + rot[2])
    ob.location = loc
    return ob


def add_wedge(name, size, loc, rot=(0, 0, 0), nose="y"):
    """A triangular prism ramp (nose/ram/blade shape)."""
    sx, sy, sz = size[0] / 2, size[1] / 2, size[2] / 2
    if nose == "y":
        verts = [Vector((-sx, -sy, -sz)), Vector((sx, -sy, -sz)),
                 Vector((sx, sy, -sz)), Vector((-sx, sy, -sz)),
                 Vector((-sx, -sy, sz)), Vector((sx, -sy, sz))]
        faces = [(3, 2, 1, 0), (0, 1, 5, 4), (2, 3, 4, 5),
                 (1, 2, 5), (3, 0, 4)]
    else:  # blade along Y, thin in X, rising at the tip
        verts = [Vector((-sx, -sy, -sz)), Vector((sx, -sy, -sz)),
                 Vector((sx, sy, -sz)), Vector((-sx, sy, -sz)),
                 Vector((-sx, -sy, sz)), Vector((sx, -sy, sz)),
                 Vector((sx, sy, sz)), Vector((-sx, sy, sz))]
        verts = [Vector((v.x, v.y, v.z)) for v in verts]
        faces = [(3, 2, 1, 0), (4, 5, 6, 7), (0, 1, 5, 4),
                 (2, 3, 7, 6), (1, 2, 6, 5), (3, 0, 4, 7)]
    ob = _new_mesh_obj(name, verts, faces)
    ob.rotation_euler = rot
    ob.location = loc
    return ob


def project_uv(ob, rect):
    """Cube-project the object's local coords into a real texture rectangle
    taken from a hull panel, so new geometry wears the hull's own paint."""
    me = ob.data
    if not me.uv_layers:
        me.uv_layers.new(name="UVMap")
    uvl = me.uv_layers.active.data
    xs = [v.co.x for v in me.vertices]
    ys = [v.co.y for v in me.vertices]
    zs = [v.co.z for v in me.vertices]
    rng = [(min(xs), max(xs)), (min(ys), max(ys)), (min(zs), max(zs))]

    def nz(a, b):
        return (a, b) if abs(b - a) > 1e-9 else (a, a + 1.0)

    rng = [nz(a, b) for a, b in rng]
    u0, v0, u1, v1 = rect
    for poly in me.polygons:
        n = poly.normal
        ax = max(range(3), key=lambda i: abs(n[i]))
        a, b = [i for i in range(3) if i != ax]
        for li in poly.loop_indices:
            co = me.vertices[me.loops[li].vertex_index].co
            pa = (co[a] - rng[a][0]) / (rng[a][1] - rng[a][0])
            pb = (co[b] - rng[b][0]) / (rng[b][1] - rng[b][0])
            uvl[li].uv = (u0 + pa * (u1 - u0), v0 + pb * (v1 - v0))
    me.update()


def finish_parts(host, parts, rect=None, embed_parent=True):
    """Assign hull material + atlas UVs, parent everything to the host root,
    and bake transforms so nothing floats free of the root."""
    if rect is None:
        rect = _rect_from_island(host)
    mat = host.mesh.data.materials[0]
    # matrix_world is cached - reading it before an update returns IDENTITY
    # for a freshly created part, which silently zeroes its location AND
    # rotation (this is how the sensor boom ended up vertical, in the middle
    # of the ship - see traps.md).
    bpy.context.view_layer.update()
    for ob in parts:
        project_uv(ob, rect)
        ob.data.materials.clear()
        ob.data.materials.append(mat)
        if embed_parent:
            world = ob.matrix_world.copy()
            ob.parent = host.root
            ob.matrix_parent_inverse = host.root.matrix_world.inverted()
            ob.matrix_world = world
    bpy.context.view_layer.update()
    return rect


# ------------------------------------------------------------- rendering
def setup_render(cam_dist_mult=1.7, elev_deg=50.0, res=480, engine=None):
    size = 10.2
    scene = bpy.context.scene
    if engine is None:
        engine = "BLENDER_EEVEE" if "BLENDER_EEVEE" in \
            bpy.types.RenderSettings.bl_rna.properties["engine"].enum_items.keys() \
            else "BLENDER_EEVEE_NEXT"
    scene.render.engine = engine
    scene.render.resolution_x = res
    scene.render.resolution_y = res
    scene.render.image_settings.file_format = "PNG"

    if "Cam" not in bpy.data.objects:
        cam = bpy.data.objects.new("Cam", bpy.data.cameras.new("Cam"))
        bpy.context.scene.collection.objects.link(cam)
        tgt = bpy.data.objects.new("CamTarget", None)
        bpy.context.scene.collection.objects.link(tgt)
        con = cam.constraints.new("TRACK_TO")
        con.target = tgt
        con.track_axis = "TRACK_NEGATIVE_Z"
        con.up_axis = "UP_Y"
        sun = bpy.data.objects.new("Sun", bpy.data.lights.new("Sun", "SUN"))
        sun.data.energy = 3.2
        bpy.context.scene.collection.objects.link(sun)
        sun.rotation_euler = (math.radians(55), 0, math.radians(35))
        fill = bpy.data.objects.new("Fill", bpy.data.lights.new("Fill", "SUN"))
        fill.data.energy = 1.1
        bpy.context.scene.collection.objects.link(fill)
        fill.rotation_euler = (math.radians(70), 0, math.radians(-120))
        world = bpy.data.worlds.new("World")
        world.use_nodes = True
        world.node_tree.nodes["Background"].inputs[0].default_value = \
            (0.13, 0.14, 0.16, 1)
        bpy.context.scene.world = world
    bpy.context.scene.camera = bpy.data.objects["Cam"]
    return cam_dist_mult, elev_deg


def cam_frame(size, dist_mult=1.7, elev_deg=50.0, yaw_deg=45.0,
              target=(0.0, 0.0, 0.0)):
    """Place the camera at a fixed distance from `target` so ships of
    different sizes stay comparable across a contact sheet."""
    d = size * dist_mult
    e = math.radians(elev_deg)
    y = math.radians(yaw_deg)
    cam = bpy.data.objects["Cam"]
    cam.location = (target[0] + d * math.cos(e) * math.cos(y),
                    target[1] + d * math.cos(e) * math.sin(y),
                    target[2] + d * math.sin(e))
    bpy.data.objects["CamTarget"].location = target


def render_still(path, res=None):
    scene = bpy.context.scene
    if res:
        scene.render.resolution_x = res
        scene.render.resolution_y = res
    scene.render.filepath = path
    bpy.ops.render.render(write_still=True)


VIEWS = {
    # Ship axes: bow = +X, stern = -X, span = +/-Y, up = +Z.
    "game": dict(elev=52.0, yaw=45.0),    # RTS camera, bow at frame right
    "top": dict(elev=89.0, yaw=90.0),
    "side": dict(elev=3.0, yaw=90.0),     # from +Y: the true X/Z profile
    "front": dict(elev=5.0, yaw=0.0),     # from +X: the prow
    "rear": dict(elev=8.0, yaw=180.0),    # from -X: the stern
}


def _frame_box():
    """World bbox of every mesh + its centre (updated)."""
    objs = [o for o in bpy.context.scene.objects if o.type == "MESH"]
    mn, mx = bbox_world(objs)
    ctr = ((mn[0] + mx[0]) / 2, (mn[1] + mx[1]) / 2, (mn[2] + mx[2]) / 2)
    return mn, mx, ctr


def render_views(out_dir, tag, size=None, res=480):
    os.makedirs(out_dir, exist_ok=True)
    mn, mx, ctr = _frame_box()
    if size is None:
        size = max(mx[i] - mn[i] for i in range(3))
    paths = []
    for name, v in VIEWS.items():
        cam_frame(size, dist_mult=1.75, elev_deg=v["elev"], yaw_deg=v["yaw"],
                  target=ctr)
        p = os.path.join(out_dir, f"{tag}_{name}.png")
        render_still(p, res)
        paths.append(p)
    return paths


def render_turntable(out_dir, tag, size=None, n_frames=16, res=480):
    os.makedirs(out_dir, exist_ok=True)
    mn, mx, ctr = _frame_box()
    if size is None:
        size = max(mx[i] - mn[i] for i in range(3))
    paths = []
    for i in range(n_frames):
        yaw = (i / n_frames) * 360.0
        cam_frame(size, dist_mult=1.75, elev_deg=52.0, yaw_deg=yaw,
                  target=ctr)
        p = os.path.join(out_dir, f"frame_{i:03d}.png")
        render_still(p, res)
        paths.append(p)
    return paths


def save_blend(path):
    try:
        bpy.ops.wm.save_as_mainfile(filepath=path)
    except Exception as exc:   # OneDrive version-backup hiccup
        print("SAVE WARNING", exc)

