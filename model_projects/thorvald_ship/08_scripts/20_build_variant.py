"""Assemble a vehicle variant from vanilla donor models, declaratively.

    blender -b --factory-startup --python 10_build_variant.py -- <spec.json>

Each piece is a vanilla donor vehicle plus an ABSOLUTE world-space box on that
donor (the same coordinates 11_islands_baked.py prints). The chunk is cut
first, then scaled to the size we want, then mounted. Cutting in the donor's
own space means the box numbers read off the island survey are used verbatim.

Design rules encoded here (learned the hard way, see sentinal/SPEC.md):
  * Every added element comes from a pre-existing game model. No hand-modelled
    primitives: donor geometry already has correct texel density and normals.
  * HMD-converted meshes store BIND pose in `mesh.data`, not the shape you see.
    Everything is baked to world space through the evaluated depsgraph first,
    then the object transform is cleared, so local == world.
  * Parts are cut by a world-space BOX, never by connected-component id: these
    hulls are hundreds of unwelded islands so component selection is useless.
  * A graft is EMBEDDED into the host surface rather than floated above it -
    that interpenetration is what makes a join read as one built object
    instead of a toy glued on top.
"""
import json
import math
import os
import sys

import bmesh
import bpy
from mathutils import Matrix, Vector

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = os.path.dirname(os.path.dirname(PROJ))
sys.path.insert(0, HERE)
import blender_scene as bs  # noqa: E402
import preview_wiring as pw  # noqa: E402

VEH = os.path.join(REPO, "model_inputs", "Vehicle")

DONORS = {
    "chronos":  ("Imperial/Chronos/preview_textures/Chronos_real.fbx", "Imperial/Chronos/Chronos"),
    "carryall": ("Atreide/CarryAll/preview_textures/CarryAll_real.fbx", "Atreide/CarryAll/CarryAll"),
    "wraith":   ("Smuggler/Wraith/preview_textures/Wraith_real.fbx", "Smuggler/Wraith/Wraith"),
    "banshee":  ("Smuggler/Banshee/preview_textures/Banshee_real.fbx", "Smuggler/Banshee/Banshee"),
    "ravager":  ("Common/Ravager/preview_textures/Ravager_real.fbx", "Common/Ravager/Ravager"),
    "kraken":   ("Atreide/Kraken/preview_textures/Kraken_real.fbx", "Atreide/Kraken/Kraken"),
    "hawk":     ("Atreide/Hawk/preview_textures/Hawk_real.fbx", "Atreide/Hawk/Hawk"),
    "overlord": ("Harkonnen/Overlord/preview_textures/Overlord_real.fbx", "Harkonnen/Overlord/Overlord"),
    "hammer":   ("Imperial/Hammer/preview_textures/Hammer_real.fbx", "Imperial/Hammer/Hammer"),
    "drones":   ("Smuggler/DroneS/preview_textures/DroneS_real.fbx", "Smuggler/DroneS/DroneS"),
    "dronea":   ("Atreide/DroneA/preview_textures/DroneA_real.fbx", "Atreide/DroneA/DroneA"),
    "frigate":  ("Common/Renegade_Frigate/preview_textures/Renegade_Frigate_real.fbx",
                 "Common/Renegade_Frigate/Renegade_Frigate"),
    "harpy":    ("Harkonnen/Harpy/preview_textures/Harpy_real.fbx", "Harkonnen/Harpy/Harpy"),
    "tank":     ("Atreide/Tank/preview_textures/Tank_real.fbx", "Atreide/Tank/Tank"),
}

# Reference sheet palette: near-black charcoal hull, ornate copper contrast,
# oxblood stripes. `rgb` is the target LINEAR colour; `gain`/`lift` normalise
# the donor albedo's own luminance into a mid-grey so the tint is readable.
PALETTE = {
    "charcoal": {"rgb": (0.050, 0.052, 0.060), "metal": 0.85, "rough": 0.32, "gain": 4.0, "lift": 0.20},
    "hull":    {"rgb": (0.030, 0.032, 0.038), "metal": 0.55, "rough": 0.52,
                "gain": 7.0, "lift": 0.14},
    "copper":  {"rgb": (0.440, 0.155, 0.048), "metal": 0.95, "rough": 0.30,
                "gain": 5.2, "lift": 0.10},
    "oxblood": {"rgb": (0.130, 0.022, 0.022), "metal": 0.35, "rough": 0.50,
                "gain": 7.0, "lift": 0.14},
    "steel":   {"rgb": (0.180, 0.185, 0.205), "metal": 0.85, "rough": 0.38,
                "gain": 6.0, "lift": 0.12},
    "bone":    {"rgb": (0.330, 0.290, 0.230), "metal": 0.30, "rough": 0.55,
                "gain": 6.0, "lift": 0.12},
}


