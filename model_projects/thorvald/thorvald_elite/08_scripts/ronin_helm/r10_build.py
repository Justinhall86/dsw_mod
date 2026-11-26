"""Ronin helm study (owner request 2026-11-19): Heavy Vanguard with everything removed from the head, the owner's Meshy
"Cyber Ronin" helmet shell (decimated, its own visor cut away) and the vanilla Atreides Ranger visor-mask recoloured copper
(owner's paint-over: white plates -> copper, green glass -> black). Skinned 100 % to B_HeadJ. STUDY ONLY: never install.

    blender -b ../../03_blender/v2_final.blend --python r10_build.py
env: TAG (default R1), TRIS (helmet triangle budget, 6000), HS (helmet scale, 0 = auto from the head width), HDX/HDY/HDZ (helmet offset, m),
     CUT_X/CUT_ZLO/CUT_ZHI/CUT_Y (face cut box in Meshy units), MS (mask scale), MDY/MDZ (mask offset), PALETTE=1 (ground_v6 body),
     HORN (hex, default copper), DESAT=1 (all colour textures but the weapons -> grey), VIEWS=none
Out: 03_blender/helmet_study/ronin_<TAG>.blend, 02_progress_photos/50_ronin_helm/<TAG>/*.png"""
import os, sys, math, bmesh, bpy
import numpy as np
from mathutils import Vector, Matrix
from mathutils.bvhtree import BVHTree
sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "helmet_study"))
import paths as P
sys.path.insert(0, P.SCENE_HELPERS)
import blender_scene as bs

E = os.environ.get
TAG = E("TAG", "R1")
OUT = P.ELITE + "/02_progress_photos/50_ronin_helm/" + TAG + "/"
os.makedirs(OUT, exist_ok=True)
GLB = P.ELITE + "/01_input/ronin_helm/Meshy_Cyber_Ronin_Helm.glb"
RANGER = P.REPO + "/model_inputs/Character/Atreide/A_Ranger/Female01_AtreideRanger_TRUE_FBX.fbx"
V6 = P.REPO + "/model_projects/thorvald/thorvald_recolours/04_textures/ground_v6/Male01_ThorvaldElite/"


def hexsrgb(h):
    """display (sRGB) values: what an 8-bit image's .pixels holds"""
    return [int(h[i:i + 2], 16) / 255 for i in (0, 2, 4)]


def hexlin(h):
    return [(int(h[i:i + 2], 16) / 255) ** 2.2 for i in (0, 2, 4)]


def _gblur(a, sig):
    """separable Gaussian blur of an HxW or HxWxC float array (numpy only: Blender's Python has no PIL)"""
    if sig <= 0:
        return a
    r = int(3 * sig + 1)
    k = np.exp(-0.5 * (np.arange(-r, r + 1) / sig) ** 2)
    k /= k.sum()
    for ax in (0, 1):
        a = np.apply_along_axis(lambda m: np.convolve(np.pad(m, r, mode="edge"), k, mode="valid"), ax, a)
    return a


rig = next(o for o in bpy.data.objects if o.type == "ARMATURE")
rig.data.pose_position = "REST"
bpy.context.view_layer.update()
E_HEAD = rig.matrix_world @ rig.data.bones["B_HeadJ"].matrix_local

# ---------- 1. strip the head: kasa hat gone, goggles gone, the head itself kept only as a neck/skull filler (culled later)
if "TrooperHat" in bpy.data.objects:
    bpy.data.objects.remove(bpy.data.objects["TrooperHat"], do_unlink=True)
head = bpy.data.objects["CommandoHead"]
gi = [i for i, m in enumerate(head.data.materials) if m and "Trim" in m.name]
hb = bmesh.new()
hb.from_mesh(head.data)
kill = [fc for fc in hb.faces if fc.material_index in gi]
bmesh.ops.delete(hb, geom=kill, context="FACES")
bmesh.ops.delete(hb, geom=[v for v in hb.verts if not v.link_faces], context="VERTS")
hb.to_mesh(head.data)
hb.free()
print("GOGGLES faces removed", len(kill))
hw = [head.matrix_world @ v.co for v in head.data.vertices]
hnames = {g.index: g.name for g in head.vertex_groups}
hskull = [head.matrix_world @ v.co for v in head.data.vertices if v.groups and hnames[max(v.groups, key=lambda x: x.weight).group] == "B_HeadJ"]
hlo = Vector([min(p[i] for p in hskull) for i in range(3)])
hhi = Vector([max(p[i] for p in hskull) for i in range(3)])
print("HEAD skull bbox", tuple(round(x, 3) for x in hlo), tuple(round(x, 3) for x in hhi))

if E("PALETTE", "1") == "1":
    for m in bpy.data.materials:
        if not m.node_tree or not m.name.startswith("Mat_"):
            continue
        stem = V6 + "ThEli" + m.name[4:].split(".")[0]
        for n in m.node_tree.nodes:
            if n.type != "TEX_IMAGE" or not n.image or any(l.to_socket.name == "Alpha" for o in n.outputs for l in o.links):
                continue
            for kind in ("Albedo", "MetallicGlossAO", "Normal"):
                if kind in n.image.name and os.path.exists(stem + "_%s.png" % kind):
                    cs = n.image.colorspace_settings.name
                    n.image = bpy.data.images.load(stem + "_%s.png" % kind, check_existing=True)
                    n.image.colorspace_settings.name = cs
                    break

