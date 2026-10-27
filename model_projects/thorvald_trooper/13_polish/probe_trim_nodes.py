"""Print Mat_Thorvald_Trim's node wiring and image datablock usage (diagnostic)."""
import bpy

mat = bpy.data.materials["Mat_Thorvald_Trim"]
print("=== Mat_Thorvald_Trim nodes ===")
for node in mat.node_tree.nodes:
    outs = []
    for so in node.outputs:
        for lk in so.links:
            outs.append("%s->%s.%s" % (so.name, lk.to_node.name, lk.to_socket.name))
    img = getattr(node, "image", None)
    print("%-18s type=%-12s img=%-28s links=[%s]" % (node.name, node.type, img.name if img else "-", "; ".join(outs)))
print("=== image datablocks (trim/gurney/duncan) ===")
for im in bpy.data.images:
    if any(k in im.name.lower() for k in ("trim", "gurney", "duncan")):
        users = []
        for m in bpy.data.materials:
            if m.node_tree is None:
                continue
            for n in m.node_tree.nodes:
                if getattr(n, "image", None) is im:
                    users.append(m.name + ":" + n.name)
        print("%-32s %4dx%-4d users=%s" % (im.name, im.size[0], im.size[1], users))