def donor(key):
    """DONORS entry, or auto-discovered: any model_inputs/Vehicle/<Faction>/<Name>
    with preview_textures/<Name>_real.fbx, matched case-insensitively on <Name>."""
    if key in DONORS:
        return DONORS[key]
    for fac in os.listdir(VEH):
        fdir = os.path.join(VEH, fac)
        if not os.path.isdir(fdir):
            continue
        for name in os.listdir(fdir):
            if name.lower() == key.lower() or (fac + "_" + name).lower() == key.lower():
                rel = "%s/%s/preview_textures/%s_real.fbx" % (fac, name, name)
                if os.path.exists(os.path.join(VEH, rel.replace("/", os.sep))):
                    return (rel, "%s/%s/%s" % (fac, name, name))
    raise SystemExit("unknown donor %r" % key)


def log(*a):
    print("[build]", *a)


def import_and_flatten(rel, tag):
    """Import, bake the evaluated (posed) shape into the vertices, clear the
    transforms so local coordinates equal world coordinates."""
    path = os.path.join(VEH, rel.replace("/", os.sep))
    pre = set(bpy.context.scene.objects)
    bpy.ops.import_scene.fbx(filepath=path)
    new = [o for o in bpy.context.scene.objects if o not in pre]

    for junk in ("Cube", "Camera", "Light", "Lamp"):
        for o in list(new):
            if o.name.split(".")[0] == junk:
                new.remove(o)
                bpy.data.objects.remove(o, do_unlink=True)

    meshes = [o for o in new if o.type == "MESH"]
    if not meshes:
        raise SystemExit("no mesh in %s" % path)
    bpy.context.view_layer.update()

    objs = []
    for o in meshes:
        dg = bpy.context.evaluated_depsgraph_get()
        ev = o.evaluated_get(dg)
        me = ev.to_mesh()
        coords = [(o.matrix_world @ me.vertices[i].co).copy() for i in range(len(me.vertices))]
        ev.to_mesh_clear()
        if len(coords) == len(o.data.vertices):
            for i, v in enumerate(o.data.vertices):
                v.co = coords[i]
        else:
            mw = o.matrix_world.copy()
            for v in o.data.vertices:
                v.co = mw @ v.co
        o.data.update()
        for mod in list(o.modifiers):
            if mod.type == "ARMATURE":
                o.modifiers.remove(mod)
        o.parent = None
        o.matrix_world = Matrix.Identity(4)
        o.name = "%s_%s" % (tag, o.name)
        objs.append(o)

    for o in list(new):
        if o.type != "MESH" and o.name in bpy.data.objects:
            bpy.data.objects.remove(o, do_unlink=True)
    return objs


def bounds(objs):
    mn = Vector((1e18, 1e18, 1e18))
    mx = Vector((-1e18, -1e18, -1e18))
    for o in objs:
        for v in o.data.vertices:
            p = v.co
            mn.x, mn.y, mn.z = min(mn.x, p.x), min(mn.y, p.y), min(mn.z, p.z)
            mx.x, mx.y, mx.z = max(mx.x, p.x), max(mx.y, p.y), max(mx.z, p.z)
    if mn.x > mx.x:
        raise SystemExit("empty object set")
    return mn, mx


def xform(objs, fn):
    for o in objs:
        for v in o.data.vertices:
            v.co = fn(v.co)
        o.data.update()


def cut_box(objs, b, strict=False):
    """Keep only faces whose centroid is inside the absolute box
    b = (x0, x1, y0, y1, z0, z1)."""
    x0, x1, y0, y1, z0, z1 = b
    kept = total = 0
    for o in objs:
        bm = bmesh.new()
        bm.from_mesh(o.data)
        doomed = []
        for f in bm.faces:
            total += 1
            pts = [v.co for v in f.verts] if strict else [f.calc_center_median()]
            if all(x0 <= c.x <= x1 and y0 <= c.y <= y1 and z0 <= c.z <= z1 for c in pts):
                kept += 1
            else:
                doomed.append(f)
        for f in doomed:
            bm.faces.remove(f)
        for v in [v for v in bm.verts if not v.link_faces]:
            bm.verts.remove(v)
        bm.to_mesh(o.data)
        bm.free()
        o.data.update()
    return kept, total


def remove_box_strict(objs, b):
    """Delete faces whose vertices are ALL inside the absolute box b. Returns the number removed."""
    x0, x1, y0, y1, z0, z1 = b
    gone = 0
    for o in objs:
        bm = bmesh.new()
        bm.from_mesh(o.data)
        doomed = [f for f in bm.faces
                  if all(x0 <= v.co.x <= x1 and y0 <= v.co.y <= y1 and z0 <= v.co.z <= z1 for v in f.verts)]
        gone += len(doomed)
        for f in doomed:
            bm.faces.remove(f)
        for v in [v for v in bm.verts if not v.link_faces]:
            bm.verts.remove(v)
        bm.to_mesh(o.data)
        bm.free()
        o.data.update()
    return gone


