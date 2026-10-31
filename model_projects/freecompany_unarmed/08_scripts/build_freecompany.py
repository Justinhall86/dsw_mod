import os
import sys

import bpy

repo = r"C:\Users\justi\Python\dsw_mod"
scripts = os.path.join(
    repo, ".claude", "skills", "dsw-model-workshop", "scripts")
sys.path.insert(0, scripts)

import blender_scene as bs


def reset_scene_without_factory_settings():
    for obj in list(bpy.data.objects):
        bpy.data.objects.remove(obj, do_unlink=True)


def import_model_with_gui_context(path):
    window = bpy.context.window
    override = {"window": window}
    if window:
        override["screen"] = window.screen
        area = next((a for a in window.screen.areas if a.type == "VIEW_3D"), None)
        if area:
            override["area"] = area
            region = next((r for r in area.regions if r.type == "WINDOW"), None)
            if region:
                override["region"] = region
    with bpy.context.temp_override(**override):
        bpy.ops.import_scene.fbx(filepath=os.path.abspath(path))
    meshes = [o for o in bpy.data.objects if o.type == "MESH"]
    rigs = [o for o in bpy.data.objects if o.type == "ARMATURE"]
    if not meshes:
        raise SystemExit("no mesh in %s" % path)
    body = max(meshes, key=lambda o: len(o.data.polygons))
    for name in bs.JUNK_NAMES:
        obj = bpy.data.objects.get(name)
        if obj and obj.type == "MESH":
            bpy.data.objects.remove(obj, do_unlink=True)
    return body, rigs[0] if rigs else None


bs.reset_scene = reset_scene_without_factory_settings
bs.import_model = import_model_with_gui_context
builder = os.path.join(scripts, "07_build_blend.py")
with open(builder, "rb") as source:
    exec(compile(source.read(), builder, "exec"))
