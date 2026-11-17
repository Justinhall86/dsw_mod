"""Heavy Vanguard + Warden (Atreides Elite) helmet, owner request 2026-11-14:
recolour, top crest removed and the crown smoothed, collar off (COLLAR=keep to compare), Karlin's breather in place of the white face guard,
Karlin's H2f4 antennae on the crown. Fitted on the real Elite body (v2_final.blend, TrooperHat removed) and skinned 100 % to B_HeadJ.

    blender -b ../../03_blender/v2_final.blend --python wd_build.py
env: TAG (name), TEX (helmet albedo, default vanilla Warden), COLLAR drop|keep, FIT_SCALE (0 = search), FIT_DZ, FIT_DY,
     ANT_SCALE, ANT_X, ANT_Y, ANT_TILT (deg, minus = lean back), ANT=0 (no antennae), MASK_SCALE, MASK_DY, MASK_DZ,
     PALETTE=1 (body textures from thorvald_recolours ground_v6 = the 2026-11-13 palette), VIEWS (comma list or "none")
Out: 03_blender/helmet_study/wd_<TAG>.blend, gallery/helmets_and_heads/warden_study/<TAG>/{helmet_*,body_*,rts_*}.png"""
import os, sys, math, bmesh, bpy
import numpy as np
from mathutils import Vector, Matrix
from mathutils.bvhtree import BVHTree
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import paths as P
sys.path.insert(0, P.SCENE_HELPERS)
import blender_scene as bs

E = os.environ.get
TAG = E("TAG", "W0")
TEX = E("TEX", P.WARDEN_DIR + "AtreideWarden_Albedo.png")
COLLAR = E("COLLAR", "drop")
AS, AX, AY, AT = float(E("ANT_SCALE", "0.6")), float(E("ANT_X", "0.04")), float(E("ANT_Y", "-0.03")), float(E("ANT_TILT", "-8"))
MS, MY, MZ = float(E("MASK_SCALE", "1.15")), float(E("MASK_DY", "-0.02")), float(E("MASK_DZ", "0"))
OUT = P.GAL + "/warden_study/" + TAG + "/"
os.makedirs(OUT, exist_ok=True)
HELMET = E("HELMET", "warden")          # warden | hg (House Guard, for the on-body comparison)
WFBX = (P.REPO + "/model_projects/thorvald/thorvald_trooper/05_fbx_export/Female01_AtreideWarden_TRUE_FBX.fbx" if HELMET == "warden"
        else P.HG_DIR + "Male01_HouseGuard_TRUE_FBX.fbx")
V6 = P.REPO + "/model_projects/thorvald/thorvald_recolours/04_textures/ground_v6/Male01_ThorvaldElite/"

rig = next(o for o in bpy.data.objects if o.type == "ARMATURE")
rig.data.pose_position = "REST"
bpy.context.view_layer.update()
E_HEAD = rig.matrix_world @ rig.data.bones["B_HeadJ"].matrix_local
KASA = None
if "TrooperHat" in bpy.data.objects:
    if E("SHIKORO", "0") != "0":      # samurai pass: the Trooper's kasa becomes a flared neck guard (shikoro), see below
        KASA = bpy.data.objects["TrooperHat"]
    else:
        bpy.data.objects.remove(bpy.data.objects["TrooperHat"], do_unlink=True)

# ---------- body palette: the ground_v6 textures (one set per material, same UVs)
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

