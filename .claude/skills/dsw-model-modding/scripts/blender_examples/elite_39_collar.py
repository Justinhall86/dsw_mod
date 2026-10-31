exec(open(r"C:\Users\justi\AppData\Local\Temp\claude\c--Users-justi-OneDrive-Python-dsw-mod\bcfd5601-f811-4ebb-8e18-d846ff537b3d\scratchpad\scripts\elite_measure.py", encoding="utf-8").read(), globals())
lo = bpy.data.objects["elite_lo"]; me = lo.data; n = len(me.vertices)
rig.animation_data_create(); rig.animation_data.action = None
for pb in rig.pose.bones: pb.matrix_basis.identity()
bpy.context.scene.frame_set(1)
co = np.empty(n*3, dtype=np.float32); me.vertices.foreach_get('co', co); co = co.reshape(-1,3).astype(np.float64)
gi = {g.name: g for g in lo.vertex_groups}
band = np.where((co[:,2] > 1.56) & (co[:,2] < 1.74) & (np.abs(co[:,0]) > 0.10) & (np.abs(co[:,0]) < 0.32))[0]
print("collar band verts:", len(band))
for i in band:
    for g in lo.vertex_groups: 
        try: g.remove([int(i)])
        except RuntimeError: pass
    gi["B_Neck01J"].add([int(i)], 0.5, "REPLACE"); gi["B_SpineTopJ"].add([int(i)], 0.5, "REPLACE")
# re-measure attack only + a render
act = None
b = set(bpy.data.objects)
bpy.ops.import_scene.fbx(filepath=os.path.join(ANIM, "guard_AttackMelee01.fbx"), use_anim=True, use_manual_orientation=False, automatic_bone_orientation=False, primary_bone_axis='Y', secondary_bone_axis='X')
nw = [o for o in bpy.data.objects if o not in b]; act = next(o for o in nw if o.type == 'ARMATURE').animation_data.action
for o in nw: bpy.data.objects.remove(o, do_unlink=True)
rig.animation_data.action = act
if hasattr(rig.animation_data, "action_slot") and act.slots: rig.animation_data.action_slot = act.slots[0]
f0, f1 = map(int, act.frame_range)
for k, t in enumerate((0.2, 0.4)):
    f = f0 + int((f1 - f0) * t); bpy.context.scene.frame_set(f)
    print(cshot(f"14_attack_{k}", rz=35, scale=2.6, loc=(0,0,1.0), w=700, h=800, engine='BLENDER_EEVEE'))
bpy.ops.wm.save_as_mainfile(filepath=r"C:\Users\justi\Python\dsw_mod\model_work\elite_stage3.blend")
