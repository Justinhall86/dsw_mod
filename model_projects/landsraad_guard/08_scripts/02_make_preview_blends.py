"""Step 2 - build a VIEWABLE .blend of each Landsraad Guard weapon variant.

  blender -b --python 08_scripts/02_make_preview_blends.py -- [halberd|gun|bazooka ...]

Needs 01_prep_preview_assets.py to have run first (real PNGs + FBXs).

The three variants share ONE body (Male01_LandsraadGuard.hmd, vanilla); only the
weapon, its hand bone and the animation set differ (data.cdb models
N_LR_Guard / N_LR_Guard_Gun / N_LR_Guard_Bazooka -> the three prefabs):
  halberd  Prefab_LandsraadGuard.prefab          Landsraad_Halberd  y -0.2 rotX -90  -> B_Weapon
  gun      Prefab_LandsraadGuard_Gun.prefab      Gun_Landsraad      rotX -90         -> B_Gun
  bazooka  Prefab_LandsraadGuard_Bazooka.prefab  Bazooka           rotX -90         -> B_Gun
Each .blend holds the body (shipped textures), the weapon parented to the hand
bone with the prefab's own offset/rotation, the variant's vanilla FightIdle clip,
lights and four cameras.
"""
import math
import os
import sys

import bpy
from mathutils import Matrix, Vector

PROJ = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_projects\landsraad_guard"
BLEND_DIR = os.path.join(PROJ, "03_blender")
TEX_DIR = os.path.join(PROJ, "04_textures")
PHOTOS = os.path.join(PROJ, "02_progress_photos", "03_final")
FBX = os.path.join(PROJ, "05_fbx_export", "preview")
os.makedirs(PHOTOS, exist_ok=True)
os.makedirs(BLEND_DIR, exist_ok=True)

BODY_MAPS = {
    "albedo": "LandsraadGuard_Albedo.png",
    "mgao": "LandsraadGuard_MetallicGlossAO.png",
    "normal": "LandsraadGuard_Normal.png",
}

# bone, prefab offset (x, y, z), prefab rotation deg (x, y, z), extra slide along local Y
VARIANTS = {
    "halberd": dict(
        weapon_fbx="halberd.fbx", weapon_name="Landsraad_Halberd", mat="Mat_LandsraadHalberd",
        maps={"albedo": "Landsraad_Halberd_Albedo.png", "mgao": "Landsraad_Halberd_MetallicGlossAO.png",
              "normal": "Landsraad_Halberd_Normal.png"},
        bone="B_Weapon", offset=(0.0, -0.2, 0.0), rot=(-90.0, 0.0, 0.0), anchor_y=0.0,
        blend="landsraad_guard_halberd_preview.blend"),
    "gun": dict(
        weapon_fbx="gun.fbx", weapon_name="Gun_Landsraad", mat="Mat_LandsraadGun",
        maps={"albedo": "Landsraad_gun_Albedo.png", "mgao": "Landsraad_gun_MetallicGlossAOEmiss.png",
              "normal": "Landsraad_gun_Normal.png"},
        bone="B_Gun", offset=(0.0, 0.0, 0.0), rot=(-90.0, 0.0, 0.0), anchor_y=0.0,
        blend="landsraad_guard_gun_preview.blend"),
    "bazooka": dict(
        weapon_fbx="bazooka.fbx", weapon_name="Bazooka", mat="Mat_Bazooka",
        maps={"albedo": "Bazooka_Albedo.png", "mgao": "Bazooka_MetallicGlossAO.png",
              "normal": "Bazooka_Normal.png"},
        bone="B_Gun", offset=(0.0, 0.0, 0.0), rot=(-90.0, 0.0, 0.0), anchor_y=0.0,
        blend="landsraad_guard_bazooka_preview.blend"),
}


def wipe_scene():
    bpy.ops.wm.read_factory_settings(use_empty=True)


def only_mesh(objs, min_verts=100):
    return [o for o in objs if o.type == "MESH" and len(o.data.vertices) >= min_verts]


def load_image(path):
    img = bpy.data.images.load(path, check_existing=True)
    try:
        img.pack()
    except Exception as e:
        print("   pack failed for", img.name, e)
    return img