# ---------- Warden helmet
SS_BLEND = P.REPO + "/model_projects/thorvald/thorvald_sworn_sword/03_blender/SwornSword2_2.1.blend"
SS_EXTRA = {}
if HELMET == "ss":
    # samurai pass: the Sworn Sword 2.1 domed helm (a ribbed kettle dome, same Male01 rig and head position) as the hachi, plume left off.
    # SS_SOCKET=drop removes the copper plume socket on the crown; SS_BADGE=1 keeps the gear badge on the brow (the horns rise behind it);
    # the Sworn Sword's own half-mask (fitted to this head) replaces Karlin's breather.
    with bpy.data.libraries.load(SS_BLEND, link=False) as (s3, d3):
        d3.objects = ["SwornHelmet", "SwornMask"] + (["SwornBadge"] if E("SS_BADGE", "1") == "1" else []) + (["SwornTail"] if E("SS_TAIL") == "1" else []) + (["CommandoHead"] if E("SS_HEAD", "1") == "1" else []) + [n for n in s3.objects if n == "Armature"]
    srig = next(o for o in d3.objects if o.type == "ARMATURE")
    if E("SS_HEAD", "1") == "1" and any(o.name.startswith("CommandoHead") for o in d3.objects):
        # the Sworn Sword's head (eyes intact; the Elite head has goggles and nothing under them) replaces the Elite's
        old_h = bpy.data.objects["CommandoHead"]
        nh = next(o for o in d3.objects if o.name.startswith("CommandoHead") and o is not old_h)
        bpy.context.scene.collection.objects.link(nh)
        mwh = nh.matrix_world.copy()
        bpy.data.objects.remove(old_h, do_unlink=True)
        nh.name = "CommandoHead"
        nh.parent = rig
        nh.matrix_world = mwh
        for m in nh.modifiers:
            if m.type == "ARMATURE":
                m.object = rig
        print("SS head swapped in")
    S_HEAD = srig.matrix_world @ srig.data.bones["B_HeadJ"].matrix_local
    for o in d3.objects:
        if o.type != "MESH" or o.name.startswith("CommandoHead"):
            continue
        bpy.context.scene.collection.objects.link(o)
        for m in list(o.modifiers):
            o.modifiers.remove(m)
        o.data.transform(E_HEAD @ S_HEAD.inverted() @ o.matrix_world)
        o.parent = None
        o.matrix_world = Matrix.Identity(4)
        SS_EXTRA[o.name.split(".")[0]] = o
    bpy.data.objects.remove(srig, do_unlink=True)
    helm = SS_EXTRA.pop("SwornHelmet")
    if E("SS_SOCKET", "drop") == "drop":
        hb_ = bmesh.new()
        hb_.from_mesh(helm.data)
        zt = max(v.co.z for v in hb_.verts)
        cyy = (min(v.co.y for v in hb_.verts) + max(v.co.y for v in hb_.verts)) / 2
        sock = [f_ for f_ in hb_.faces if all(v.co.z > zt - float(E("SS_SOCKET_H", "0.03")) and math.hypot(v.co.x, v.co.y - cyy) < 0.045 for v in f_.verts)]
        bmesh.ops.delete(hb_, geom=sock, context="FACES")
        bmesh.ops.delete(hb_, geom=[v for v in hb_.verts if not v.link_faces], context="VERTS")
        # close the hole: one n-gon over the open top loop, flattened onto the dome
        bnd = [e for e in hb_.edges if e.is_boundary and min(v.co.z for v in e.verts) > zt - 0.06]
        if bnd:
            bmesh.ops.holes_fill(hb_, edges=bnd, sides=0)
        hb_.to_mesh(helm.data)
        hb_.free()
        print("SS socket faces removed", len(sock))
    helm.name = "Kit_ssdome"
