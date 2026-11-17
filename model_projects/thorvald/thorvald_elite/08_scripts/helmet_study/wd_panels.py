"""Warden (Atreides Elite) helmet: split the head-bone faces into panels (surface bends > ANG deg), write panels.json
(per panel: centre, size, face count, UV polygons) and render 12 views with the vanilla paint plus 4 views in "panel id" colours.
    blender -b --python wd_panels.py
Out: 04_textures/helmet_study/warden/panels.json, panel_ids.png (legend);
     gallery/helmets_and_heads/warden_study/renders/{orig,ids}/<view>.png"""
import os, sys, math, json, random, bmesh, bpy
from mathutils import Vector
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import paths as P
sys.path.insert(0, P.SCENE_HELPERS)
import blender_scene as bs

ANG = float(os.environ.get("ANG", "32"))
W = P.WORK + "/warden/"
os.makedirs(W, exist_ok=True)
D = P.WARDEN_DIR
FBX = P.REPO + "/model_projects/thorvald/thorvald_trooper/05_fbx_export/Female01_AtreideWarden_TRUE_FBX.fbx"
VIEWS = {"front": (0, -1, 0.05), "tq_left": (-0.75, -0.65, 0.1), "tq_right": (0.75, -0.65, 0.1), "side_left": (-1, 0, 0.05),
         "side_right": (1, 0, 0.05), "back": (0, 1, 0.05), "back_tq_left": (-0.75, 0.65, 0.1), "back_tq_right": (0.75, 0.65, 0.1),
         "top": (0, -0.05, 1), "below": (0, -0.3, -1), "front_high": (0, -1, 0.7), "front_low": (0, -1, -0.45)}


def load():
    bs.reset_scene()
    body, rig = bs.import_model(FBX)
    rig.data.pose_position = "REST"
    bpy.context.view_layer.update()
    names = {g.index: g.name for g in body.vertex_groups}
    dom = {v.index: names[max(v.groups, key=lambda x: x.weight).group] for v in body.data.vertices if v.groups}
    bm = bmesh.new()
    bm.from_mesh(body.data)
    bmesh.ops.delete(bm, geom=[f for f in bm.faces if not all(dom.get(v.index) in ("B_HeadJ", "B_Neck01J") for v in f.verts)], context="FACES")
    bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")
    bm.to_mesh(body.data)
    bm.free()
    return body, rig


def panels_of(body):
    bm = bmesh.new()
    bm.from_mesh(body.data)
    bm.faces.ensure_lookup_table()
    uv = bm.loops.layers.uv.active
    mw = body.matrix_world
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
                    if g.index in seen or g is f or f.normal.angle(g.normal) > math.radians(ANG):
                        continue
                    seen.add(g.index)
                    st.append(g)
        pts = [mw @ v.co for f in grp for v in f.verts]
        lo = Vector((min(p.x for p in pts), min(p.y for p in pts), min(p.z for p in pts)))
        hi = Vector((max(p.x for p in pts), max(p.y for p in pts), max(p.z for p in pts)))
        out.append({"faces": [f.index for f in grp], "centre": list((lo + hi) / 2), "lo": list(lo), "hi": list(hi),
                    "uv": [[(l[uv].uv.x, l[uv].uv.y) for l in f.loops] for f in grp]})
    bm.free()
    return out


if __name__ == "__main__":
    body, rig = load()
    pans = panels_of(body)
    mw = body.matrix_world
    zs = [(mw @ v.co).z for v in body.data.vertices]
    meta = {"z0": min(zs), "z1": max(zs), "head": list(rig.matrix_world @ rig.data.bones["B_HeadJ"].head_local)}
    json.dump({"meta": meta, "panels": pans}, open(W + "panels.json", "w"))
    print("PANELS", len(pans), "z %.3f-%.3f" % (meta["z0"], meta["z1"]))
    for i, p in enumerate(pans):
        if len(p["faces"]) >= 4:
            print("P%02d n=%3d c=(%.3f %.3f %.3f) size=(%.3f %.3f %.3f)" % (i, len(p["faces"]), *p["centre"],
                  *[h - l for h, l in zip(p["hi"], p["lo"])]))
    cz = (meta["z0"] + meta["z1"]) / 2
    cy = sum((mw @ v.co).y for v in body.data.vertices) / len(body.data.vertices)
    wanted = {"Base Color": D + "AtreideWarden_Albedo.png", "Specular IOR Level": D + "AtreideWarden_MetallicGlossAO.png",
              "Normal": D + "AtreideWarden_Normal.png"}
    for mat in body.data.materials:
        if mat and mat.use_nodes:
            for _ in bs.wire_textures(mat, wanted):
                pass
    bs.setup_world(strength=1.8, color=(0.55, 0.58, 0.64))
    bs.setup_lights(sun_energy=3.0, fill_energy=120)
    bs.setup_render(500, 500)
    G = P.GAL + "/warden_study/renders/"

    def shoot(tag, views):
        for tg in views:
            cam = bs.setup_camera(target=Vector((0, cy, cz)), ortho_scale=0.36, direction=VIEWS[tg], distance=4)
            bs.render_to(G + tag + "/" + tg + ".png", cam)
            bpy.data.objects.remove(cam, do_unlink=True)
    shoot("orig", VIEWS)
    # panel-id colours: one flat material per panel
    random.seed(3)
    cols = []
    me = body.data
    me.materials.clear()
    for i, p in enumerate(pans):
        m = bpy.data.materials.new("P%02d" % i)
        c = (random.random(), random.random(), random.random(), 1)
        cols.append(c)
        m.diffuse_color = c
        m.use_nodes = True
        m.node_tree.nodes["Principled BSDF"].inputs["Base Color"].default_value = c
        me.materials.append(m)
        for fi in p["faces"]:
            me.polygons[fi].material_index = i
    shoot("ids", ["front", "tq_right", "side_left", "back", "top", "front_low"])
    json.dump([[round(x, 3) for x in c[:3]] for c in cols], open(W + "panel_colours.json", "w"))
    print("DONE")
