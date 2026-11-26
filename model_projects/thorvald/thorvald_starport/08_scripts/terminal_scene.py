"""Shared bpy helpers for the 2026-11-26 Terminal appearance pass (scripts 31-36).

Game-like matte look: warm high sun + sky fill, sand ground, Standard view transform, roughness 0.85, AO from the
MetallicGlossAO blue channel multiplied in lightly (vanilla AO is bright, so this only darkens creases).
Works inside Blender (`blender -b --python X -- args`) or with the `bpy` wheel (`python X args`).
"""
import json
import math
import os
import sys

import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
VD = os.path.join(PROJ, "03_blender", "village_donors")
SAND = (0.62, 0.45, 0.31)          # in-game sand, linear-ish
CAM_DIR = Vector((-0.62, -0.62, 0.95)).normalized()   # RTS: about 47 deg down, 45 deg yaw (vanilla default camera)


def args():
    return sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else sys.argv[1:]


def reset():
    bpy.ops.wm.read_factory_settings(use_empty=True)


def _img(path, non_color=False):
    im = bpy.data.images.load(path, check_existing=True)
    if non_color:
        im.colorspace_settings.name = "Non-Color"
    return im


def matte_material(name, albedo, mga=None, ao_mix=0.5):
    m = bpy.data.materials.new(name)
    m.use_nodes = True
    nt = m.node_tree
    b = nt.nodes["Principled BSDF"]
    b.inputs["Roughness"].default_value = 0.85
    t = nt.nodes.new("ShaderNodeTexImage")
    t.image = _img(albedo) if isinstance(albedo, str) else albedo
    col = t.outputs["Color"]
    if mga and os.path.exists(mga):
        g = nt.nodes.new("ShaderNodeTexImage")
        g.image = _img(mga, True)
        sep = nt.nodes.new("ShaderNodeSeparateColor")
        nt.links.new(g.outputs["Color"], sep.inputs[0])
        mix = nt.nodes.new("ShaderNodeMix")
        mix.data_type = "RGBA"
        mix.blend_type = "MULTIPLY"
        mix.inputs["Factor"].default_value = ao_mix
        nt.links.new(col, mix.inputs[6])
        nt.links.new(sep.outputs[2], mix.inputs[7])
        col = mix.outputs[2]
    nt.links.new(col, b.inputs["Base Color"])
    return m


def import_fbx(paths):
    """Import FBX files, join into one mesh with transforms applied; returns the object."""
    before = set(bpy.data.objects)
    for p in paths:
        bpy.ops.import_scene.fbx(filepath=p)
    new = [o for o in bpy.data.objects if o not in before]
    new_names = [o.name for o in new]
    meshes = [o for o in new if o.type == "MESH"]
    for o in meshes:
        o.data = o.data.copy() if o.data.users > 1 else o.data
    bpy.ops.object.select_all(action="DESELECT")
    for o in meshes:
        o.select_set(True)
    bpy.context.view_layer.objects.active = meshes[0]
    if len(meshes) > 1:
        bpy.ops.object.join()
    ob = bpy.context.view_layer.objects.active
    bpy.ops.object.parent_clear(type="CLEAR_KEEP_TRANSFORM")
    bpy.ops.object.transform_apply(location=True, rotation=True, scale=True)
    for nm in new_names:
        o = bpy.data.objects.get(nm)
        if o is not None and o != ob:
            bpy.data.objects.remove(o)
    return ob


def sheet_of(mat):
    """Texture-sheet name of an imported FBX material (from its image file), or None."""
    import terminal_sheets as TS
    if mat is None:
        return None
    if mat.name.startswith("SHEET:"):
        return mat.name.split(":")[1]
    if mat.use_nodes:
        for nd in mat.node_tree.nodes:
            if nd.type == "TEX_IMAGE" and nd.image:
                return TS.sheet_name(nd.image.filepath or nd.image.name)
    return None


