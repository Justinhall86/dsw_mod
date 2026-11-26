"""Blender helpers for the Thorvald artillery drone (import inside Blender / bpy).

  * load_drone(): the two-part drone (legs + hull/gun) posed by a DroneC clip at a frame, from either the vanilla
    baked clips (01_input/anim_fbx, made by 10_bake_clips.py) or a built variant .blend (03_blender/...).
  * load_squad(): Thorvald troopers (Th_Trooper, in-game scale 1.0) for size comparison.
  * stage(): neutral matte world, sun + fill, ortho camera; rts_camera() is the high RTS angle.
  * Sizes: everything is shown at its IN-GAME scale. The drone's model row has scale 2.1, so drone objects are
    scaled by DRONE_SCALE; the infantry is 1.0.

Paths resolve from this file, so the scripts run on the owner's Windows PC and in a Linux cloud session alike.
"""
import math
import os
import sys

import bpy
from mathutils import Matrix, Vector

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = os.path.abspath(os.path.join(PROJ, "..", "..", ".."))
VEH = os.path.join(REPO, "model_inputs", "Vehicle")
DRONE_DIR = os.path.join(VEH, "Imperial", "DroneI")
ANIM_FBX = os.path.join(PROJ, "01_input", "anim_fbx")
TRO = os.path.join(REPO, "model_projects", "thorvald", "thorvald_trooper")
DRONE_SCALE = 2.1
JUNK = ("Cube", "Camera", "Light", "Lamp")
CLIP_FRAMES = {"Opening": 45, "Closing": 41, "Idle": 120, "Run": 120, "AttackRange": 59, "Death": 81, "FightIdle": 2}
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(REPO, "model_projects", "thorvald", "thorvald_ship", "08_scripts"))  # preview_wiring


def reset():
    bpy.ops.wm.read_factory_settings(use_empty=True)


def import_fbx(path):
    pre = set(bpy.data.objects)
    bpy.ops.import_scene.fbx(filepath=os.path.abspath(path))
    new = [o for o in bpy.data.objects if o not in pre]
    for o in list(new):
        if o.name.split(".")[0] in JUNK:
            new.remove(o)
            bpy.data.objects.remove(o, do_unlink=True)
    return new


# ---------------------------------------------------------------- materials
def image(path, colourspace):
    img = bpy.data.images.load(os.path.abspath(path), check_existing=True)
    img.colorspace_settings.name = colourspace
    return img


def pbr_mat(name, albedo, mgao=None, normal=None, flat=None):
    """Toolkit wiring (what the exporter expects): Albedo -> Base Color, MGAO -> Specular IOR Level, Normal map."""
    m = bpy.data.materials.get(name) or bpy.data.materials.new(name)
    m.use_nodes = True
    nt = m.node_tree
    for n in list(nt.nodes):
        nt.nodes.remove(n)
    out = nt.nodes.new("ShaderNodeOutputMaterial")
    bsdf = nt.nodes.new("ShaderNodeBsdfPrincipled")
    nt.links.new(bsdf.outputs["BSDF"], out.inputs["Surface"])
    if flat is not None:
        bsdf.inputs["Base Color"].default_value = (*flat, 1)
        bsdf.inputs["Roughness"].default_value = 0.7
        return m
    a = nt.nodes.new("ShaderNodeTexImage")
    a.image = image(albedo, "sRGB")
    nt.links.new(a.outputs["Color"], bsdf.inputs["Base Color"])
    if mgao:
        g = nt.nodes.new("ShaderNodeTexImage")
        g.image = image(mgao, "Non-Color")
        nt.links.new(g.outputs["Color"], bsdf.inputs["Specular IOR Level"])
    if normal:
        n = nt.nodes.new("ShaderNodeTexImage")
        n.image = image(normal, "Non-Color")
        nm = nt.nodes.new("ShaderNodeNormalMap")
        nt.links.new(n.outputs["Color"], nm.inputs["Color"])
        nt.links.new(nm.outputs["Normal"], bsdf.inputs["Normal"])
    return m


def vanilla_drone_mat():
    pt = os.path.join(DRONE_DIR, "preview_textures")
    return pbr_mat("Mat_ImperiumDrone_preview", os.path.join(pt, "albedo.png"), os.path.join(pt, "mgao.png"),
                   os.path.join(pt, "normal.png"))


def gamelike_all():
    import preview_wiring as pw
    pw.apply_all()


# ---------------------------------------------------------------- drone
SCENE_FRAME = 1000      # every render happens at this scene frame; each drone is offset with its own NLA strip


