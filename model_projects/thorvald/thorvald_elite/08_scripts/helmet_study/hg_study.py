import os, sys, json, math, bmesh, bpy
from mathutils import Vector
import os as _os, sys as _sys
_sys.path.insert(0, _os.path.dirname(_os.path.abspath(__file__)))
import paths as P
sys.path.insert(0, P.SCENE_HELPERS)
import blender_scene as bs
D = P.HG_DIR
S = P.WORK + "/house_guard/"
ALB = os.environ.get("ALB", D + "HouseGuard_Albedo.png"); TAG = os.environ.get("TAG", "orig")
MET = os.environ.get("MET", D + "HouseGuard_MetallicGlossAO.png")
bs.reset_scene()
body, rig = bs.import_model(D + "Male01_HouseGuard_TRUE_FBX.fbx")
wanted = {"Base Color": ALB, "Specular IOR Level": MET, "Normal": D + "HouseGuard_Normal.png"}
for mat in body.data.materials:
    if mat and mat.use_nodes:
        for _ in bs.wire_textures(mat, wanted): pass
names = {g.index: g.name for g in body.vertex_groups}
dom = {v.index: names[max(v.groups, key=lambda x: x.weight).group] for v in body.data.vertices if v.groups}
bm = bmesh.new(); bm.from_mesh(body.data)
kill = [f for f in bm.faces if not all(dom.get(v.index) in ("B_HeadJ", "B_Neck01J") for v in f.verts)]
bmesh.ops.delete(bm, geom=kill, context="FACES")
bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")
bm.to_mesh(body.data)
if TAG == "orig":   # dump UV masks by region
    mw = body.matrix_world; uv = bm.loops.layers.uv.active
    zs = [(mw @ v.co).z for v in bm.verts]; z0, z1 = min(zs), max(zs); H = z1 - z0
    cy = sum((mw @ v.co).y for v in bm.verts) / len(bm.verts)
    import math as _m
    cats = {}; seen = set(); ANG = float(os.environ.get("ANG", "32"))
    panels = []
    for f0 in bm.faces:
        if f0.index in seen: continue
        stack = [f0]; seen.add(f0.index); grp = []
        while stack:
            f = stack.pop(); grp.append(f)
            for e in f.edges:
                for g in e.link_faces:
                    if g.index in seen or g is f: continue
                    if f.normal.angle(g.normal) > _m.radians(ANG): continue
                    seen.add(g.index); stack.append(g)
        panels.append(grp)
    print("PANELS", len(panels), sorted(len(p) for p in panels)[-12:])
    for i, grp in enumerate(panels):
        cs = [mw @ f.calc_center_median() for f in grp]
        cx = sum(c.x for c in cs) / len(cs); cyy = sum(c.y for c in cs) / len(cs); czz = sum(c.z for c in cs) / len(cs)
        zr = (czz - z0) / H; front = cyy < cy - 0.01
        if zr < 0.50 and not (front and abs(cx) < 0.075): k = "collar"
        elif front and abs(cx) < 0.05 and zr < 0.42: k = "chin"
        elif zr > 0.82: k = "dome"
        elif front and zr > 0.38: k = "plate"
        elif front: k = "collar"
        else: k = "shell"
        cats.setdefault(k, []).extend([[(l[uv].uv.x, l[uv].uv.y) for l in f.loops] for f in grp])
        cats.setdefault("panel%d" % i, []).extend([[(l[uv].uv.x, l[uv].uv.y) for l in f.loops] for f in grp])
    json.dump(cats, open(S + "cats.json", "w")); print("CATS", {k: len(v) for k, v in cats.items()})
bm.free()
zs = [(body.matrix_world @ v.co).z for v in body.data.vertices]; cz = (min(zs) + max(zs)) / 2
bs.setup_world(strength=1.8, color=(0.55, 0.58, 0.64)); bs.setup_lights(sun_energy=3.0, fill_energy=120)
bs.setup_render(500, 500)
VIEWS = {"front": (0, -1, 0.05), "tq_left": (-0.75, -0.65, 0.1), "tq_right": (0.75, -0.65, 0.1), "side_left": (-1, 0, 0.05), "side_right": (1, 0, 0.05),
         "back": (0, 1, 0.05), "back_tq_left": (-0.75, 0.65, 0.1), "back_tq_right": (0.75, 0.65, 0.1), "top": (0, -0.05, 1), "below": (0, -0.3, -1),
         "front_high": (0, -1, 0.7), "front_low": (0, -1, -0.45)}
for tag, dd in VIEWS.items():
    cam = bs.setup_camera(target=Vector((0, 0, cz)), ortho_scale=0.42, direction=dd, distance=4)
    bs.render_to(P.GAL + "/house_guard_study/renders/%s/%s.png" % (TAG, tag), cam)
    bpy.data.objects.remove(cam, do_unlink=True)
print("DONE", TAG)
