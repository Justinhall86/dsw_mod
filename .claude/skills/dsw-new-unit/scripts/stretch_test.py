"""Find edges that stretch badly in a real clip frame vs rest.
    blender -b <unit.blend> --python stretch_test.py -- <clip> <frame> [--ratio 2.5]
"""
import os, sys
import bpy
HERE = os.path.dirname(os.path.abspath(__file__)); PROJ = os.path.dirname(HERE)
a = sys.argv[sys.argv.index("--") + 1:]
clip, frame = a[0], int(a[1])
ratio = float(a[a.index("--ratio") + 1]) if "--ratio" in a else 2.5
rig = next(o for o in bpy.data.objects if o.type == "ARMATURE")
meshes = [o for o in bpy.data.objects if o.type == "MESH" and not o.hide_render]
rest = {}
for o in meshes:
    rest[o.name] = [(e.vertices[0], e.vertices[1], (o.data.vertices[e.vertices[0]].co - o.data.vertices[e.vertices[1]].co).length) for e in o.data.edges]
before = set(bpy.data.objects)
bpy.ops.import_scene.fbx(filepath=os.path.join(PROJ, "05_fbx_export", "anim", clip + ".fbx"))
new = [o for o in bpy.data.objects if o not in before]
action = next(o for o in new if o.type == "ARMATURE").animation_data.action
for o in new:
    bpy.data.objects.remove(o, do_unlink=True)
rig.animation_data_create(); rig.animation_data.action = action
if getattr(action, "slots", None):
    rig.animation_data.action_slot = action.slots[0]
bpy.context.scene.frame_set(frame)
dg = bpy.context.evaluated_depsgraph_get()
for o in meshes:
    ev = o.evaluated_get(dg); me = ev.to_mesh()
    bad = []
    for (i, j, l0) in rest[o.name]:
        if l0 < 1e-5: continue
        l1 = (me.vertices[i].co - me.vertices[j].co).length
        if l1 / l0 > ratio and l1 > 0.03:
            bad.append((l1 / l0, l1, i, j))
    bad.sort(reverse=True)
    print("STRETCH %-22s edges>%.1fx: %d" % (o.name, ratio, len(bad)))
    for r, l1, i, j in bad[:6]:
        w = o.matrix_world @ me.vertices[i].co
        gi = [(o.vertex_groups[g.group].name, round(g.weight, 2)) for g in o.data.vertices[i].groups]
        r0 = o.matrix_world @ o.data.vertices[i].co; r1 = o.matrix_world @ o.data.vertices[j].co
        gj = [(o.vertex_groups[g.group].name, round(g.weight, 2)) for g in o.data.vertices[j].groups]
        print("    x%.1f len %.3f at (%.2f %.2f %.2f) groups %s | rest (%.2f %.2f %.2f)-(%.2f %.2f %.2f) other %s" % (r, l1, w.x, w.y, w.z, gi, r0.x, r0.y, r0.z, r1.x, r1.y, r1.z, gj))
    ev.to_mesh_clear()
