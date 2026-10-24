"""Kitbash v2: Gurney's body + the Ravager's hood/mask head, recoloured black.

    blender -b --python 11_kitbash_gurney_ravager_helm.py -- [--shots]

v1 (kitbash_ravager_gurney.py) stacked two COMPLETE bodies at the same origin,
so Gurney's face poked through the Ravager hood and the two bodies z-fought.
v2 builds ONE character:

  * body   = Gurney with every head-weighted face removed (his face/hair)
  * helmet = the Ravager's head-weighted faces (hood, mask, neck), split out of
             the Ravager mesh into its own object with its own material
  * both ride on ONE shared armature (identical Male01 rig)
  * Gurney's green is recoloured black (10_recolour_gurney_black.py)
"""
import os
import sys

import bmesh
import bpy
from mathutils import Vector

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import blender_scene as bs  # noqa: E402
from dsw_core import script_args  # noqa: E402

argv = script_args()
PROJ = os.path.dirname(HERE)
IN = os.path.join(PROJ, "01_input")
TEX = os.path.join(PROJ, "04_textures")
OUT = os.path.join(PROJ, "03_blender", "Gurney_Ravager_Helm_Black.blend")
SHOTS = os.path.join(PROJ, "02_progress_photos", "04_showcase")
STAGE = os.path.join(PROJ, "02_progress_photos", "02_removed")

HELM_BONES = {"B_HeadJ", "B_Neck01J"}
GURNEY_CUT_BONES = {"B_HeadJ"}


def import_new(path):
    before = {o.name for o in bpy.data.objects}
    bpy.ops.import_scene.fbx(filepath=os.path.abspath(path))
    bpy.context.view_layer.update()
    new = [o for o in bpy.data.objects if o.name not in before]
    for o in list(new):
        if o.name.split(".")[0] in bs.JUNK_NAMES and o.type in ("MESH", "CAMERA", "LIGHT"):
            bpy.data.objects.remove(o, do_unlink=True)
            new.remove(o)
    meshes = [o for o in new if o.type == "MESH"]
    rig = [o for o in new if o.type == "ARMATURE"][0]
    return max(meshes, key=lambda o: len(o.data.polygons)), rig


def dominant_bone(obj):
    names = {g.index: g.name for g in obj.vertex_groups}
    dom = {}
    for v in obj.data.vertices:
        if v.groups:
            dom[v.index] = names[max(v.groups, key=lambda x: x.weight).group]
    return dom


def keep_faces(obj, predicate):
    """Delete every face of `obj` (and orphaned verts) for which predicate is False."""
    dom = dominant_bone(obj)
    bm = bmesh.new()
    bm.from_mesh(obj.data)
    bm.faces.ensure_lookup_table()
    kill = [f for f in bm.faces if not predicate([dom.get(v.index) for v in f.verts])]
    bmesh.ops.delete(bm, geom=kill, context="FACES")
    # drop loose verts/edges left behind
    loose = [v for v in bm.verts if not v.link_faces]
    bmesh.ops.delete(bm, geom=loose, context="VERTS")
    bm.to_mesh(obj.data)
    bm.free()
    obj.data.update()
    return len(kill)


bs.reset_scene()

# ---- Gurney body ----------------------------------------------------------
gurney, g_rig = import_new(os.path.join(IN, "Gurney", "Male01_AtreidesGurney.fbx"))
gurney.name, gurney.data.name = "Gurney Body", "Gurney Body Mesh"
g_rig.name = "Armature"
n0 = len(gurney.data.polygons)
cut = keep_faces(gurney, lambda ds: not any(d in GURNEY_CUT_BONES for d in ds))
print("GURNEY faces %d -> removed %d head faces -> %d" % (n0, cut, len(gurney.data.polygons)))

