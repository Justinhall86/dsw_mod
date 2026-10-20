import re, math, numpy as np
from mathutils import Vector, Euler
G = globals()
lo = bpy.data.objects["ginaz_lo"]; rig = bpy.data.objects["Rig"]
# 1. reset the skinning
lo.vertex_groups.clear()
for m in list(lo.modifiers): lo.modifiers.remove(m)
lo.parent = None
# 2. prop bones (weapon/gun/shield/scabbard) are attachment points, not deforming bones
for b in ("B_Weapon_Add", "B_Weapon", "B_Gun", "B_Shield", "B_Scabbard"):
    rig.data.bones[b].use_deform = False
# 3. automatic weights again
for o in bpy.context.view_layer.objects: o.select_set(False)
lo.select_set(True); rig.select_set(True); bpy.context.view_layer.objects.active = rig
with bpy.context.temp_override(**view3d_ctx()):
    bpy.ops.object.parent_set(type="ARMATURE_AUTO")
me = lo.data
print("groups:", len(lo.vertex_groups), "| props among them:", [g.name for g in lo.vertex_groups if g.name in ("B_Weapon_Add", "B_Weapon", "B_Gun", "B_Shield", "B_Scabbard")])
gname = {g.index: g.name for g in lo.vertex_groups}
unw = sum(1 for v in me.vertices if not any(g.weight > 1e-4 for g in v.groups)); print("unweighted verts:", unw)
# 4. cape chain + limit/normalize/report/save (parts 3 and 4 of stage 3)
SC3 = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_work\ginaz_stage3.py"
parts = re.split(r"\n# -{20,} ", open(SC3, encoding="utf-8").read())
G.update(dict(lo=lo, rig=rig, me=me, n=len(me.vertices), groups=gname))
for i in (3, 4):
    with bpy.context.temp_override(**view3d_ctx()):
        exec(compile("# " + parts[i], f"stage3_part{i}", "exec"), G)
# 5. progress render
rig.hide_set(False)
c = view3d_ctx(); sp = c['area'].spaces.active; r3d = sp.region_3d
sp.shading.type = 'SOLID'; sp.shading.color_type = 'OBJECT'; sp.overlay.show_overlays = True; sp.overlay.show_bones = True
rig.show_in_front = True
r3d.view_perspective = 'ORTHO'; r3d.view_location = Vector((0, 0, 0.95)); r3d.view_distance = 2.0
r3d.view_rotation = Euler((math.radians(90), 0, 0)).to_quaternion()
print(shot3("10_skinned_with_rig"))
