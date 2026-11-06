"""Round 15: a closed helmet with two tall antennae for Karlin (user reference 2026-11-05: rounded gunmetal helmet, copper
seam lines, open face window, breathing mask, two antennae rising from the forehead).

  blender -b --factory-startup --python 62_helmet_build.py -- --donor Warden --drop 4,5,6,7 --tag H1 [--no-antennae]

 * helmet: a vanilla unit's head-bone pieces (60_helmet_survey.py / 61_helmet_parts.py ids), minus --drop (its face plate,
   visor, skin). Moved from the donor's B_HeadJ rest onto Karlin's, then fitted by a small search over scale and offset:
   the smallest scale at which none of Karlin's skull vertices (behind the face window) is outside or within 4 mm of the
   shell. 100 % B_HeadJ (rigid). Karlin's hair (Kit_face pieces starting above z 1.85) is removed; face skin and his
   gunmetal breathing mask stay
 * paint (26b_paint.py): the donor's albedo tinted gunmetal (shading kept), copper lines along every panel's open edge -
   the reference's orange seam lines; MetallicGlossAO/normal are the donor's own (DDS -> PNG)
 * antennae: the library katana's own blade (model_projects/weapons/thorvald_katana), sliced into 18 stations along its
   length and swept along a curve per side - base just above the brow at the centre line, out to the helmet's width
   at its crown, then up ~0.38 m and slightly in at the tip. Flat face toward the front, like the reference. They use
   the katana material with Karlin's copper-hilt albedo, so the export merges them with the swords (no new material)

Reads 03_blender/nudge/B_hero_C1.blend, writes 03_blender/nudge/B_hero_<tag>.blend and renders
02_progress_photos/30_helmet/<tag>/ (close-up front/three-quarter/side like the reference, full body front).
"""
import argparse
import json
import math
import os
import subprocess
import sys

import bmesh
import bpy
from mathutils import Matrix, Vector
from mathutils.bvhtree import BVHTree

sys.path.insert(0, r"C:\Users\justi\Python\dsw_mod\.claude\skills\dsw-part-kitbash\scripts")
import dsw_parts as P  # noqa: E402

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = os.path.abspath(os.path.join(PROJ, os.pardir, os.pardir, os.pardir))
DONOR_DIR = os.path.join(PROJ, "05_fbx_export", "helmet_donors")
EXTR = r"C:\dsw_mod\extr\Character"
KATANA_BLEND = os.path.join(REPO, "model_projects", "weapons", "thorvald_katana", "Thorvald_Katana.blend")
KATANA_ALBEDO_B = os.path.join(PROJ, "04_textures", "B_katana", "Katana_Albedo_B.png")
GUNMETAL = (58, 61, 66)
COPPER = (178, 104, 52)

ap = argparse.ArgumentParser()
ap.add_argument("--donor", required=True)
ap.add_argument("--drop", default="")
ap.add_argument("--tag", required=True)
ap.add_argument("--src", default="hero_C1")
ap.add_argument("--no-antennae", action="store_true")
ap.add_argument("--rise", type=float, default=0.38, help="antenna tip height above the helmet crown (m)")
ap.add_argument("--spread", type=float, default=1.5, help="antenna tip spread, x the helmet half-width")
ap.add_argument("--base-w", type=float, default=0.034, help="antenna width at the base (m), tapering to a point")
ap.add_argument("--flatten", type=float, default=0.0,
                help="soft limit (m) on how far the helmet front may stand ahead of a plane 2 cm in front of Karlin's "
                     "face; 0 = off. H2's Imperial Trooper front cones out (beak-like; with the antennae it read as a bug)")
ap.add_argument("--flat-front", type=float, default=0.0,
                help="with --flatten: pull the front-facing surface within this half-width (m) onto the front plane")
ap.add_argument("--no-front-seam", action="store_true",
                help="no copper line down the front centre (it underlined the ridge); the crown keeps it")
