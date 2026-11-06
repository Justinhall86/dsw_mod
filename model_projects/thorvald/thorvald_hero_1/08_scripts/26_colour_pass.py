"""Round 14 colour pass for B (Karlin): matte black waist cloth with a dark orange trim, dark orange armour segments.

  blender -b --factory-startup --python 26_colour_pass.py -- --src hero_M4 --tag C2 --orange lame,bracers

  * waist cloth = Kit_apron (the sash round the waist + the front and back apron panels): matte black, the painted
    folds kept at half contrast; a dark orange trim band (~2.5 cm on the cloth) along every open hem; its
    MetallicGlossAO gets metal 0 / gloss 25 over the cloth so it reads as fabric, not lacquer
  * --orange: which armour segments turn dark orange (copper rim texels are kept, so the rims still read):
      knees   the knee cops (Kit_leg_0, KneeJ-dominant front pieces)
      chest   the hexagonal chest plate (Iakin, the two big SpineTopJ front halves)
      lame    the middle lame of each pauldron stack (Kit_lame_1; own material + texture, the shell stays iron)
      bracers the Elite forearm armour (Kit_bracers, its Gurney-textured faces)
  * skin is in 21_recolour_face.py (round 14: a shade darker); the face texture is re-applied here

Reads 03_blender/nudge/B_<src>.blend (27_motion_pass.py), writes 03_blender/nudge/B_hero_<tag>.blend and renders
02_progress_photos/21_colour_motion/<tag>/. Painting is done by 26b_paint.py in system Python.
"""
import argparse
import json
import os
import statistics
import subprocess
import sys
from collections import defaultdict

import bpy

sys.path.insert(0, r"C:\Users\justi\Python\dsw_mod\.claude\skills\dsw-part-kitbash\scripts")
import dsw_parts as P  # noqa: E402

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
FACE_ALBEDO = os.path.join(PROJ, "04_textures", "B_face_recolour", "Feydakin_Albedo_eyes_hair_mask.png")
CLOTH_BLACK = (22, 21, 20)
DARK_ORANGE = (132, 52, 16)        # first try (150,62,20) rendered too bright on the knee cops and chest
TRIM_M = 0.025

ap = argparse.ArgumentParser()
ap.add_argument("--src", required=True)
ap.add_argument("--tag", required=True)
ap.add_argument("--orange", default="lame,bracers")
ap.add_argument("--no-render", action="store_true")
a = ap.parse_args(P.script_args())
orange = set(x for x in a.orange.split(",") if x)
OUT_BLEND = os.path.join(PROJ, "03_blender", "nudge", "B_hero_%s.blend" % a.tag)
OUT_TEX = os.path.join(PROJ, "04_textures", "B_hero_colour", a.tag)
OUT_DIR = os.path.join(PROJ, "02_progress_photos", "21_colour_motion", a.tag)
for d in (OUT_TEX, OUT_DIR):
    os.makedirs(d, exist_ok=True)

bpy.ops.wm.open_mainfile(filepath=os.path.join(PROJ, "03_blender", "nudge", "B_%s.blend" % a.src))
sc = bpy.context.scene
rig = bpy.data.objects["Rig"]
O = bpy.data.objects


def base_colour_node(mat):
    """The image node that really feeds Principled Base Color (walks back through mix/colour nodes)."""
    bsdf = next(n for n in mat.node_tree.nodes if n.type == "BSDF_PRINCIPLED")
    stack = [l.from_node for l in bsdf.inputs["Base Color"].links]
    while stack:
        n = stack.pop()
        if n.type == "TEX_IMAGE":
            return n
        stack += [l.from_node for i in n.inputs for l in i.links]
    return None


def mga_node(mat):
    return next((n for n in mat.node_tree.nodes if n.type == "TEX_IMAGE" and n.image
                 and "metallicgloss" in n.image.name.lower()), None)


def dump(img, path):
    """Write an image (packed or on disk) to path as its original file bytes."""
    if img.packed_file:
        open(path, "wb").write(img.packed_file.data)
    else:
        img.save(filepath=path)
    return path


def uv_polys(ob, faces):
    uv = ob.data.uv_layers.active.data
    return [[list(uv[l].uv) for l in ob.data.polygons[f].loop_indices] for f in faces]


def comp_faces(ob, pred):
    """Faces of the components for which pred(dominant bone, centre, n_verts) is true."""
    gn = {g.index: g.name for g in ob.vertex_groups}
    keep = set()
    for idx in P.components(ob):
        acc = defaultdict(float)
        for i in idx:
            for g in ob.data.vertices[i].groups:
                acc[gn[g.group]] += g.weight
        dom = max(acc, key=acc.get) if acc else ""
        c = sum((ob.data.vertices[i].co for i in idx), ob.data.vertices[0].co * 0) / len(idx)
        c = ob.matrix_world @ c
        if pred(dom, c, len(idx)):
            keep |= set(idx)
    return [p.index for p in ob.data.polygons if all(v in keep for v in p.vertices)]


def own_material(ob, slot=0):
    m = ob.material_slots[slot].material.copy()
    ob.material_slots[slot].material = m
    return m


rig.data.pose_position = "REST"
bpy.context.view_layer.update()
jobs, assign = [], []      # assign: (material, node, out path)

# --- waist cloth -----------------------------------------------------------------------------------------------
ap_ob = O["Kit_apron"]
mat = own_material(ap_ob)
node = base_colour_node(mat)
src = dump(node.image, os.path.join(OUT_TEX, "apron_src.png"))
mnode = mga_node(mat)
msrc = dump(mnode.image, os.path.join(OUT_TEX, "apron_mga_src.png")) if mnode else None
W = node.image.size[0]
edge_faces = defaultdict(int)
for p in ap_ob.data.polygons:
    for k in p.edge_keys:
        edge_faces[k] += 1
