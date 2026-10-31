"""Compare vertex groups/weights: source FBX vs exported duncan_modified.fbx (re-import both)."""
import bpy, numpy as np

def report(path, label):
    bpy.ops.wm.read_factory_settings(use_empty=True)
    bpy.ops.import_scene.fbx(filepath=path, use_anim=False)
    me = next(o for o in bpy.context.scene.objects if o.type == 'MESH')
    rig = next(o for o in bpy.context.scene.objects if o.type == 'ARMATURE')
    print(f"=== {label}: {len(me.data.vertices)} verts, {len(rig.data.bones)} bones, {len(me.vertex_groups)} groups")
    empty, weighted = [], []
    for vg in me.vertex_groups:
        tot = 0.0; n = 0
        for v in me.data.vertices:
            for g in v.groups:
                if g.group == vg.index and g.weight > 1e-6:
                    tot += g.weight; n += 1
        if n == 0: empty.append(vg.name)
        else: weighted.append((vg.name, n, tot))
    print("  empty groups:", empty if empty else "none")
    print("  weighted groups:", len(weighted))
    # max influences per vertex
    mx = max((sum(1 for g in v.groups if g.weight > 1e-4) for v in me.data.vertices), default=0)
    print("  max influences/vert:", mx)

report(r"C:\Users\justi\Python\dsw_mod\model_projects\duncan_modified\03_blender\Male01_AtreidesDuncan_src.fbx", "SRC")
report(r"C:\Users\justi\Python\dsw_mod\model_projects\duncan_modified\05_fbx_export\duncan_modified.fbx", "OUT")
