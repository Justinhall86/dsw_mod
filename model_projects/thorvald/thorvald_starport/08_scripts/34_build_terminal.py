"""Build one native-scale Consignment Terminal variant from a declarative spec (2026-11-26 appearance pass).

    python 34_build_terminal.py specs/<V>.json [--no-render]      (or blender -b --python 34_build_terminal.py -- <spec>)

Spec (JSON):
  name      "V1_bonded_hall"
  note      one line for the sheets
  donors    village buildings the pieces come from (30_village_convert.py names)
  drop_sheets  texture sheets whose faces are removed (default: ground decals). At most four sheets may remain:
            each gets one 512 quadrant of the 1024 atlas, the vanilla density.
  strength  gunmetal darkening for 33_thorvald_paint.py (default 1; 1.6 = charcoal)
  copper    copper anchor RGB (default 33_thorvald_paint.COPPER)
  sheet_paint  per-sheet paint options, e.g. {"SpacingGuildBranch": {"gold_to": "gunmetal"}}
  pieces    list of {donor, keep: [[x0,y0,z0],[x1,y1,z1]] (optional), remove: [box, ...] (optional),
                     scale (default 1: keep vanilla texel density), rotz (deg), at: [x, y, z], mirror_x (bool)}
            Boxes are in the donor's own grid coordinates (32_donor_grid.py sheets: native size, XY centred, base z 0).
            Whole loose islands are kept or dropped by their centre, so nothing is cut open.
Result: ../03_blender/terminal_native/<name>.blend (object Thorvald_Starport, one material, atlas packed, custom props
footprint=0 and lift_ao=0 for 10_export_building.py), atlas in ../04_textures/terminal_native/<name>/,
renders in ../02_progress_photos/22_native_variants/<name>_{rts,close,back}.png.
"""
import json
import math
import os
import sys

import bpy  # noqa: I001  (bpy first: the bpy wheel provides bmesh only after it loads)
import bmesh
from mathutils import Matrix, Vector

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import importlib.util  # noqa: E402

import terminal_scene as T  # noqa: E402

_spec = importlib.util.spec_from_file_location("paint", os.path.join(T.HERE, "33_thorvald_paint.py"))
PAINT = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(PAINT)

BLEND_DIR = os.path.join(T.PROJ, "03_blender", "terminal_native")
SHOTS = os.path.join(T.PROJ, "02_progress_photos", "22_native_variants")


def inside(p, box):
    lo, hi = box
    return all(lo[k] <= p[k] <= hi[k] for k in range(3))


def islands(me):
    """Face index lists of each loose part, joined by vertex POSITION (HMD meshes are split at UV seams)."""
    key = {}
    parent = list(range(len(me.vertices)))

    def find(i):
        while parent[i] != i:
            parent[i] = parent[parent[i]]
            i = parent[i]
        return i
    for v in me.vertices:
        k = tuple(round(c, 4) for c in v.co)
        if k in key:
            parent[find(v.index)] = find(key[k])
        else:
            key[k] = v.index
    for p in me.polygons:
        vs = list(p.vertices)
        for a in vs[1:]:
            ra, rb = find(a), find(vs[0])
            if ra != rb:
                parent[ra] = rb
    groups = {}
    for p in me.polygons:
        groups.setdefault(find(p.vertices[0]), []).append(p.index)
    return list(groups.values())


