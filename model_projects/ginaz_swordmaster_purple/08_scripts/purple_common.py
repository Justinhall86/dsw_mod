"""Shared helpers for the purple Ginaz Swordmaster project.

Imported by the step scripts executed inside Blender (via the MCP bridge).
Provides: paths, camera/light rig, ortho renders, part analysis.
"""
import bpy
import os
from mathutils import Vector

PROJ = r"C:/Users/justi/OneDrive/Python/dsw_mod/model_projects/ginaz_swordmaster_purple"
PHOTOS = os.path.join(PROJ, "02_progress_photos")
TEX = os.path.join(PROJ, "04_textures")
BLEND_DIR = os.path.join(PROJ, "03_blender")
EXPORT_DIR = os.path.join(PROJ, "05_fbx_export")

MESH_NAME = "GinazSwordmaster"
ARM_NAME = "Armature"


def ensure_dir(p):
    if not os.path.isdir(p):
        os.makedirs(p, exist_ok=True)
    return p


def stage_dir(stage):
    return ensure_dir(os.path.join(PHOTOS, stage))


# ---------------------------------------------------------------- scene setup
def get_mesh():
    return bpy.data.objects.get(MESH_NAME)


def get_arm():
    return bpy.data.objects.get(ARM_NAME)


def setup_render_scene(res=900, samples=16):
    """Ortho camera + sun + bright world so textured EEVEE previews look right."""
    scene = bpy.context.scene
    for eng in ('BLENDER_EEVEE_NEXT', 'BLENDER_EEVEE'):
        try:
            scene.render.engine = eng
            break
        except TypeError:
            continue
    try:
        scene.eevee.taa_render_samples = samples
    except Exception:
        pass
    scene.render.resolution_x = res
    scene.render.resolution_y = res
    scene.render.resolution_percentage = 100
    scene.render.film_transparent = False
    scene.view_settings.view_transform = 'Standard'

    # world
    world = scene.world or bpy.data.worlds.new("World")
    scene.world = world
    world.use_nodes = True
    bg = world.node_tree.nodes.get("Background")
    if bg:
        bg.inputs[0].default_value = (0.28, 0.28, 0.30, 1.0)
        bg.inputs[1].default_value = 1.6

    # key + fill lights
    for name, loc, energy, ang in (
        ("Key", (2.2, -2.6, 2.4), 3.0, 0.25),
        ("Fill", (-2.6, -1.6, 1.2), 1.1, 0.6),
        ("Rim", (0.4, 3.0, 2.2), 1.6, 0.5),
    ):
        l = bpy.data.lights.get("P_" + name) or bpy.data.lights.new("P_" + name, 'SUN')
        l.energy = energy
        l.angle = ang
        ob = bpy.data.objects.get("P_" + name)
        if ob is None:
            ob = bpy.data.objects.new("P_" + name, l)
            bpy.context.scene.collection.objects.link(ob)
        ob.location = loc
        d = Vector((0, 0, 0.9)) - Vector(loc)
        ob.rotation_euler = d.to_track_quat('-Z', 'Y').to_euler()

    cam = bpy.data.objects.get("P_Cam")
    if cam is None:
        cd = bpy.data.cameras.new("P_Cam")
        cam = bpy.data.objects.new("P_Cam", cd)
        bpy.context.scene.collection.objects.link(cam)
    cam.data.type = 'ORTHO'
    scene.camera = cam
    return cam


def aim_camera(cam, target=(0, 0, 0.95), azimuth=0.0, height=1.05, ortho_scale=2.2):
    """Place an ortho camera on a circle around the target, looking at it."""
    import math
    t = Vector(target)
    pos = Vector((math.sin(azimuth) * height, -math.cos(azimuth) * height, t.z + 0.02))
    cam.location = pos
    cam.data.ortho_scale = ortho_scale
    cam.rotation_euler = (t - pos).to_track_quat('-Z', 'Y').to_euler()