# ---- Ravager helmet (head faces only) -------------------------------------
rav, r_rig = import_new(os.path.join(IN, "Ravager_Melee_TRUE_FBX.fbx"))
rav.name, rav.data.name = "Ravager Helmet", "Ravager Helmet Mesh"
n0 = len(rav.data.polygons)
removed = keep_faces(rav, lambda ds: all(d in HELM_BONES for d in ds))
print("RAVAGER faces %d -> helmet keeps %d" % (n0, len(rav.data.polygons)))
rav.parent = g_rig
rav.parent_type = "OBJECT"
for m in rav.modifiers:
    if m.type == "ARMATURE":
        m.object = g_rig
bpy.data.objects.remove(r_rig, do_unlink=True)
bpy.context.view_layer.update()

# ---- textures --------------------------------------------------------------
bs_wired = []
for body, tex_dir, stem, albedo in (
    (gurney, os.path.join(IN, "Gurney"), "Gurney", os.path.join(TEX, "Gurney_Black_Albedo.png")),
    (rav, IN, "Ravager", os.path.join(IN, "Ravager_Albedo.png")),
):
    wanted = {"Base Color": albedo,
              "Specular IOR Level": os.path.join(tex_dir, stem + "_MetallicGlossAO.png"),
              "Normal": os.path.join(tex_dir, stem + "_Normal.png")}
    if stem == "Gurney":
        wanted["Emissive"] = os.path.join(tex_dir, "Gurney_Emissive.png")
    for mat in body.data.materials:
        if mat and mat.use_nodes:
            for sock, name, _ in bs.wire_textures(mat, wanted):
                print("   %-10s %-20s <- %s" % (stem, sock, name))

# ---- scene -----------------------------------------------------------------
bs.setup_world(strength=1.8, color=(0.55, 0.58, 0.64))
bs.setup_lights(sun_energy=3.0, fill_energy=120)
bs.setup_render(1000, 1300)
g_rig.show_in_front = True
for img in list(bpy.data.images):
    if img.users == 0:
        bpy.data.images.remove(img)
print("packed", bs.pack_all_images())

lo, hi = bs.model_bounds(gurney)
hlo, hhi = bs.model_bounds(rav)
lo = Vector((min(lo.x, hlo.x), min(lo.y, hlo.y), min(lo.z, hlo.z)))
hi = Vector((max(hi.x, hhi.x), max(hi.y, hhi.y), max(hi.z, hhi.z)))
centre = (lo + hi) / 2
scale = (hi.z - lo.z) * 1.12


def shot(path, direction, target=None, ortho=None, size=None):
    if size:
        bs.setup_render(*size)
    cam = bs.setup_camera(target=target or centre, ortho_scale=ortho or scale,
                          direction=direction, distance=(ortho or scale) * 2.5)
    bs.render_to(path, cam)
    bpy.data.objects.remove(cam, do_unlink=True)


os.makedirs(os.path.dirname(OUT), exist_ok=True)
os.makedirs(SHOTS, exist_ok=True)
os.makedirs(STAGE, exist_ok=True)
head = Vector((0.0, 0.0, 1.72))
if "--shots" in argv:
    for tag, d in (("front", (0, -1, 0)), ("tq", (0.7, -0.7, 0)), ("back", (0, 1, 0))):
        shot(os.path.join(SHOTS, "GurneyRavagerHelm_%s.png" % tag), d, size=(1000, 1300))
        shot(os.path.join(STAGE, "head_%s.png" % tag), d, target=head, ortho=0.7, size=(900, 900))

bs.setup_render(1000, 1300)
cam = bs.setup_camera(target=centre, ortho_scale=scale, direction=(0.7, -0.7, 0.0),
                      distance=scale * 2.5)
bpy.ops.wm.save_as_mainfile(filepath=os.path.abspath(OUT), compress=True)
print("SAVED", OUT, "%.2f MB" % (os.path.getsize(OUT) / 1e6))
print("TRIS body %d helmet %d" % (len(gurney.data.polygons), len(rav.data.polygons)))