def pose_at(arms, frame, action=None):
    """Pose these armatures at clip `frame` of `action` (default: their own imported action), independently of
    any other drone in the scene: a held NLA strip starts at SCENE_FRAME - frame."""
    for a in arms:
        ad = a.animation_data or a.animation_data_create()
        act = action or ad.action or getattr(a, "_drone_action", None)
        if act is None:
            continue
        ad.action = None
        for t in list(ad.nla_tracks):
            ad.nla_tracks.remove(t)
        tr = ad.nla_tracks.new()
        st = tr.strips.new("pose", int(SCENE_FRAME - frame), act)
        if hasattr(st, "action_slot") and len(getattr(act, "slots", [])):
            st.action_slot = act.slots[0]
        st.extrapolation = "HOLD"
        st.blend_type = "REPLACE"
    bpy.context.scene.frame_set(SCENE_FRAME)
    bpy.context.view_layer.update()


def set_action_frame(arms, frame):
    pose_at(arms, frame)


def load_drone_fbx(fbx_paths, frame=0, offset=(0, 0, 0), rotz=0.0, scale=DRONE_SCALE, materials=None, tag="Drone"):
    """Import a two-part drone from clip-baked FBX files (one per part), pose it at clip `frame`, under one root empty.
    `materials`: callable(material name) -> bpy material, or None for the vanilla drone material."""
    root = bpy.data.objects.new("%s_root" % tag, None)
    bpy.context.scene.collection.objects.link(root)
    meshes, arms = [], []
    for path in fbx_paths:
        new = import_fbx(path)
        for o in new:
            if o.parent is None:
                o.parent = root
            if o.type == "MESH":
                if materials is None:
                    o.data.materials.clear()
                    o.data.materials.append(vanilla_drone_mat())
                else:
                    for i, sl in enumerate(o.material_slots):
                        if sl.material is not None:
                            o.material_slots[i].material = materials(sl.material.name.split(".")[0])
                meshes.append(o)
            elif o.type == "ARMATURE":
                arms.append(o)
    root.location = offset
    root.rotation_euler = (0, 0, rotz)
    root.scale = (scale,) * 3
    pose_at(arms, frame)
    return meshes, arms, root


def load_vanilla_drone(clip="Opening", frame=0, offset=(0, 0, 0), rotz=0.0, scale=DRONE_SCALE):
    """Both vanilla parts posed by `clip` at `frame`. Returns (meshes, armatures, root empty)."""
    return load_drone_fbx([os.path.join(ANIM_FBX, "%s__%s.fbx" % (p, clip)) for p in ("ImperiumDroneBase", "ImperiumDroneCanon")],
                          frame, offset, rotz, scale, tag="VanillaDrone")


def game_folder_materials(folder):
    """Material resolver for a game folder written by 60_write_hmd.py: Mat_<stem> -> <stem>_{Albedo,MGAO,Normal}.png."""
    def get(name):
        stem = name[len("Mat_"):] if name.startswith("Mat_") else name
        return pbr_mat("RT_" + name, *[os.path.join(folder, "%s_%s.png" % (stem, s))
                                       for s in ("Albedo", "MetallicGlossAO", "Normal")])
    return get


def load_variant(blend, clip="Opening", frame=0, offset=(0, 0, 0), rotz=0.0, scale=DRONE_SCALE, tag=None):
    """A built variant posed by a vanilla DroneC clip.

    Each baked clip FBX has its own armature rest (hmdanim2fbx writes the clip's first frame into the rest), so an action
    cannot be moved between armatures. Instead the clip's own two armatures are imported, and the variant's meshes (same
    raw data frame and bone-named vertex groups as the vanilla meshes) take the place of the vanilla meshes on them."""
    meshes, arms, root = load_vanilla_drone(clip, frame, offset, rotz, scale)
    with bpy.data.libraries.load(os.path.abspath(blend), link=False) as (src, dst):
        dst.objects = [n for n in src.objects if n.startswith("ThDrone_")]
    out = []
    for o in dst.objects:
        key = "Base" if o.name.startswith("ThDrone_Base") else "Canon"
        van = next(m for m in meshes if ("DroneBase" if key == "Base" else "DroneCanon") in m.name)
        arm = van.parent
        bpy.context.scene.collection.objects.link(o)
        o.parent = arm
        o.matrix_parent_inverse = van.matrix_parent_inverse.copy()
        o.matrix_basis = van.matrix_basis.copy()
        for md in o.modifiers:
            if md.type == "ARMATURE":
                md.object = arm
        if tag:
            o.name = "%s_%s" % (tag, o.name)
        out.append(o)
    for m in meshes:
        bpy.data.objects.remove(m, do_unlink=True)
    pose_at(arms, frame)
    return out, arms, root


# ---------------------------------------------------------------- infantry
def trooper_mat_map():
    gf = os.path.join(TRO, "Final", "game_files", "CharMOD", "Male01_ThorvaldTrooper")
    out = {}
    for f in os.listdir(gf):
        if f.endswith("_Albedo.png"):
            stem = f[:-len("_Albedo.png")]
            out[stem] = (os.path.join(gf, f), os.path.join(gf, stem + "_MetallicGlossAO.png"),
                         os.path.join(gf, stem + "_Normal.png"))
    return out