# ---------- region rules (Meshy units): horns, dome, lames, gorget, plates
r_xy = lambda c: math.hypot(c.x, c.y)
PAL = {"dome": E("C_DOME", "242527"), "horn": E("HORN", "b36a36"), "lame": E("C_LAME", "2c2d30"), "rim": E("C_RIM", "b36a36"),
       "gorget": E("C_GORGET", "5d2d1d"), "plate": E("C_PLATE", "35363a")}


def region(c, n):
    if c.z > float(E("HORN_CZ", "0.46")) and c.y < float(E("HORN_CY", "-0.50")):
        return "horn"       # the crescent's middle, low over the brow in front of the dome
    if c.z > float(E("HORN_Z", "0.58")) and (abs(c.x) > float(E("HORN_X", "0.44")) or c.y < float(E("HORN_Y", "-0.48"))):
        # horn blades face front/back/up; dome faces at the same height face outward from the axis (those stay dome)
        rad = Vector((c.x, c.y, 0)).normalized() if r_xy(c) > 1e-6 else Vector((0, 0, 1))
        if abs(n.dot(rad)) < float(E("HORN_RAD", "0.75")) or (c.z > 0.80 and E("SPLIT_HORN", "0") != "1"):
            return "horn"
    if c.z < -0.38:
        return "gorget"
    if r_xy(c) > 0.60 and -0.35 < c.z < 0.40:
        # neck-guard lames; the lowest band of each lame row gets the copper rim (bold, reads at RTS zoom)
        return "rim" if (c.z < -0.12 and r_xy(c) > 0.74) else "lame"
    if c.y < -0.25 and c.z < 0.62:
        return "plate"      # cheek / brow plates left round the face opening
    return "dome"


# ---------- 2. Meshy helmet: decimate, cut its own visor/face block away
before = set(bpy.data.objects)
bpy.ops.import_scene.gltf(filepath=GLB)
helm = next(o for o in bpy.data.objects if o not in before and o.type == "MESH")
for o in [o for o in bpy.data.objects if o not in before and o is not helm]:
    bpy.data.objects.remove(o, do_unlink=True)
helm.data.transform(helm.matrix_world)
helm.parent = None
helm.matrix_world = Matrix.Identity(4)
bm = bmesh.new()
bm.from_mesh(helm.data)
bmesh.ops.remove_doubles(bm, verts=bm.verts, dist=0.002)
bm.to_mesh(helm.data)
bm.free()
def _clean(o, vox, its):
    bpy.context.view_layer.objects.active = o
    if vox > 0:
        md_ = o.modifiers.new("rm", "REMESH")
        md_.mode = "VOXEL"
        md_.voxel_size = vox
        md_.adaptivity = 0
        bpy.ops.object.modifier_apply(modifier="rm")
    if its:
        md_ = o.modifiers.new("cs", "CORRECTIVE_SMOOTH")
        md_.smooth_type = "LENGTH_WEIGHTED"
        md_.rest_source = "ORCO"
        md_.iterations = its
        md_.factor = 0.5
        md_.use_only_smooth = True
        bpy.ops.object.modifier_apply(modifier="cs")


# VOXEL / PRE_SMOOTH (owner 2026-11-20, "not AAA, jagged"): the Meshy surface is noisy (dents, crumpled crescent, ragged flange edges).
# Voxel remesh to an even grid, then volume-keeping smoothing, BEFORE the decimate: lumps go, the lame steps stay (test r31: 0.010 / 40)
_clean(helm, float(E("VOXEL", "0")), int(E("PRE_SMOOTH", "0")))
print("HELMET after remesh/smooth: faces", len(helm.data.polygons))
# SPLIT_HORN=1 (owner 2026-11-20, jagged/blotchy crescent): the Meshy helm is ONE piece with the crescents fused into the dome, so the
# copper border was a per-texel guess. On the full-res mesh: front crescent faces -> own object (solid copper material), rear crescent
# deleted, holes capped on both; done on the remeshed/smoothed shell (a remesh after the split broke the capped dome into fragments).
cres = None
if E("SPLIT_HORN", "0") == "1":
    bm = bmesh.new()
    bm.from_mesh(helm.data)
    hf = [f for f in bm.faces if region(f.calc_center_median(), f.normal) == "horn"]
    hy = sorted(f.calc_center_median().y for f in hf)
    gmax, gi_ = max((hy[i + 1] - hy[i], i) for i in range(len(hy) - 1))
    split = float(E("HORN_SPLIT", (hy[gi_] + hy[gi_ + 1]) / 2))
    front = [f for f in hf if f.calc_center_median().y < split]
    # clean the selection outline on the face graph (the rule's border crosses near-parallel surfaces -> drips and slivers):
    # closing (grow, shrink) fills pinholes, opening (shrink, grow) removes slivers, then only the biggest piece is kept
    bm.faces.ensure_lookup_table()
    nbr = {f: {g for v in f.verts for g in v.link_faces if g is not f} for f in bm.faces}
    def _grow(S, k):
        for _ in range(k):
            S = S | {g for f in S for g in nbr[f]}
        return S
    def _shrink(S, k):
        for _ in range(k):
            S = {f for f in S if nbr[f] <= S}
        return S
    MK = int(E("HORN_MORPH", "3"))
    S = _shrink(_grow(set(front), MK), MK)
    S = _grow(_shrink(S, MK), MK) & S
    comps, left = [], set(S)
    while left:
        st = [left.pop()]
        comp = set(st)
        while st:
            f = st.pop()
            for g in nbr[f]:
                if g in left:
                    left.discard(g)
                    comp.add(g)
                    st.append(g)
        comps.append(comp)
    front = list(max(comps, key=len)) if comps else []
    hf = list(set(hf) - set(f for f in hf if f.calc_center_median().y < split) | set(front))   # rear crescent + cleaned front
    print("SPLIT_HORN cleaned front faces", len(front), "pieces", len(comps))
    print("SPLIT_HORN horn faces", len(hf), "front", len(front), "split y %.3f gap %.3f" % (split, gmax))
    cb = bmesh.new()
    vmap = {}
    for f in front:
        vs = []
        for v in f.verts:
            if v not in vmap:
                vmap[v] = cb.verts.new(v.co)
            vs.append(vmap[v])
        cb.faces.new(vs)
    bmesh.ops.holes_fill(cb, edges=[e for e in cb.edges if e.is_boundary], sides=0)
    bmesh.ops.triangulate(cb, faces=[f for f in cb.faces if len(f.verts) > 4])
    cme = bpy.data.meshes.new("Kit_ronincrescent")
    cb.to_mesh(cme)
    cb.free()
    cres = bpy.data.objects.new("Kit_ronincrescent", cme)
    bpy.context.scene.collection.objects.link(cres)
    bmesh.ops.delete(bm, geom=hf, context="FACES")
    bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")
    bmesh.ops.holes_fill(bm, edges=[e for e in bm.edges if e.is_boundary], sides=0)
    bmesh.ops.triangulate(bm, faces=[f for f in bm.faces if len(f.verts) > 4])
    bm.to_mesh(helm.data)
    bm.free()


