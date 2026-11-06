"""Measure where the cannons actually sit in Thorvald_Drone_v3_twin.blend (posed frame)."""
import bpy

bpy.ops.wm.open_mainfile(filepath=r"C:\Users\justi\Python\dsw_mod\model_projects\thorvald_vehicles\03_blender\Thorvald_Drone_v3_twin.blend")
bpy.context.scene.frame_set(1)
bpy.context.view_layer.update()


def posed(obj):
    dg = bpy.context.evaluated_depsgraph_get()
    ev = obj.evaluated_get(dg)
    me = ev.to_mesh()
    pts = [ev.matrix_world @ v.co for v in me.vertices]
    ev.to_mesh_clear()
    return pts


for ob in bpy.data.objects:
    if ob.type != "MESH":
        continue
    pts = posed(ob)
    print("OBJ %s verts %d  x %.3f..%.3f  y %.3f..%.3f  z %.3f..%.3f" % (
        ob.name, len(pts), min(p.x for p in pts), max(p.x for p in pts),
        min(p.y for p in pts), max(p.y for p in pts), min(p.z for p in pts), max(p.z for p in pts)))
