"""Print a .blend's materials (nodes, links, key inputs) and mesh attributes / UV layers.

    blender -b --disable-autoexec <file.blend> --python inspect_material.py
"""
import bpy

for m in bpy.data.materials:
    print("MAT", m.name, "use_nodes", m.use_nodes)
    if not m.use_nodes:
        continue
    for n in m.node_tree.nodes:
        extra = ""
        if n.type == "BSDF_PRINCIPLED":
            extra = " base %s metallic %.2f rough %.2f emission %s" % (
                tuple(round(x, 2) for x in n.inputs["Base Color"].default_value), n.inputs["Metallic"].default_value,
                n.inputs["Roughness"].default_value, tuple(round(x, 2) for x in n.inputs["Emission Color"].default_value))
        if n.type == "TEX_IMAGE":
            extra = " image %s" % (n.image.name if n.image else None)
        print("  NODE", n.type, n.name, extra)
    for l in m.node_tree.links:
        print("  LINK", l.from_node.name, l.from_socket.name, "->", l.to_node.name, l.to_socket.name)
for o in bpy.data.objects:
    if o.type == "MESH":
        me = o.data
        print("MESH", o.name, "attrs", [(a.name, a.domain, a.data_type) for a in me.attributes], "uv", [u.name for u in me.uv_layers],
              "color_attrs", [c.name for c in me.color_attributes])
print("IMAGES", [(i.name, tuple(i.size), i.source) for i in bpy.data.images])