ap.add_argument("--seam-cm", type=float, default=0.6, help="copper seam line width on the helmet (cm)")
a = ap.parse_args(P.script_args())
drop = {int(x) for x in a.drop.split(",") if x}
OUT_BLEND = os.path.join(PROJ, "03_blender", "nudge", "B_%s.blend" % ("hero_" + a.tag))
OUT_DIR = os.path.join(PROJ, "02_progress_photos", "30_helmet", a.tag)
OUT_TEX = os.path.join(PROJ, "04_textures", "B_helmet", a.tag)
for d in (OUT_DIR, OUT_TEX):
    os.makedirs(d, exist_ok=True)
manifest = json.load(open(os.path.join(DONOR_DIR, "manifest.json")))
info = manifest[a.donor]

bpy.ops.wm.open_mainfile(filepath=os.path.join(PROJ, "03_blender", "nudge", "B_%s.blend" % a.src))
sc = bpy.context.scene
rig = bpy.data.objects["Rig"]
action = rig.animation_data.action if rig.animation_data else None
rig.data.pose_position = "REST"
bpy.context.view_layer.update()
K_HEAD = rig.matrix_world @ rig.data.bones["B_HeadJ"].matrix_local

# --- Karlin: hair off -------------------------------------------------------------------------------------------
face = bpy.data.objects["Kit_face"]
hair = set()
for idx in P.components(face):
    if min((face.matrix_world @ face.data.vertices[i].co).z for i in idx) >= 1.85:
        hair |= set(idx)
P.delete_verts(face, hair)
print("HAIR removed %d verts" % len(hair))
skull = [face.matrix_world @ v.co for v in face.data.vertices]

# --- donor helmet -----------------------------------------------------------------------------------------------
before = set(bpy.data.objects)
bpy.ops.import_scene.fbx(filepath=info["fbx"])
new = [o for o in bpy.data.objects if o not in before]
d_arm = next(o for o in new if o.type == "ARMATURE")
D_HEAD = d_arm.matrix_world @ d_arm.data.bones["B_HeadJ"].matrix_local
dm = [o for o in new if o.type == "MESH"]
for o in bpy.context.view_layer.objects:
    o.select_set(o in dm)
bpy.context.view_layer.objects.active = dm[0]
if len(dm) > 1:
    bpy.ops.object.join()
helm = bpy.context.view_layer.objects.active
for m in list(helm.modifiers):
    helm.modifiers.remove(m)
helm.parent = None
helm.data.transform(helm.matrix_world)
helm.matrix_world = Matrix.Identity(4)
gn = {g.index: g.name for g in helm.vertex_groups}
dom = {v.index: gn[max(v.groups, key=lambda g: g.weight).group] for v in helm.data.vertices if v.groups}
bm = bmesh.new()
bm.from_mesh(helm.data)
bmesh.ops.delete(bm, geom=[f for f in bm.faces if not all(dom.get(v.index) == "B_HeadJ" for v in f.verts)],
                 context="FACES")
bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")
bm.to_mesh(helm.data)
bm.free()
comps = [c for c in P.components(helm) if len(c) >= 4]          # same ids as 61_helmet_parts.py
keep = set()
for k, idx in enumerate(comps):
    if k not in drop:
        keep |= set(idx)
P.delete_verts(helm, keep, invert=True)
for o in new:
    if o is not helm and o.name in bpy.data.objects:
        bpy.data.objects.remove(o, do_unlink=True)
helm.name = helm.data.name = "Kit_helmet"
helm.data.transform(K_HEAD @ D_HEAD.inverted())
print("HELMET %s: %d pieces kept of %d (dropped %s), %d verts" % (a.donor, len(comps) - len(drop & set(range(len(comps)))),
                                                                  len(comps), sorted(drop), len(helm.data.vertices)))

