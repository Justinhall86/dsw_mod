print([m.name for m in bpy.data.materials])
for m in bpy.data.materials:
    if "Landsraad" in m.name and m.use_nodes:
        nt = m.node_tree
        print("==", m.name)
        for l in nt.links:
            fn, tn = l.from_node, l.to_node
            print(f"  {fn.name}[{getattr(fn, 'image', None) and fn.image.name or fn.bl_idname}].{l.from_socket.name}  ->  {tn.name}.{l.to_socket.name}")
        for n in nt.nodes:
            if n.bl_idname == "ShaderNodeBsdfPrincipled":
                print("  principled defaults: metallic", n.inputs["Metallic"].default_value, "roughness", n.inputs["Roughness"].default_value)
            if n.bl_idname == "ShaderNodeTexImage":
                print("  img node", n.name, "colorspace", n.image.colorspace_settings.name, "ext", n.extension, "interp", n.interpolation)