if cres is not None:
    _clean(cres, float(E("CRES_VOXEL", "0")), int(E("CRES_SMOOTH", "10")))
    md_ = cres.modifiers.new("dec", "DECIMATE")
    md_.ratio = float(E("CRES_TRIS", "700")) / max(1, len(cres.data.polygons))
    bpy.context.view_layer.objects.active = cres
    bpy.ops.object.modifier_apply(modifier="dec")
    for p_ in cres.data.polygons:
        p_.use_smooth = True
    cmat = bpy.data.materials.new("Mat_RoninCrescent")
    cmat.use_nodes = True
    cb_ = cmat.node_tree.nodes["Principled BSDF"]
    cb_.inputs["Base Color"].default_value = hexlin(E("C_CRESCENT", "b36a36")) + [1]
    cb_.inputs["Metallic"].default_value = float(E("CRES_METAL", "0.2"))
    cb_.inputs["Roughness"].default_value = float(E("CRES_ROUGH", "0.55"))
    cres.data.materials.append(cmat)
    print("CRESCENT tris", sum(len(p_.vertices) - 2 for p_ in cres.data.polygons))
CX, CZL, CZH, CY = float(E("CUT_X", "0.42")), float(E("CUT_ZLO", "-0.40")), float(E("CUT_ZHI", "0.42")), float(E("CUT_Y", "-0.30"))
inbox = lambda c: abs(c.x) < CX and CZL < c.z < CZH and c.y < CY
nkeep = sum(1 for p in helm.data.polygons if not inbox(p.center))
dec = helm.modifiers.new("dec", "DECIMATE")
dec.ratio = float(E("TRIS", "4500")) / max(1, nkeep)
bpy.context.view_layer.objects.active = helm
bpy.ops.object.modifier_apply(modifier="dec")
# face opening cut AFTER the decimate, along straight planes (the face-by-face cut before the decimate left saw-tooth edges)
bm = bmesh.new()
bm.from_mesh(helm.data)
for co_, no_ in (((CX, 0, 0), (1, 0, 0)), ((-CX, 0, 0), (1, 0, 0)), ((0, 0, CZL), (0, 0, 1)), ((0, 0, CZH), (0, 0, 1)), ((0, CY, 0), (0, 1, 0))):
    g = bm.verts[:] + bm.edges[:] + bm.faces[:]
    bmesh.ops.bisect_plane(bm, geom=g, plane_co=co_, plane_no=no_)
face_cut = [f for f in bm.faces if inbox(f.calc_center_median())]
bmesh.ops.delete(bm, geom=face_cut, context="FACES")
bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")
print("MESHY face block removed", len(face_cut))
# smoothing: relax the open edges along themselves, then a light volume-preserving Laplacian over the whole shell (decimate grit)
for _ in range(int(E("EDGE_RELAX", "4"))):
    bv = [v for v in bm.verts if v.is_boundary]
    new = {}
    for v in bv:
        nb = [e.other_vert(v) for e in v.link_edges if e.is_boundary]
        if len(nb) == 2:
            new[v] = v.co * 0.5 + (nb[0].co + nb[1].co) * 0.25
    for v, c in new.items():
        v.co = c
for _ in range(int(E("SMOOTH_IT", "3"))):
    bmesh.ops.smooth_laplacian_vert(bm, verts=[v for v in bm.verts if not v.is_boundary], lambda_factor=float(E("SMOOTH_L", "0.4")),
                                    lambda_border=0.0, use_x=True, use_y=True, use_z=True, preserve_volume=True)
