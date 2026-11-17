import os, sys, glob
import bmesh, bpy
from mathutils import Vector
sys.path.insert(0, "D:/dsw_mod/model_projects/thorvald/thorvald_trooper/08_scripts")
import blender_scene as bs
MI = "D:/dsw_mod/model_inputs/"
OUT = "C:/Users/Justin/AppData/Local/Temp/claude/efa6784c87cb018e/86929e4f-0969-45c2-a8bd-0145882219cf/scratchpad/heads/"
LIST = [l.split("|") for l in open(OUT + "list.txt").read().split("\n") if l.strip()]
only = sys.argv[sys.argv.index("--") + 1:]
for label, rel, alb in LIST:
    if only and label not in only: continue
    d = os.path.dirname(rel if rel[1:2]==":" else MI + rel)
    if rel[1:2]==":":
        import glob
        d = os.path.dirname(glob.glob(MI + "Character/**/" + alb + "_Albedo.png", recursive=True)[0])
    wanted = {"Base Color": d + "/" + alb + "_Albedo.png", "Specular IOR Level": d + "/" + alb + "_MetallicGlossAO.png", "Normal": d + "/" + alb + "_Normal.png"}
    try:
        bs.reset_scene()
        body, rig = bs.import_model((rel if rel[1:2]==":" else MI + rel))
        for mat in body.data.materials:
            if mat and mat.use_nodes:
                for _ in bs.wire_textures(mat, wanted): pass
        names = {g.index: g.name for g in body.vertex_groups}
        dom = {v.index: names[max(v.groups, key=lambda x: x.weight).group] for v in body.data.vertices if v.groups}
        bm = bmesh.new(); bm.from_mesh(body.data)
        kill = [f for f in bm.faces if not all(dom.get(v.index) in ("B_HeadJ", "B_Neck01J") for v in f.verts)]
        bmesh.ops.delete(bm, geom=kill, context="FACES")
        bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")
        bm.to_mesh(body.data); bm.free()
        zs = [(body.matrix_world @ v.co).z for v in body.data.vertices]
        cz = (min(zs) + max(zs)) / 2
        bs.setup_world(strength=1.8, color=(0.55, 0.58, 0.64)); bs.setup_lights(sun_energy=3.0, fill_energy=120)
        bs.setup_render(450, 450)
        for tag, dd in (("front", (0, -1, 0.05)), ("tq", (0.75, -0.65, 0.1))):
            cam = bs.setup_camera(target=Vector((0, 0, cz)), ortho_scale=0.42, direction=dd, distance=4)
            bs.render_to(OUT + "%s_%s.png" % (label, tag), cam)
            bpy.data.objects.remove(cam, do_unlink=True)
        print("HEAD OK", label, len(body.data.polygons))
    except Exception as e:
        print("HEAD FAIL", label, e)
