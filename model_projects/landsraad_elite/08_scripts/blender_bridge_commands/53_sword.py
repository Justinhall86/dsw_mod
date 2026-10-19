import numpy as np, bmesh, os
lo = bpy.data.objects["LandsraadElite"]; rig = bpy.data.objects["Armature"]
before = set(bpy.data.objects)
bpy.ops.import_scene.fbx(filepath=r"C:\Users\justi\AppData\Local\Temp\claude\c--Users-justi-OneDrive-Python-dsw-mod\bcfd5601-f811-4ebb-8e18-d846ff537b3d\scratchpad\atreide_soldier_true.fbx")
new = [o for o in bpy.data.objects if o not in before]
src = next(o for o in new if o.type == 'MESH'); arm2 = next(o for o in new if o.type == 'ARMATURE')
print("soldier vgroups with weapon:", [g.name for g in src.vertex_groups if g.name in ("B_Weapon", "B_Scabbard")], "| uv", [u.name for u in src.data.uv_layers])
for nm in ("B_Weapon", "B_Scabbard", "B_rWristJ"):
    a = rig.matrix_world @ rig.data.bones[nm].head_local; b = arm2.matrix_world @ arm2.data.bones[nm].head_local
    print(f"{nm}: Elite rig head {tuple(round(x,3) for x in a)} | soldier rig head {tuple(round(x,3) for x in b)}")
# --- which vertices/faces form the sword
gid = {g.name: g.index for g in src.vertex_groups}
me = src.data
def w(v, names):
    return sum(g.weight for g in v.groups if g.group in [gid[n] for n in names if n in gid])
sw_v = np.array([w(v, ("B_Weapon", "B_Scabbard")) > 0.5 for v in me.vertices])
faces = [p.index for p in me.polygons if all(sw_v[i] for i in p.vertices)]
print("sword verts", int(sw_v.sum()), "faces", len(faces))
bm = bmesh.new(); bm.from_mesh(me); bm.faces.ensure_lookup_table()
kill = [f for f in bm.faces if f.index not in set(faces)]
bmesh.ops.delete(bm, geom=kill, context='FACES')
bmesh.ops.delete(bm, geom=[v for v in bm.verts if not v.link_faces], context='VERTS')
sword_me = bpy.data.meshes.new("AtreideSword"); bm.to_mesh(sword_me); bm.free()
sword = bpy.data.objects.new("AtreideSword", sword_me); bpy.context.collection.objects.link(sword)
# copy vertex groups by re-deriving from the source mesh through matching positions
srcco = np.array([v.co[:] for v in me.vertices]); 
from mathutils.kdtree import KDTree
kd = KDTree(len(srcco)); [kd.insert(tuple(c), i) for i, c in enumerate(srcco)]; kd.balance()
names = {g.index: g.name for g in src.vertex_groups}
for g in src.vertex_groups: sword.vertex_groups.new(name=g.name)
for v in sword_me.vertices:
    _, j, d = kd.find(tuple(v.co))
    for gg in me.vertices[j].groups:
        if gg.weight > 1e-4: sword.vertex_groups[names[gg.group]].add([v.index], gg.weight, 'REPLACE')
sword.matrix_world = src.matrix_world.copy()
# only keep groups that are used
used = {g.name for v in sword_me.vertices for g in [type('x',(object,),{'name':names[gg.group]}) for gg in v.groups]}
print("sword groups used:", sorted(used), "| uv", [u.name for u in sword_me.uv_layers])
for o in new: bpy.data.objects.remove(o, do_unlink=True)
co = np.array([v.co[:] for v in sword_me.vertices]); print("sword bbox", co.min(0).round(3), co.max(0).round(3), "tris", sum(len(p.vertices)-2 for p in sword_me.polygons))
