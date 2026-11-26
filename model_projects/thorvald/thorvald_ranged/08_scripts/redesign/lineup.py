"""Side-by-side lineup of vanilla units (units.py keys or FBX paths) and our .blend units, matte game-like preview.

    python lineup.py <out_prefix> <item> [<item> ...] [--views front,tq,back,rts]
    item = Label=vanilla:<units.py key>   |   Label=fbx:<path>|<texture stem>   |   Label=blend:<path>
Uses the dsw-new-unit skill helpers. Read-only on every input.
"""
import os, sys
import bpy
from mathutils import Vector

SK = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "..", "..", "..", "..", ".claude", "skills", "dsw-new-unit", "scripts")
sys.path.insert(0, os.path.abspath(SK))
import blender_scene as bs  # noqa
import preview_wiring as PW  # noqa
import units  # noqa
units.MI = os.path.abspath(os.path.join(SK, '..', '..', '..', '..', 'model_inputs')); units._INDEX.clear()   # its own MI is stale

args = sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else sys.argv[1:]
views = ["front", "tq", "back"]
if "--views" in args:
    i = args.index("--views"); views = args[i + 1].split(","); del args[i:i + 2]
hide = []
if "--hide" in args:
    i = args.index("--hide"); hide = args[i + 1].split(","); del args[i:i + 2]
OUT, items = args[0], args[1:]
SPACING = 1.25

bs.reset_scene()
groups = []
for idx, item in enumerate(items):
    label, spec = item.split("=", 1)
    kind, val = spec.split(":", 1)
    before = set(bpy.data.objects)
    if kind == "blend":
        with bpy.data.libraries.load(val, link=False) as (src, dst):
            dst.objects = list(src.objects)
        for o in dst.objects:
            if o is not None and o.type in ("MESH", "ARMATURE", "EMPTY"):
                bpy.context.scene.collection.objects.link(o)
    else:
        if kind == "vanilla":
            path, wanted = units.paths(val)
        else:
            path, stem = val.split("|")
            wanted = units._tex(stem, os.path.dirname(path))
        bs.import_model(path)
        for o in set(bpy.data.objects) - before:
            if o.type == "MESH":
                for m in o.data.materials:
                    if m and m.use_nodes:
                        bs.wire_textures(m, wanted)
    new = [o for o in set(bpy.data.objects) - before]
    for o in new:
        if o.type == "MESH" and (o.name.startswith("Cube") or o.hide_render):
            bpy.data.objects.remove(o, do_unlink=True)
    new = [o for o in set(bpy.data.objects) - before if o.name in bpy.data.objects]
    roots = [o for o in new if o.parent is None or o.parent not in new]
    # centre each unit on x by its meshes' bounds
    meshes = [o for o in new if o.type == "MESH"]
    bpy.context.view_layer.update()
    xs = [ (o.matrix_world @ Vector(c)).x for o in meshes for c in o.bound_box]
    cx = (min(xs) + max(xs)) / 2 if xs else 0
    for r in roots:
        r.location.x += idx * SPACING - cx
    groups.append((label, meshes))
    print("ITEM", label, len(meshes), "meshes")

for o in list(bpy.data.objects):
    if o.type == "MESH" and any(h in o.name for h in hide):
        o.hide_render = True
        for _, ms in groups:
            if o in ms: ms.remove(o)
PW.apply_all()
bs.setup_world(strength=1.0, color=(0.62, 0.62, 0.64))
PW.soften_world()
bs.setup_lights(sun_energy=3.0, fill_energy=120)
bpy.context.view_layer.update()
allm = [o for _, ms in groups for o in ms]
pts = [o.matrix_world @ Vector(c) for o in allm for c in o.bound_box]
lo = Vector([min(p[i] for p in pts) for i in range(3)]); hi = Vector([max(p[i] for p in pts) for i in range(3)])
ctr = (lo + hi) / 2
W = hi.x - lo.x + 0.6
H = 2.15
DIRS = {"front": (0, -1, 0), "tq": (0.6, -0.8, 0.0), "back": (0, 1, 0), "side": (1, 0, 0), "rts": (0.0, -0.75, 0.9)}
for v in [w for w in views if w.startswith("head")]:   # head close-ups, one image per unit: head (front) / headtq
    d = (0, -1, 0.06) if v == "head" else (0.6, -0.8, 0.08)
    for i, (label, ms) in enumerate(groups):
        bs.setup_render(520, 600)
        cam = bs.setup_camera(target=Vector((i * SPACING, 0, 1.74)), ortho_scale=0.62, direction=d, distance=6)
        bs.render_to("%s_%s_%s.png" % (OUT, v, label.replace(" ", "_")), cam)
        bpy.data.objects.remove(cam, do_unlink=True)
views = [w for w in views if not w.startswith("head")]
for v in views:
    n = len(items)
    if v == "rts":
        bs.setup_render(130 * n + 40, 210)
    else:
        bs.setup_render(max(int(430 * n), 900), 820)
    cam = bs.setup_camera(target=Vector((ctr.x, 0, 1.0 if v != "rts" else 0.9)), ortho_scale=max(W, H * max(430 * n, 900) / 820) if v != "rts" else W,
                          direction=DIRS[v], distance=12)
    bs.render_to("%s_%s.png" % (OUT, v), cam)
    bpy.data.objects.remove(cam, do_unlink=True)
print("LABELS", [g[0] for g in groups])
