import os, shutil, math, numpy as np
from mathutils import Vector, Euler
G = globals()
PROG = r"C:\Users\justi\Python\dsw_mod\model_work\progress"
os.makedirs(PROG, exist_ok=True)
SH = os.path.join(BRIDGE, "shots")
m = {"21_front.png": "01_source_turnaround_sheet.png", "25_fit_front.png": "02_scaled_to_rig_before_arm_fix.png",
     "28_pose_front.png": "03_arms_bent_to_rig_pose.png", "49_front.png": "04_painted_front.png",
     "49_back.png": "05_painted_back.png", "51_lo_front.png": "06_lowpoly_7000tris.png",
     "56_front.png": "07_textured_front.png", "56_back.png": "08_textured_back.png", "56_head34.png": "09_textured_head.png"}
for k, v in m.items():
    if os.path.exists(os.path.join(SH, k)):
        shutil.copy(os.path.join(SH, k), os.path.join(PROG, v))
for f in os.listdir(os.path.join(os.path.dirname(PROG), "tex")):
    shutil.copy(os.path.join(os.path.dirname(PROG), "tex", f), os.path.join(PROG, "tex_" + f))
print("copied:", sorted(os.listdir(PROG)))

def shot3(name, w=1000, h=900):
    sc = bpy.context.scene; sc.render.resolution_x, sc.render.resolution_y, sc.render.resolution_percentage = w, h, 100
    with bpy.context.temp_override(**view3d_ctx()): bpy.ops.render.opengl(view_context=True)
    p = os.path.join(PROG, name + ".png"); bpy.data.images['Render Result'].save_render(p); return p
G["shot3"] = shot3

# ---- prop bones must not deform the mesh: fold their weights into the bone they hang from
lo = bpy.data.objects["ginaz_lo"]; rig = bpy.data.objects["Rig"]
PROPS = {}
for b in ("B_Weapon_Add", "B_Weapon", "B_Gun", "B_Shield", "B_Scabbard"):
    p = rig.data.bones[b].parent
    while p and p.name in ("B_Weapon_Add", "B_Weapon"):
        p = p.parent
    PROPS[b] = p.name
print("fold into:", PROPS)
me = lo.data
gname = {g.index: g.name for g in lo.vertex_groups}
moved = 0
for v in me.vertices:
    ws = {gname[g.group]: g.weight for g in v.groups}
    hit = [k for k in ws if k in PROPS]
    if not hit: continue
    for k in hit:
        tgt = PROPS[k]
        if tgt not in lo.vertex_groups: lo.vertex_groups.new(name=tgt)
        lo.vertex_groups[tgt].add([v.index], ws[k], 'ADD')
        lo.vertex_groups[k].remove([v.index])
    moved += 1
print("vertices with prop-bone weight folded into parents:", moved)
for b in PROPS:
    if b in lo.vertex_groups: lo.vertex_groups.remove(lo.vertex_groups[b])
bpy.context.view_layer.objects.active = lo
with bpy.context.temp_override(**view3d_ctx(), object=lo, active_object=lo):
    bpy.ops.object.vertex_group_limit_total(group_select_mode='ALL', limit=3)
    bpy.ops.object.vertex_group_normalize_all(group_select_mode='ALL', lock_active=False)
use = {}
for v in me.vertices:
    for g in v.groups:
        if g.weight > 0.05: use[lo.vertex_groups[g.group].name] = use.get(lo.vertex_groups[g.group].name, 0) + 1
print("bones used:", len(use), "| prop bones left:", [b for b in PROPS if b in use])
print("top:", sorted(use.items(), key=lambda kv: -kv[1])[:10])

# ---- progress render: rest pose with the rig visible, then textured only
rig.hide_set(False)
c = view3d_ctx(); sp = c['area'].spaces.active; r3d = sp.region_3d
sp.shading.type = 'SOLID'; sp.shading.color_type = 'OBJECT'; sp.overlay.show_overlays = True; sp.overlay.show_bones = True
rig.show_in_front = True
r3d.view_perspective = 'ORTHO'; r3d.view_location = Vector((0, 0, 0.95)); r3d.view_distance = 2.0
r3d.view_rotation = Euler((math.radians(90), 0, 0)).to_quaternion()
print(shot3("10_skinned_with_rig"))