bmesh.ops.triangulate(bm, faces=[f for f in bm.faces if len(f.verts) > 4])
bm.to_mesh(helm.data)
bm.free()
# small islands left by the decimate/cut (floating crumbs) -> removed
bm = bmesh.new()
bm.from_mesh(helm.data)
seen, isl = set(), []
for f0 in bm.faces:
    if f0.index in seen:
        continue
    st, g = [f0], []
    seen.add(f0.index)
    while st:
        f = st.pop()
        g.append(f)
        for e in f.edges:
            for h in e.link_faces:
                if h.index not in seen:
                    seen.add(h.index)
                    st.append(h)
    isl.append(g)
crumbs = [f for g in isl if len(g) < int(E("MIN_ISLAND", "40")) for f in g]
bmesh.ops.delete(bm, geom=crumbs, context="FACES")
bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")
bm.to_mesh(helm.data)
bm.free()
print("HELMET tris after decimate", sum(len(p.vertices) - 2 for p in helm.data.polygons), "islands", len(isl), "crumb faces", len(crumbs))
for p in helm.data.polygons:
    p.use_smooth = True

# ---------- 3. region colours (palette) + baked AO -> one albedo
# regions in Meshy units (before scaling): horns, dome, lames (side/back neck guard), gorget (below the chin), brow band
co = np.array([v.co[:] for v in helm.data.vertices])
me = helm.data
ca = me.color_attributes.new("region", "FLOAT_COLOR", "CORNER")
counts = {}
for p in me.polygons:
    c = p.center
    rg = region(c, p.normal)
    counts[rg] = counts.get(rg, 0) + 1
    col = hexlin(PAL[rg]) + [1]
    for li in p.loop_indices:
        ca.data[li].color = col
print("REGIONS", counts)
if E("ONE_HORN", "1") == "1" and cres is None:
    hy = sorted(p.center.y for p in me.polygons if region(p.center, p.normal) == "horn")
    gaps = [(hy[i + 1] - hy[i], i) for i in range(len(hy) - 1)]
    gmax, gi_ = max(gaps)
    split = (hy[gi_] + hy[gi_ + 1]) / 2 if gmax > 0.02 else float(E("HORN_SPLIT", "-0.46"))
    split = float(E("HORN_SPLIT", split))
    rear = [p.index for p in me.polygons if region(p.center, p.normal) == "horn" and p.center.y > split]
    bm = bmesh.new()
    bm.from_mesh(me)
    bm.faces.ensure_lookup_table()
    bmesh.ops.delete(bm, geom=[bm.faces[i] for i in rear], context="FACES")
    bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")
    # the rear crescent passed through the dome: cap the small holes it leaves (the big face opening stays open)
    bmesh.ops.holes_fill(bm, edges=[e for e in bm.edges if e.is_boundary], sides=int(E("HOLE_SIDES", "40")))
    bmesh.ops.triangulate(bm, faces=[f for f in bm.faces if len(f.verts) > 4])
    bm.to_mesh(me)
    bm.free()
    print("REAR crescent faces removed", len(rear), "split y %.3f (largest gap %.3f)" % (split, gmax))
    me.color_attributes.remove(me.color_attributes["region"])
    ca = me.color_attributes.new("region", "FLOAT_COLOR", "CORNER")
    for p in me.polygons:
        col = hexlin(PAL[region(p.center, p.normal)]) + [1]
        for li in p.loop_indices:
            ca.data[li].color = col
# UVs + bake (Cycles): emission of the region colour, then AO; albedo = colour * (0.35 + 0.65 * AO)
bpy.ops.object.select_all(action="DESELECT")
helm.select_set(True)
bpy.context.view_layer.objects.active = helm
bpy.ops.object.mode_set(mode="EDIT")
bpy.ops.mesh.select_all(action="SELECT")
bpy.ops.uv.smart_project(angle_limit=math.radians(55), island_margin=0.01)
bpy.ops.object.mode_set(mode="OBJECT")
RES = int(E("TEX_RES", "1024"))
mat = bpy.data.materials.new("Mat_RoninHelm")
mat.use_nodes = True
nt = mat.node_tree
bsdf = nt.nodes["Principled BSDF"]
me.materials.clear()
me.materials.append(mat)
img_c = bpy.data.images.new("RoninHelm_col", RES, RES)
img_a = bpy.data.images.new("RoninHelm_ao", RES, RES)
tex = nt.nodes.new("ShaderNodeTexImage")
attr = nt.nodes.new("ShaderNodeAttribute")
attr.attribute_name = "region"
emi = nt.nodes.new("ShaderNodeEmission")
out = nt.nodes["Material Output"]
sc = bpy.context.scene
sc.render.engine = "CYCLES"
sc.cycles.samples = 16
sc.cycles.device = "CPU"
nt.links.new(emi.outputs[0], out.inputs["Surface"])
PIXREG = E("PIXREG", "1") == "1"
if PIXREG:
    # per-texel regions: bake object-space position and normal (encoded 0..1 in float images), classify each texel in numpy
    # with the same rules as region(): colour borders follow straight 3D thresholds instead of the triangle edges (no saw teeth)
    tco = nt.nodes.new("ShaderNodeTexCoord")
    geo = nt.nodes.new("ShaderNodeNewGeometry")
    vm = nt.nodes.new("ShaderNodeVectorMath")
    vm.operation = "MULTIPLY_ADD"
    vm.inputs[1].default_value = (0.25, 0.25, 0.25)
    vm.inputs[2].default_value = (0.5, 0.5, 0.5)
    maps = {}
    for key, sock in (("pos", tco.outputs["Object"]), ("nrm", geo.outputs["Normal"])):
        im_ = bpy.data.images.new("bake_" + key, RES, RES, float_buffer=True)
        im_.colorspace_settings.name = "Non-Color"
        for l in list(vm.inputs[0].links):
            nt.links.remove(l)
        nt.links.new(sock, vm.inputs[0])
        nt.links.new(vm.outputs[0], emi.inputs["Color"])
        tex.image = im_
        nt.nodes.active = tex
        bpy.ops.object.bake(type="EMIT", margin=4)
        maps[key] = (np.array(im_.pixels[:]).reshape(RES, RES, 4)[..., :3] - 0.5) / 0.25
        bpy.data.images.remove(im_)
    for n in (tco, geo, vm):
        nt.nodes.remove(n)
    X, Y, Z = (maps["pos"][..., i] for i in range(3))
    N = maps["nrm"]
    R = np.hypot(X, Y)
    rad = np.stack([X, Y, np.zeros_like(X)], -1) / np.maximum(R, 1e-6)[..., None]
    nd = np.abs((N * rad).sum(-1))
    lab = np.full(X.shape, "dome", dtype=object)
    lab[(Y < -0.25) & (Z < 0.62)] = "plate"
    lames = (R > 0.60) & (Z > -0.35) & (Z < 0.40)
    lab[lames] = "lame"
    lab[lames & (Z < -0.12) & (R > 0.74)] = "rim"
    lab[Z < -0.38] = "gorget"
    AX_ = np.abs(X)
    hornA = (Z > float(E("HORN_Z", "0.58"))) & ((AX_ > 0.55) | (Y < float(E("HORN_Y", "-0.48"))) | ((AX_ > float(E("HORN_X", "0.44"))) & (nd < float(E("HORN_RAD", "0.75")))))
    hornB = (Z > float(E("HORN_CZ", "0.46"))) & (Y < float(E("HORN_CY", "-0.50")))
    if cres is None:          # SPLIT_HORN: the crescent is its own object, no copper texels on the dome
        lab[hornA | hornB] = "horn"
    HORN_M = _gblur((lab == "horn").astype(float), 1.0)
    c = np.ones((RES, RES, 4))
    for k_, hx in PAL.items():
        c[lab == k_, :3] = hexsrgb(hx)
