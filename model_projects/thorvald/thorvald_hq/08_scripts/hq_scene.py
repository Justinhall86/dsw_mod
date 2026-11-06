"""Blender-side helpers shared by the HQ scripts: import a donor FBX with its textures, place it, light and render.

Imported by the Blender scripts in this folder (run inside Blender). Lighting and materials follow the
dsw-vehicle-preview renderer (matte, game-like), so the HQ previews match the unit and building previews.
"""
import math
import os
import sys

import bpy
from mathutils import Vector

REPO = os.path.abspath(os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "..", "..", ".."))
sys.path.insert(0, os.path.join(REPO, ".claude", "skills", "dsw-vehicle-preview", "scripts"))
import preview_wiring as PW  # noqa: E402

JUNK = ("Cube", "Camera", "Light", "Lamp")


def reset():
    bpy.ops.wm.read_factory_settings(use_empty=True)


def material(name, albedo=None, normal=None, mgao=None, emissive=None, flat=(0.4, 0.4, 0.38)):
    mat = bpy.data.materials.new("Mat_" + name)
    mat.use_nodes = True
    nt = mat.node_tree
    for n in list(nt.nodes):
        nt.nodes.remove(n)
    bsdf = nt.nodes.new("ShaderNodeBsdfPrincipled")
    out = nt.nodes.new("ShaderNodeOutputMaterial")
    nt.links.new(bsdf.outputs["BSDF"], out.inputs["Surface"])

    def tex(path, cs):
        nd = nt.nodes.new("ShaderNodeTexImage")
        nd.image = bpy.data.images.load(path, check_existing=True)
        nd.image.colorspace_settings.name = cs
        return nd
    if albedo:
        nt.links.new(tex(albedo, "sRGB").outputs["Color"], bsdf.inputs["Base Color"])
    else:
        bsdf.inputs["Base Color"].default_value = tuple(flat) + (1.0,)
    if mgao:
        nt.links.new(tex(mgao, "Non-Color").outputs["Color"], bsdf.inputs["Specular IOR Level"])
    if normal:
        nm = nt.nodes.new("ShaderNodeNormalMap")
        nt.links.new(tex(normal, "Non-Color").outputs["Color"], nm.inputs["Color"])
        nt.links.new(nm.outputs["Normal"], bsdf.inputs["Normal"])
    if emissive:
        nt.links.new(tex(emissive, "sRGB").outputs["Color"], bsdf.inputs["Emission Color"])
        bsdf.inputs["Emission Strength"].default_value = 1.0
    PW.gamelike(mat)
    return mat


def load(fbx, mat=None, loc=(0, 0, 0), rot_z=0.0, scale=1.0, name=None):
    """Import fbx, give its meshes mat, wrap everything under one empty at loc / rot_z (deg) / scale."""
    before = set(bpy.data.objects)
    bpy.ops.import_scene.fbx(filepath=fbx)
    new = [o for o in bpy.data.objects if o not in before]
    for o in list(new):
        if o.name.split(".")[0] in JUNK or o.type in ("CAMERA", "LIGHT"):
            new.remove(o)
            bpy.data.objects.remove(o, do_unlink=True)
    root = bpy.data.objects.new(name or os.path.splitext(os.path.basename(fbx))[0], None)
    bpy.context.scene.collection.objects.link(root)
    for o in new:
        if o.parent is None:
            o.parent = root
        if o.type == "MESH" and isinstance(mat, dict):     # per slot: {material-name prefix: material}
            for i, m in enumerate(o.data.materials):
                hit = next((v for k, v in mat.items() if m and m.name.startswith(k)), mat.get("*"))
                if hit:
                    o.data.materials[i] = hit
        elif o.type == "MESH" and mat:
            o.data.materials.clear()
            o.data.materials.append(mat)
    root.location = loc
    root.rotation_euler = (0, 0, math.radians(rot_z))
    root.scale = (scale, scale, scale)
    bpy.context.view_layer.update()
    return root, [o for o in new if o.type == "MESH"]


def bounds(meshes):
    lo = Vector((1e9, 1e9, 1e9))
    hi = Vector((-1e9, -1e9, -1e9))
    for m in meshes:
        dg = bpy.context.evaluated_depsgraph_get()
        ev = m.evaluated_get(dg)
        for v in ev.data.vertices:
            w = m.matrix_world @ v.co
            for i in range(3):
                lo[i] = min(lo[i], w[i])
                hi[i] = max(hi[i], w[i])
    return lo, hi


def lights_and_camera(centre, ortho, ground=True, ground_rgb=(0.55, 0.30, 0.18)):
    world = bpy.data.worlds.new("World")
    world.use_nodes = True
    bpy.context.scene.world = world
    PW.soften_world()
    sun = bpy.data.objects.new("Sun", bpy.data.lights.new("Sun", type="SUN"))
    sun.data.energy = 3.0
    sun.data.angle = math.radians(3)
    sun.rotation_euler = (math.radians(50), 0.0, math.radians(35))
    bpy.context.scene.collection.objects.link(sun)
    if ground:   # desert-coloured ground so the base reads as it will on the map
        bpy.ops.mesh.primitive_plane_add(size=ortho * 6, location=(centre.x, centre.y, -0.05))
        g = bpy.context.active_object
        g.name = "Ground"
        gm = bpy.data.materials.new("Ground")
        gm.use_nodes = True
        b = gm.node_tree.nodes["Principled BSDF"]
        b.inputs["Base Color"].default_value = tuple(ground_rgb) + (1.0,)
        b.inputs["Roughness"].default_value = 1.0
        g.data.materials.append(gm)
    cam = bpy.data.objects.new("Cam", bpy.data.cameras.new("Cam"))
    cam.data.type = "ORTHO"
    cam.data.ortho_scale = ortho
    cam.data.clip_end = 5000.0
    bpy.context.scene.collection.objects.link(cam)
    bpy.context.scene.camera = cam
    sc = bpy.context.scene
    sc.render.engine = "BLENDER_EEVEE"
    sc.view_settings.view_transform = "Standard"
    sc.render.image_settings.file_format = "PNG"
    return cam


def shoot(cam, centre, az_deg, elev_deg, path, px=(1200, 900), dist=400.0):
    a, e = math.radians(az_deg), math.radians(elev_deg)
    v = Vector((math.cos(a) * math.cos(e), math.sin(a) * math.cos(e), math.sin(e)))
    cam.location = centre + v * dist
    cam.rotation_euler = (centre - cam.location).to_track_quat("-Z", "Y").to_euler()
    sc = bpy.context.scene
    sc.render.resolution_x, sc.render.resolution_y = px
    sc.render.resolution_percentage = 100
    sc.render.filepath = os.path.abspath(path)
    bpy.ops.render.render(write_still=True)
    print("RENDERED", path)