# fit: smallest scale (about the helmet centre) + offset with Karlin's skull fully inside the shell
co0 = [v.co.copy() for v in helm.data.vertices]
ctr = sum(co0, Vector()) / len(co0)
faces = [tuple(p.vertices) for p in helm.data.polygons]
back = [p for p in skull if p.y > -0.06]          # behind the face window: must be covered


def outside(s, off):
    vs = [ctr + (c - ctr) * s + off for c in co0]
    bvh = BVHTree.FromPolygons(vs, faces)
    n = 0
    for p in back:
        hit, nrm, _, dist = bvh.find_nearest(p, 0.05)
        if hit is not None and ((p - hit).dot(nrm) > 0 or dist < 0.004):
            n += 1
    return n


best = None
for s in [1.0 + 0.03 * i for i in range(12)]:
    for dz in (-0.02, 0.0, 0.02, 0.04):
        for dy in (-0.02, 0.0, 0.02):
            n = outside(s, Vector((0, dy, dz)))
            key = (n, s, abs(dz) + abs(dy))
            if best is None or key < best[0]:
                best = (key, s, Vector((0, dy, dz)))
    if best[0][0] == 0:
        break
(_, s, off) = best
for v, c in zip(helm.data.vertices, co0):
    v.co = ctr + (c - ctr) * s + off
helm.data.update()
print("FIT scale %.2f offset %s -> %d skull verts outside the shell" % (s, tuple(round(x, 3) for x in off), best[0][0]))
if a.flatten > 0:
    # front plane: 2 cm ahead of the most forward face/mask point at the helmet's height; anything further forward is
    # pulled back with d' = f * tanh(d / f) - a soft clamp, so the cone becomes a flat front without a crease
    zs_h = [v.co.z for v in helm.data.vertices]
    zlo = min(zs_h)
    face_front = min(p.y for p in skull if p.z >= zlo)
    plane = face_front - 0.02
    moved, deepest = 0, 0.0
    for v in helm.data.vertices:
        d = plane - v.co.y
        if d > 0:
            deepest = max(deepest, d)
            v.co.y = plane - a.flatten * math.tanh(d / a.flatten)
            moved += 1
    if a.flat_front:
        # H2's front is a wedge (centre 4.7 cm ahead of the surface 4 cm to the side - checked on the open edge), so
        # flattening the tip alone kept a prow. Front-facing surface within --flat-front of the centre line is pulled
        # forward onto the same plane, weight (1 - (|x|/W)^4) so the corners stay round
        W = a.flat_front
        normals = {v.index: v.normal.copy() for v in helm.data.vertices}
        pulled = 0
        for v in helm.data.vertices:
            if v.co.y > plane and v.co.y < plane + 0.07 and abs(v.co.x) < W and normals[v.index].y < -0.25:
                w = (1 - (abs(v.co.x) / W) ** 4) * min(1.0, -normals[v.index].y / 0.6)
                v.co.y = v.co.y + w * (plane - v.co.y)
                pulled += 1
        print("FLAT FRONT width %.2f m: %d verts pulled onto the plane" % (W, pulled))
    helm.data.update()
    print("FLATTEN plane y %.3f (face front %.3f): %d verts, cone stood %.1f cm ahead -> now <= %.1f cm" % (
        plane, face_front, moved, deepest * 100, a.flatten * 100))
helm.vertex_groups.clear()
helm.vertex_groups.new(name="B_HeadJ").add([v.index for v in helm.data.vertices], 1.0, "REPLACE")

# --- helmet textures: gunmetal + copper seams (26b_paint.py), MGA/normal from the donor -------------------------
mat = helm.material_slots[0].material.copy()
helm.data.materials.clear()
helm.data.materials.append(mat)
for p in helm.data.polygons:
    p.material_index = 0
