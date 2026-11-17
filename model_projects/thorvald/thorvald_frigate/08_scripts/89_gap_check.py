"""Gap check: every surface flat grey, backfaces bright green (a green patch = you can see inside the hull = a hole),
plus boundary-loop stats. Renders 8 views.
    blender -b <blend> --python 89_gap_check.py -- <outdir>"""
import math, os, sys
if "--holes" in sys.argv:
    import numpy as np
    from PIL import Image
    out = os.path.abspath(sys.argv[sys.argv.index("--holes") + 1]); tiles = []
    for name in ["tq", "tq_rear", "top", "bottom", "side", "front", "rear", "low"]:
        c = np.asarray(Image.open(os.path.join(out, "_c_%s.png" % name)).convert("RGB")).astype(int)
        sm = np.asarray(Image.open(os.path.join(out, "_s_%s.png" % name)).convert("RGB")).astype(int)
        inside = ~((sm[..., 0] > 200) & (sm[..., 1] < 60) & (sm[..., 2] > 200))
        green = (c[..., 1] > 200) & (c[..., 0] < 80) & (c[..., 2] < 80)
        hole = inside & green
        o = c.copy(); o[green & ~inside] = (64, 64, 77); o[hole] = (255, 0, 0)
        im = Image.fromarray(o.astype(np.uint8)); im.save(os.path.join(out, name + "_HOLES.png"))
        print("HOLES", name, int(hole.sum()), "px"); im.thumbnail((600, 400)); tiles.append(im)
    S = Image.new("RGB", (2400, 800))
    for i, im in enumerate(tiles): S.paste(im, ((i % 4) * 600, (i // 4) * 400))
    S.save(os.path.join(out, "SHEET.png")); sys.exit(0)
import bmesh, bpy
import numpy as np
from mathutils import Vector
HERE = os.path.dirname(os.path.abspath(__file__)); sys.path.insert(0, HERE)
import blender_scene as bs
out = os.path.abspath(sys.argv[sys.argv.index("--") + 1]); os.makedirs(out, exist_ok=True)
CULL = "--cull" in sys.argv
m = bpy.data.materials.new("diag"); m.use_nodes = True; nt = m.node_tree
for n in list(nt.nodes): nt.nodes.remove(n)
o_ = nt.nodes.new("ShaderNodeOutputMaterial"); geo = nt.nodes.new("ShaderNodeNewGeometry")
d = nt.nodes.new("ShaderNodeBsdfDiffuse"); d.inputs["Color"].default_value = (0.55, 0.55, 0.57, 1)
e = nt.nodes.new("ShaderNodeEmission"); e.inputs["Color"].default_value = (0, 1, 0, 1); e.inputs["Strength"].default_value = 3
mix = nt.nodes.new("ShaderNodeMixShader")
nt.links.new(geo.outputs["Backfacing"], mix.inputs[0]); nt.links.new(d.outputs[0], mix.inputs[1]); nt.links.new(e.outputs[0], mix.inputs[2])
nt.links.new(mix.outputs[0], o_.inputs["Surface"])
objs = [o for o in bpy.data.objects if o.type == "MESH"]
for o in objs:
    o.data.materials.clear(); o.data.materials.append(m)
    try: m.use_backface_culling = False
    except Exception: pass
hull = bpy.data.objects["thorvald_cruiser"]
bm = bmesh.new(); bm.from_mesh(hull.data)
bnd = [ed for ed in bm.edges if ed.is_boundary]
print("GAP boundary edges", len(bnd), "total length", round(sum(ed.calc_length() for ed in bnd), 1))
bm.free()
pts = [o.matrix_world @ v.co for o in objs for v in o.data.vertices]
mn = Vector([min(p[i] for p in pts) for i in range(3)]); mx = Vector([max(p[i] for p in pts) for i in range(3)])
c = (mn + mx) / 2; span = max(mx - mn)
bs.setup_render(1200, 800); bs.setup_world(strength=1.0, color=(0.25, 0.25, 0.3)); bs.setup_lights()
cam = bs.setup_camera(target=c, ortho_scale=span * 1.1, distance=span * 3)
V = {"tq": (-0.7, -0.7, 0.55), "tq_rear": (0.7, 0.7, 0.55), "top": (-0.0001, 0, 1), "bottom": (0.0001, 0, -1),
     "side": (0, -1, 0.08), "front": (-1, 0, 0.12), "rear": (1, 0, 0.12), "low": (-0.7, 0.7, -0.4)}
for name, dv in V.items():
    cam.location = c + Vector(dv).normalized() * span * 3
    cam.rotation_euler = (c - cam.location).to_track_quat("-Z", "X" if name in ("top", "bottom") else "Y").to_euler()
    bs.render_to(os.path.join(out, name + ".png"), cam)
    if CULL:                                   # game-accurate: culled render vs silhouette -> see-through pixels in red
        wnt = bpy.context.scene.world.node_tree; bg = wnt.nodes["Background"]
        if "lp" not in wnt.nodes:                     # camera sees the key colour; lighting stays neutral grey
            lp = wnt.nodes.new("ShaderNodeLightPath"); lp.name = "lp"
            mixc = wnt.nodes.new("ShaderNodeMixRGB"); mixc.name = "mixc"
            mixc.inputs[1].default_value = (0.25, 0.25, 0.3, 1)
            wnt.links.new(lp.outputs["Is Camera Ray"], mixc.inputs[0]); wnt.links.new(mixc.outputs[0], bg.inputs[0])
        wnt.nodes["mixc"].inputs[2].default_value = (0, 1, 0, 1)
        m.use_backface_culling = True; bs.render_to(os.path.join(out, "_c_%s.png" % name), cam)
        m.use_backface_culling = False
        wnt.nodes["mixc"].inputs[2].default_value = (1, 0, 1, 1)
        mix.inputs[0].default_value = 0; nt.links.remove(mix.inputs[0].links[0])
        bs.render_to(os.path.join(out, "_s_%s.png" % name), cam)
        nt.links.new(geo.outputs["Backfacing"], mix.inputs[0])
        wnt.nodes["mixc"].inputs[2].default_value = (0.25, 0.25, 0.3, 1)
print("GAP_OK")
# then (plain python): python 89_gap_check.py --holes <outdir>  -> <view>_HOLES.png (see-through pixels red) + SHEET.png
