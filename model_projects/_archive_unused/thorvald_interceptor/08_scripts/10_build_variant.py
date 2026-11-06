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


def cut_box(objs, b):
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
            c = f.calc_center_median()
            if x0 <= c.x <= x1 and y0 <= c.y <= y1 and z0 <= c.z <= z1:
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


def cut_disc(objs, d):
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
            c = f.calc_center_median()
            dx, dy = c.x - cx, c.y - cy
            if dx * dx + dy * dy <= r2 and z0 <= c.z <= z1:
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
    p_rel, p_stem = DONORS[pname]

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

    rot = piece.get("rot_deg", [0, 0, 0])
    rmat = (Matrix.Rotation(math.radians(rot[2]), 4, 'Z')
            @ Matrix.Rotation(math.radians(rot[1]), 4, 'Y')
            @ Matrix.Rotation(math.radians(rot[0]), 4, 'X'))
    xform(objs, lambda p, r=rmat: r @ p)

    mn, mx = bounds(objs)
    csize = max(mx.x - mn.x, mx.y - mn.y, mx.z - mn.z, 1e-6)

    fx, fy, fz = piece["mount"]
    mirror = piece.get("mirror")
    signs = [(1, 1)]
    if mirror == "x":
        signs = [(1, 1), (-1, 1)]
    elif mirror == "y":
        signs = [(1, 1), (1, -1)]
    elif mirror == "xy":
        signs = [(1, 1), (-1, 1), (1, -1), (-1, -1)]

    out = []
    for sx, sy in signs:
        clone = clone_objs(objs)
        if sx < 0 or sy < 0:
            m = Matrix.Diagonal((sx, sy, 1.0, 1.0))
            xform(clone, lambda p, m=m: m @ p)
            recalc_normals(clone)

        seat = piece.get("seat")
        if seat:
            # Seat the chunk ON the host surface exactly: place its inner face
            # `overlap` units inside the host half-extent on the seating axis.
            # A fraction-of-half-extent mount cannot do this reliably - it
            # depends on the piece's own size, so the same mount number buried
            # a long piece and left a short one floating.
            axis = seat.get("axis", "x")
            overlap = float(seat.get("overlap", 0.35))
            ai = "xyz".index(axis)
            pmin = min(v.co[ai] for o in clone for v in o.data.vertices)
            pmax = max(v.co[ai] for o in clone for v in o.data.vertices)
            limit = host_half[ai]
            sign = -1.0 if sx < 0 else 1.0
            # inner face sits `overlap` INSIDE the hull, everything else sticks
            # out: that interpenetration is what makes the join read as one
            # built object instead of a drum resting against a wall.
            inner = limit - overlap
            shift = (sign * inner) - (pmin if sign > 0 else pmax)
            fx, fy, fz = piece["mount"]
            target = Vector((0.0, fy * host_half.y * sy, fz * host_half.z))
            if axis == "x":
                target.x = shift          # `shift` is already signed
            elif axis == "y":
                target.y += shift
            else:
                target.z += shift
        else:
            fx, fy, fz = piece["mount"]
            target = Vector((fx * host_half.x * sx, fy * host_half.y * sy, fz * host_half.z))
            embed = piece.get("embed", 0.25) * csize
            if target.length > 1e-9:
                target = target - target.normalized() * embed

        xform(clone, lambda p, t=target: p + t)
        out.append((clone, piece.get("role", "copper"), "%s_%d%d" % (pname, sx, sy), p_stem))

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

    h_rel, h_stem = DONORS[spec["host"]]
    log("host", spec["host"])
    host = import_and_flatten(h_rel, "host")
    bpy.context.view_layer.update()

    if spec.get("host_cut"):
        kept, total = cut_box(host, spec["host_cut"])
        log("  host_cut kept %d/%d faces" % (kept, total))

    mn, mx = bounds(host)
    c = (mn + mx) / 2
    xform(host, lambda p, c=c: p - c)
    mn, mx = bounds(host)
    half = (mx - mn) / 2
    log("  host dims %.3f x %.3f x %.3f" % (mx.x - mn.x, mx.y - mn.y, mx.z - mn.z))

    objects = list(host)
    hm = make_material("Mat_host", texture_paths(h_stem), spec.get("host_role", "hull"))
    apply_material(host, hm)

    for i, piece in enumerate(spec.get("pieces", [])):
        for objs, role, tag, stem in make_piece(piece, half, i):
            mat = make_material("Mat_" + tag, texture_paths(stem), role, piece.get("tint"))
            apply_material(objs, mat)
            objects.extend(objs)

    bpy.context.view_layer.update()

    # Wire MetallicGlossAO the way the game reads it (R metal, G gloss, B AO)
    # instead of dumping the packed map into Specular, which is what makes an
    # unwired preview look washed out. Runs after every material exists and
    # before centring, so the nodes never see transformed geometry.
    pw.soften_world()
    for mat in bpy.data.materials:
        if mat.name.startswith("Mat_") and mat.use_nodes:
            pw.gamelike(mat)

    mn, mx = bounds(objects)
    c = (mn + mx) / 2
    xform(objects, lambda p, c=c: p - c)
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
    views = {
        "front": (0.0, -1.0, 0.06),
        "side": (1.0, 0.0, 0.06),
        "top": (0.0, -0.001, 1.0),
        "tq": (0.78, -0.78, 0.34),
        "back": (0.0, 1.0, 0.10),
    }
    for vname, d in views.items():
        dv = Vector(d).normalized()
        cam.location = dv * size * 2.6
        cam.rotation_euler = (Vector((0, 0, 0)) - cam.location).to_track_quat("-Z", "Y").to_euler()
        bs.render_to(os.path.join(frames, "%s_%s.png" % (name, vname)), cam)

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


main()
