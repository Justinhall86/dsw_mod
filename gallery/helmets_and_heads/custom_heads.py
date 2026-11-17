import os, sys, bmesh, bpy
from mathutils import Vector
sys.path.insert(0, "D:/dsw_mod/model_projects/thorvald/thorvald_trooper/08_scripts")
import blender_scene as bs
T = "D:/dsw_mod/model_projects/thorvald/"
OUT = "C:/Users/Justin/AppData/Local/Temp/claude/efa6784c87cb018e/86929e4f-0969-45c2-a8bd-0145882219cf/scratchpad/heads/"
L = [l.split("|") for l in open(OUT + "custom.txt").read().split("\n") if l.strip()]
HEAD = ("B_HeadJ", "B_Neck01J")
for label, rel in L:
    try:
        bpy.ops.wm.open_mainfile(filepath=T + rel)
        for o in list(bpy.data.objects):
            if o.type == "MESH" and (o.hide_render or o.hide_get() if hasattr(o,"hide_get") else False):
                pass
        for o in list(bpy.data.objects):
            if o.type != "MESH": continue
            names = {g.index: g.name for g in o.vertex_groups}
            bm = bmesh.new(); bm.from_mesh(o.data)
            dom = {}
            for v in bm.verts:
                gs = o.data.vertices[v.index].groups
                dom[v.index] = names[max(gs, key=lambda x: x.weight).group] if gs else None
            kill = [f for f in bm.faces if not all(dom.get(v.index) in HEAD for v in f.verts)]
            bmesh.ops.delete(bm, geom=kill, context="FACES")
            bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context="VERTS")
            bm.to_mesh(o.data); bm.free()
            if len(o.data.polygons) == 0: bpy.data.objects.remove(o, do_unlink=True)
        for a in bpy.data.objects:
            if a.type == 'ARMATURE': a.data.pose_position = 'REST'
        bpy.context.view_layer.update()
        ms = [o for o in bpy.data.objects if o.type == "MESH"]
        for o in bpy.data.objects:
            if o.type == "LIGHT" or o.type == "CAMERA": bpy.data.objects.remove(o, do_unlink=True)
        dg = bpy.context.evaluated_depsgraph_get()
        pts = []
        for o in ms:
            e = o.evaluated_get(dg); m = e.to_mesh()
            pts += [e.matrix_world @ v.co for v in m.vertices]
        print("ARM", [(a.name, a.animation_data.action.name if a.animation_data and a.animation_data.action else None) for a in bpy.data.objects if a.type=="ARMATURE"])
        zs = [p.z for p in pts]; cz = (min(zs) + max(zs)) / 2
        # pose may differ: use head centre in x,y
        cx = sum(p.x for p in pts) / len(pts); cy = sum(p.y for p in pts) / len(pts)
        bs.setup_world(strength=1.8, color=(0.55, 0.58, 0.64)); bs.setup_lights(sun_energy=3.0, fill_energy=120)
        bs.setup_render(450, 450)
        for tag, dd in (("front", (0, -1, 0.05)), ("tq", (0.75, -0.65, 0.1))):
            cam = bs.setup_camera(target=Vector((cx, cy, cz)), ortho_scale=0.95, direction=dd, distance=4)
            bs.render_to(OUT + "%s_%s.png" % (label, tag), cam)
            bpy.data.objects.remove(cam, do_unlink=True)
        print("HEAD OK", label, "z %.2f..%.2f" % (min(zs), max(zs)))
    except Exception as e:
        import traceback; traceback.print_exc(); print("HEAD FAIL", label, e)