def remove_box(objs, b):
    """Delete faces whose centroid is inside the absolute box
    b = (x0, x1, y0, y1, z0, z1). Returns the number removed."""
    x0, x1, y0, y1, z0, z1 = b
    gone = 0
    for o in objs:
        bm = bmesh.new()
        bm.from_mesh(o.data)
        doomed = [f for f in bm.faces
                  if x0 <= f.calc_center_median().x <= x1
                  and y0 <= f.calc_center_median().y <= y1
                  and z0 <= f.calc_center_median().z <= z1]
        gone += len(doomed)
        for f in doomed:
            bm.faces.remove(f)
        for v in [v for v in bm.verts if not v.link_faces]:
            bm.verts.remove(v)
        bm.to_mesh(o.data)
        bm.free()
        o.data.update()
    return gone


def scale_region(objs, sr):
    """Scale the vertices inside a box about a pivot (local enlarge of one part, e.g. a gun barrel).
    sr = {"box": [x0,x1,y0,y1,z0,z1] (|y| is tested, so both sides match), "pivot": [px, |py|, pz],
          "scale": [sx, sy, sz]}. The pivot y takes the sign of the vertex."""
    x0, x1, y0, y1, z0, z1 = sr["box"]
    px, py, pz = sr["pivot"]
    sx, sy, sz = sr["scale"]
    n = 0
    for o in objs:
        for v in o.data.vertices:
            c = v.co
            if x0 <= c.x <= x1 and y0 <= abs(c.y) <= y1 and z0 <= c.z <= z1:
                cy = py if c.y >= 0 else -py
                v.co = Vector((px + (c.x - px) * sx, cy + (c.y - cy) * sy, pz + (c.z - pz) * sz))
                n += 1
        o.data.update()
    return n


def squash(objs, sq):
    """Scale one axis of every vertex inside a slab of another axis, about 0.
    sq = {"slab": "x", "range": [lo, hi], "axis": "y", "scale": 0.5}.
    Retailors a boxy donor part without opening holes the way a face cut does."""
    si, ai = "xyz".index(sq["slab"]), "xyz".index(sq["axis"])
    lo, hi = sq["range"]
    n = 0
    for o in objs:
        for v in o.data.vertices:
            if lo <= v.co[si] <= hi:
                v.co[ai] *= sq["scale"]
                n += 1
        o.data.update()
    return n


def cut_disc(objs, d, strict=False):
    """Keep only faces whose centroid lies inside a vertical cylinder
    d = (cx, cy, radius, z0, z1).

    A box is the wrong tool for a round part: a cylinder pod sits on a donor
    whose struts attach at the pod's corners, so any box tight enough to
    exclude the struts also shaves the drum, and any box loose enough to keep
    the drum also drags in torn strut stubs that render as black shards."""
    cx, cy, r, z0, z1 = d
    kept = total = 0
    r2 = r * r
    for o in objs:
        bm = bmesh.new()
        bm.from_mesh(o.data)
        doomed = []
        for f in bm.faces:
            total += 1
            pts = [v.co for v in f.verts] if strict else [f.calc_center_median()]
            if all((c.x - cx) ** 2 + (c.y - cy) ** 2 <= r2 and z0 <= c.z <= z1 for c in pts):
                kept += 1
            else:
                doomed.append(f)
        for f in doomed:
            bm.faces.remove(f)
        for v in [v for v in bm.verts if not v.link_faces]:
            bm.verts.remove(v)
        bm.to_mesh(o.data)
        bm.free()
        o.data.update()
    return kept, total


def cut_cyl(objs, d, strict=False):
    """Keep faces whose centroid is inside a cylinder around an arbitrary axis
    d = (c1, c2, radius, lo, hi, axis): (c1, c2) are the other two coords in
    x,y,z order, lo..hi is the extent along `axis`. cut_disc is the z-axis case."""
    c1, c2, r, lo, hi, axis = d
    ai = "xyz".index(axis)
    oi = [i for i in range(3) if i != ai]
    kept = total = 0
    for o in objs:
        bm = bmesh.new()
        bm.from_mesh(o.data)
        doomed = []
        for f in bm.faces:
            total += 1
            pts = [v.co for v in f.verts] if strict else [f.calc_center_median()]
            if all(((c[oi[0]] - c1) ** 2 + (c[oi[1]] - c2) ** 2 <= r * r) and lo <= c[ai] <= hi
                   for c in pts):
                kept += 1
            else:
                doomed.append(f)
        for f in doomed:
            bm.faces.remove(f)
        for v in [v for v in bm.verts if not v.link_faces]:
            bm.verts.remove(v)
        bm.to_mesh(o.data)
        bm.free()
        o.data.update()
    return kept, total


