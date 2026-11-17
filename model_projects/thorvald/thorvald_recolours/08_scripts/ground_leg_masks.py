"""Blender: dump UV polygons of leg-armour faces (dominant bone B_l/rKneeJ) per material -> json.
    blender -b --factory-startup --python ground_leg_masks.py -- <idle.fbx> <out.json> <mat1,mat2>
Used by ground_recolour.py to force those texture areas to copper (owner 2026-11-13: copper shin/knee guards)."""
import bpy, sys, json
fbx, out, mats = sys.argv[sys.argv.index('--') + 1:]
mats = mats.split(',')
bpy.ops.wm.read_factory_settings(use_empty=True); bpy.ops.import_scene.fbx(filepath=fbx)
res = {}
for ob in [o for o in bpy.context.scene.objects if o.type == 'MESH']:
    me = ob.data; uv = me.uv_layers.active.data; names = {g.index: g.name for g in ob.vertex_groups}
    for p in me.polygons:
        m = ob.material_slots[p.material_index].material.name.split('.')[0].replace('Mat_', '')
        if m not in mats: continue
        ws = {}
        for vi in p.vertices:
            for g in me.vertices[vi].groups: ws[names[g.group]] = ws.get(names[g.group], 0) + g.weight
        if not ws or max(ws, key=ws.get) not in ('B_lKneeJ', 'B_rKneeJ'): continue
        res.setdefault(m, []).append([list(uv[li].uv) for li in p.loop_indices])
json.dump(res, open(out, 'w'))
print('MASK', {k: len(v) for k, v in res.items()})
