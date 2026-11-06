"""Print transforms of the v2 scene so misplaced kitbash parts can be diagnosed.

    blender -b --python dump_xform.py -- <in.blend>
"""
import os
import sys

import bpy
from mathutils import Vector

src = os.path.abspath(sys.argv[sys.argv.index("--") + 1])
bpy.ops.wm.open_mainfile(filepath=src)
dg = bpy.context.evaluated_depsgraph_get()

for name in ("Armature", "Renegade_Frigate", "Renegade_Frigate_root",
             "TK_Scanner", "TK_Module", "TK_Turret", "TK_SensorDome"):
    o = bpy.data.objects.get(name)
    if o is None:
        print("MISSING", name)
        continue
    pts = [o.matrix_world @ Vector(c) for c in o.bound_box]
    lo = tuple(round(min(p[i] for p in pts), 3) for i in range(3))
    hi = tuple(round(max(p[i] for p in pts), 3) for i in range(3))
    print("%-18s loc %s rot %s scale %s parent=%s world_t %s bbox %s..%s"
          % (name,
             tuple(round(v, 3) for v in o.location),
             tuple(round(v, 3) for v in o.rotation_euler),
             tuple(round(v, 3) for v in o.scale),
             o.parent.name if o.parent else None,
             tuple(round(v, 3) for v in o.matrix_world.translation),
             lo, hi))

arm = bpy.data.objects.get("Armature")
if arm:
    print("armature actions:", [a.name for a in bpy.data.actions])
    if arm.animation_data and arm.animation_data.action:
        print("active action:", arm.animation_data.action.name)
    print("pose bones:", [pb.name for pb in arm.pose.bones], "n=", len(arm.pose.bones))
    for pb in arm.pose.bones:
        t = tuple(round(v, 3) for v in pb.location)
        r = tuple(round(v, 3) for v in pb.rotation_euler)
        if any(abs(v) > 1e-4 for v in t + r):
            print("  posed bone", pb.name, "loc", t, "rot", r)
