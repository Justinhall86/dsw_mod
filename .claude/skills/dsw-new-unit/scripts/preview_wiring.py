"""Preview-only material wiring: MetallicGlossAO the way the game reads it (R metallic, G gloss, B AO). Never saved into exported blends."""
import bpy


def gamelike(mat):
    """PREVIEW ONLY (never saved): wire MetallicGlossAO the way the game reads it: R metallic, G gloss (roughness = 1 - G), B ambient occlusion."""
    nt = mat.node_tree
    bsdf = next((n for n in nt.nodes if n.type == "BSDF_PRINCIPLED"), None)
    if bsdf is None:
        return
    link = next((l for l in nt.links if l.to_node == bsdf and l.to_socket.name == "Specular IOR Level" and l.from_node.type == "TEX_IMAGE"), None)
    if link is None:
        return
    tex = link.from_node
    nt.links.remove(link)
    sep = nt.nodes.new("ShaderNodeSeparateColor")
    inv = nt.nodes.new("ShaderNodeMath")
    inv.operation = "SUBTRACT"
    inv.inputs[0].default_value = 1.0
    nt.links.new(tex.outputs["Color"], sep.inputs["Color"])
    nt.links.new(sep.outputs["Red"], bsdf.inputs["Metallic"])
    nt.links.new(sep.outputs["Green"], inv.inputs[1])
    nt.links.new(inv.outputs["Value"], bsdf.inputs["Roughness"])
    bsdf.inputs["Specular IOR Level"].default_value = 0.5
    base_link = next((l for l in nt.links if l.to_node == bsdf and l.to_socket.name == "Base Color"), None)
    if base_link is not None:
        mix = nt.nodes.new("ShaderNodeMix")
        mix.data_type = "RGBA"
        mix.blend_type = "MULTIPLY"
        mix.inputs["Factor"].default_value = 1.0
        nt.links.new(base_link.from_socket, mix.inputs["A"])
        nt.links.new(sep.outputs["Blue"], mix.inputs["B"])
        nt.links.new(mix.outputs["Result"], bsdf.inputs["Base Color"])


def apply_all():
    for m in bpy.data.materials:
        if m.use_nodes and m.name != "Mat_GinazGold":
            gamelike(m)
