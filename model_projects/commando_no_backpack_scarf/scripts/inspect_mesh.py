import bpy
bpy.ops.wm.open_mainfile(filepath=r'C:\Users\justi\Python\dsw_mod\model_projects\commando_no_backpack_scarf\03_blender\Commando_NoBackpack_Scarf.blend')
for obj in bpy.data.objects:
    if obj.type == 'MESH':
        print(f"{obj.name}: verts={len(obj.data.vertices)} tris={len(obj.data.polygons)}")