else:
    nt.links.new(attr.outputs["Color"], emi.inputs["Color"])
    tex.image = img_c
    nt.nodes.active = tex
    bpy.ops.object.bake(type="EMIT", margin=4)
tex.image = img_a
nt.nodes.active = tex
nt.links.new(bsdf.outputs[0], out.inputs["Surface"])
sc.world = sc.world or bpy.data.worlds.new("w")
bpy.ops.object.bake(type="AO", margin=4)
if not PIXREG:
    c = np.array(img_c.pixels[:]).reshape(RES, RES, 4)
for ch in range(3):
    c[..., ch] = _gblur(c[..., ch], float(E("COL_BLUR", "1.2")))
a = np.array(img_a.pixels[:]).reshape(RES, RES, 4)[..., :1]
alb = c.copy()
alb[..., :3] = np.clip(c[..., :3] * (0.35 + 0.65 * a), 0, 1)
img = bpy.data.images.new("RoninHelm_Albedo", RES, RES)
img.pixels[:] = alb.ravel()
img.filepath_raw = P.ELITE + "/04_textures/helmet_study/ronin/RoninHelm_%s_Albedo.png" % TAG
os.makedirs(os.path.dirname(img.filepath_raw), exist_ok=True)
img.file_format = "PNG"
img.save()
for n in (attr, emi):
    nt.nodes.remove(n)
tex.image = img
nt.links.new(tex.outputs["Color"], bsdf.inputs["Base Color"])
bsdf.inputs["Metallic"].default_value = 0.55
bsdf.inputs["Roughness"].default_value = 0.5
me.color_attributes.remove(me.color_attributes["region"])
bpy.data.images.remove(img_c)
bpy.data.images.remove(img_a)

# ---------- 4. scale + place the helmet on the Elite head
mlo = Vector([co[:, i].min() for i in range(3)])
mhi = Vector([co[:, i].max() for i in range(3)])
HS = float(E("HS", "0")) or (hhi.x - hlo.x) * float(E("HS_K", "2.0")) / (mhi.x - mlo.x)
hc = (hlo + hhi) / 2
# Meshy anchor: the brow line of its face opening sits at (0, ?, ~0.25); maps onto the head's eye level
anchor_m = Vector((0, float(E("ANCH_Y", "0.0")), float(E("ANCH_Z", "0.10"))))
off = Vector((float(E("HDX", "0")), float(E("HDY", "0")), float(E("HDZ", "0"))))
Tm = Matrix.Translation(hc + off) @ Matrix.Scale(HS, 4) @ Matrix.Translation(-anchor_m)
helm.data.transform(Tm)
if cres is not None:
    cres.data.transform(Tm)
helm.name = "Kit_roninhelm"
print("HELMET scale %.4f placed at %s" % (HS, tuple(round(x, 3) for x in hc + off)))

# ---------- 5. Ranger visor-mask (vanilla, Female01 rig) -> the face opening, recoloured copper / black glass
before = set(bpy.data.objects)
bpy.ops.import_scene.fbx(filepath=RANGER)
new = [o for o in bpy.data.objects if o not in before]
rrig = next(o for o in new if o.type == "ARMATURE")
rmesh = max((o for o in new if o.type == "MESH"), key=lambda o: len(o.data.vertices))
for o in new:
    if o not in (rrig, rmesh):
        bpy.data.objects.remove(o, do_unlink=True)