else:
    before = set(bpy.data.objects)
    bpy.ops.import_scene.fbx(filepath=WFBX)
    new = [o for o in bpy.data.objects if o not in before]
    wrig = next(o for o in new if o.type == "ARMATURE")
    helm = max((o for o in new if o.type == "MESH"), key=lambda o: len(o.data.polygons))
    for o in new:
        if o not in (wrig, helm):
            bpy.data.objects.remove(o, do_unlink=True)
    wrig.data.pose_position = "REST"
    bpy.context.view_layer.update()
    W_HEAD = wrig.matrix_world @ wrig.data.bones["B_HeadJ"].matrix_local
    names = {g.index: g.name for g in helm.vertex_groups}
    dom = {v.index: names[max(v.groups, key=lambda x: x.weight).group] for v in helm.data.vertices if v.groups}
    mw = helm.matrix_world.copy()
    bm = bmesh.new()
    bm.from_mesh(helm.data)
    bmesh.ops.delete(bm, geom=[f for f in bm.faces if not all(dom.get(v.index) in ("B_HeadJ", "B_Neck01J") for v in f.verts)], context="FACES")
    if COLLAR == "drop":     # the neck skirt: faces with a vertex led by the neck bone
        bmesh.ops.delete(bm, geom=[f for f in bm.faces if any(dom.get(v.index) == "B_Neck01J" for v in f.verts)], context="FACES")
    bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")
    for v in bm.verts:
        v.co = mw @ v.co          # work in world space (Warden rest pose)
    bm.normal_update()
    bm.faces.ensure_lookup_table()


    def panels(bm, ang=32):
        seen, out = set(), []
        for f0 in bm.faces:
            if f0.index in seen:
                continue
            st, grp = [f0], []
            seen.add(f0.index)
            while st:
                f = st.pop()
                grp.append(f)
                for e in f.edges:
                    for g in e.link_faces:
                        if g.index in seen or g is f or f.normal.angle(g.normal) > math.radians(ang):
                            continue
                        seen.add(g.index)
                        st.append(g)
            pts = [v.co for f in grp for v in f.verts]
            c = Vector([(min(p[i] for p in pts) + max(p[i] for p in pts)) / 2 for i in range(3)])
            out.append((grp, c))
        return out


    z1 = max(v.co.z for v in bm.verts)
    z0 = min(v.co.z for v in bm.verts)
    if HELMET == "warden":
        pans = panels(bm)
        # 1) top crest: the raised plates along the crown -> pressed down onto a smooth dome fitted to the shell around them
        crest = [g for g, c in pans if c.z > z1 - 0.045 and abs(c.x) < 0.07]
        cverts = {v for g in crest for f in g for v in f.verts}
        zmid = (z0 + z1) / 2
        shell = [v.co for v in bm.verts if v not in cverts and v.co.z > zmid]
        # axis-aligned ellipsoid  A x2 + B y2 + C z2 + D x + E y + F z = 1  fitted to the shell's upper half
        A = np.array([[p.x ** 2, p.y ** 2, p.z ** 2, p.x, p.y, p.z] for p in shell])
        k = np.linalg.lstsq(A, np.ones(len(shell)), rcond=None)[0]
        ec = Vector((-k[3] / (2 * k[0]), -k[4] / (2 * k[1]), -k[5] / (2 * k[2])))
        g_ = 1 + k[0] * ec.x ** 2 + k[1] * ec.y ** 2 + k[2] * ec.z ** 2
        ax = Vector([math.sqrt(g_ / k[i]) for i in range(3)])
        ell = lambda p: ((p.x - ec.x) / ax.x) ** 2 + ((p.y - ec.y) / ax.y) ** 2 + ((p.z - ec.z) / ax.z) ** 2
        SINK = float(E("CROWN_SINK", "0.997"))
        moved = 0
        for v in bm.verts:
            if abs(v.co.x) < 0.08 and v.co.z > z1 - 0.075 and ell(v.co) > SINK ** 2:
                d = v.co - ec
                v.co = ec + d * (SINK / math.sqrt(ell(v.co)))
                moved += 1
        print("ELLIPSOID centre", tuple(round(x, 3) for x in ec), "axes", tuple(round(x, 3) for x in ax))
        print("CREST panels %d (%d faces), %d verts projected onto the shell ellipsoid" % (len(crest), sum(len(g) for g in crest), moved))
        # 2) white face guard -> removed (the breather goes there)
        guard = [f for g, c in pans if c.y < -0.07 and c.z < z0 + 0.136 for f in g]
        bmesh.ops.delete(bm, geom=list(set(guard)), context="FACES")
        bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")
        print("GUARD faces removed", len(set(guard)))
        bm.faces.ensure_lookup_table()
        bm.normal_update()
        for g, c in panels(bm):
            if c.z < z0 + 0.07:
                pts = [v.co for f in g for v in f.verts]
                print("LOWPANEL n=%d c=(%.3f %.3f %.3f) size=(%.3f %.3f %.3f)" % (len(g), *c, *[max(p[i] for p in pts) - min(p[i] for p in pts) for i in range(3)]))
        if E("TUSKS", "keep") == "clip":      # cheek-guard tips left hanging in front once the face guard is gone
            tz, ty = z0 + float(E("TUSK_Z", "0.10")), float(E("TUSK_Y", "-0.03"))
            n = 0
            for v in bm.verts:                 # clip: the guard tips end on a level line instead of hanging down (deleting faces showed the inside)
                if v.co.y < ty and v.co.z < tz:
                    v.co.z = tz
                    n += 1
            print("TUSK verts clipped up to z0+%.3f: %d" % (tz - z0, n))
        if COLLAR == "drop":
            low = [f for g, c in panels(bm) if c.z < z0 + 0.07 for f in g]
            bmesh.ops.delete(bm, geom=list(set(low)), context="FACES")
            bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")
            print("LINER faces removed", len(set(low)))
        # samurai pass: DOME (0..1) pulls the whole upper bowl toward the fitted ellipsoid, so the faceted hex plates become a smooth hachi
        # (owner's reference: smooth lacquered dome). DOME_SUB extra cuts per edge first (so the dome is round, not big flat facets).
        # Ramps in from DOME_Z (fraction of the helmet height) over the next 0.15; the front below the brow (visor) is left alone.
        DOME = float(E("DOME", "0"))
        if DOME > 0:
            dz0 = z0 + float(E("DOME_Z", "0.35")) * (z1 - z0)
            cuts = int(E("DOME_SUB", "2"))
            if cuts:
                ed = {e for f in bm.faces if all(v.co.z > dz0 - 0.01 for v in f.verts) for e in f.edges}
                bmesh.ops.subdivide_edges(bm, edges=list(ed), cuts=cuts, use_grid_fill=True)
            nd = 0
            for v in bm.verts:
                w = min(1.0, max(0.0, (v.co.z - dz0) / (0.15 * (z1 - z0)))) * DOME
                if w <= 0:
                    continue
                q = ec + (v.co - ec) * (SINK / math.sqrt(max(ell(v.co), 1e-9)))
                v.co = v.co.lerp(q, w)
                nd += 1
            for f in bm.faces:
                if all(v.co.z > dz0 for v in f.verts):
                    f.smooth = True
            bm.normal_update()
            print("DOME %.2f: %d verts pulled to the ellipsoid (%d cuts)" % (DOME, nd, cuts))
    else:     # House Guard: drop the chin vent (the breather replaces it), as in hg_build.py
        cy_ = sum(v.co.y for v in bm.verts) / len(bm.verts)
        chin = [f for g, c in panels(bm) if c.y < cy_ - 0.01 and abs(c.x) < 0.05 and (c.z - z0) / (z1 - z0) < 0.42 for f in g]
        bmesh.ops.delete(bm, geom=list(set(chin)), context="FACES")
        bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")
        print("HG chin faces removed", len(set(chin)))
    bm.to_mesh(helm.data)
    bm.free()
    helm.matrix_world = Matrix.Identity(4)
    for m in list(helm.modifiers):
        helm.modifiers.remove(m)
    helm.parent = None
    helm.data.transform(E_HEAD @ W_HEAD.inverted())
    bpy.data.objects.remove(wrig, do_unlink=True)
    helm.name = "Kit_wardenhelm" if HELMET == "warden" else "Kit_hghelm"
    if HELMET == "warden":
        wanted = {"Base Color": TEX, "Specular IOR Level": P.WARDEN_DIR + "AtreideWarden_MetallicGlossAO.png",
                  "Normal": P.WARDEN_DIR + "AtreideWarden_Normal.png"}
    else:
        hw = P.WORK + "/house_guard/"
        wanted = {"Base Color": hw + "H5_copper_crown_chin_collar_smooth.png", "Specular IOR Level": hw + "HG_Metal_smooth.png",
                  "Normal": hw + "HG_Normal_smooth.png"}
    for mat in helm.data.materials:
        if mat:
            mat.name = "Mat_WardenHelm" if HELMET == "warden" else "Mat_HGHelm"
            mat.use_nodes = True
            for _ in bs.wire_textures(mat, wanted):
                pass

