"""Survey every helmet donor's head-bone geometry (faces whose verts are all mostly B_HeadJ), textured, front /
three-quarter / side, plus the same in flat colour per component (ids printed, for --pick later).

    blender -b --factory-startup --python 04_head_survey.py -- <out_dir>
"""
import colorsys
import glob
import os
import sys

import bmesh
import bpy
from mathutils import Matrix, Vector

sys.path.insert(0, r"D:\dsw_mod\.claude\skills\dsw-part-kitbash\scripts")
import dsw_parts as P  # noqa: E402

OUT = sys.argv[sys.argv.index("--") + 1]
os.makedirs(OUT, exist_ok=True)
DON = r"D:\dsw_mod\model_projects\thorvald\thorvald_hero_1\05_fbx_export\helmet_donors"


def clear():
    for o in list(bpy.data.objects):
        bpy.data.objects.remove(o, do_unlink=True)
    P.purge_orphans()


def head_part(path):
    before = set(bpy.data.objects)
    bpy.ops.import_scene.fbx(filepath=path)
    new = [o for o in bpy.data.objects if o not in before]
    arm = next(o for o in new if o.type == "ARMATURE")
    hb = arm.matrix_world @ arm.data.bones["B_HeadJ"].matrix_local
    dm = [o for o in new if o.type == "MESH"]
    for o in bpy.context.view_layer.objects:
        o.select_set(o in dm)
    bpy.context.view_layer.objects.active = dm[0]
    if len(dm) > 1:
        bpy.ops.object.join()
    h = bpy.context.view_layer.objects.active
    for m in list(h.modifiers):
        h.modifiers.remove(m)
    h.parent = None
    h.data.transform(h.matrix_world)
    h.matrix_world = Matrix.Identity(4)
    gn = {g.index: g.name for g in h.vertex_groups}
    dom = {v.index: gn[max(v.groups, key=lambda g: g.weight).group] for v in h.data.vertices if v.groups}
    bm = bmesh.new()
    bm.from_mesh(h.data)
    bmesh.ops.delete(bm, geom=[f for f in bm.faces if not all(dom.get(v.index) == "B_HeadJ" for v in f.verts)],
                     context="FACES")
    bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")
    bm.to_mesh(h.data)
    bm.free()
    for o in new:
        if o is not h:
            bpy.data.objects.remove(o, do_unlink=True)
    # head bone to the origin-ish: centre on the head bone so every donor frames the same
    h.data.transform(Matrix.Translation(-hb.translation))
    return h


sc = bpy.context.scene
for fbx in sorted(glob.glob(os.path.join(DON, "*_TRUE_FBX.fbx"))):
    name = os.path.basename(fbx).replace("_TRUE_FBX.fbx", "")
    clear()
    try:
        h = head_part(fbx)
    except Exception as e:  # noqa: BLE001
        print("FAIL", name, e)
        continue
    comps = [c for c in P.components(h) if len(c) >= 4]
    for ci, idx in enumerate(comps):
        info = P.comp_info(h, idx)
        print("COMP %-16s %2d n=%4d %s" % (name, ci, len(idx), info))
    # textured views
    P.setup_scene(sc, 400)
    vs = [v.co for v in h.data.vertices]
    if not vs:
        continue
    lo = Vector([min(v[i] for v in vs) for i in range(3)])
    hi = Vector([max(v[i] for v in vs) for i in range(3)])
    c = (lo + hi) / 2
    size = max(hi - lo) * 1.15
    cam = bpy.data.objects.new("C", bpy.data.cameras.new("C"))
    cam.data.type = "ORTHO"
    cam.data.ortho_scale = size
    sc.collection.objects.link(cam)
    sc.camera = cam
    sc.render.resolution_x = sc.render.resolution_y = 400
    for vname, d in (("front", (0, -1, 0.05)), ("tq", (0.7, -0.7, 0.1)), ("side", (1, 0, 0.05))):
        cam.location = c + Vector(d).normalized() * 3
        cam.rotation_euler = (c - cam.location).to_track_quat("-Z", "Y").to_euler()
        sc.render.filepath = os.path.join(OUT, "%s_%s.png" % (name, vname))
        bpy.ops.render.render(write_still=True)
    # flat colour per component
    col = h.data.color_attributes.new("part", "BYTE_COLOR", "POINT")
    for ci, idx in enumerate(comps):
        r, g, b = colorsys.hsv_to_rgb((ci * 0.618) % 1, 0.75, 0.95)
        for i in idx:
            col.data[i].color = (r, g, b, 1)
    m = bpy.data.materials.new("flat")
    m.use_nodes = True
    a = m.node_tree.nodes.new("ShaderNodeAttribute")
    a.attribute_name = "part"
    m.node_tree.links.new(a.outputs["Color"], m.node_tree.nodes["Principled BSDF"].inputs["Base Color"])
    h.data.materials.clear()
    h.data.materials.append(m)
    for vname, d in (("flatfront", (0, -1, 0.05)), ("flatside", (1, 0, 0.05))):
        cam.location = c + Vector(d).normalized() * 3
        cam.rotation_euler = (c - cam.location).to_track_quat("-Z", "Y").to_euler()
        sc.render.filepath = os.path.join(OUT, "%s_%s.png" % (name, vname))
        bpy.ops.render.render(write_still=True)
    print("DONE", name)
print("ALLDONE")
