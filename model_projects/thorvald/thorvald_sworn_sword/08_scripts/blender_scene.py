"""Blender-only helpers for the DSW model workshop scripts.

Import this INSIDE Blender (`blender -b --python script.py`).  It handles the
things every script needs and that are easy to get wrong:

  * loading a model and finding the body / rig by role, not by name
  * deleting the junk that game FBXs carry (`Cube`, `Camera`, `Light`)
  * building a world + three-point lighting + an orthographic camera
  * rendering a set of standard angles
  * replacing a packed image datablock (the way that actually works)

Every script that uses it should do `from dsw_core import ...` and
`import blender_scene as bs` with this folder on sys.path.
"""
import math
import os

import bpy
import numpy as np
from mathutils import Matrix, Vector

# Objects the game's FBX exporter leaves behind that must never be rendered.
JUNK_NAMES = ("Cube", "Camera", "Light", "Lamp")


# --------------------------------------------------------------------------
# scene loading
# --------------------------------------------------------------------------

def reset_scene():
    """Empty scene. Every script that renders must call this first, so that
    a previous iteration's objects cannot leak into the next render."""
    bpy.ops.wm.read_factory_settings(use_empty=True)


def import_model(path):
    """Import an FBX and return (body_mesh_object, armature_object_or_None).

    The body is the LARGEST mesh; the rig is the armature.  Game FBXs also
    contain a helper mesh named `Cube` (a 2x2x2 m bounds reference) - it is
    removed here because it renders as a giant slab over the character.
    """
    bpy.ops.import_scene.fbx(filepath=os.path.abspath(path))
    meshes = [o for o in bpy.data.objects if o.type == "MESH"]
    rigs = [o for o in bpy.data.objects if o.type == "ARMATURE"]
    if not meshes:
        raise SystemExit("no mesh in %s" % path)
    body = max(meshes, key=lambda o: len(o.data.polygons))
    for n in JUNK_NAMES:
        o = bpy.data.objects.get(n)
        if o and o.type == "MESH":
            bpy.data.objects.remove(o, do_unlink=True)
    return body, (rigs[0] if rigs else None)


def world_positions(mesh):
    """numpy array of every vertex's world position."""
    mw = mesh.matrix_world
    return np.array([(mw @ v.co)[:] for v in mesh.data.vertices])


def dominant_bone_per_vertex(mesh):
    """vertex index -> name of the bone it is most strongly weighted to."""
    groups = {g.index: g.name for g in mesh.vertex_groups}
    out = {}
    for v in mesh.data.vertices:
        if not v.groups:
            out[v.index] = "NONE"
            continue
        g = max(v.groups, key=lambda g: g.weight)
        out[v.index] = groups.get(g.group, "NONE")
    return out


def hand_centroid(mesh, bone_name="B_rWristJ", threshold=0.5):
    """The grip point of a hand: the centroid of the vertices whose
    strongest weight is the wrist bone.

    `B_Gun` sits at the armature origin in the rest pose, so its rest
    transform is NOT a usable placement hint.  This is.
    """
    groups = {g.name: g.index for g in mesh.vertex_groups}
    idx = groups.get(bone_name)
    if idx is None:
        return None
    mw = mesh.matrix_world
    pts = []
    for v in mesh.data.vertices:
        best, bw = None, -1.0
        for g in v.groups:
            if g.group == idx and g.weight > bw:
                best, bw = g.group, g.weight
        if best is not None and bw > threshold:
            pts.append(mw @ v.co)
    if not pts:
        return None
    arr = np.array([p[:] for p in pts])
    return Vector((float(arr[:, 0].mean()), float(arr[:, 1].mean()), float(arr[:, 2].mean())))


# --------------------------------------------------------------------------
# material wiring
# --------------------------------------------------------------------------

def socket_of(node, tree):
    """The socket a texture node feeds, resolved BY NAME (node identity is not
    stable between file loads).  A texture that feeds a Normal Map node
    reports `Color`, but the useful answer is `Normal`."""
    for l in tree.links:
        if l.from_node.name == node.name:
            sock = l.to_socket.name
            if sock == "Color" and l.to_node.type == "NORMAL_MAP":
                for l2 in tree.links:
                    if l2.from_node.name == l.to_node.name:
                        return "Normal"
            return sock
    return None