# ---------- fit: smallest scale with the head (skull, goggles, hood) behind the face inside the shell, 4 mm clearance
head = bpy.data.objects["CommandoHead"]
skull = [head.matrix_world @ v.co for v in head.data.vertices]
co0 = [v.co.copy() for v in helm.data.vertices]
faces = [tuple(p.vertices) for p in helm.data.polygons]
ctr = sum(co0, Vector()) / len(co0)
zlo = min(c.z for c in co0)
front = min(p.y for p in skull)
back = [p for p in skull if p.y > front + 0.05 and p.z > zlo + 0.02]


def outside(s, off):
    t = BVHTree.FromPolygons([ctr + (c - ctr) * s + off for c in co0], faces)
    n = 0
    for p in back:
        hit, nrm, _, dist = t.find_nearest(p, 0.06)
        if hit is not None and ((p - hit).dot(nrm) > 0 or dist < 0.004):
            n += 1
    return n


if float(E("FIT_SCALE", "0")):
    s, off, nout = float(E("FIT_SCALE")), Vector((0, 0, 0)), -1
else:
    best = None
    for s in [1.00 + 0.03 * i for i in range(20)]:
        for dz in (-0.02, 0.0, 0.02):
            for dy in (-0.02, 0.0, 0.02):
                n = outside(s, Vector((0, dy, dz)))
                key = (n, s, abs(dz) + abs(dy))
                if best is None or key < best[0]:
                    best = (key, s, Vector((0, dy, dz)))
        if best[0][0] <= 2:
            break
    (_, s, off), nout = best[1:] and (best[0], best[1], best[2]), best[0][0]
off += Vector((0, float(E("FIT_DY", "0")), float(E("FIT_DZ", "0"))))
for v, c in zip(helm.data.vertices, co0):
    v.co = ctr + (c - ctr) * s + off
helm.data.update()
if HELMET == "ss" and "SwornBadge" in SS_EXTRA:     # the brow badge sits on the dome: scale it with the dome
    bdg = SS_EXTRA["SwornBadge"]
    for v in bdg.data.vertices:
        v.co = ctr + (v.co - ctr) * s + off
    bdg.data.update()
print("FIT scale %.2f offset %s, %d of %d skull points outside" % (s, tuple(round(x, 3) for x in off), nout, len(back)))
hv = [v.co.copy() for v in helm.data.vertices]
bvh = BVHTree.FromPolygons(hv, [tuple(p.vertices) for p in helm.data.polygons])
hz0, hz1 = min(p.z for p in hv), max(p.z for p in hv)
# hide head parts that poke out of the shell above its rim (hood, goggles), like v3b
rim = hz0
bad = set()
for v in head.data.vertices:
    p = head.matrix_world @ v.co
    if p.z < rim + 0.012 or E("CULL", "0" if HELMET == "ss" else "1") == "0":     # open-face dome: keep the face
        continue
    hit, nrm, _, dist = bvh.find_nearest(p, 0.08)
    if hit is not None and (p - hit).dot(nrm) > -0.002:
        bad.add(v.index)
