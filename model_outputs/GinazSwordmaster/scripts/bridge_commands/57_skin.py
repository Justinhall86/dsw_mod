SC3 = r"C:\Users\justi\Python\dsw_mod\model_work\ginaz_stage3.py"
G = globals()
G["__file__"] = SC3
with bpy.context.temp_override(**view3d_ctx()):
    exec(compile(open(SC3, encoding="utf-8").read(), "stage3", "exec"), G)