def load_squad(positions, rotz=0.0, clip="FightIdle"):
    """Th_Trooper (round-trip of the installed HMD) at each position, scale 1.0."""
    src = os.path.join(TRO, "05_fbx_export", "roundtrip", "Male01_ThorvaldTrooper_HMD_%s.fbx" % clip)
    texmap = trooper_mat_map()
    new = import_fbx(src)
    arm = next(o for o in new if o.type == "ARMATURE")
    meshes = [o for o in new if o.type == "MESH"]
    for o in meshes:
        for i, slot in enumerate(o.material_slots):
            if slot.material is None:
                continue
            key = next((k for k in texmap if k.lower() in slot.material.name.lower()
                        or slot.material.name.lower().replace("mat_", "") in k.lower()), None)
            if key:
                o.material_slots[i].material = pbr_mat("Tro_" + key, *texmap[key])
    roots = []
    for i, p in enumerate(positions):
        root = bpy.data.objects.new("Trooper_%d" % i, None)
        bpy.context.scene.collection.objects.link(root)
        if i == 0:
            arm.parent = root
            for o in meshes:
                if o.parent is None:
                    o.parent = root
        else:
            a2 = arm.copy()
            bpy.context.scene.collection.objects.link(a2)
            a2.parent = root
            for o in meshes:
                m2 = o.copy()
                bpy.context.scene.collection.objects.link(m2)
                m2.parent = a2 if o.parent == arm else root
                for md in m2.modifiers:
                    if md.type == "ARMATURE":
                        md.object = a2
        root.location = p
        root.rotation_euler = (0, 0, rotz)
        roots.append(root)
    return roots


# ---------------------------------------------------------------- stage
def stage(px=(900, 700), world=(0.62, 0.62, 0.64), strength=1.0, sun=3.2, fill=200.0, ground=None, samples=24):
    sc = bpy.context.scene
    sc.render.engine = "BLENDER_EEVEE"
    sc.eevee.taa_render_samples = samples
    sc.render.resolution_x, sc.render.resolution_y = px
    sc.render.resolution_percentage = 100
    sc.view_settings.view_transform = "Standard"
    sc.render.image_settings.file_format = "PNG"
    sc.render.film_transparent = False
    w = bpy.data.worlds.new("World")
    sc.world = w
    w.use_nodes = True
    bg = w.node_tree.nodes["Background"]
    bg.inputs[0].default_value = (*world, 1)
    bg.inputs[1].default_value = strength
    sd = bpy.data.lights.new("Sun", type="SUN")
    sd.energy = sun
    sd.angle = math.radians(3)
    s = bpy.data.objects.new("Sun", sd)
    sc.collection.objects.link(s)
    s.rotation_euler = (math.radians(50), 0.0, math.radians(30))
    fd = bpy.data.lights.new("Fill", type="AREA")
    fd.energy = fill
    fd.size = 8.0
    f = bpy.data.objects.new("Fill", fd)
    sc.collection.objects.link(f)
    f.location = (-6, -7, 6)
    f.rotation_euler = (math.radians(55), 0.0, math.radians(-40))
    if ground is not None:
        bpy.ops.mesh.primitive_plane_add(size=200, location=(0, 0, 0))
        g = bpy.context.active_object
        g.name = "Ground"
        gm = pbr_mat("Ground", None, flat=ground)
        g.data.materials.append(gm)
    cd = bpy.data.cameras.new("Camera")
    cd.type = "ORTHO"
    cam = bpy.data.objects.new("Camera", cd)
    sc.collection.objects.link(cam)
    sc.camera = cam
    return cam


def aim(cam, target, azim_deg, elev_deg, ortho, dist=60.0):
    """Camera looking at `target` from azimuth (0 = from -Y, i.e. the drone's front; 90 = from +X) and elevation."""
    a, e = math.radians(azim_deg), math.radians(elev_deg)
    d = Vector((math.sin(a) * math.cos(e), -math.cos(a) * math.cos(e), math.sin(e)))
    t = Vector(target)
    cam.location = t + d * dist
    cam.rotation_euler = (t - cam.location).to_track_quat("-Z", "Y").to_euler()
    cam.data.ortho_scale = ortho
    cam.data.clip_end = dist * 4


def render(path):
    os.makedirs(os.path.dirname(os.path.abspath(path)), exist_ok=True)
    bpy.context.scene.render.filepath = os.path.abspath(path)
    bpy.ops.render.render(write_still=True)
    return path


def world_bounds(objs):
    dg = bpy.context.evaluated_depsgraph_get()
    lo = Vector((1e9,) * 3)
    hi = Vector((-1e9,) * 3)
    for o in objs:
        if o.type != "MESH":
            continue
        ev = o.evaluated_get(dg)
        me = ev.to_mesh()
        mw = o.matrix_world
        for v in me.vertices:
            p = mw @ v.co
            lo = Vector((min(lo.x, p.x), min(lo.y, p.y), min(lo.z, p.z)))
            hi = Vector((max(hi.x, p.x), max(hi.y, p.y), max(hi.z, p.z)))
        ev.to_mesh_clear()
    return lo, hi