hb = bmesh.new()
hb.from_mesh(head.data)
kill = [f for f in hb.faces if any(v.index in bad for v in f.verts)]
bmesh.ops.delete(hb, geom=kill, context="FACES")
hb.to_mesh(head.data)
hb.free()
print("CULL head faces", len(kill))
if E("GOGGLES") == "drop":    # samurai pass: the Elite head's copper goggles (Mat_Thorvald_Trim faces of CommandoHead) removed
    gi = [i for i, m in enumerate(head.data.materials) if m and "Trim" in m.name]
    hb = bmesh.new()
    hb.from_mesh(head.data)
    kill = [fc for fc in hb.faces if fc.material_index in gi]
    bmesh.ops.delete(hb, geom=kill, context="FACES")
    bmesh.ops.delete(hb, geom=[v for v in hb.verts if not v.link_faces], context="VERTS")
    hb.to_mesh(head.data)
    hb.free()
    print("GOGGLES faces removed", len(kill))

# ---------- Karlin breather + antennae
want = (["Kit_face"] if HELMET != "ss" else []) + (["Kit_antenna_l", "Kit_antenna_r"] if E("ANT", "1") == "1" else [])
with bpy.data.libraries.load(P.KARLIN_H2F4, link=False) as (src, dst):
    dst.objects = want + [n for n in src.objects if n in ("Rig", "Armature")][:1]
krig = next(o for o in dst.objects if o.type == "ARMATURE")
K_HEAD = krig.matrix_world @ krig.data.bones["B_HeadJ"].matrix_local
parts = {}
for o in dst.objects:
    if o.type != "MESH":
        continue
    bpy.context.scene.collection.objects.link(o)
    for m in list(o.modifiers):
        o.modifiers.remove(m)
    o.parent = None
    o.data.transform(E_HEAD @ K_HEAD.inverted() @ o.matrix_world)
    o.matrix_world = Matrix.Identity(4)
    parts[o.name.split(".")[0]] = o
bpy.data.objects.remove(krig, do_unlink=True)
if HELMET != "ss":
    f = parts["Kit_face"]
    imgs = [n.image for n in f.active_material.node_tree.nodes if n.type == "TEX_IMAGE" and n.image]
    img = next((i for i in imgs if "lbedo" in (i.name + i.filepath)), imgs[0])
    w, h = img.size
    px = np.array(img.pixels[:]).reshape(h, w, 4)
    fb = bmesh.new()
    fb.from_mesh(f.data)
    uv = fb.loops.layers.uv.active
    fz0, fz1 = min(v.co.z for v in fb.verts), max(v.co.z for v in fb.verts)
    fyy = min(v.co.y for v in fb.verts)
    kill = []
    for fc in fb.faces:
        c = fc.calc_center_median()
        cc = np.array([px[min(h - 1, int((l[uv].uv.y % 1) * h)), min(w - 1, int((l[uv].uv.x % 1) * w)), :3] for l in fc.loops]).mean(0)
        sat = (cc.max() - cc.min()) / cc.max() if cc.max() > 0 else 0
        if not (sat < 0.30 and c.y < fyy + 0.07 and (c.z - fz0) / (fz1 - fz0) < 0.62):
            kill.append(fc)
    bmesh.ops.delete(fb, geom=kill, context="FACES")
    bmesh.ops.delete(fb, geom=[v for v in fb.verts if not v.link_faces], context="VERTS")
    fb.to_mesh(f.data)
    fb.free()
    c = sum((v.co for v in f.data.vertices), Vector()) / len(f.data.vertices)
    for v in f.data.vertices:
        v.co = c + (v.co - c) * MS + Vector((0, MY, MZ))
    f.data.update()
    f.name = "Kit_breather"
    print("BREATHER faces", len(f.data.polygons))
    # goggles/eyes of the Commando head that show between the breather and the visor -> removed (the helmet shell reads as the visor)
    bz = max(v.co.z for v in f.data.vertices)
    hb = bmesh.new()
    hb.from_mesh(head.data)
    hy = sum(v.co.y for v in hb.verts) / len(hb.verts)
    kill = [fc for fc in hb.faces if (head.matrix_world @ fc.calc_center_median()).z > bz - 0.015 and (head.matrix_world @ fc.calc_center_median()).y < hy - 0.02]
    bmesh.ops.delete(hb, geom=kill, context="FACES")
    hb.to_mesh(head.data)
    hb.free()
    print("CULL face/goggle faces", len(kill))