rrig.data.pose_position = "REST"
bpy.context.view_layer.update()
R_HEAD = rrig.matrix_world @ rrig.data.bones["B_HeadJ"].matrix_local
names = {g.index: g.name for g in rmesh.vertex_groups}
dom = {v.index: names[max(v.groups, key=lambda x: x.weight).group] for v in rmesh.data.vertices if v.groups}
mimg = next(n.image for m in rmesh.data.materials if m and "Ranger" in m.name for n in m.node_tree.nodes if n.type == "TEX_IMAGE" and n.image and "lbedo" in (n.image.name + n.image.filepath))
w, h = mimg.size
px = np.array(mimg.pixels[:]).reshape(h, w, 4)
rmw = rmesh.matrix_world.copy()
rb = bmesh.new()
rb.from_mesh(rmesh.data)
uv = rb.loops.layers.uv.active
ranger_mat = [i for i, m in enumerate(rmesh.data.materials) if m and "Ranger" in m.name]
ys = [(rmw @ v.co).y for v in rb.verts if dom.get(v.index) == "B_HeadJ"]
yc = (min(ys) + max(ys)) / 2
kill, kept = [], 0
for fc in rb.faces:
    if fc.material_index not in ranger_mat or not all(dom.get(v.index) in ("B_HeadJ",) for v in fc.verts):
        kill.append(fc)
        continue
    cc = np.array([px[min(h - 1, int((l[uv].uv.y % 1) * h)), min(w - 1, int((l[uv].uv.x % 1) * w)), :3] for l in fc.loops]).mean(0)
    mx, mn = cc.max(), cc.min()
    sat = (mx - mn) / mx if mx > 0 else 0
    hue_warm = cc[0] >= cc[1] >= cc[2] - 0.02
    wc = rmw @ fc.calc_center_median()
    # hair (saturated orange) and skin (warm, mid saturation) out; white/grey plates, dark chin and green glass stay; front half only
    if (hue_warm and sat > float(E("SKIN_SAT", "0.16"))) or wc.y > yc + float(E("MASK_BACK", "0.0")):
        kill.append(fc)
    else:
        kept += 1
bmesh.ops.delete(rb, geom=kill, context="FACES")
bmesh.ops.delete(rb, geom=[v for v in rb.verts if not v.link_faces], context="VERTS")
rb.to_mesh(rmesh.data)
rb.free()
print("RANGER mask faces kept", kept)
for m in list(rmesh.modifiers):
    rmesh.modifiers.remove(m)
rmesh.parent = None
rmesh.data.transform(E_HEAD @ R_HEAD.inverted() @ rmw)
rmesh.matrix_world = Matrix.Identity(4)
bpy.data.objects.remove(rrig, do_unlink=True)
mv = [v.co.copy() for v in rmesh.data.vertices]
mc = sum(mv, Vector()) / len(mv)
MS = float(E("MS", "1.25"))
moff = Vector((0, float(E("MDY", "0")), float(E("MDZ", "0"))))
for v in rmesh.data.vertices:
    v.co = mc + (v.co - mc) * MS + moff
rmesh.data.update()
rmesh.name = "Kit_rangermask"
# recolour (owner's paint-over): green glass -> near-black glass; light plates -> copper (keeps the painted shading); grey chin -> dark gunmetal
cu = np.array(hexsrgb(E("C_MASK", "b36a36")))
rgb = px[..., :3]
lum = rgb.mean(-1, keepdims=True)
green = (rgb[..., 1] > rgb[..., 0] * 1.12) & (rgb[..., 1] > rgb[..., 2] * 0.95)
light = (~green) & (lum[..., 0] > 0.35)
dark = (~green) & (~light)
def _soft(mk):
    return _gblur(mk.astype(float), float(E("MASK_BLUR", "1.5")))[..., None]
wg, wl, wd = _soft(green), _soft(light), _soft(dark)
tot = np.maximum(wg + wl + wd, 1e-3)
glass = np.array(hexsrgb("141518")) * (0.6 + 0.8 * lum)
copper = np.clip(cu * (lum / float(E("MASK_LUM", "0.80"))), 0, 1)
gun = np.clip(np.array(hexsrgb("2c2d30")) * (lum / 0.3), 0, 1)
newp = px.copy()
newp[..., :3] = (wg * glass + wl * copper + wd * gun) / tot
mi2 = bpy.data.images.new("RangerMask_Copper", w, h, alpha=True)
mi2.pixels[:] = newp.ravel()
mi2.filepath_raw = P.ELITE + "/04_textures/helmet_study/ronin/RangerMask_Copper_%s_Albedo.png" % TAG
mi2.file_format = "PNG"
mi2.save()
for i in sorted(set(range(len(rmesh.data.materials))) - set(ranger_mat), reverse=True):
    rmesh.data.materials.pop(index=i)
mm = rmesh.data.materials[0].copy()
mm.name = "Mat_RangerMaskCopper"
rmesh.data.materials[0] = mm
for n in mm.node_tree.nodes:
    if n.type == "TEX_IMAGE" and n.image and "lbedo" in (n.image.name + n.image.filepath):
        n.image = mi2
        break
