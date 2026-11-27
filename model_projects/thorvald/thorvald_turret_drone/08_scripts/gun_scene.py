"""Scene helpers for the turret gunship (Renegade drone rig, DroneR clips); builds on the artillery drone's drone_scene."""
import os
import sys

import bpy

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = os.path.abspath(os.path.join(PROJ, "..", "..", ".."))
sys.path.insert(0, os.path.join(REPO, "model_projects", "thorvald", "thorvald_artillery_drone", "08_scripts"))
import drone_scene as ds  # noqa: E402,F401

GUN_SCALE = 3.1                     # N_Renegade_Drone's model scale (rig 25); the owner sets Th_Drone's
ANIM_FBX = os.path.join(PROJ, "01_input", "anim_fbx")
HOST_TEX = os.path.join(ds.VEH, "Common", "Ravager_Drone", "preview_textures")
STATES = {"idle": ("Idle", 0), "fire": ("AttackRange", 12), "run": ("Run", 30)}


def clip_fbx(clip, anim_dir=None):
    return os.path.join(anim_dir or ANIM_FBX, "Ravager_Drone__%s.fbx" % clip)


def vanilla_mat(name):
    return ds.pbr_mat("Van_RavagerDrone", *[os.path.join(HOST_TEX, f) for f in ("albedo.png", "mgao.png", "normal.png")])


def load_vanilla(clip, frame, offset=(0, 0, 0), scale=GUN_SCALE):
    return ds.load_drone_fbx([clip_fbx(clip)], frame, offset, 0.0, scale, materials=vanilla_mat, tag="RenegadeDrone")


def load_variant(blend, clip, frame, offset=(0, 0, 0), scale=GUN_SCALE, tag="Gun", anim_dir=None):
    """The variant's mesh on the clip FBX's own armature (each clip FBX has its own rest)."""
    meshes, arms, root = ds.load_drone_fbx([clip_fbx(clip, anim_dir)], frame, offset, 0.0, scale, materials=vanilla_mat, tag=tag)
    van = meshes[0]
    with bpy.data.libraries.load(os.path.abspath(blend), link=False) as (src, dst):
        dst.objects = [n for n in src.objects if n.startswith("ThDrone_")]
    out = []
    for o in dst.objects:
        bpy.context.scene.collection.objects.link(o)
        o.parent = van.parent
        o.matrix_parent_inverse = van.matrix_parent_inverse.copy()
        o.matrix_basis = van.matrix_basis.copy()
        for md in o.modifiers:
            if md.type == "ARMATURE":
                md.object = van.parent
        out.append(o)
    bpy.data.objects.remove(van, do_unlink=True)
    ds.pose_at(arms, frame)
    return out, arms, root