def drop_fragments(objs, min_faces):
    """Delete tiny leftover islands created by a cut severing welded detail.

    A box that stops inside a drum's weld collar leaves a handful of thin
    triangles hanging in mid-air; through them you see the inside of the shell,
    which is what reads as black torn metal. Anything with fewer faces than
    `min_faces` is a fragment, not a feature."""
    removed_islands = removed_faces = 0
    for o in objs:
        bm = bmesh.new()
        bm.from_mesh(o.data)
        bm.verts.ensure_lookup_table()
        seen, isl = set(), []
        for v0 in bm.verts:
            if v0.index in seen:
                continue
            stack, members = [v0], []
            seen.add(v0.index)
            while stack:
                cur = stack.pop()
                members.append(cur)
                for e in cur.link_edges:
                    ov = e.other_vert(cur)
                    if ov.index not in seen:
                        seen.add(ov.index)
                        stack.append(ov)
            isl.append(members)
        doomed = []
        for members in isl:
            faces = {f for v in members for f in v.link_faces}
            if len(faces) < min_faces:
                doomed.extend(faces)
                removed_islands += 1
                removed_faces += len(faces)
        if doomed:
            bmesh.ops.delete(bm, geom=list(set(doomed)), context="FACES")
            for v in [v for v in bm.verts if not v.link_faces]:
                bm.verts.remove(v)
        bm.to_mesh(o.data)
        bm.free()
        o.data.update()
    return removed_islands, removed_faces


def seal_holes(objs):
    """Close the boundary loops a cut leaves behind.

    Without this the cut is a hole: the renderer shows the inside of the shell
    through it, which is what makes a graft read as broken metal rather than a
    solid machined part. Filling the loops gives the chunk a flat lid."""
    filled = 0
    for o in objs:
        bm = bmesh.new()
        bm.from_mesh(o.data)
        edges = [e for e in bm.edges if e.is_boundary]
        if edges:
            try:
                res = bmesh.ops.triangle_fill(bm, use_beauty=True, use_dissolve=False, edges=edges)
                filled += len(res.get("geom", []))
            except RuntimeError:
                pass
        for f in bm.faces:
            f.smooth = False
        bm.to_mesh(o.data)
        bm.free()
        o.data.update()
    return filled


def texture_paths(stem):
    base = os.path.join(VEH, stem.replace("/", os.sep))
    d, name = os.path.dirname(base), os.path.basename(base)
    cands = {
        "albedo": [os.path.join(d, name + "_Albedo.png")],
        "mgao": [os.path.join(d, name + "_MetallicGlossAOEmiss.png"),
                 os.path.join(d, name + "_MetallicGlossAO.png")],
        "normal": [os.path.join(d, name + "_Normal.png")],
    }
    return {k: next((p for p in v if os.path.exists(p)), None) for k, v in cands.items()}


def make_material(name, tex, role, tint=None):
    pal = dict(PALETTE[role])
    if tint:
        pal.update(tint)

    mat = bpy.data.materials.new(name)
    mat.use_nodes = True
    nt = mat.node_tree
    for n in list(nt.nodes):
        nt.nodes.remove(n)

    out = nt.nodes.new("ShaderNodeOutputMaterial")
    out.location = (420, 0)
    bsdf = nt.nodes.new("ShaderNodeBsdfPrincipled")
    bsdf.location = (140, 0)
    nt.links.new(bsdf.outputs["BSDF"], out.inputs["Surface"])
    bsdf.inputs["Metallic"].default_value = pal["metal"]
    bsdf.inputs["Roughness"].default_value = pal["rough"]

    # Recolour the donor albedo INTO the target palette instead of rotating its
    # hue. ShaderNodeHueSaturation takes `Hue` as an OFFSET (0.5 = unchanged),
    # so passing an absolute hue there rotates every donor to a random colour -
    # a neutral grey hull came out vivid yellow. Here the donor's own luminance
    # is used as the shading signal and the palette supplies the colour, which
    # keeps every painted seam and panel line and lands on the intended colour.
    target = pal["rgb"]
    tint_rgb = nt.nodes.new("ShaderNodeRGB")
    tint_rgb.location = (-120, 240)
    tint_rgb.outputs[0].default_value = (target[0], target[1], target[2], 1.0)

    tint_fac = nt.nodes.new("ShaderNodeValue")
    tint_fac.location = (-120, 60)
    tint_fac.outputs[0].default_value = pal.get("tint_frac", 0.82)

    mix = nt.nodes.new("ShaderNodeMix")
    mix.data_type = "RGBA"
    mix.blend_type = "MULTIPLY"
    mix.location = (20, 160)
    mix.inputs["Factor"].default_value = 1.0
    nt.links.new(tint_rgb.outputs[0], mix.inputs["A"])
    nt.links.new(mix.outputs["Result"], bsdf.inputs["Base Color"])

    if tex.get("albedo"):
        n = nt.nodes.new("ShaderNodeTexImage")
        n.location = (-520, 220)
        img = bpy.data.images.load(tex["albedo"], check_existing=True)
        img.colorspace_settings.name = "sRGB"
        n.image = img
        # albedo -> luminance (keeps shading / panel lines) -> gain
        lum = nt.nodes.new("ShaderNodeRGBToBW")
        lum.location = (-300, 220)
        nt.links.new(n.outputs["Color"], lum.inputs["Color"])
        gain = nt.nodes.new("ShaderNodeMath")
        gain.operation = "MULTIPLY_ADD"
        gain.location = (-140, -60)
        gain.inputs[1].default_value = pal.get("gain", 2.6)
        gain.inputs[2].default_value = pal.get("lift", 0.0)
        nt.links.new(lum.outputs["Val"], gain.inputs[0])
        nt.links.new(gain.outputs["Value"], mix.inputs["B"])
    else:
        mix.inputs["B"].default_value = (1.0, 1.0, 1.0, 1.0)

    if tex.get("mgao"):
        n = nt.nodes.new("ShaderNodeTexImage")
        n.location = (-520, -80)
        img = bpy.data.images.load(tex["mgao"], check_existing=True)
        img.colorspace_settings.name = "Non-Color"
        n.image = img
        nt.links.new(n.outputs["Color"], bsdf.inputs["Specular IOR Level"])

    if tex.get("normal"):
        n = nt.nodes.new("ShaderNodeTexImage")
        n.location = (-520, -380)
        img = bpy.data.images.load(tex["normal"], check_existing=True)
        img.colorspace_settings.name = "Non-Color"
        n.image = img
        nm = nt.nodes.new("ShaderNodeNormalMap")
        nm.location = (-200, -380)
        nt.links.new(n.outputs["Color"], nm.inputs["Color"])
        nt.links.new(nm.outputs["Normal"], bsdf.inputs["Normal"])
    return mat


