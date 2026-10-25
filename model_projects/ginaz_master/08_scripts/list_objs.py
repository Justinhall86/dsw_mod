import bpy
for o in bpy.data.objects:
    print("OBJ", o.name, o.type, [m.name for m in o.data.materials] if o.type == "MESH" else "")
