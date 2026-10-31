"""Build the House Thorvald katana from the stock Atreides sword and save it as a stand-alone weapon blend.

    blender -b --python make_katana.py -- [--blade 1.35] [--curve 0.035] [--hilt 0.72]

Source: source/AtreideSword_TRUE_FBX.fbx (Atreide_Sword_01, Duncan's prefab sword, converted from the game HMD).  Weapon space = the sword's own
local space: +Y is the hilt (guard at y 0..0.09, grip y 0.12..0.44, pommel to 0.50), the blade runs from y 0 to the tip at -Y, flat in local Z.

  - blade: every vertex with y < 0 is stretched by --blade along the blade and given a gentle curve (sori) that grows with the square of the
    distance from the guard;
  - hilt: guard, grip and pommel (y >= 0) are scaled by --hilt about the guard (smaller, as asked), so the grip point moves with them;
  - writes blade_uv.json (the blade's UV polygons) for paint_katana.py, and textures/Katana_Albedo.png is used when it exists.

Output: Thorvald_Katana.blend with one object "Thorvald_Katana" at the origin (weapon space), plus weapon.json's grip point printed.
"""
import json
import os
import sys

import bpy

HERE = os.path.dirname(os.path.abspath(__file__))
a = sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else []
BLADE = float(a[a.index("--blade") + 1]) if "--blade" in a else 1.35
CURVE = float(a[a.index("--curve") + 1]) if "--curve" in a else 0.035
HILT = float(a[a.index("--hilt") + 1]) if "--hilt" in a else 0.72
GRIP_Y0 = 0.20                                   # where the hand holds the stock sword (local y), before the hilt is scaled

bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=os.path.join(HERE, "source", "AtreideSword_TRUE_FBX.fbx"))
sword = max([o for o in bpy.data.objects if o.type == "MESH"], key=lambda o: len(o.data.vertices))
for o in list(bpy.data.objects):
    if o is not sword:
        bpy.data.objects.remove(o, do_unlink=True)    # the 2x2x2 'Cube' helper, empties, armature
sword.name = sword.data.name = "Thorvald_Katana"
sword.parent = None
sword.matrix_world.identity()

L0 = -min(v.co.y for v in sword.data.vertices)
for v in sword.data.vertices:
    if v.co.y < 0.0:
        t = -v.co.y / L0
        v.co.y *= BLADE
        v.co.x += CURVE * t * t
    else:
        v.co *= HILT                                 # guard sits at y = 0, so this shrinks the hilt in place
sword.data.update()
grip_y = GRIP_Y0 * HILT
ys = [v.co.y for v in sword.data.vertices]
print("KATANA blade %.3f -> %.3f m, hilt x%.2f (hilt length %.3f m), grip at local y %.3f" % (L0, L0 * BLADE, HILT, max(ys), grip_y))

# blade UV polygons for the paint step: faces entirely on the blade side of the guard
uv = sword.data.uv_layers.active.data
polys, hilt = [], []
for p in sword.data.polygons:
    cy = sum(sword.data.vertices[i].co.y for i in p.vertices) / len(p.vertices)
    (polys if cy < -0.01 else hilt).append([(uv[li].uv.x, uv[li].uv.y) for li in p.loop_indices])
json.dump({"blade": polys, "hilt": hilt}, open(os.path.join(HERE, "blade_uv.json"), "w"))
print("BLADE faces", len(polys), "hilt faces", len(hilt), "of", len(sword.data.polygons))

alb = os.path.join(HERE, "textures", "Katana_Albedo.png")
if not os.path.exists(alb):
    alb = os.path.join(HERE, "textures", "MetalSword_Albedo.png")
mat = bpy.data.materials.new("Mat_Katana")
mat.use_nodes = True
nt = mat.node_tree
bsdf = next(n for n in nt.nodes if n.type == "BSDF_PRINCIPLED")
tex = nt.nodes.new("ShaderNodeTexImage")
tex.image = bpy.data.images.load(alb, check_existing=False)
nt.links.new(tex.outputs["Color"], bsdf.inputs["Base Color"])
bsdf.inputs["Metallic"].default_value = 0.45
bsdf.inputs["Roughness"].default_value = 0.35
sword.data.materials.clear()
sword.data.materials.append(mat)
tex.image.pack()
print("ALBEDO", os.path.basename(alb))
bpy.ops.wm.save_as_mainfile(filepath=os.path.join(HERE, "Thorvald_Katana.blend"), compress=True)
print("SAVED Thorvald_Katana.blend  grip_local [0, %.4f, 0]" % grip_y)
