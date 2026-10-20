import numpy as np
from collections import Counter
ANIM = os.path.join(BRIDGE, "..", "anim")
lo = bpy.data.objects["elite_lo"]; rig = bpy.data.objects["Rig"]; me = lo.data; sc = bpy.context.scene
tris = np.array([p.vertices[:] for p in me.polygons])
def tri_areas(c):
    a, b, d = c[tris[:,0]], c[tris[:,1]], c[tris[:,2]]
    return np.linalg.norm(np.cross(b - a, d - a), axis=1) / 2
def evaluated(frame):
    sc.frame_set(frame); dg = bpy.context.evaluated_depsgraph_get(); ev = lo.evaluated_get(dg)
    m = ev.to_mesh(); co = np.empty(len(m.vertices)*3, dtype=np.float32); m.vertices.foreach_get('co', co); ev.to_mesh_clear()
    return co.reshape(-1,3).astype(np.float64)
def measure(do_shots=False, tag="m"):
    rig.animation_data_create(); rig.animation_data.action = None
    for pb in rig.pose.bones: pb.matrix_basis.identity()
    sc.frame_set(1)
    rest = np.empty(len(me.vertices)*3, dtype=np.float32); me.vertices.foreach_get('co', rest); rest = rest.reshape(-1,3).astype(np.float64)
    a0 = tri_areas(rest)
    out = {}
    for name, fn in (("run", "guard_Run.fbx"), ("attack", "guard_AttackMelee01.fbx"), ("idle", "guard_Idle.fbx")):
        b = set(bpy.data.objects)
        bpy.ops.import_scene.fbx(filepath=os.path.join(ANIM, fn), use_anim=True, use_manual_orientation=False, automatic_bone_orientation=False, primary_bone_axis='Y', secondary_bone_axis='X')
        nw = [o for o in bpy.data.objects if o not in b]
        act = next(o for o in nw if o.type == 'ARMATURE').animation_data.action
        for o in nw: bpy.data.objects.remove(o, do_unlink=True)
        rig.animation_data.action = act
        if hasattr(rig.animation_data, "action_slot") and act.slots: rig.animation_data.action_slot = act.slots[0]
        f0, f1 = map(int, act.frame_range)
        picks = [f0 + int((f1 - f0) * t) for t in (0.0, 0.2, 0.4, 0.6, 0.8)]
        worst = 0; badn = 0
        for f in picks:
            a1 = tri_areas(evaluated(f)); ratio = a1 / np.maximum(a0, 1e-9)
            bad = np.where((ratio > 4.0) & (a1 > 0.004))[0]
            badn = max(badn, len(bad)); worst = max(worst, float(a1[bad].sum()) if len(bad) else 0)
        print(f"{name}: worst frame {badn} tris stretched >4x, extra area {worst:.3f} m2")
        out[name] = (act, picks)
        if do_shots:
            for k, f in enumerate(picks[:4]):
                sc.frame_set(f)
                print(cshot(f"{tag}_{name}_{k}", rz=(35 if name != 'run' else 90), scale=2.6, loc=(0,0,1.0), w=700, h=800, engine='BLENDER_EEVEE'))
    return out
globals()["measure"] = measure