def make_drum_material(name, tex):
    """Jet-drum look: polished charcoal body, copper only on the donor's tan/brown (saturated) trim rings."""
    mat = make_material(name, tex, "charcoal")
    nt = mat.node_tree
    bsdf = next(n for n in nt.nodes if n.type == "BSDF_PRINCIPLED")
    base = next(l for l in nt.links if l.to_node == bsdf and l.to_socket.name == "Base Color")
    charcoal_out = base.from_socket
    gain = next((n for n in nt.nodes if n.type == "MATH" and n.operation == "MULTIPLY_ADD"), None)
    alb = next((n for n in nt.nodes if n.type == "TEX_IMAGE"), None)
    if gain is None or alb is None:
        return mat
    nt.links.remove(base)
    sep = nt.nodes.new("ShaderNodeSeparateColor")
    sep.mode = "HSV"
    nt.links.new(alb.outputs["Color"], sep.inputs["Color"])
    mr = nt.nodes.new("ShaderNodeMapRange")
    mr.clamp = True
    mr.inputs["From Min"].default_value = 0.16
    mr.inputs["From Max"].default_value = 0.30
    nt.links.new(sep.outputs["Green"], mr.inputs["Value"])
    cu_rgb = nt.nodes.new("ShaderNodeRGB")
    cu_rgb.outputs[0].default_value = (0.45, 0.14, 0.04, 1.0)
    cu = nt.nodes.new("ShaderNodeMix")
    cu.data_type = "RGBA"
    cu.blend_type = "MULTIPLY"
    cu.inputs["Factor"].default_value = 1.0
    nt.links.new(cu_rgb.outputs[0], cu.inputs["A"])
    nt.links.new(gain.outputs["Value"], cu.inputs["B"])
    fin = nt.nodes.new("ShaderNodeMix")
    fin.data_type = "RGBA"
    fin.blend_type = "MIX"
    nt.links.new(mr.outputs["Result"], fin.inputs["Factor"])
    nt.links.new(charcoal_out, fin.inputs["A"])
    nt.links.new(cu.outputs["Result"], fin.inputs["B"])
    nt.links.new(fin.outputs["Result"], bsdf.inputs["Base Color"])
    return mat


def make_mat(name, tex, role, tint=None):
    return make_drum_material(name, tex) if role == "drum" else make_material(name, tex, role, tint)


def assign_bands(host, bands):
    """Paint bands on the host as extra material slots: faces whose centroid lies in a coordinate range
    ({"axis":"y","range":[lo,hi],"abs":bool,"role":"oxblood"}). Used for the nose stripe and copper straps."""
    for i, b in enumerate(bands):
        mat = make_material("Mat_band%d_%s" % (i, b["role"]), {}, b["role"])
        ai = "xyz".index(b["axis"])
        lo, hi = b["range"]
        n = 0
        for o in host:
            o.data.materials.append(mat)
            idx = len(o.data.materials) - 1
            for poly in o.data.polygons:
                ok = True
                for cond in [b] + list(b.get("and", [])):
                    v = poly.center["xyz".index(cond["axis"])]
                    if cond.get("abs"):
                        v = abs(v)
                    if not (cond["range"][0] <= v <= cond["range"][1]):
                        ok = False
                        break
                if ok:
                    poly.material_index = idx
                    n += 1
        log("  band %s %s %s -> %d faces" % (b["role"], b["axis"], b["range"], n))


def apply_material(objs, mat):
    for o in objs:
        o.data.materials.clear()
        o.data.materials.append(mat)


def clone_objs(objs):
    out = []
    for o in objs:
        n = o.copy()
        n.data = o.data.copy()
        bpy.context.scene.collection.objects.link(n)
        out.append(n)
    return out