def wire_textures(material, wanted):
    """Point each texture node of `material` at the file for its socket.

    `wanted` maps socket name -> file path:
        {"Base Color": "...Albedo.png",
         "Specular IOR Level": "...MetallicGlossAO.png",
         "Normal": "...Normal.png"}

    A texture already linked to `Alpha` is left alone (alpha is 1.0 anyway).

    IMPORTANT: the image datablock is REPLACED, not re-pointed.  Setting
    `node.image.filepath` and calling `reload()` keeps the OLD packed pixels
    (and fails to repack).  A new datablock is the only reliable way.
    """
    tree = material.node_tree
    log = []
    for node in [n for n in tree.nodes if n.type == "TEX_IMAGE"]:
        sock = socket_of(node, tree)
        if sock == "Alpha":
            continue
        path = wanted.get(sock)
        if not path:
            continue
        if not os.path.exists(path):
            log.append((sock, "MISSING", path))
            continue
        img = bpy.data.images.load(path, check_existing=False)
        img.name = os.path.basename(path)
        node.image = img
        log.append((sock, os.path.basename(path), path))
    return log


def material_report(material):
    """Human-readable dump of a material's texture wiring."""
    tree = material.node_tree
    lines = []
    for l in tree.links:
        if l.from_node.type == "TEX_IMAGE":
            img = l.from_node.image
            lines.append("   %-20s <- %s" % (l.to_socket.name,
                                            img.name if img else "None"))
    return lines


# --------------------------------------------------------------------------
# lighting, camera, rendering
# --------------------------------------------------------------------------

def setup_world(strength=1.8, color=(0.55, 0.58, 0.64)):
    world = bpy.data.worlds.new("World")
    bpy.context.scene.world = world
    world.use_nodes = True
    bg = world.node_tree.nodes["Background"]
    bg.inputs[0].default_value = (color[0], color[1], color[2], 1)
    bg.inputs[1].default_value = strength
    return world


def setup_lights(sun_energy=3.0, fill_energy=120.0):
    """A sun plus a fill.  EEVEE with a bright world reads far better than
    the viewport, and the Workbench `TEXTURE` colour shows no texture."""
    sd = bpy.data.lights.new("Sun", type="SUN")
    sd.energy = sun_energy
    sd.angle = math.radians(3)
    sun = bpy.data.objects.new("Sun", sd)
    bpy.context.collection.objects.link(sun)
    sun.rotation_euler = (math.radians(55), 0.0, math.radians(35))

    fd = bpy.data.lights.new("Fill", type="AREA")
    fd.energy = fill_energy
    fd.size = 3.0
    fill = bpy.data.objects.new("Fill", fd)
    bpy.context.collection.objects.link(fill)
    fill.location = (-1.6, -2.2, 1.6)
    fill.rotation_euler = (math.radians(65), 0.0, math.radians(-40))
    return sun, fill


def setup_camera(target=None, ortho_scale=None, direction=(0.7, -0.7, 0.0),
                 distance=None):
    """An orthographic camera looking at `target` from `direction`."""
    cd = bpy.data.cameras.new("Camera")
    cd.type = "ORTHO"
    cam = bpy.data.objects.new("Camera", cd)
    bpy.context.collection.objects.link(cam)
    bpy.context.scene.camera = cam

    if target is None:
        target = Vector((0.0, 0.0, 1.0))
    else:
        target = Vector(target)
    if ortho_scale is None:
        ortho_scale = 2.2
    if distance is None:
        distance = ortho_scale * 2.5
    cd.ortho_scale = ortho_scale
    cam.location = target + Vector(direction).normalized() * distance
    cam.rotation_euler = (target - cam.location).to_track_quat("-Z", "Y").to_euler()
    return cam


def setup_render(width=900, height=1200, engine="BLENDER_EEVEE"):
    sc = bpy.context.scene
    sc.render.engine = engine          # Blender 5.2 has no BLENDER_EEVEE_NEXT
    sc.render.resolution_x = width
    sc.render.resolution_y = height
    sc.render.resolution_percentage = 100
    sc.view_settings.view_transform = "Standard"
    sc.render.image_settings.file_format = "PNG"
    return sc