uvd = ap_ob.data.uv_layers.active.data
segs, dens = [], []
for p in ap_ob.data.polygons:
    li = list(p.loop_indices)
    for n in range(len(li)):
        l0, l1 = ap_ob.data.loops[li[n]], ap_ob.data.loops[li[(n + 1) % len(li)]]
        if edge_faces[tuple(sorted((l0.vertex_index, l1.vertex_index)))] == 1:
            u0, u1 = uvd[li[n]].uv, uvd[li[(n + 1) % len(li)]].uv
            segs.append([list(u0), list(u1)])
            L3 = (ap_ob.data.vertices[l0.vertex_index].co - ap_ob.data.vertices[l1.vertex_index].co).length
            if L3 > 1e-4:
                dens.append((u1 - u0).length * W / L3)
width = max(4, int(2 * TRIM_M * statistics.median(dens)))
print("APRON %d hem edges, %.0f px/m -> trim line %d px" % (len(segs), statistics.median(dens), width))
out = os.path.join(OUT_TEX, "apron_Albedo.png")
mout = os.path.join(OUT_TEX, "apron_MetallicGlossAO.png") if msrc else None
allp = uv_polys(ap_ob, range(len(ap_ob.data.polygons)))
jobs.append(dict(src=src, out=out, fills=[dict(name="cloth", polys=allp, colour=CLOTH_BLACK, contrast=0.5,
                                               lo=0.7, hi=1.25)],
                 lines=[dict(name="hem", segs=segs, width=width, colour=DARK_ORANGE)],
                 mga_src=msrc, mga_out=mout, mga_fill=dict(polys=allp, metal=0, gloss=25)))
assign.append((mat, node, out))
if mnode:
    assign.append((mat, mnode, mout))
bsdf = next(n for n in mat.node_tree.nodes if n.type == "BSDF_PRINCIPLED")
bsdf.inputs["Roughness"].default_value = 0.9

# --- dark orange armour segments ---------------------------------------------------------------------------------
def orange_job(ob, faces, slot, tag):
    m = own_material(ob, slot)
    nd = base_colour_node(m)
    s = dump(nd.image, os.path.join(OUT_TEX, "%s_src.png" % tag))
    o = os.path.join(OUT_TEX, "%s_Albedo.png" % tag)
    jobs.append(dict(src=s, out=o, fills=[dict(name=tag, polys=uv_polys(ob, faces), colour=DARK_ORANGE,
                                                   keep_copper=True, lo=0.6, hi=1.3)]))
    assign.append((m, nd, o))
    print("ORANGE %s: %d faces on %s" % (tag, len(faces), ob.name))


if "knees" in orange:
    ob = O["Kit_leg_0"]
    orange_job(ob, comp_faces(ob, lambda d, c, n: "KneeJ" in d and c.y < -0.03 and 0.45 < c.z < 0.7), 0, "knees")
if "chest" in orange:
    ob = O["Iakin_H_Hero_2_00"]
    chest_faces = comp_faces(ob, lambda d, c, n: d == "B_SpineTopJ" and n >= 60 and c.y < -0.2 and 1.4 < c.z < 1.6)
if "lame" in orange:
    ob = O["Kit_lame_1"]
    orange_job(ob, range(len(ob.data.polygons)), 0, "lame1")
if "bracers" in orange:
    ob = O["Kit_bracers"]
    orange_job(ob, [p.index for p in ob.data.polygons if p.material_index == 0], 0, "bracers")
if "chest" in orange:
    # the body keeps ONE albedo (shared with lame 2 and the shell), so the chest plate is painted into a copy of it
    # that the body and lame 2 both use; lame 1 (if orange) already has its own copy from above
    body = O["Iakin_H_Hero_2_00"]
    m = body.material_slots[0].material
    nd = base_colour_node(m)
    s = dump(nd.image, os.path.join(OUT_TEX, "body_src.png"))
    o = os.path.join(OUT_TEX, "body_Albedo.png")
    jobs.append(dict(src=s, out=o, fills=[dict(name="chest", polys=uv_polys(body, chest_faces), colour=DARK_ORANGE,
                                                   keep_copper=True, lo=0.6, hi=1.3)]))
    assign.append((m, nd, o))
    print("ORANGE chest: %d faces" % len(chest_faces))

spec = os.path.join(OUT_TEX, "paint_jobs.json")
json.dump(jobs, open(spec, "w"))
r = subprocess.run(["python", os.path.join(HERE, "26b_paint.py"), spec], capture_output=True, text=True)
print(r.stdout.strip(), r.stderr.strip())
if r.returncode:
    raise SystemExit("26b_paint.py failed")
for m, nd, path in assign:
    img = bpy.data.images.load(path, check_existing=False)
    img.colorspace_settings.name = nd.image.colorspace_settings.name
    img.pack()
    nd.image = img

face_img = bpy.data.images.load(FACE_ALBEDO, check_existing=False)
face_img.pack()
for slot in O["Kit_face"].material_slots:
    for nd in slot.material.node_tree.nodes:
        if nd.type == "TEX_IMAGE" and nd.image and "albedo" in nd.image.name.lower():
            nd.image = face_img

rig.data.pose_position = "POSE"
bpy.context.view_layer.update()
P.purge_orphans()
if not a.no_render:
    P.setup_scene(sc)
    cams = P.render_views(sc, OUT_DIR, "B_hero_%s" % a.tag, "posed")
    sc.camera = cams["tq"]
sc.frame_set(sc.frame_start)
bpy.ops.wm.save_as_mainfile(filepath=OUT_BLEND)
print("SAVED", OUT_BLEND)