parts.update(SS_EXTRA)       # Sworn Sword build: its own half-mask and brow badge
f = parts.get("Kit_face") or parts.get("Kit_breather")
top = max(hv, key=lambda p: p.z - 3 * abs(p.x))
for nm in ("Kit_antenna_l", "Kit_antenna_r"):
    if nm not in parts:
        continue
    o = parts[nm]
    vs = [v.co.copy() for v in o.data.vertices]
    sgn = 1 if sum(v.x for v in vs) > 0 else -1
    zmin = min(v.z for v in vs)
    # samurai pass: ANT_W widens the cross-section in the front plane (a flat kuwagata blade), ANT_T thins it front-to-back
    aw, at_ = float(E("ANT_W", "1")), float(E("ANT_T", "1"))
    if aw != 1 or at_ != 1:
        zs_ = np.array([v.z for v in vs])
        P3 = np.array([tuple(v) for v in vs])
        for v in o.data.vertices:
            near = np.abs(zs_ - v.co.z) < 0.012
            c3 = P3[near].mean(0)
            v.co = Vector((c3[0] + (v.co.x - c3[0]) * aw, c3[1] + (v.co.y - c3[1]) * at_, v.co.z))
        vs = [v.co.copy() for v in o.data.vertices]
    bv = [v for v in vs if v.z < zmin + 0.015]
    base = sum(bv, Vector()) / len(bv)
    loc, nrm, idx, dist = bvh.ray_cast(Vector((sgn * AX, top.y + AY, hz1 + 0.3)), Vector((0, 0, -1)))
    # ANT_ROLL: extra outward splay (deg, about the forward axis); ANT_YAW: tips turned forward (+) or back (deg, about Z)
    Rr = Matrix.Rotation(math.radians(sgn * float(E("ANT_ROLL", "0"))), 4, "Y") @ Matrix.Rotation(math.radians(-sgn * float(E("ANT_YAW", "0"))), 4, "Z")
    T = Matrix.Translation(loc - Vector((0, 0, 0.006))) @ Matrix.Rotation(math.radians(AT), 4, "X") @ Rr @ Matrix.Scale(AS, 4) @ Matrix.Translation(-base)
    o.data.transform(T)
    o.data.update()
    for sl in o.material_slots:
        if sl.material and "Katana" in sl.material.name:
            sl.material.name = "Mat_Antenna"
            if E("ANT_COLOR"):                  # e.g. B87333: flat matte copper antennae (no texture)
                nt = sl.material.node_tree
                bsdf = next(n for n in nt.nodes if n.type == "BSDF_PRINCIPLED")
                for l in list(bsdf.inputs["Base Color"].links):
                    nt.links.remove(l)
                hc = E("ANT_COLOR")
                bsdf.inputs["Base Color"].default_value = [(int(hc[i:i + 2], 16) / 255) ** 2.2 for i in (0, 2, 4)] + [1]
                bsdf.inputs["Roughness"].default_value = 0.55
    print("ANT", nm, "at", tuple(round(x, 3) for x in loc))
# samurai pass: HALO=n adds a sunburst of n spikes round the back of the bowl (owner's reference: the spiked ring behind the kabuto).
# Each spike is a copy of Karlin's antenna, shrunk (HALO_LEN = its length in m) and pointed radially
# out from a centre HALO_DY behind / HALO_DZ above the helmet centre, over +-HALO_ARC deg from straight up, leaning back HALO_TILT deg.
NH = int(E("HALO", "0"))
if NH and "Kit_antenna_l" in parts:
    src_ = parts["Kit_antenna_l"]
    with bpy.data.libraries.load(P.KARLIN_H2F4, link=False) as (s2, d2):
        d2.objects = ["Kit_antenna_l"]
    proto = d2.objects[0]
    pv = [v.co.copy() for v in proto.data.vertices]
    pz0 = min(v.z for v in pv)
    pbase = sum((v for v in pv if v.z < pz0 + 0.015), Vector()) / max(1, len([v for v in pv if v.z < pz0 + 0.015]))
    ptip = max(pv, key=lambda v: v.z)
    plen = (ptip - pbase).length
    L = float(E("HALO_LEN", "0.12"))
    arc, tilt = float(E("HALO_ARC", "100")), math.radians(float(E("HALO_TILT", "20")))
    hcen = Vector((0, sum(p.y for p in hv) / len(hv) + float(E("HALO_DY", "0.03")), (hz0 + hz1) / 2 + float(E("HALO_DZ", "0.03"))))
    R0 = float(E("HALO_R", "0.10"))
    me_ = bpy.data.meshes.new("Kit_halo")
    hb2 = bmesh.new()
    gap = float(E("HALO_GAP", "10"))       # no spikes within +-HALO_GAP deg of straight up (they would poke through the dome / hide behind the horns)
    for i in range(NH):
        a = math.radians(-arc + 2 * arc * i / max(1, NH - 1))
        if abs(math.degrees(a)) < gap:
            continue
        dirv = Vector((math.sin(a), 0, math.cos(a)))
        dirv = Matrix.Rotation(tilt, 3, "X") @ dirv       # lean the ring back (+ = tops tilt toward +y, the back)
        dirv.normalize()
        rot = (ptip - pbase).normalized().rotation_difference(dirv).to_matrix().to_4x4()
        M_ = Matrix.Translation(hcen + dirv * R0) @ rot @ Matrix.Scale(L / plen, 4) @ Matrix.Translation(-pbase)
        tmp = proto.data.copy()
        tmp.transform(M_)
        hb2.from_mesh(tmp)
        bpy.data.meshes.remove(tmp)
    hb2.to_mesh(me_)
    hb2.free()
    halo = bpy.data.objects.new("Kit_halo", me_)
    bpy.context.scene.collection.objects.link(halo)
    for m in src_.data.materials:
        if E("HALO_COLOR") and m:
            m = m.copy()
            m.name = "Mat_Halo"
            bsdf = next(n for n in m.node_tree.nodes if n.type == "BSDF_PRINCIPLED")
            for l in list(bsdf.inputs["Base Color"].links):
                m.node_tree.links.remove(l)
            hcol = E("HALO_COLOR")
            bsdf.inputs["Base Color"].default_value = [(int(hcol[i:i + 2], 16) / 255) ** 2.2 for i in (0, 2, 4)] + [1]
        me_.materials.append(m)
    parts["Kit_halo"] = halo
    bpy.data.objects.remove(proto, do_unlink=True)
    print("HALO", NH, "spikes")