def model_bounds(mesh):
    bb = [mesh.matrix_world @ Vector(c) for c in mesh.bound_box]
    lo = Vector((min(v.x for v in bb), min(v.y for v in bb), min(v.z for v in bb)))
    hi = Vector((max(v.x for v in bb), max(v.y for v in bb), max(v.z for v in bb)))
    return lo, hi


def frame_camera_on(mesh, margin=1.12, direction=(0.7, -0.7, 0.0)):
    """Point an ortho camera at the model so it fills the frame."""
    lo, hi = model_bounds(mesh)
    centre = (lo + hi) / 2
    height = max(hi.z - lo.z, 0.2)
    width = max(hi.x - lo.x, hi.y - lo.y, 0.2)
    scale = max(height, width) * margin
    return setup_camera(target=centre, ortho_scale=scale,
                        direction=direction, distance=scale * 2.5)


def render_to(path, camera=None):
    sc = bpy.context.scene
    if camera is not None:
        sc.camera = camera
    sc.render.filepath = os.path.abspath(path)
    bpy.ops.render.render(write_still=True)
    print("RENDERED", sc.render.filepath, os.path.getsize(sc.render.filepath), "bytes")
    return sc.render.filepath


# The standard set of angles used everywhere in this project.
#   front      -Y   (the character faces -Y)
#   back      +Y
#   side       X
#   three_quarter
ANGLES = {
    "front": (0.0, -1.0, 0.0),
    "back": (0.0, 1.0, 0.0),
    "left": (-1.0, 0.0, 0.0),
    "right": (1.0, 0.0, 0.0),
    "three_quarter": (0.7, -0.7, 0.0),
    "back_three_quarter": (0.7, 0.7, 0.0),
}


def render_angles(mesh, out_dir, prefix="", angles=None, margin=1.12,
                  width=900, height=1200):
    """Render the model from several standard angles into `out_dir`."""
    os.makedirs(out_dir, exist_ok=True)
    setup_render(width, height)
    setup_world()
    setup_lights()
    lo, hi = model_bounds(mesh)
    centre = (lo + hi) / 2
    height = max(hi.z - lo.z, 0.2)
    width_m = max(hi.x - lo.x, hi.y - lo.y, 0.2)
    scale = max(height, width_m) * margin
    cam = setup_camera(target=centre, ortho_scale=scale, distance=scale * 2.5)

    written = []
    for name in (angles or ANGLES):
        d = Vector(ANGLES[name])
        cam.location = centre + d.normalized() * scale * 2.5
        cam.rotation_euler = (centre - cam.location).to_track_quat("-Z", "Y").to_euler()
        path = os.path.join(out_dir, "%s%s.png" % (prefix, name))
        render_to(path, cam)
        written.append(path)
    return written


# --------------------------------------------------------------------------
# bone parenting - the trap
# --------------------------------------------------------------------------

def parent_to_bone(child, armature, bone_name="B_Gun"):
    """Parent `child` to a bone, keeping its world transform.

    Use the OPERATOR, not `matrix_parent_inverse`.  Blender's bone parenting
    uses the bone's TAIL as the origin, so hand-setting the inverse matrix
    puts the object ~0.67 m off.  The active bone must be set first.
    """
    if bone_name not in armature.data.bones:
        raise SystemExit("no bone %s" % bone_name)
    for o in bpy.context.view_layer.objects:
        o.select_set(False)
    child.select_set(True)
    armature.select_set(True)
    bpy.context.view_layer.objects.active = armature
    armature.data.bones.active = armature.data.bones[bone_name]
    bpy.ops.object.parent_set(type="BONE", keep_transform=True)
    armature.data.bones[bone_name].use_deform = True
    bpy.context.view_layer.update()


def pack_all_images():
    """Pack every image into the .blend so the file is portable."""
    packed = 0
    for img in bpy.data.images:
        if img.size[0] and not img.packed_file:
            try:
                img.pack()
                packed += 1
            except Exception as e:
                print("   could not pack %s: %s" % (img.name, e))
    return packed
