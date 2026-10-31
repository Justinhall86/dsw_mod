import os
import sys

import bpy

repo = r"C:\Users\justi\Python\dsw_mod"
scripts = os.path.join(repo, ".claude", "skills", "dsw-model-workshop", "scripts")
sys.path.insert(0, scripts)
import blender_scene as bs


def reset_scene():
    for obj in list(bpy.data.objects):
        bpy.data.objects.remove(obj, do_unlink=True)


def import_model(path):
    window = bpy.context.window
    override = {"window": window}
    if window:
        override["screen"] = window.screen
        area = next((item for item in window.screen.areas if item.type == "VIEW_3D"), None)
        if area:
            override["area"] = area
            region = next((item for item in area.regions if item.type == "WINDOW"), None)
            if region:
                override["region"] = region
    with bpy.context.temp_override(**override):
        bpy.ops.import_scene.fbx(filepath=os.path.abspath(path))
    meshes = [obj for obj in bpy.data.objects if obj.type == "MESH"]
    rigs = [obj for obj in bpy.data.objects if obj.type == "ARMATURE"]
    if not meshes:
        raise RuntimeError("no mesh in " + path)
    body = max(meshes, key=lambda obj: len(obj.data.polygons))
    for name in bs.JUNK_NAMES:
        junk = bpy.data.objects.get(name)
        if junk and junk.type == "MESH":
            bpy.data.objects.remove(junk, do_unlink=True)
    return body, rigs[0] if rigs else None


bs.reset_scene = reset_scene
bs.import_model = import_model
analyser = os.path.join(scripts, "01_analyse_mesh.py")
with open(analyser, "rb") as source:
    exec(compile(source.read(), analyser, "exec"))
