"""Blender: UV polygons per material, split into armour tone groups by dominant bone (owner 2026-11-13: two shades
of gunmetal).  dark = shoulders/arms/hands/neck/head (pauldrons, helmet), light = spine (chest + back plate).
    blender -b --factory-startup --python ground_part_masks.py -- <idle.fbx> <out.json>"""
import bpy, sys, json
fbx, out = sys.argv[sys.argv.index('--') + 1:]
DARK = ('Clavicle', 'Shoulder', 'Elbow', 'Forearm', 'Wrist', 'Palm', 'Finger', 'Thumb', 'Neck', 'Head')
LIGHT = ('Spine',)
bpy.ops.wm.read_factory_settings(use_empty=True); bpy.ops.import_scene.fbx(filepath=fbx)
res = {}
for ob in [o for o in bpy.context.scene.objects if o.type == 'MESH']:
    me = ob.data; uv = me.uv_layers.active.data; names = {g.index: g.name for g in ob.vertex_groups}
    for p in me.polygons:
        ws = {}
        for vi in p.vertices:
            for g in me.vertices[vi].groups: ws[names[g.group]] = ws.get(names[g.group], 0) + g.weight
        if not ws: continue
        b = max(ws, key=ws.get)
        cat = 'dark' if any(k in b for k in DARK) else 'light' if any(k in b for k in LIGHT) else None
        if not cat: continue
        m = ob.material_slots[p.material_index].material.name.split('.')[0].replace('Mat_', '').replace('MAT_', '')
        res.setdefault(m, {}).setdefault(cat, []).append([list(uv[li].uv) for li in p.loop_indices])
json.dump(res, open(out, 'w'))
print('PARTS', {m: {c: len(v) for c, v in d.items()} for m, d in res.items()})