mat.name = "Mat_Helmet"
src_alb = next(iter(info["albedos"].values()))
stem = os.path.basename(src_alb).split("__", 1)[1].replace("_Albedo.png", "")
src_rel = {
    "Warden": "Atreide/Unit/Warden", "ImpTrooper": "Imperial/Trooper", "FlameThrower": "Imperial/FlameThrower",
    "AtreidesSoldier": "Atreide/Unit/Soldier", "Suboid": "Vernius/Unit/Suboid", "HeavyWeapon": "Atreide/Unit/HeavyWeaponSquad",
}[a.donor]
maps = {}
for kind in ("MetallicGlossAO", "Normal"):
    dds = os.path.join(EXTR, src_rel, "%s_%s.png" % (stem, kind))
    if not os.path.exists(dds):                      # FlameThrower ships MetallicGlossAOEmiss
        dds = os.path.join(EXTR, src_rel, "%s_%sEmiss.png" % (stem, kind))
    png = os.path.join(OUT_TEX, "helmet_%s.png" % kind)
    subprocess.run(["python", "-c", "from PIL import Image; Image.open(r'%s').convert('RGBA').save(r'%s')" % (dds, png)],
                   check=True)
    maps[kind] = png
uvd = helm.data.uv_layers.active.data
img_w = 512
try:
    img_w = bpy.data.images.load(src_alb, check_existing=True).size[0]
except RuntimeError:
    pass
ef = {}
for p in helm.data.polygons:
    for k in p.edge_keys:
        ef[k] = ef.get(k, 0) + 1
segs, dens = [], []
front_y = min(v.co.y for v in helm.data.vertices)
for p in helm.data.polygons:
    li = list(p.loop_indices)
    for n in range(len(li)):
        l0, l1 = helm.data.loops[li[n]], helm.data.loops[li[(n + 1) % len(li)]]
        va, vb = helm.data.vertices[l0.vertex_index].co, helm.data.vertices[l1.vertex_index].co
        if a.no_front_seam and abs(va.x) < 0.006 and abs(vb.x) < 0.006 and min(va.y, vb.y) < front_y + 0.06:
            continue
        if ef[tuple(sorted((l0.vertex_index, l1.vertex_index)))] == 1:
            u0, u1 = uvd[li[n]].uv, uvd[li[(n + 1) % len(li)]].uv
            segs.append([list(u0), list(u1)])
            L3 = (helm.data.vertices[l0.vertex_index].co - helm.data.vertices[l1.vertex_index].co).length
            if L3 > 1e-4:
                dens.append((u1 - u0).length * img_w / L3)