def wire_material(obj, mat_name, maps):
    """albedo -> Base Color, MGAO -> Specular IOR Level, normal -> Normal Map."""
    mat = bpy.data.materials.new(mat_name)
    mat.use_nodes = True
    nt = mat.node_tree
    for n in list(nt.nodes):
        nt.nodes.remove(n)

    def tex(key, label, y):
        nd = nt.nodes.new("ShaderNodeTexImage")
        nd.image = load_image(os.path.join(TEX_DIR, maps[key]))
        nd.label = label
        nd.location = (-700, y)
        return nd

    alb, mga, nrm = tex("albedo", "Albedo", 300), tex("mgao", "MetallicGlossAO", 0), tex("normal", "Normal", -300)
    bsdf = nt.nodes.new("ShaderNodeBsdfPrincipled")
    out = nt.nodes.new("ShaderNodeOutputMaterial")
    nmap = nt.nodes.new("ShaderNodeNormalMap")
    bsdf.location, out.location, nmap.location = (-200, 0), (200, 0), (-400, -300)
    nt.links.new(alb.outputs["Color"], bsdf.inputs["Base Color"])
    nt.links.new(mga.outputs["Color"], bsdf.inputs["Specular IOR Level"])
    nt.links.new(nrm.outputs["Color"], nmap.inputs["Color"])
    nt.links.new(nmap.outputs["Normal"], bsdf.inputs["Normal"])
    nt.links.new(bsdf.outputs["BSDF"], out.inputs["Surface"])
    mga.image.colorspace_settings.name = "Non-Color"
    nrm.image.colorspace_settings.name = "Non-Color"
    obj.data.materials.clear()
    obj.data.materials.append(mat)
    return mat


def place_in_bone(obj, rig, bone_name, offset, rot_deg, anchor_y):
    """Parent to the bone HEAD and apply the prefab transform in the bone's frame.

    Blender evaluates world = rig @ pose_bone @ T(0, length, 0) @ parent_inverse @ basis,
    i.e. a bone-parented child sits on the bone TAIL. parent_inverse = T(0, -length, 0)
    moves it back to the head while still following the pose bone every frame (an
    inverse of the whole bone matrix would freeze the object at its start place).

    The imported weapon object already carries its HMD model-node rotation/position
    (e.g. rotX +90 on the gun); the prefab transform is applied on top of that, in the
    bone's frame - so basis = prefab @ imported (verified by the held-weapon renders)."""
    pb = rig.pose.bones[bone_name]
    obj.parent, obj.parent_type, obj.parent_bone = rig, "BONE", bone_name
    obj.matrix_parent_inverse = Matrix.Translation((0.0, -pb.bone.length, 0.0))
    rot = (Matrix.Rotation(math.radians(rot_deg[0]), 4, "X")
           @ Matrix.Rotation(math.radians(rot_deg[1]), 4, "Y")
           @ Matrix.Rotation(math.radians(rot_deg[2]), 4, "Z"))
    obj.matrix_basis = (Matrix.Translation((0.0, anchor_y, 0.0)) @ Matrix.Translation(offset) @ rot
                        @ obj.matrix_basis)
    bpy.context.view_layer.update()


def add_camera(name, loc, target, ortho_scale):
    data = bpy.data.cameras.new(name)
    cam = bpy.data.objects.new(name, data)
    bpy.context.collection.objects.link(cam)
    cam.location = loc
    cam.rotation_euler = (Vector(target) - Vector(loc)).to_track_quat("-Z", "Y").to_euler()
    data.type, data.ortho_scale = "ORTHO", ortho_scale
    return cam


def add_light(name, kind, energy, loc, rot_deg, size=None):
    data = bpy.data.lights.new(name, type=kind)
    data.energy = energy
    if size:
        data.size = size
    ob = bpy.data.objects.new(name, data)
    bpy.context.collection.objects.link(ob)
    ob.location = loc
    ob.rotation_euler = [math.radians(a) for a in rot_deg]