def recalc_normals(objs):
    for o in objs:
        bm = bmesh.new()
        bm.from_mesh(o.data)
        bmesh.ops.recalc_face_normals(bm, faces=bm.faces)
        bm.to_mesh(o.data)
        bm.free()
        o.data.update()


def make_piece(piece, host_half, idx):
    pname = piece["donor"]
    p_rel, p_stem = donor(pname)

    objs = import_and_flatten(p_rel, "p%d_%s" % (idx, pname))
    bpy.context.view_layer.update()

    # 1. cut in the donor's own coordinate space
    if piece.get("disc_abs"):
        kept, total = cut_disc(objs, piece["disc_abs"])
    else:
        kept, total = cut_box(objs, piece["box_abs"])
    if kept == 0:
        raise SystemExit("piece %s cut kept 0 faces - %s is wrong"
                         % (pname, "disc_abs" if piece.get("disc_abs") else "box_abs"))
    log("  piece %-9s cut %5d/%5d faces (%.1f%%)"
        % (pname, kept, total, 100.0 * kept / total))

    if piece.get("seal", False):
        nf = seal_holes(objs)
        if nf:
            log("  piece %-9s sealed %d boundary faces" % (pname, nf))

    frag = piece.get("min_island_faces", 8)
    if frag:
        ni, nfc = drop_fragments(objs, frag)
        if ni:
            log("  piece %-9s dropped %d fragment islands (%d faces)" % (pname, ni, nfc))

    # 2. normalise the chunk: centre it, scale its longest side to `size`
    mn, mx = bounds(objs)
    c = (mn + mx) / 2
    xform(objs, lambda p, c=c: p - c)
    mn, mx = bounds(objs)
    dim = mx - mn
    longest = max(dim.x, dim.y, dim.z, 1e-6)
    s = piece["size"] / longest
    xform(objs, lambda p, s=s: p * s)
    # optional lengthening along the drum's own axis (donor Z): the sheet's
    # drums are ~2x longer than wide, the Wraith pod is ~1.25x
    st = piece.get("stretch", 1.0)
    if st != 1.0:
        xform(objs, lambda p, st=st: Vector((p.x, p.y, p.z * st)))

    rot =piece.get("rot_deg", [0, 0, 0])
    rmat = (Matrix.Rotation(math.radians(rot[2]), 4, 'Z')
            @ Matrix.Rotation(math.radians(rot[1]), 4, 'Y')
            @ Matrix.Rotation(math.radians(rot[0]), 4, 'X'))
    xform(objs, lambda p, r=rmat: r @ p)

    mn, mx = bounds(objs)
    csize = max(mx.x - mn.x, mx.y - mn.y, mx.z - mn.z, 1e-6)

    # `lateral` is the host's port/starboard axis: the Renegade is long on X so
    # its lateral axis is Y; the old builder always mirrored on X, which put
    # the drums on the nose and tail of a ship that is long on X.
    lat = piece.get("lateral", "y")
    li = "xyz".index(lat)
    mirror = piece.get("mirror", True)
    sides = [1, -1] if mirror else [1]

    out = []
    for sgn in sides:
        clone = clone_objs(objs)
        if sgn < 0:
            d = [1.0, 1.0, 1.0, 1.0]
            d[li] = -1.0
            m = Matrix.Diagonal(d)
            xform(clone, lambda p, m=m: m @ p)
            recalc_normals(clone)

        # Seat the chunk ON the host exactly: its inner face sits `overlap`
        # units inside the hull wall at lateral distance `at`; everything else
        # sticks out. The other two axes come from `pos` in absolute host
        # coordinates (host is centred on the origin).
        seat = piece["seat"]
        overlap = float(seat.get("overlap", 0.3))
        at = float(seat["at"])
        pmin = min(v.co[li] for o in clone for v in o.data.vertices)
        pmax = max(v.co[li] for o in clone for v in o.data.vertices)
        inner = at - overlap
        shift = (sgn * inner) - (pmin if sgn > 0 else pmax)
        target = Vector((0.0, 0.0, 0.0))
        pos = piece.get("pos", [0.0, 0.0])      # the two non-lateral axes
        others = [i for i in range(3) if i != li]
        for k, i in enumerate(others):
            c = (min(v.co[i] for o in clone for v in o.data.vertices)
                 + max(v.co[i] for o in clone for v in o.data.vertices)) / 2
            target[i] = pos[k] - c
        target[li] = shift

        xform(clone, lambda p, t=target: p + t)
        out.append((clone, piece.get("role", "copper"), "%s_%+d" % (pname, sgn), p_stem))

    for o in objs:
        bpy.data.objects.remove(o, do_unlink=True)
    return out


def deck_z(host, x, y):
    """Z of the host surface under (x, y): ray straight down from above."""
    from mathutils.bvhtree import BVHTree
    bpy.context.view_layer.update()
    dg = bpy.context.evaluated_depsgraph_get()
    best = None
    for o in host:
        tree = BVHTree.FromObject(o, dg)
        hit, _n, _i, _d = tree.ray_cast(Vector((x, y, 50.0)), Vector((0, 0, -1)))
        if hit is not None and (best is None or hit.z > best):
            best = hit.z
    return best