if E("MASK_MATTE", "0") == "1":
    # the Ranger's metal/gloss maps make the copper plates mirror the grey sky (pale, washed out next to the apron):
    # metal and specular inputs unplugged, set to the apron cloth's look
    bsdf_m = next(n for n in mm.node_tree.nodes if n.type == "BSDF_PRINCIPLED")
    for nm_, v_ in (("Metallic", float(E("MASK_METALLIC", "0.2"))), ("Specular IOR Level", 0.3), ("Roughness", float(E("MASK_ROUGH", "0.6")))):
        for l in list(bsdf_m.inputs[nm_].links):
            mm.node_tree.links.remove(l)
        bsdf_m.inputs[nm_].default_value = v_
if E("MASK_METAL"):        # e.g. 0.3: the Ranger metal map scaled down (less grey reflection on the copper plates)
    for n in mm.node_tree.nodes:
        if n.type == "TEX_IMAGE" and n.image and "Metallic" in (n.image.name + n.image.filepath):
            iw, ih = n.image.size
            mp = np.array(n.image.pixels[:]).reshape(ih, iw, 4)
            mp[..., 0] *= float(E("MASK_METAL"))
            im3 = bpy.data.images.new("RangerMask_Metal_low", iw, ih, alpha=True)
            im3.pixels[:] = mp.ravel()
            im3.colorspace_settings.name = "Non-Color"
            n.image = im3

# ---------- 6. cull head faces that show outside the helmet + mask (nothing on the head but our kit)
kit = [helm, rmesh] + ([cres] if cres is not None else [])
allv, allf, base = [], [], 0
for o in kit:
    allv += [v.co.copy() for v in o.data.vertices]
    allf += [tuple(base + i for i in p.vertices) for p in o.data.polygons]
    base += len(o.data.vertices)
bvh = BVHTree.FromPolygons(allv, allf)
hz0 = min(p.z for p in (v.co for v in helm.data.vertices))
hb = bmesh.new()
hb.from_mesh(head.data)
bad = []
for fc in hb.faces:
    p = head.matrix_world @ fc.calc_center_median()
    if p.z < hz0 + 0.01:
        continue
    hit, nrm, _, dist = bvh.find_nearest(p, 0.1)
    if hit is not None and (p - hit).dot(nrm) > -float(E("CULL_TOL", "0.008")):
        bad.append(fc)
bmesh.ops.delete(hb, geom=bad, context="FACES")
hb.to_mesh(head.data)
hb.free()
print("CULL head faces poking out", len(bad))
if E("SKULL_DROP", "1") == "1":
    hn = {g.index: g.name for g in head.vertex_groups}
    hb = bmesh.new()
    hb.from_mesh(head.data)
    dl = hb.verts.layers.deform.active
    def _dom(v):
        d = v[dl]
        return hn[max(d.items(), key=lambda kv: kv[1])[0]] if d else None
    sk = [fc for fc in hb.faces if all(_dom(v) == "B_HeadJ" for v in fc.verts) and (head.matrix_world @ fc.calc_center_median()).z > hz0 + 0.02]
    bmesh.ops.delete(hb, geom=sk, context="FACES")
    bmesh.ops.delete(hb, geom=[v for v in hb.verts if not v.link_faces], context="VERTS")
    hb.to_mesh(head.data)
    hb.free()
    print("SKULL faces inside the helmet removed", len(sk))

