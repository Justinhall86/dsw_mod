# Probe a vanilla vehicle's real FBX: bones, skin matrix (data->world), bounds, per-bone vertex weights.
# usage: blender -b --factory-startup --python 48_probe_rig.py -- <real.fbx>
import sys
import bpy
import numpy as np

fbx = sys.argv[sys.argv.index("--") + 1]
bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=fbx)
bpy.context.view_layer.update()
arm = next(o for o in bpy.data.objects if o.type == "ARMATURE")
print("ARM", arm.name, [(b.name, b.parent.name if b.parent else None) for b in arm.data.bones])
dg = bpy.context.evaluated_depsgraph_get()
for o in bpy.data.objects:
    if o.type != "MESH":
        continue
    ev = o.evaluated_get(dg)
    me = ev.to_mesh()
    world = np.array([tuple(o.matrix_world @ v.co) for v in me.vertices])
    ev.to_mesh_clear()
    data = np.array([tuple(v.co) for v in o.data.vertices])
    X = np.hstack([data, np.ones((len(data), 1))])
    sol = np.linalg.lstsq(X, world, rcond=None)[0]
    err = np.abs(X @ sol - world).max()
    print("MESH", o.name, len(data), "world min", world.min(0).round(2), "max", world.max(0).round(2))
    print("  data min", data.min(0).round(2), "max", data.max(0).round(2))
    print("  data->world\n", np.round(sol.T, 3), "fit err %.2e" % err)
    groups = {g.index: g.name for g in o.vertex_groups}
    cnt = {}
    for v in o.data.vertices:
        for g in v.groups:
            if g.weight > 0.01:
                cnt[groups[g.group]] = cnt.get(groups[g.group], 0) + 1
    print("  weights", cnt)
