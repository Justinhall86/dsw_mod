"""Kitbash multiple DSW character models into one textured .blend scene.

All models share one Male01/Female01 armature. Each body keeps its own
material and texture set. All images are packed into the .blend.

    blender -b --python 01_kitbash_blend.py -- \
        <primary.fbx> <secondary.fbx> [more.fbx ...] <out.blend>
"""
import os
import sys

import bpy

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import blender_scene as bs
from dsw_core import script_args


def import_fbx_tracked(path):
    """Import an FBX and return (new_meshes, new_rigs, new_cameras, new_lights).

    Only objects created by this import are returned, so we can correctly
    identify the body and rig even when a previous import contributed a
    larger mesh to the scene.
    """
    before = set(bpy.data.objects)
    bpy.ops.import_scene.fbx(filepath=os.path.abspath(path))
    new_objects = [o for o in bpy.data.objects if o not in before]
    new_meshes = [o for o in new_objects if o.type == "MESH"]
    new_rigs = [o for o in new_objects if o.type == "ARMATURE"]
    new_cameras = [o for o in new_objects if o.type == "CAMERA"]
    new_lights = [o for o in new_objects if o.type == "LIGHT"]
    return new_meshes, new_rigs, new_cameras, new_lights


def wire_body_textures(body, tex_dir, stem):
    """Wire a body's material textures from the folder beside its FBX."""
    wanted = {
        "Base Color": os.path.join(tex_dir, stem + "_Albedo.png"),
        "Specular IOR Level": os.path.join(tex_dir, stem + "_MetallicGlossAO.png"),
        "Normal": os.path.join(tex_dir, stem + "_Normal.png"),
    }
    emissive = os.path.join(tex_dir, stem + "_Emissive.png")
    if os.path.exists(emissive):
        wanted["Emissive"] = emissive
    for mat in body.data.materials:
        if not mat.use_nodes:
            continue
        for sock, name, path in bs.wire_textures(mat, wanted):
            print("   %-20s <- %s" % (sock, name))


def main():
    argv = script_args()
    if len(argv) < 3:
        raise SystemExit(
            "usage: 01_kitbash_blend.py -- <primary.fbx> <secondary.fbx> "
            "[more.fbx ...] <out.blend>"
        )
    fbx_paths = [os.path.abspath(p) for p in argv[:-1]]
    out_path = os.path.abspath(argv[-1])

    bs.reset_scene()

    shared_rig = None
    bodies = []

    for idx, fbx_path in enumerate(fbx_paths):
        stem = os.path.splitext(os.path.basename(fbx_path))[0]
        tex_dir = os.path.dirname(fbx_path)

        new_meshes, new_rigs, new_cameras, new_lights = import_fbx_tracked(fbx_path)
        if not new_meshes:
            raise SystemExit("no mesh imported from %s" % fbx_path)

        body = max(new_meshes, key=lambda o: len(o.data.polygons))
        body.name = stem
        body.data.name = stem + " Mesh"
        bodies.append(body)

        rig = new_rigs[0] if new_rigs else None
        if rig is not None:
            rig.name = "Armature" if shared_rig is None else "Armature.%03d" % idx
            if shared_rig is None:
                shared_rig = rig
            else:
                # Re-parent this model's mesh to the shared armature, drop its rig.
                body.parent = shared_rig
                body.parent_type = "OBJECT"
                bpy.data.objects.remove(rig, do_unlink=True)

        # Remove junk helper meshes from this import.
        for n in bs.JUNK_NAMES:
            o = bpy.data.objects.get(n)
            if o and o.type == "MESH":
                bpy.data.objects.remove(o, do_unlink=True)

        # Remove import camera/light (we add our own later).
        for o in new_cameras + new_lights:
            bpy.data.objects.remove(o, do_unlink=True)

        # Wire this body's own textures.
        wire_body_textures(body, tex_dir, stem)
        print("BODY %s  tris=%d  rig=%s" % (
            stem, len(body.data.polygons),
            rig.name if rig else "none"))

    if shared_rig is None:
        raise SystemExit("no armature found in any import")

    # ---- scene setup -------------------------------------------------------
    bs.setup_world(strength=1.8, color=(0.55, 0.58, 0.64))
    bs.setup_lights(sun_energy=3.0, fill_energy=120)
    bs.setup_render(1000, 1300)
    cam = bs.frame_camera_on(bodies[0], margin=1.12, direction=(0.7, -0.7, 0.0))
    shared_rig.show_in_front = True

    # ---- pack --------------------------------------------------------------
    packed = bs.pack_all_images()
    print("   packed %d images into the .blend" % packed)

    os.makedirs(os.path.dirname(os.path.abspath(out_path)), exist_ok=True)
    bpy.ops.wm.save_as_mainfile(filepath=out_path, compress=True)
    print("SAVED %s (%.2f MB)" % (out_path, os.path.getsize(out_path) / 1e6))
    print("BODIES: %s" % ", ".join(
        "%s tris=%d" % (b.name, len(b.data.polygons)) for b in bodies))


if __name__ == "__main__":
    main()