# DESAT=1 (owner 2026-11-19: "shades, not colour"): every colour (sRGB) texture on the body, apron, helmet and mask -> luminance grey.
# The shield and glaive (DESAT_WEAPONS=1 to include them) keep their paint.
if E("DESAT", "0") == "1":
    skip = () if E("DESAT_WEAPONS", "0") == "1" else ("Thorvald_Glaive", "Thorvald_TowerShield")
    mats = {sl.material for o in bpy.data.objects if o.type == "MESH" and not o.name.startswith(skip) for sl in o.material_slots if sl.material}
    wmats = {sl.material for o in bpy.data.objects if o.type == "MESH" and o.name.startswith(skip) for sl in o.material_slots if sl.material}
    done = {}
    gdir = P.ELITE + "/04_textures/helmet_study/ronin/grey_%s/" % TAG
    os.makedirs(gdir, exist_ok=True)
    for m in mats - wmats:
        if not m.node_tree:
            continue
        for n in m.node_tree.nodes:
            if n.type != "TEX_IMAGE" or not n.image or n.image.colorspace_settings.name != "sRGB" or n.image.size[0] == 0                     or any(k in n.image.name for k in ("Normal", "Metallic", "Gloss", "Emissive")):
                continue
            if n.image.name not in done:
                im0 = n.image
                w_, h_ = im0.size
                a_ = np.array(im0.pixels[:]).reshape(h_, w_, 4)
                g_ = a_[..., 0] * 0.2126 + a_[..., 1] * 0.7152 + a_[..., 2] * 0.0722
                a_[..., :3] = g_[..., None] * float(E("DESAT_K", "1.0"))
                # COPPER=1 (owner 2026-11-19, brushed rose-copper tap photo): the apron, the mask plates and the helmet crescent get a
                # copper gradient map (shadow / mid / highlight sampled from the photo) driven by the grey shading, so the metal keeps its light
                if E("COPPER", "0") == "1":
                    cm = None
                    if "RoninHelm_Albedo" in im0.name and "HORN_M" in globals():
                        cm = HORN_M
                    elif "RangerMask" in im0.name:
                        cm = wl[..., 0]
                    elif E("APRON_IMG", "DuncanFill_sash") in im0.name or any(k_ and k_ in im0.name for k_ in E("CU_ACCENTS", "").split(",")):
                        # apron, and accents (CU_ACCENTS = texture name parts): the pixels that were copper/orange in the original paint
                        o_ = np.array(im0.pixels[:]).reshape(h_, w_, 4)
                        r_, gg_, b_ = o_[..., 0], o_[..., 1], o_[..., 2]
                        rmin_ = (0.25 if E("APRON_IMG", "DuncanFill_sash") in im0.name
                                 else float(E("ACC_MINR_TRIM", "0.55")) if "Trim" in im0.name else float(E("ACC_MINR", "0.42")))
                        # accents: only the bright copper (inlay strips, studs, gear); the darker rust-brown cloth in the same atlas stays grey
                        cm = _gblur(((r_ > gg_ * 1.25) & (r_ > b_ * 1.5) & (r_ > rmin_)).astype(float), 1.5)
                    if cm is not None and (cm > 0.5).any():
                        lo_, hi_ = np.percentile(g_[cm > 0.5], [3, 97])
                        t_ = np.clip((g_ - lo_) / max(hi_ - lo_, 1e-3), 0, 1)[..., None]
                        if "RangerMask" in im0.name:
                            # the mask's painted shading spans far more light/dark than the apron cloth and its metal map greys it:
                            # squeeze it into the apron's mid-copper band so both read as the same copper in the render
                            t0_, t1_ = (float(x_) for x_ in E("MASK_T", "0.38,0.72").split(","))
                            t_ = t0_ + (t1_ - t0_) * t_
                        sh_, md_, hl_ = (np.array(hexsrgb(E(k_, d_))) for k_, d_ in (("CU_SH", "6e3e2d"), ("CU_MID", "c49684"), ("CU_HI", "efbda9")))
                        ramp_ = np.where(t_ < 0.5, sh_ + (md_ - sh_) * (t_ * 2), md_ + (hl_ - md_) * (t_ * 2 - 1))
                        if "RangerMask" in im0.name:
                            # calibrated against the render (R14: mask median 154,121,110 vs apron 213,151,128): the mask's metal/gloss map
                            # darkens and greys its copper, so its albedo is pushed up per channel to read as the same copper as the apron
                            ramp_ = np.clip(ramp_ * np.array([float(x_) for x_ in E("MASK_GAIN", "1.38,1.25,1.16").split(",")]), 0, 1)
                        a_[..., :3] = a_[..., :3] * (1 - cm[..., None]) + ramp_ * cm[..., None]
                        print("COPPER on", im0.name, "pixels", int((cm > 0.5).sum()))
                gi_ = bpy.data.images.new("Grey_" + im0.name.split(".")[0], w_, h_, alpha=True)
                gi_.pixels[:] = np.clip(a_, 0, 1).ravel()
                gi_.filepath_raw = gdir + gi_.name + ".png"
                gi_.file_format = "PNG"
                gi_.save()
                done[im0.name] = gi_
            n.image = done[n.image.name]
    print("DESAT colour textures turned grey:", len(done), sorted(done)[:12])

for o in kit:
    o.vertex_groups.clear()
    o.vertex_groups.new(name="B_HeadJ").add([v.index for v in o.data.vertices], 1.0, "REPLACE")
    o.parent = rig
    md = o.modifiers.new("Armature", "ARMATURE")
    md.object = rig
try:
    bpy.ops.file.pack_all()
except RuntimeError as e:
    print("PACK WARNING", str(e)[:120])
os.makedirs(P.ELITE + "/03_blender/helmet_study", exist_ok=True)
bpy.ops.wm.save_as_mainfile(filepath=P.ELITE + "/03_blender/helmet_study/ronin_%s.blend" % TAG)
print("SAVED")

# ---------- 7. renders: helmet alone, head close-ups, full body
if E("VIEWS", "all") != "none":
    for o in [o for o in bpy.data.objects if o.type in ("LIGHT", "CAMERA")]:
        bpy.data.objects.remove(o, do_unlink=True)
    bs.setup_world(strength=1.8, color=(0.55, 0.58, 0.64))
    bs.setup_lights(sun_energy=3.0, fill_energy=120)
    hv = allv
    hcen = Vector([(min(p[i] for p in hv) + max(p[i] for p in hv)) / 2 for i in range(3)])
    hsize = max(max(p[i] for p in hv) - min(p[i] for p in hv) for i in range(3))
    others = [o for o in bpy.data.objects if o.type == "MESH" and o not in kit]
    bs.setup_render(500, 500)
    for tg, d in (("front", (0, -1, 0.05)), ("tq", (0.7, -0.7, 0.12)), ("side", (1, 0, 0.05)), ("back", (0, 1, 0.08))):
        cam = bs.setup_camera(target=hcen, ortho_scale=hsize * 1.25, direction=d, distance=4)
        bs.render_to(OUT + "head_" + tg + ".png", cam)
        bpy.data.objects.remove(cam, do_unlink=True)
    bs.setup_render(600, 800)
    for tg, d in (("full_front", (0, -1, 0.1)), ("full_tq", (0.7, -0.7, 0.2)), ("full_back", (0.3, 1, 0.15))):
        cam = bs.setup_camera(target=Vector((0, 0, 1.15)), ortho_scale=2.7, direction=d, distance=8)
        bs.render_to(OUT + "body_" + tg + ".png", cam)
        bpy.data.objects.remove(cam, do_unlink=True)
print("DONE", TAG)