def render_to(path, cam=None, res=900):
    ensure_dir(os.path.dirname(path))
    if cam is None:
        cam = setup_render_scene()
    bpy.context.scene.render.filepath = path
    bpy.ops.render.render(write_still=True)
    return path


def render_views(tag, azimuths=(0.0, 90.0, 180.0, 270.0), target=(0, 0, 0.95),
                 ortho_scale=2.2, res=900, height=1.05):
    """Render front/left/back/right of the whole character."""
    cam = setup_render_scene(res=res)
    out = []
    names = {0.0: "front", 90.0: "left", 180.0: "back", 270.0: "right"}
    for az in azimuths:
        aim_camera(cam, target=target, azimuth=az, ortho_scale=ortho_scale, height=height)
        p = os.path.join(stage_dir(tag), "%s_%s.png" % (tag, names.get(az, str(az))))
        render_to(p, cam, res)
        out.append(p)
    return out


# ---------------------------------------------------------------- analysis
def weight_of(obj, vg_name):
    """Max weight of a vertex group for a vertex index."""
    vg = obj.vertex_groups.get(vg_name)
    if vg is None:
        return 0.0
    for g in v.groups:
        if g.group == vg.index:
            return g.weight
    return 0.0


def part_report(obj, groups):
    """Report vertex counts and bbox per bone group (weight > thresh)."""
    rep = {}
    for gname in groups:
        vg = obj.vertex_groups.get(gname)
        if vg is None:
            rep[gname] = {"exists": False}
            continue
        idxs = [v.index for v in obj.data.vertices
                if any(g.group == vg.index and g.weight > 0.5 for g in v.groups)]
        if not idxs:
            rep[gname] = {"exists": True, "count": 0}
            continue
        co = [obj.data.vertices[i].co for i in idxs]
        mn = [min(c[k] for c in co) for k in range(3)]
        mx = [max(c[k] for c in co) for k in range(3)]
        rep[gname] = {"count": len(idxs), "min": [round(x, 3) for x in mn],
                      "max": [round(x, 3) for x in mx]}
    return rep


def mesh_bbox(obj):
    co = [v.co for v in obj.data.vertices]
    return {"min": [round(min(c[k] for c in co), 3) for k in range(3)],
            "max": [round(max(c[k] for c in co), 3) for k in range(3)]}


def separated_objects(obj, group_map, names):
    """Split a mesh object into separate objects by vertex-group membership.

    group_map: {new_name: [bone names]} - a vertex goes to the first group it
    matches (highest weight wins), unmatched vertices go to 'rest'.
    """
    out = []
    vgs = {n: obj.vertex_groups.get(n) for n in obj.vertex_groups.keys()}
    assign = {}
    for v in obj.data.vertices:
        best_name, best_w = "rest", 0.0
        for gname, bones in group_map.items():
            for b in bones:
                vg = vgs.get(b)
                if vg is None:
                    continue
                w = 0.0
                for g in v.groups:
                    if g.group == vg.index and g.weight > w:
                        w = g.weight
                if w > best_w:
                    best_name, best_w = gname, w
        assign.setdefault(best_name, []).append(v.index)

    for gname, idxs in assign.items():
        if not idxs:
            continue
        bpy.ops.object.select_all(action='DESELECT')
        obj.select_set(True)
        bpy.context.view_layer.objects.active = obj
        bpy.ops.object.mode_set(mode='EDIT')
        bpy.ops.mesh.select_all(action='DESELECT')
        bpy.ops.mesh.select_non_manifold(only_wire=False)  # no-op, keeps context
        # select the target verts
        for v in obj.data.vertices:
            v.select = v.index in set(idxs)
        bpy.ops.mesh.delete(type='VERTS')
        bpy.ops.object.mode_set(mode='OBJECT')
        newname = names.get(gname, gname)
        obj.name = newname
        obj.data.name = newname
        out.append(newname)
    return out
