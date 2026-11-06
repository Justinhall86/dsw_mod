"""Render one asset in Blender: import its FBX parts, optionally delete islands, texture it, render stills, save a .blend.

    blender -b --factory-startup --python render_asset.py -- <config.json>

Config keys (paths absolute):
    fbx          list of real FBX files; all share one material (they share one texture atlas)
    name         used for the material name
    albedo, mgao, normal, emissive   texture PNGs or null
    front        "-Y" (default), "+Y", "+X", "-X": the side the asset faces
    delete       list of rules, applied before texturing:
                   {"obj": "<substring>", "islands": [ids]}       islands numbered by vertex count, largest first
                   {"obj": "<substring>", "bones": [names]}       islands mainly skinned to these bones
                   {"obj": "<substring>", "box": [[x0,y0,z0],[x1,y1,z1]], "inside": "all"|"centroid"}
                 an island is deleted whole, so nothing that stays is cut open
    stills       {"front": png, "back": png, "three_quarter": png, "x_pos": png, "x_neg": png, "top": png}
    still_px     default 900
    zoom         >1 frames tighter (buildings, whose bounds include flat ground clutter)
    blend        .blend to save (optional); textures are packed
Prints DELETED <obj> <n islands> <n verts> for every rule and KEPT_OPEN_EDGES before/after as the no-hole check.
"""
import json
import math
import os
import sys

import bmesh
import bpy
from mathutils import Vector

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__))))
import preview_wiring as PW  # noqa: E402

cfg = json.load(open(sys.argv[sys.argv.index("--") + 1], encoding="utf-8"))
JUNK = ("Cube", "Camera", "Light", "Lamp")
FRONT_AZ = {"-Y": -90.0, "+Y": 90.0, "+X": 0.0, "-X": 180.0}

bpy.ops.wm.read_factory_settings(use_empty=True)
for p in cfg["fbx"]:
    bpy.ops.import_scene.fbx(filepath=p)
for o in list(bpy.data.objects):
    if o.name.split(".")[0] in JUNK or o.type in ("CAMERA", "LIGHT"):
        bpy.data.objects.remove(o, do_unlink=True)
meshes = [o for o in bpy.data.objects if o.type == "MESH"]
bpy.context.view_layer.update()


def islands(bm):
    bm.verts.ensure_lookup_table()
    seen, out = set(), []
    for v0 in bm.verts:
        if v0.index in seen:
            continue
        st, mem = [v0], []
        seen.add(v0.index)
        while st:
            v = st.pop()
            mem.append(v)
            for e in v.link_edges:
                w = e.other_vert(v)
                if w.index not in seen:
                    seen.add(w.index)
                    st.append(w)
        out.append(mem)
    out.sort(key=len, reverse=True)
    return out


def world_pts(m):
    """Posed (armature-deformed) world positions, index-aligned with m.data.vertices: what the render shows."""
    dg = bpy.context.evaluated_depsgraph_get()
    ev = m.evaluated_get(dg)
    me = ev.to_mesh()
    pts = [ev.matrix_world @ v.co for v in me.vertices]
    ev.to_mesh_clear()
    return pts


def open_edges(bm):
    return sum(1 for e in bm.edges if e.is_boundary)


for rule in cfg.get("delete", []):
    for m in [o for o in meshes if rule["obj"] in o.name]:
        bm = bmesh.new()
        bm.from_mesh(m.data)
        isl = islands(bm)
        WP = world_pts(m)
        doomed = []
        if "islands" in rule:
            doomed = [isl[i] for i in rule["islands"] if i < len(isl)]
        elif "bones" in rule:              # islands whose strongest skin weight is on one of these bones
            names = {g.index: g.name for g in m.vertex_groups}
            for mem in isl:
                w = {}
                for v in mem:
                    for g in m.data.vertices[v.index].groups:
                        w[names[g.group]] = w.get(names[g.group], 0.0) + g.weight
                if w and max(w, key=w.get) in rule["bones"]:
                    doomed.append(mem)
        else:
            lo, hi = Vector(rule["box"][0]), Vector(rule["box"][1])
            inside = lambda p: all(lo[k] <= p[k] <= hi[k] for k in range(3))  # noqa: E731
            for mem in isl:
                pts = [WP[v.index] for v in mem]
                if rule.get("inside", "all") == "centroid":
                    ok = inside(sum(pts, Vector()) / len(pts))
                else:
                    ok = all(inside(p) for p in pts)
                if ok:
                    doomed.append(mem)
        before = open_edges(bm)
        doomed_open = sum(1 for mem in doomed for e in {e for v in mem for e in v.link_edges} if e.is_boundary)
        nv = sum(len(mem) for mem in doomed)
        bmesh.ops.delete(bm, geom=[v for mem in doomed for v in mem], context="VERTS")
        after = open_edges(bm)
        bm.to_mesh(m.data)
        bm.free()
        m.data.update()
        print("DELETED", m.name, len(doomed), "islands", nv, "verts")
        # whole islands only: the open edges left must equal the open edges before minus those of the removed islands
        print("KEPT_OPEN_EDGES before", before - doomed_open, "after", after, "OK" if after == before - doomed_open else "MISMATCH")