def build(tag, cfg, render=True):
    print("=" * 70, "\n", tag, "\n", "=" * 70)
    wipe_scene()
    bpy.ops.import_scene.fbx(filepath=os.path.join(FBX, "body_%s_anim.fbx" % tag))
    body = only_mesh(bpy.context.scene.objects)[0]
    rig = next(o for o in bpy.context.scene.objects if o.type == "ARMATURE")
    body.name, body.data.name, rig.name = "LandsraadGuard", "LandsraadGuardMesh", "Male01_LandsraadGuard"
    rig.show_in_front = True
    print("   body: %d verts, %d tris, %d vertex groups; rig %d bones" % (
        len(body.data.vertices), sum(len(p.vertices) - 2 for p in body.data.polygons),
        len(body.vertex_groups), len(rig.data.bones)))
    wire_material(body, "Mat_LandsraadGuard1", BODY_MAPS)

    before = set(bpy.context.scene.objects)
    bpy.ops.import_scene.fbx(filepath=os.path.join(FBX, cfg["weapon_fbx"]))
    new = [o for o in bpy.context.scene.objects if o not in before]
    wp = only_mesh(new, min_verts=50)[0]
    for o in new:
        if o is not wp and o.type != "MESH":
            bpy.data.objects.remove(o, do_unlink=True)
    wp.name, wp.data.name = cfg["weapon_name"], cfg["weapon_name"] + "Mesh"
    wire_material(wp, cfg["mat"], cfg["maps"])
    place_in_bone(wp, rig, cfg["bone"], cfg["offset"], cfg["rot"], cfg["anchor_y"])
    hand = rig.matrix_world @ rig.pose.bones[cfg["bone"]].head
    wbb = [wp.matrix_world @ Vector(c) for c in wp.bound_box]
    print("   %s -> %s  offset %s rot %s anchor %s" % (wp.name, cfg["bone"], cfg["offset"], cfg["rot"], cfg["anchor_y"]))
    print("   bone head %s; weapon bbox x %.3f..%.3f y %.3f..%.3f z %.3f..%.3f" % (
        (tuple(round(v, 3) for v in hand),)
        + (min(v.x for v in wbb), max(v.x for v in wbb), min(v.y for v in wbb), max(v.y for v in wbb),
           min(v.z for v in wbb), max(v.z for v in wbb))))

    world = bpy.data.worlds.new("World")
    bpy.context.scene.world = world
    world.use_nodes = True
    bg = world.node_tree.nodes["Background"]
    bg.inputs[0].default_value = (0.55, 0.58, 0.64, 1.0)
    bg.inputs[1].default_value = 1.6
    add_light("Sun", "SUN", 3.5, (0, 0, 5), (52, 0, 35))
    add_light("Fill", "AREA", 160, (-1.8, -2.4, 1.8), (68, 0, -40), size=3.0)
    add_light("Rim", "AREA", 120, (1.6, 2.6, 2.2), (115, 0, 200), size=2.0)

    sc = bpy.context.scene
    sc.frame_set(1)
    bpy.context.view_layer.update()
    bb = [body.matrix_world @ Vector(c) for c in body.bound_box]
    lo = Vector((min(v.x for v in bb), min(v.y for v in bb), min(v.z for v in bb)))
    hi = Vector((max(v.x for v in bb), max(v.y for v in bb), max(v.z for v in bb)))
    centre, height = (lo + hi) / 2, hi.z - lo.z
    print("   body height %.3f, centre %s" % (height, tuple(round(v, 3) for v in centre)))
    d, scale = height * 2.4, height * 1.25
    # the Male01 rig faces world -X in Blender, so "front" is the -X camera
    cams = {
        "front": add_camera("Camera_Front", centre + Vector((-d, 0, 0.1)), centre, scale),
        "threequarter": add_camera("Camera_ThreeQuarter", centre + Vector((-1.0, -0.9, 0.12)).normalized() * d, centre, scale),
        "side": add_camera("Camera_Side", centre + Vector((0, -d, 0.1)), centre, scale),
        "back": add_camera("Camera_Back", centre + Vector((d, 0, 0.1)), centre, scale),
    }
    sc.render.engine = "BLENDER_EEVEE"
    sc.render.resolution_x, sc.render.resolution_y = 900, 1200
    sc.view_settings.view_transform = "Standard"
    sc.frame_start = 1
    act = rig.animation_data.action if rig.animation_data else None
    sc.frame_end = int(act.frame_range[1]) if act else 40
    for screen in bpy.data.screens:
        for area in screen.areas:
            if area.type == "VIEW_3D":
                sp = area.spaces.active
                sp.shading.type = "MATERIAL"
                sp.region_3d.view_distance = height * 2.0
                sp.region_3d.view_location = centre
                sp.region_3d.view_rotation = cams["threequarter"].rotation_euler.to_quaternion()
    if render:
        sc.frame_set(1)
        for name, cam in cams.items():
            sc.camera = cam
            sc.render.filepath = os.path.join(PHOTOS, "%s_%s.png" % (tag, name))
            bpy.ops.render.render(write_still=True)
    sc.camera = cams["threequarter"]
    # drop the FBX importer's dead texture stubs / materials (0 users) so only the packed maps stay
    for coll in (bpy.data.images, bpy.data.materials):
        for item in list(coll):
            if item.users == 0:
                coll.remove(item)
    for img in bpy.data.images:
        if img.name.endswith(".001"):
            img.name = img.name[:-4]
    for mat in bpy.data.materials:
        if mat.name.endswith(".001"):
            mat.name = mat.name[:-4]
    out = os.path.join(BLEND_DIR, cfg["blend"])
    bpy.ops.wm.save_as_mainfile(filepath=out)
    print("SAVED %s (%.2f MB), frames 1-%d" % (out, os.path.getsize(out) / 1e6, sc.frame_end))


args = sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else []
for tag in (args or VARIANTS):
    build(tag, VARIANTS[tag])
