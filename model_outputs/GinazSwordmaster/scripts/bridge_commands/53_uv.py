import re, numpy as np
SC2 = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_work\ginaz_stage2.py"
G["__file__"] = SC2
P2 = re.split(r"\n# -{20,} ", open(SC2, encoding="utf-8").read())
G["P2"] = P2
print([p.split("\n")[0][:55] for p in P2])
def run2(i):
    code = P2[i] if i == 0 else "# " + P2[i]
    with bpy.context.temp_override(**view3d_ctx()): exec(compile(code, f"stage2_part{i}", "exec"), G)
G["run2"] = run2
run2(0); run2(1); run2(2)
lo = bpy.data.objects['ginaz_lo']; uv = lo.data.uv_layers.active.data
u = np.array([l.uv for l in uv]); print("UV extent: u %.3f..%.3f  v %.3f..%.3f" % (u[:,0].min(), u[:,0].max(), u[:,1].min(), u[:,1].max()), "loops", len(u))
