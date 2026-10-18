import re
SC3 = r"C:\Users\justi\OneDrive\Python\dsw_mod\model_work\ginaz_stage3.py"
G = globals()
G["__file__"] = SC3
parts = re.split(r"\n# -{20,} ", open(SC3, encoding="utf-8").read())
print([p.split("\n")[0][:50] for p in parts])
for i in (3, 4):      # cape weights, then limit/normalize/report/save (steps 1-2 already ran)
    with bpy.context.temp_override(**view3d_ctx()):
        exec(compile("# " + parts[i], f"stage3_part{i}", "exec"), G)