dens.sort()
width = max(2, int(2 * a.seam_cm / 100 * dens[len(dens) // 2])) if dens else 3
polys = [[list(uvd[l].uv) for l in p.loop_indices] for p in helm.data.polygons]
out_alb = os.path.join(OUT_TEX, "helmet_Albedo.png")
spec = os.path.join(OUT_TEX, "paint_jobs.json")
json.dump([dict(src=src_alb, out=out_alb,
                fills=[dict(name="helmet", polys=polys, colour=GUNMETAL, contrast=0.9, lo=0.55, hi=1.45)],
                lines=[dict(name="seams", segs=segs, width=width, colour=COPPER)])], open(spec, "w"))
r = subprocess.run(["python", os.path.join(HERE, "26b_paint.py"), spec], capture_output=True, text=True)
print(r.stdout.strip(), r.stderr.strip()[-400:])
nt = mat.node_tree
nt.nodes.clear()
bsdf = nt.nodes.new("ShaderNodeBsdfPrincipled")
outn = nt.nodes.new("ShaderNodeOutputMaterial")
nt.links.new(bsdf.outputs[0], outn.inputs[0])
for kind, path in (("Albedo", out_alb), ("MetallicGlossAO", maps["MetallicGlossAO"]), ("Normal", maps["Normal"])):
    t = nt.nodes.new("ShaderNodeTexImage")
    t.image = bpy.data.images.load(path, check_existing=False)
    t.image.name = "helmet_%s.png" % kind
    t.image.pack()
    if kind == "Albedo":
        nt.links.new(t.outputs["Color"], bsdf.inputs["Base Color"])
    elif kind == "MetallicGlossAO":
        t.image.colorspace_settings.name = "Non-Color"
        nt.links.new(t.outputs["Color"], bsdf.inputs["Specular IOR Level"])
    else:
        t.image.colorspace_settings.name = "Non-Color"
        nm = nt.nodes.new("ShaderNodeNormalMap")
        nt.links.new(t.outputs["Color"], nm.inputs["Color"])
        nt.links.new(nm.outputs["Normal"], bsdf.inputs["Normal"])
bsdf.inputs["Roughness"].default_value = 0.45
bsdf.inputs["Metallic"].default_value = 0.35
print("SEAMS %d open edges, line %d px" % (len(segs), width))
added = [helm]

# --- antennae from the katana blade -------------------------------------------------------------------------------
if not a.no_antennae:
    with bpy.data.libraries.load(KATANA_BLEND, link=False) as (src, dst):
        dst.objects = ["Thorvald_Katana"]
    kat = dst.objects[0]
    hp = [v.co for v in helm.data.vertices]
    top = max(p.z for p in hp)
    front = min(p.y for p in hp)
    half_w = (max(p.x for p in hp) - min(p.x for p in hp)) / 2
    # blade only (the hilt is local +Y from the grip at 0.144), sliced into stations so it can bend
    bm = bmesh.new()
    bm.from_mesh(kat.data)
    # cut AT the guard first: the blade's long faces run up into the hilt, so deleting hilt verts alone took the
    # blade with it (H1's first build kept only the 0.19 m tip)
    bmesh.ops.bisect_plane(bm, geom=bm.verts[:] + bm.edges[:] + bm.faces[:], plane_co=(0, -0.04, 0),
                           plane_no=(0, 1, 0), clear_outer=True)
    ys = [v.co.y for v in bm.verts]
    y0, y1 = max(ys), min(ys)
    for k in range(1, 18):
        y = y0 + (y1 - y0) * k / 18
        geom = bm.verts[:] + bm.edges[:] + bm.faces[:]
        bmesh.ops.bisect_plane(bm, geom=geom, plane_co=(0, y, 0), plane_no=(0, 1, 0))
    blade = bpy.data.meshes.new("antenna_src")
    bm.to_mesh(blade)
    bm.free()
    xs = [v.co.x for v in blade.vertices]
    zs = [v.co.z for v in blade.vertices]
    bx, bz = (max(xs) + min(xs)) / 2, (max(zs) + min(zs)) / 2
    # the blade's broad face must face the front (H1 first try assumed local x = width and showed the edge)
    wide_is_x = (max(xs) - min(xs)) >= (max(zs) - min(zs))
    byst = {}
    for v in blade.vertices:
        byst.setdefault(round(v.co.y, 3), []).append(v.co)
    stations = []
    for yk, cs in sorted(byst.items()):
        wv = [(c.x if wide_is_x else c.z) for c in cs]
        tv = [(c.z if wide_is_x else c.x) for c in cs]
        stations.append((yk, (max(wv) + min(wv)) / 2, (max(tv) + min(tv)) / 2, max((max(wv) - min(wv)) / 2, 1e-4)))
    print("BLADE section x %.3f z %.3f m -> width axis %s" % (max(xs) - min(xs), max(zs) - min(zs),
                                                              "x" if wide_is_x else "z"))
    katmat = kat.material_slots[0].material.copy()
    if os.path.exists(KATANA_ALBEDO_B):
        img = bpy.data.images.get("Katana_Albedo_B") or bpy.data.images.load(KATANA_ALBEDO_B)
        img.name = "Katana_Albedo_B"
        img.pack()
        for nd in katmat.node_tree.nodes:
            if nd.type == "TEX_IMAGE" and nd.image and "albedo" in nd.image.name.lower():
                nd.image = img

    def bez(p, t):
        u = 1 - t
        return p[0] * u ** 3 + p[1] * 3 * u * u * t + p[2] * 3 * u * t * t + p[3] * t ** 3

    for side in (1, -1):
        ctl = [Vector((0.014 * side, front + 0.012, top - 0.085)),
               Vector((0.085 * side, front + 0.010, top - 0.02)),
               Vector((1.05 * half_w * side, front + 0.03, top + 0.16)),
               Vector((a.spread * 0.95 * half_w * side, front + 0.06, top + a.rise))]
        L = sum((bez(ctl, (i + 1) / 40) - bez(ctl, i / 40)).length for i in range(40))
        me = blade.copy()
        for v in me.vertices:
            t = (y0 - v.co.y) / (y0 - y1)
            st = stations[min(range(len(stations)), key=lambda i: abs(stations[i][0] - v.co.y))]
            c = bez(ctl, t)
            tang = (bez(ctl, min(t + 0.01, 1)) - bez(ctl, max(t - 0.01, 0))).normalized()
            wdir = tang.cross(Vector((0, 1, 0))).normalized()            # across, in the front view plane
            tdir = wdir.cross(tang).normalized()                          # thickness, toward the viewer
            # per-slice centre and half-width: the katana's own 3.5 cm curve is NOT width (H1 third try read it as
            # width and came out as wide square "rabbit ears"); width follows a set taper, base -> point
            _, cw, ct, hw = st
            w_rel = ((v.co.z if not wide_is_x else v.co.x) - cw) / max(hw, 1e-4)
            t_off = (v.co.x if not wide_is_x else v.co.z) - ct
            half = a.base_w / 2 * (1 - t) + 0.002 * t
            v.co = c + wdir * w_rel * half * side + tdir * t_off
        ob = bpy.data.objects.new("Kit_antenna_%s" % ("l" if side > 0 else "r"), me)
        bpy.context.collection.objects.link(ob)
        ob.data.materials.clear()
        ob.data.materials.append(katmat)
        if side < 0:
            me.flip_normals()
        ob.vertex_groups.new(name="B_HeadJ").add([v.index for v in me.vertices], 1.0, "REPLACE")
        added.append(ob)
        print("ANTENNA %s: %d verts, length %.2f m (blade %.2f m), tip at %s" % (
            ob.name, len(me.vertices), L, y0 - y1, tuple(round(x, 3) for x in ctl[3])))
    bpy.data.objects.remove(kat, do_unlink=True)

for ob in added:
    P.attach_to_rig(ob, rig)
rig.data.pose_position = "POSE"
if action is not None:
    rig.animation_data.action = action
bpy.context.view_layer.update()
P.purge_orphans()

# --- renders: close-ups like the reference, and the full figure --------------------------------------------------
P.setup_scene(sc)
cams = P.render_views(sc, OUT_DIR, "B_hero_%s" % a.tag, "posed")
rig.data.pose_position = "REST"
bpy.context.view_layer.update()
cam = bpy.data.objects.new("CloseCam", bpy.data.cameras.new("CloseCam"))
cam.data.type = "ORTHO"
cam.data.ortho_scale = 1.0
sc.collection.objects.link(cam)
c = Vector((0, 0, 2.08))
for name, d in (("close_front", (0, -1, 0.05)), ("close_tq", (0.7, -0.7, 0.1)), ("close_side", (1, 0, 0.05)),
                ("close_back", (0, 1, 0.1))):
    cam.location = c + Vector(d).normalized() * 3
    cam.rotation_euler = (c - cam.location).to_track_quat("-Z", "Y").to_euler()
    sc.camera = cam
    sc.render.filepath = os.path.join(OUT_DIR, "%s.png" % name)
    bpy.ops.render.render(write_still=True)
rig.data.pose_position = "POSE"
sc.camera = cams["tq"]
sc.frame_set(sc.frame_start)
bpy.ops.wm.save_as_mainfile(filepath=OUT_BLEND)
print("SAVED", OUT_BLEND)