def tex(nt, path, loc, cs):
    nd = nt.nodes.new("ShaderNodeTexImage")
    img = bpy.data.images.load(path, check_existing=False)
    img.colorspace_settings.name = cs
    nd.image = img
    nd.location = loc
    return nd


mat = bpy.data.materials.new("Mat_" + cfg["name"])
mat.use_nodes = True
nt = mat.node_tree
for n in list(nt.nodes):
    nt.nodes.remove(n)
bsdf = nt.nodes.new("ShaderNodeBsdfPrincipled")
out = nt.nodes.new("ShaderNodeOutputMaterial")
out.location = (300, 0)
nt.links.new(bsdf.outputs["BSDF"], out.inputs["Surface"])
if cfg.get("albedo"):
    nt.links.new(tex(nt, cfg["albedo"], (-700, 300), "sRGB").outputs["Color"], bsdf.inputs["Base Color"])
if cfg.get("mgao"):
    nt.links.new(tex(nt, cfg["mgao"], (-700, 0), "Non-Color").outputs["Color"], bsdf.inputs["Specular IOR Level"])
if cfg.get("normal"):
    nm = nt.nodes.new("ShaderNodeNormalMap")
    nm.location = (-400, -300)
    nt.links.new(tex(nt, cfg["normal"], (-700, -300), "Non-Color").outputs["Color"], nm.inputs["Color"])
    nt.links.new(nm.outputs["Normal"], bsdf.inputs["Normal"])
if cfg.get("emissive"):
    nt.links.new(tex(nt, cfg["emissive"], (-700, -600), "sRGB").outputs["Color"], bsdf.inputs["Emission Color"])
    bsdf.inputs["Emission Strength"].default_value = 1.0
PW.gamelike(mat)
for m in meshes:
    m.data.materials.clear()
    m.data.materials.append(mat)

bpy.context.view_layer.update()
lo = Vector((1e9,) * 3)
hi = Vector((-1e9,) * 3)
for m in meshes:
    for p in world_pts(m):
        for i in range(3):
            lo[i] = min(lo[i], p[i])
            hi[i] = max(hi[i], p[i])
centre = (lo + hi) / 2
dx, dy, dz = hi - lo
ortho = 1.08 * max(math.hypot(dx, dy), 1.6 * dz, 0.2) / cfg.get("zoom", 1.0)
print("BOUNDS", [round(c, 3) for c in lo], [round(c, 3) for c in hi])

world = bpy.data.worlds.new("World")
world.use_nodes = True
bpy.context.scene.world = world
PW.soften_world()
sun = bpy.data.objects.new("Sun", bpy.data.lights.new("Sun", type="SUN"))
sun.data.energy = 3.0
sun.data.angle = math.radians(3)
sun.rotation_euler = (math.radians(55), 0.0, math.radians(35))
bpy.context.scene.collection.objects.link(sun)
cam = bpy.data.objects.new("Cam", bpy.data.cameras.new("Cam"))
cam.data.type = "ORTHO"
cam.data.ortho_scale = ortho
cam.data.clip_end = 10000.0
bpy.context.scene.collection.objects.link(cam)
bpy.context.scene.camera = cam

sc = bpy.context.scene
sc.render.engine = "BLENDER_EEVEE"
sc.render.resolution_x = sc.render.resolution_y = cfg.get("still_px", 900)
sc.view_settings.view_transform = "Standard"
sc.render.image_settings.file_format = "PNG"

faz = FRONT_AZ[cfg.get("front", "-Y")]
AZ = {"front": (faz, 0.12), "back": (faz + 180, 0.12), "three_quarter": (faz + 45, 0.45),
      "x_pos": (0, 0.12), "x_neg": (180, 0.12), "y_pos": (90, 0.3), "y_neg": (-90, 0.3), "top": (faz + 30, 2.5)}
for view, path in cfg.get("stills", {}).items():
    az, el = AZ[view]
    a = math.radians(az)
    d = Vector((math.cos(a), math.sin(a), el)).normalized()
    cam.location = centre + d * ortho * 3
    cam.rotation_euler = (centre - cam.location).to_track_quat("-Z", "Y").to_euler()
    os.makedirs(os.path.dirname(path), exist_ok=True)
    sc.render.filepath = path
    bpy.ops.render.render(write_still=True)
    print("RENDERED", view, path)

if cfg.get("blend"):
    os.makedirs(os.path.dirname(cfg["blend"]), exist_ok=True)
    for img in list(bpy.data.images):    # FBX import adds the game's own texture paths, which do not exist here
        if img.source == "FILE" and not os.path.exists(bpy.path.abspath(img.filepath)):
            bpy.data.images.remove(img)
    bpy.ops.file.pack_all()
    bpy.ops.wm.save_as_mainfile(filepath=cfg["blend"])
    print("SAVED", cfg["blend"])
print("DONE", cfg["name"])