def build(spec):
    T.reset()
    donors = spec["donors"]
    drop_sheets = spec.get("drop_sheets", ["SupplyDepot_Ground", "MilitaryBase_Ground", "Concrete_Construction"])
    src = {}
    for d in donors:
        ob = T.village(d, "corrino")
        bpy.ops.object.select_all(action="DESELECT")
        ob.select_set(True)
        bpy.context.view_layer.objects.active = ob
        bpy.ops.object.transform_apply(location=True, rotation=True, scale=True)
        ob.hide_render = True
        src[d] = ob
    parts = []
    for n, pc in enumerate(spec["pieces"]):
        so = src[pc["donor"]]
        ob = so.copy()
        ob.data = so.data.copy()
        ob.hide_render = False
        bpy.context.scene.collection.objects.link(ob)
        me = ob.data
        drop = []
        kept = 0
        for faces in islands(me):
            c = Vector()
            for f in faces:
                c += me.polygons[f].center
            c /= len(faces)
            keep = ("keep" not in pc or inside(c, pc["keep"])) and not any(inside(c, b) for b in pc.get("remove", []))
            if keep:
                kept += 1
                drop += [f for f in faces if T.sheet_of(me.materials[me.polygons[f].material_index]) in drop_sheets]
            else:
                drop += faces
        bm = bmesh.new()
        bm.from_mesh(me)
        bm.faces.ensure_lookup_table()
        bmesh.ops.delete(bm, geom=[bm.faces[i] for i in drop], context="FACES")
        loose = [v for v in bm.verts if not v.link_faces]
        bmesh.ops.delete(bm, geom=loose, context="VERTS")
        bm.to_mesh(me)
        bm.free()
        s = pc.get("scale", 1.0)
        s = s if isinstance(s, list) else [s, s, s]
        M = (Matrix.Translation(Vector(pc.get("at", (0, 0, 0)))) @ Matrix.Rotation(math.radians(pc.get("rotz", 0)), 4, "Z")
             @ Matrix.Diagonal((s[0] * (-1 if pc.get("mirror_x") else 1), s[1], s[2], 1)))
        me.transform(M)
        if pc.get("mirror_x"):
            me.flip_normals()
        print("PIECE", n, pc["donor"], "islands kept", kept, "faces", len(me.polygons))
        parts.append(ob)
    for d in src.values():
        bpy.data.objects.remove(d)
    # sheets in use -> atlas quadrants (most faces first)
    count = {}
    for o in parts:
        for p in o.data.polygons:
            sh = T.sheet_of(o.data.materials[p.material_index])
            count[sh] = count.get(sh, 0) + 1
    sheets = sorted(count, key=lambda k: -count[k])
    print("SHEETS", count)
    if len(sheets) > 4:
        raise SystemExit("more than four texture sheets %s: add some to drop_sheets or remove their parts" % sheets)
    for o in parts:
        uv = o.data.uv_layers.active.data
        bad = 0
        for p in o.data.polygons:
            cx, cy = PAINT.QUADS[sheets.index(T.sheet_of(o.data.materials[p.material_index]))]
            for li in p.loop_indices:
                u, v = uv[li].uv
                bad += not (-0.01 <= u <= 1.01 and -0.01 <= v <= 1.01)
                uv[li].uv = (min(max(u, 0.004), 0.996) * 0.5 + cx * 0.5, min(max(v, 0.004), 0.996) * 0.5 + cy * 0.5)
        if bad:
            print("UV_OUT", o.name, bad, "loops clamped")
    tex = PAINT.atlas(sheets, os.path.join(T.PROJ, "04_textures", "terminal_native", spec["name"]), "",
                      spec.get("strength", 1.0), spec.get("copper"), spec.get("sheet_paint"))
    bpy.ops.object.select_all(action="DESELECT")
    for o in parts:
        o.select_set(True)
    bpy.context.view_layer.objects.active = parts[0]
    bpy.ops.object.join()
    ob = bpy.context.view_layer.objects.active
    ob.name = "Thorvald_Starport"
    ob["footprint"] = 0.0
    ob["lift_ao"] = 0
    ob["spec"] = json.dumps(spec)
    # material: the converter wiring (10_export_building.py rewires again anyway) + image names it looks up
    m = bpy.data.materials.new("Mat_Terminal")
    m.use_nodes = True
    nt = m.node_tree
    b = nt.nodes["Principled BSDF"]
    b.inputs["Roughness"].default_value = 0.85
    imgs = {}
    for key in ("Albedo", "MetallicGlossAO", "Normal"):
        im = bpy.data.images.load(tex[key])
        im.name = "Thorvald_Starport_" + key
        if key != "Albedo":
            im.colorspace_settings.name = "Non-Color"
        n = nt.nodes.new("ShaderNodeTexImage")
        n.image = im
        imgs[key] = n
    nt.links.new(imgs["Albedo"].outputs["Color"], b.inputs["Base Color"])
    nm = nt.nodes.new("ShaderNodeNormalMap")
    nt.links.new(imgs["Normal"].outputs["Color"], nm.inputs["Color"])
    nt.links.new(nm.outputs["Normal"], b.inputs["Normal"])
    ob.data.materials.clear()
    ob.data.materials.append(m)
    T.ground(ob)
    bpy.ops.object.select_all(action="DESELECT")
    ob.select_set(True)
    bpy.context.view_layer.objects.active = ob
    bpy.ops.object.transform_apply(location=True, rotation=True, scale=True)
    lo, hi = T.bounds([ob])
    print("SIZE", spec["name"], [round(x, 2) for x in hi - lo], "faces", len(ob.data.polygons))
    os.makedirs(BLEND_DIR, exist_ok=True)
    path = os.path.join(BLEND_DIR, spec["name"] + ".blend")
    for im in list(bpy.data.images):                   # the donors' FBX image references point nowhere: drop them
        if not im.name.startswith("Thorvald_Starport_"):
            bpy.data.images.remove(im)
    for m in list(bpy.data.materials):
        if m.users == 0:
            bpy.data.materials.remove(m)
    bpy.ops.file.pack_all()
    bpy.ops.wm.save_as_mainfile(filepath=path)
    return ob, tex, path


def render_views(ob, tex, name):
    """Matte game look (AO multiplied in) for the preview only; the saved blend keeps the export wiring."""
    T.world()
    ob.data.materials[0] = T.matte_material("preview", tex["Albedo"], tex["MetallicGlossAO"])
    lo, hi = T.bounds([ob])
    c = (lo + hi) / 2
    out = []
    for tag, d, ortho, res in (("rts", T.CAM_DIR, 7.5, 420), ("close", T.CAM_DIR, max(hi - lo) * 1.5, 900),
                               ("back", Vector((0.62, 0.62, 0.95)), max(hi - lo) * 1.5, 900)):
        T.camera((c.x, c.y, hi.z * 0.35), ortho, d)
        out.append(T.render(os.path.join(SHOTS, "%s_%s.png" % (name, tag)), res, samples=24))
    return out


if __name__ == "__main__":
    a = T.args()
    spec = json.load(open(a[0]))
    ob, tex, path = build(spec)
    print("BLEND", path)
    if "--no-render" not in a:
        for p in render_views(ob, tex, spec["name"]):
            print("SHOT", p)