def make_graft(g, host, idx):
    """Cut a part from any donor, scale/rotate it, and seat it on the host.

    g keys: donor, box_abs | disc_abs, scale (float | [sx,sy,sz], donor frame),
    rot_deg (about the chunk centre, after scale), at [x,y,z|null] (host-centred
    coords; z null = sit on the deck at x,y), sink (deck seating overlap),
    mirror_y (also place a copy across Y=0), min_island_faces, role, tint.
    Returns [(objs, role, tag, stem)]."""
    gname = g["donor"]
    rel, stem = donor(gname)
    objs = import_and_flatten(rel, "g%d_%s" % (idx, gname))
    bpy.context.view_layer.update()
    st = g.get("strict", True)    # all verts inside: no long spikes from big donor triangles
    if g.get("cyl_abs"):
        kept, total = cut_cyl(objs, g["cyl_abs"], st)
    elif g.get("disc_abs"):
        kept, total = cut_disc(objs, g["disc_abs"], st)
    else:
        kept, total = cut_box(objs, g["box_abs"], st)
    if kept == 0:
        raise SystemExit("graft %s cut kept 0 faces" % gname)
    if g.get("clamp_abs"):
        # centroid cuts keep big side panels whose far verts spike out; pull those verts back onto the box
        x0, x1, y0, y1, z0, z1 = g["clamp_abs"]
        xform(objs, lambda p: Vector((min(max(p.x, x0), x1), min(max(p.y, y0), y1), min(max(p.z, z0), z1))))
    for rb in g.get("remove_abs", []):
        # strict: only faces wholly inside go (donor space), so big panels crossing the box survive
        n = remove_box_strict(objs, rb)
        log("  graft %s remove_abs %s removed %d faces" % (gname, rb, n))
    frag = g.get("min_island_faces", 8)
    if frag:
        drop_fragments(objs, frag)
    mn, mx = bounds(objs)
    c = (mn + mx) / 2
    sc = g.get("scale", 1.0)
    sc = [sc] * 3 if not isinstance(sc, list) else sc
    rot = g.get("rot_deg", [0, 0, 0])
    rmat = (Matrix.Rotation(math.radians(rot[2]), 4, 'Z')
            @ Matrix.Rotation(math.radians(rot[1]), 4, 'Y')
            @ Matrix.Rotation(math.radians(rot[0]), 4, 'X'))
    xform(objs, lambda p, c=c, sc=sc, r=rmat: r @ Vector(((p.x - c.x) * sc[0],
                                                           (p.y - c.y) * sc[1],
                                                           (p.z - c.z) * sc[2])))
    mn, mx = bounds(objs)
    log("  graft %-9s cut %5d/%5d faces -> %.2f x %.2f x %.2f"
        % (gname, kept, total, mx.x - mn.x, mx.y - mn.y, mx.z - mn.z))
    at = list(g["at"])
    out = []
    mir = g.get("mirror_axis", "y")
    li = "xyz".index(mir)
    for sgn in ([1, -1] if (g.get("mirror_y") or g.get("mirror")) else [1]):
        clone = clone_objs(objs)
        if sgn < 0:
            def flip(p, li=li):
                q = Vector(p)
                q[li] = -q[li]
                return q
            xform(clone, flip)
            recalc_normals(clone)
        cmn, cmx = bounds(clone)
        goal = [at[0], at[1], at[2]]
        goal[li] = at[li] * sgn
        t = Vector((goal[0] - (cmn.x + cmx.x) / 2, goal[1] - (cmn.y + cmx.y) / 2, 0.0))
        if goal[2] is None:
            z = deck_z(host, goal[0], goal[1])
            if z is None:
                raise SystemExit("graft %s: no deck under (%.2f, %.2f)" % (gname, goal[0], goal[1]))
            t.z = z - cmn.z - g.get("sink", 0.05)
        else:
            t.z = goal[2] - (cmn.z + cmx.z) / 2
        xform(clone, lambda p, t=t: p + t)
        out.append((clone, g.get("role", "hull"), "g%d_%s_%+d" % (idx, gname, sgn), stem))
    for o in objs:
        bpy.data.objects.remove(o, do_unlink=True)
    return out