def village(name, paint="corrino"):
    """A vanilla village building in a faction paint, base centred at the origin, at its in-game (prefab) size.
    Every material is replaced by a matte one named SHEET:<sheet>:<paint> (34_build_terminal.py reads the sheet back)."""
    import terminal_sheets as TS
    info = json.load(open(os.path.join(VD, name, "info.json")))
    ob = import_fbx(info["fbx"])
    ob.name = name
    mats = {}
    for i, m in enumerate(ob.data.materials):
        sh = sheet_of(m)
        key = "SHEET:%s:%s" % (sh, paint)
        if key not in mats:
            mats[key] = bpy.data.materials.get(key)
            if mats[key] is None:
                t = TS.sheet(sh) if sh else {}
                if not t.get(paint) and info.get("tex", {}).get(paint):   # e.g. _Current: textures sit with the HMD
                    t = {paint: info["tex"][paint], "mga": info["tex"].get("mga")}
                if t.get(paint):
                    mats[key] = matte_material(key, t[paint], t.get("mga"))
                else:
                    mats[key] = bpy.data.materials.new(key)
                    print("NO_TEXTURE", name, sh)
        ob.data.materials[i] = mats[key]
    ob.scale *= info.get("scale", 1.0)                 # prefab scale = true in-game size
    bpy.context.view_layer.update()
    ground(ob)
    return ob


def bounds(objs):
    pts = [o.matrix_world @ Vector(c) for o in objs for c in o.bound_box]
    lo = Vector([min(p[k] for p in pts) for k in range(3)])
    hi = Vector([max(p[k] for p in pts) for k in range(3)])
    return lo, hi


def ground(ob, at=(0, 0)):
    lo, hi = bounds([ob])
    ob.location += Vector((at[0] - (lo.x + hi.x) / 2, at[1] - (lo.y + hi.y) / 2, -lo.z))
    bpy.context.view_layer.update()


def world(sand=True, size=400):
    sc = bpy.context.scene
    sc.render.engine = "CYCLES"
    sc.cycles.device = "CPU"
    sc.cycles.samples = 24
    sc.cycles.use_denoising = True
    sc.view_settings.view_transform = "Standard"
    sc.view_settings.look = "None"
    w = bpy.data.worlds.new("W")
    sc.world = w
    w.use_nodes = True
    bg = w.node_tree.nodes["Background"]
    bg.inputs[0].default_value = (0.75, 0.68, 0.6, 1)
    bg.inputs[1].default_value = 0.55
    ld = bpy.data.lights.new("Sun", "SUN")
    ld.energy = 3.4
    ld.angle = math.radians(4)
    ld.color = (1.0, 0.95, 0.86)
    lo = bpy.data.objects.new("Sun", ld)
    sc.collection.objects.link(lo)
    lo.rotation_euler = Vector((0.45, -0.35, 1.0)).to_track_quat("Z", "Y").to_euler()
    if sand:
        bpy.ops.mesh.primitive_plane_add(size=size, location=(0, 0, -0.002))
        p = bpy.context.active_object
        p.name = "Sand"
        m = bpy.data.materials.new("Sand")
        m.use_nodes = True
        m.node_tree.nodes["Principled BSDF"].inputs["Base Color"].default_value = SAND + (1,)
        m.node_tree.nodes["Principled BSDF"].inputs["Roughness"].default_value = 1.0
        p.data.materials.append(m)


def camera(target, ortho, direction=CAM_DIR):
    sc = bpy.context.scene
    cam = sc.camera
    if cam is None:
        cd = bpy.data.cameras.new("C")
        cd.type = "ORTHO"
        cam = bpy.data.objects.new("C", cd)
        sc.collection.objects.link(cam)
        sc.camera = cam
    cam.data.ortho_scale = ortho
    cam.data.clip_end = 2000
    d = Vector(direction).normalized()
    cam.location = Vector(target) + d * 300
    cam.rotation_euler = (-d).to_track_quat("-Z", "Y").to_euler()
    return cam


def render(path, rx, ry=None, samples=None):
    sc = bpy.context.scene
    sc.render.resolution_x, sc.render.resolution_y = rx, ry or rx
    if samples:
        sc.cycles.samples = samples
    sc.render.filepath = path
    os.makedirs(os.path.dirname(path), exist_ok=True)
    bpy.ops.render.render(write_still=True)
    return path