if E("MASK_TINT") and HELMET != "ss":        # samurai pass: breather recoloured like a lacquered mempo (hex colour x the breather's own shading)
    hc_ = E("MASK_TINT")
    tint = np.array([(int(hc_[i:i + 2], 16) / 255) ** 2.2 for i in (0, 2, 4)])
    for sl in f.material_slots:
        for n in sl.material.node_tree.nodes:
            if n.type == "TEX_IMAGE" and n.image and "lbedo" in (n.image.name + n.image.filepath):
                iw, ih = n.image.size
                a = np.array(n.image.pixels[:]).reshape(ih, iw, 4)
                lum = a[..., :3].mean(-1, keepdims=True)
                a[..., :3] = np.clip(tint * (lum / max(np.median(lum), 1e-3)) * float(E("MASK_TINT_K", "1.0")), 0, 1)
                im = bpy.data.images.new("Breather_tint", iw, ih, alpha=True)
                im.pixels[:] = a.ravel()
                n.image = im
                break

# samurai pass: SHIKORO=1 turns the Trooper's kasa into a flared neck guard: the crown of the cone is cut away (radius < SH_RIN of the brim),
# the front is opened (SH_FRONT deg either side of the face), it is scaled (SH_SCALE) and hung so its cut edge sits SH_DZ above the helmet rim,
# tilted SH_TILT deg (plus = back edge lower). Same part and paint as the Trooper / Ranger / Iron Guard kasa.
if KASA is not None:
    kb = bmesh.new()
    kb.from_mesh(KASA.data)
    km = KASA.matrix_world.copy()
    for v in kb.verts:
        v.co = km @ v.co
    kc = [v.co for v in kb.verts]
    kx, ky = (min(p.x for p in kc) + max(p.x for p in kc)) / 2, (min(p.y for p in kc) + max(p.y for p in kc)) / 2
    kR = max(math.hypot(p.x - kx, p.y - ky) for p in kc)
    kztop = max(p.z for p in kc)
    rin, fro = float(E("SH_RIN", "0.45")), float(E("SH_FRONT", "60"))
    kill = []
    for fc in kb.faces:
        c = fc.calc_center_median()
        r = math.hypot(c.x - kx, c.y - ky) / kR
        ang = math.degrees(math.atan2(c.x - kx, -(c.y - ky)))       # 0 = straight ahead (-y)
        if r < rin or abs(ang) < fro:
            kill.append(fc)
    bmesh.ops.delete(kb, geom=kill, context="FACES")
    bmesh.ops.delete(kb, geom=[v for v in kb.verts if not v.link_faces], context="VERTS")
    zcut = max(v.co.z for v in kb.verts)
    s_ = float(E("SH_SCALE", "0.8"))
    sz = float(E("SH_SZ", "1.0"))            # extra vertical stretch (steeper flare)
    hcx, hcy = 0.0, (min(p.y for p in hv) + max(p.y for p in hv)) / 2 + float(E("SH_DY", "0.01"))
    tgt = hz0 + float(E("SH_DZ", "0.03"))
    Tk = (Matrix.Translation(Vector((hcx, hcy, tgt))) @ Matrix.Rotation(math.radians(-float(E("SH_TILT", "8"))), 4, "X")
          @ Matrix.Diagonal(Vector((s_ * float(E("SH_SX", "1.0")), s_, s_ * sz, 1))) @ Matrix.Translation(Vector((-kx, -ky, -zcut))))
    for v in kb.verts:
        v.co = Tk @ v.co
    kb.to_mesh(KASA.data)
    kb.free()
    KASA.matrix_world = Matrix.Identity(4)
    for m in list(KASA.modifiers):
        KASA.modifiers.remove(m)
    KASA.parent = None
    KASA.name = "Kit_shikoro"
    parts["Kit_shikoro"] = KASA
    print("SHIKORO faces", len(KASA.data.polygons), "kasa R %.3f" % kR)