def build(spec):
    name = spec["name"]
    out_blend = os.path.join(PROJ, spec.get("out_dir", "03_blender"), name + ".blend")
    frames = os.path.join(PROJ, spec.get("photo_dir", "02_progress_photos"), name)
    os.makedirs(os.path.dirname(out_blend), exist_ok=True)
    os.makedirs(frames, exist_ok=True)

    bs.reset_scene()

    h_rel, h_stem = donor(spec["host"])
    log("host", spec["host"])
    host = import_and_flatten(h_rel, "host")
    bpy.context.view_layer.update()

    if spec.get("host_cut"):
        kept, total = cut_box(host, spec["host_cut"])
        log("  host_cut kept %d/%d faces" % (kept, total))
    for b in spec.get("host_remove", []):
        n = remove_box(host, b)
        log("  host_remove %s removed %d faces" % (b, n))
    for sq in spec.get("host_squash", []):
        n = squash(host, sq)
        log("  host_squash %s moved %d verts" % (sq, n))
    for sr in spec.get("host_scale", []):
        n = scale_region(host, sr)
        log("  host_scale %s moved %d verts" % (sr["scale"], n))

    mn, mx = bounds(host)
    c = (mn + mx) / 2
    if spec.get("host_center"):
        # pin the host centre (graft positions are host-centred; removing big parts would otherwise shift the origin)
        c = Vector(spec["host_center"])
    host_c = c.copy()
    xform(host, lambda p, c=c: p - c)
    mn, mx = bounds(host)
    half = (mx - mn) / 2
    log("  host dims %.3f x %.3f x %.3f" % (mx.x - mn.x, mx.y - mn.y, mx.z - mn.z))

    objects = list(host)
    hm = make_material("Mat_host", texture_paths(h_stem), spec.get("host_role", "hull"))
    apply_material(host, hm)
    assign_bands(host, spec.get("host_bands", []))

    for i, piece in enumerate(spec.get("pieces", [])):
        for objs, role, tag, stem in make_piece(piece, half, i):
            mat = make_mat("Mat_" + tag, texture_paths(stem), role, piece.get("tint"))
            apply_material(objs, mat)
            objects.extend(objs)

    for i, g in enumerate(spec.get("grafts", [])):
        for objs, role, tag, stem in make_graft(g, objects, i):
            mat = make_mat("Mat_" + tag, texture_paths(stem), role, g.get("tint"))
            apply_material(objs, mat)
            objects.extend(objs)

    bpy.context.view_layer.update()

    # Wire MetallicGlossAO the way the game reads it (R metal, G gloss, B AO)
    # instead of dumping the packed map into Specular, which is what makes an
    # unwired preview look washed out. Runs after every material exists and
    # before centring, so the nodes never see transformed geometry.
    pw.soften_world()
    pw.ROUGH_FLOOR = 0.35          # polished metal in the previews
    for mat in bpy.data.materials:
        if mat.name.startswith("Mat_") and mat.use_nodes:
            pw.gamelike(mat)

    if spec.get("global_scale"):
        gs = float(spec["global_scale"])
        xform(objects, lambda p, gs=gs: p * gs)
    mn, mx = bounds(objects)
    c = (mn + mx) / 2
    xform(objects, lambda p, c=c: p - c)
    # final = donor-baked world - (host_c + c): export needs this to restore the vanilla frame
    bpy.context.scene["frigate_offset"] = [host_c.x + c.x, host_c.y + c.y, host_c.z + c.z]
    log("offset (final = original - offset)", [round(v, 4) for v in bpy.context.scene["frigate_offset"]])
    mn, mx = bounds(objects)
    dims = mx - mn
    for o in objects:
        o.data.calc_loop_triangles()
    tris = sum(len(o.data.loop_triangles) for o in objects)
    log("FINAL dims %.3f x %.3f x %.3f  tris=%d  objects=%d"
        % (dims.x, dims.y, dims.z, tris, len(objects)))

    bs.setup_render(spec.get("res", 900), spec.get("res", 900))
    bs.setup_world(strength=pw.WORLD_STRENGTH, color=(0.62, 0.62, 0.64))
    bs.setup_lights()
    size = max(dims.x, dims.y, dims.z)
    cam = bs.setup_camera(target=Vector((0, 0, 0)),
                          ortho_scale=size * spec.get("margin", 1.28),
                          distance=size * 2.6)
    # Renegade is long on X, nose -X: "side" looks along Y, "nose" along +X.
    views = spec.get("views") or {
        "side": (0.0, -1.0, 0.06),
        "nose": (-1.0, 0.0, 0.06),
        "top": (-0.001, 0.0, 1.0),
        "tq": (-0.78, -0.78, 0.34),
        "tail": (1.0, 0.0, 0.10),
    }
    for vname, d in views.items():
        dv = Vector(d).normalized()
        cam.location = dv * size * 2.6
        cam.rotation_euler = (Vector((0, 0, 0)) - cam.location).to_track_quat("-Z", "Y").to_euler()
        bs.render_to(os.path.join(frames, "%s_%s.png" % (name, vname)), cam)

    if not spec.get("no_save"):
        bpy.ops.wm.save_as_mainfile(filepath=out_blend)
        log("SAVED", out_blend)


def main():
    spec_path = sys.argv[sys.argv.index("--") + 1]
    with open(spec_path) as fh:
        spec = json.load(fh)
    only = spec.get("only")
    for v in spec["variants"]:
        if only and v["name"] not in only:
            continue
        log("=" * 62)
        log("BUILDING", v["name"])
        build(v)


if __name__ == "__main__":
    main()
