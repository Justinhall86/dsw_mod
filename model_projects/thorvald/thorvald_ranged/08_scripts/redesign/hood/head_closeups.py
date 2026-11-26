"""Head + shoulder close-ups (front, three-quarter, back) of vanilla units, matte preview.
    python ../bl.py head_closeups.py -- <out_dir> Label=<fbx>|<texture dir>|<stem> ...
"""
import os, sys
import bpy
from mathutils import Vector
SK = os.path.abspath(os.path.join(os.path.dirname(os.path.abspath(__file__)), *[".."] * 6, ".claude", "skills", "dsw-new-unit", "scripts"))
sys.path.insert(0, SK)
import blender_scene as bs, preview_wiring as PW, units  # noqa
units.MI = os.path.abspath(os.path.join(SK, '..', '..', '..', '..', 'model_inputs')); units._INDEX.clear()   # its own MI is stale
a = sys.argv[sys.argv.index("--") + 1:]
OUT = a[0]; os.makedirs(OUT, exist_ok=True)
for item in a[1:]:
    label, spec = item.split("=", 1)
    fbx, tdir, stem = spec.split("|")
    bs.reset_scene()
    body, rig = bs.import_model(fbx)
    wanted = units._tex(stem, tdir)
    for o in bpy.data.objects:
        if o.type == "MESH":
            for m in o.data.materials:
                if m is None:
                    continue
                m.use_nodes = True
                nt = m.node_tree
                if not any(n.type == "TEX_IMAGE" for n in nt.nodes):   # HMD-converted FBX: material has no texture slots; build them
                    bsdf = next((n for n in nt.nodes if n.type == "BSDF_PRINCIPLED"), None) or nt.nodes.new("ShaderNodeBsdfPrincipled")
                    out = next((n for n in nt.nodes if n.type == "OUTPUT_MATERIAL"), None) or nt.nodes.new("ShaderNodeOutputMaterial")
                    nt.links.new(bsdf.outputs[0], out.inputs[0])
                    for sock in ("Base Color", "Specular IOR Level"):
                        if os.path.exists(wanted[sock]):
                            t = nt.nodes.new("ShaderNodeTexImage"); nt.links.new(t.outputs["Color"], bsdf.inputs[sock])
                            if sock != "Base Color": t.image = None
                    if os.path.exists(wanted["Normal"]):
                        t = nt.nodes.new("ShaderNodeTexImage"); nm = nt.nodes.new("ShaderNodeNormalMap")
                        nt.links.new(t.outputs["Color"], nm.inputs["Color"]); nt.links.new(nm.outputs["Normal"], bsdf.inputs["Normal"])
                bs.wire_textures(m, wanted)
                for n in nt.nodes:
                    if n.type == "TEX_IMAGE" and n.image and "Albedo" not in n.image.name:
                        n.image.colorspace_settings.name = "Non-Color"
    PW.apply_all(); bs.setup_world(1.0, (0.62, 0.62, 0.64)); PW.soften_world(); bs.setup_lights(3.0, 120)
    names = {g.index: g.name for g in body.vertex_groups}
    hz = [(body.matrix_world @ v.co) for v in body.data.vertices if v.groups and names[max(v.groups, key=lambda x: x.weight).group] == "B_HeadJ"]
    top = max(p.z for p in hz); cx = sum(p.x for p in hz) / len(hz); cy = sum(p.y for p in hz) / len(hz)
    tgt = Vector((cx, cy, top - 0.17))
    for tag, d in (("front", (0, -1, 0.08)), ("tq", (0.7, -0.7, 0.1)), ("back", (0.3, 1, 0.1))):
        bs.setup_render(420, 420)
        cam = bs.setup_camera(target=tgt, ortho_scale=0.55, direction=d, distance=4)
        bs.render_to(os.path.join(OUT, "%s_%s.png" % (label, tag)), cam)
        bpy.data.objects.remove(cam, do_unlink=True)
    print("DONE", label)