kit = [helm] + list(parts.values())
for o in kit:
    o.vertex_groups.clear()
    o.vertex_groups.new(name="B_HeadJ").add([v.index for v in o.data.vertices], 1.0, "REPLACE")
    o.parent = rig
    md = o.modifiers.new("Armature", "ARMATURE")
    md.object = rig
os.makedirs(P.ELITE + "/03_blender/helmet_study", exist_ok=True)
try:
    bpy.ops.file.pack_all()
except RuntimeError as e:
    print("PACK WARNING", str(e)[:120])
bpy.ops.wm.save_as_mainfile(filepath=P.ELITE + "/03_blender/helmet_study/wd_%s.blend" % TAG)
print("SAVED")

# ---------- renders
views = E("VIEWS", "all")
if views != "none":
    sc = bpy.context.scene
    for o in [o for o in bpy.data.objects if o.type in ("LIGHT", "CAMERA")]:
        bpy.data.objects.remove(o, do_unlink=True)
    bs.setup_world(strength=1.8, color=(0.55, 0.58, 0.64))
    bs.setup_lights(sun_energy=3.0, fill_energy=120)
    HV = {"front": (0, -1, 0.05), "tq_left": (-0.75, -0.65, 0.1), "tq_right": (0.75, -0.65, 0.1), "side_left": (-1, 0, 0.05),
          "side_right": (1, 0, 0.05), "back": (0, 1, 0.05), "back_tq_left": (-0.75, 0.65, 0.1), "back_tq_right": (0.75, 0.65, 0.1),
          "top": (0, -0.05, 1), "below": (0, -0.3, -1), "front_high": (0, -1, 0.7), "front_low": (0, -1, -0.45)}
    hc = Vector((0, sum(p.y for p in hv) / len(hv), (hz0 + hz1) / 2 + (0.07 if parts.get("Kit_antenna_l") else 0)))
    others = [o for o in bpy.data.objects if o.type == "MESH" and o not in kit]
    for o in others:
        o.hide_render = True
    bs.setup_render(500, 500)
    for tg, d in HV.items():
        if views != "all" and tg not in views.split(","):
            continue
        cam = bs.setup_camera(target=hc, ortho_scale=0.62 if parts.get("Kit_antenna_l") else 0.45, direction=d, distance=4)
        bs.render_to(OUT + "helmet_" + tg + ".png", cam)
        bpy.data.objects.remove(cam, do_unlink=True)
    for o in others:
        o.hide_render = o.name.startswith(("Thorvald_Glaive", "Thorvald_TowerShield")) and E("WEAPONS", "1") != "1"
    bs.setup_render(500, 500)
    for tg, d in (("head_front", (0, -1, 0.05)), ("head_tq", (0.7, -0.7, 0.15)), ("head_side", (1, 0, 0.05)), ("head_back", (0, 1, 0.1))):
        cam = bs.setup_camera(target=hc + Vector((0, 0, -0.08)), ortho_scale=0.8, direction=d, distance=6)
        bs.render_to(OUT + "body_" + tg + ".png", cam)
        bpy.data.objects.remove(cam, do_unlink=True)
    bs.setup_render(600, 800)
    for tg, d in (("full_front", (0, -1, 0.1)), ("full_tq", (0.7, -0.7, 0.2)), ("full_back", (0.3, 1, 0.15))):
        cam = bs.setup_camera(target=Vector((0, 0, 1.15)), ortho_scale=2.7, direction=d, distance=8)
        bs.render_to(OUT + "body_" + tg + ".png", cam)
        bpy.data.objects.remove(cam, do_unlink=True)
    # RTS: high three-quarter camera, unit about 90 px tall, shown x3 (nearest) so the pixels read like the game
    bs.setup_render(160, 160)
    for tg, d in (("rts_a", (0.55, -0.6, 0.85)), ("rts_b", (-0.6, -0.5, 0.85))):
        cam = bs.setup_camera(target=Vector((0, 0, 1.0)), ortho_scale=3.4, direction=d, distance=10)
        p = OUT + "rts_" + tg[-1] + ".png"
        bs.render_to(p, cam)
        bpy.data.objects.remove(cam, do_unlink=True)
print("DONE", TAG)
