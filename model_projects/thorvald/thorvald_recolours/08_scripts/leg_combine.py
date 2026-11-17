"""Combine two leg kits by bone: keep <target obj>'s faces on KEEP bones, add <donor obj>'s faces on DONOR bones.
    blender -b <target.blend> --python leg_combine.py -- <donor.blend> <target_obj> <donor_obj> <out.blend>
Iron Ranger v3b (owner 2026-11-13): Soldier thighs + apron (hip bones) + Trooper Duncan knees/shins/feet."""
import bpy, bmesh, sys
donor, tobj, dobj, out = sys.argv[sys.argv.index('--') + 1:]
LOWER = {'B_lKneeJ', 'B_rKneeJ', 'B_lAnkleJ', 'B_rAnkleJ', 'B_lToeJ', 'B_rToeJ'}
rig = next(o for o in bpy.data.objects if o.type == 'ARMATURE')
def trim(o, keep_lower):
    names = {g.index: g.name for g in o.vertex_groups}
    bm = bmesh.new(); bm.from_mesh(o.data); dl = bm.verts.layers.deform.active; kill = []
    for f in bm.faces:
        ws = {}
        for v in f.verts:
            for gi, w in v[dl].items(): ws[names[gi]] = ws.get(names[gi], 0) + w
        low = bool(ws) and max(ws, key=ws.get) in LOWER
        if low != keep_lower: kill.append(f)
    bmesh.ops.delete(bm, geom=kill, context='FACES'); bm.to_mesh(o.data); bm.free()
    print('TRIM', o.name, 'removed', len(kill), 'left', len(o.data.polygons))
trim(bpy.data.objects[tobj], False)
before = set(bpy.data.materials)
with bpy.data.libraries.load(donor, link=False) as (s, d): d.objects = [dobj]
o = d.objects[0]; bpy.context.scene.collection.objects.link(o)
mw = o.matrix_world.copy(); o.parent = rig; o.matrix_world = mw
for m in o.modifiers:
    if m.type == 'ARMATURE': m.object = rig
trim(o, True)
try: bpy.ops.file.pack_all()
except RuntimeError as e: print('PACK WARNING', str(e)[:120])
bpy.ops.wm.save_as_mainfile(filepath=out); print('SAVED', out)
