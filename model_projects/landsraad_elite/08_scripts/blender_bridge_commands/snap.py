"""Take a viewport picture through the Blender bridge: set the view in one command, render in the next
(the viewport only redraws between bridge commands, so a same-command render shows the previous view).

  python snap.py NAME [--rz 0] [--rx 90] [--dist 1.7] [--loc 0,0,0.13] [--shading SOLID|MATERIAL] [--color MATERIAL|VERTEX|OBJECT]
"""
import argparse, os, subprocess, sys, time
HERE = os.path.dirname(os.path.abspath(__file__))
ap = argparse.ArgumentParser()
ap.add_argument("name"); ap.add_argument("--rz", type=float, default=0); ap.add_argument("--rx", type=float, default=90)
ap.add_argument("--dist", type=float, default=1.7); ap.add_argument("--loc", default="0,0,0.13")
ap.add_argument("--shading", default="SOLID"); ap.add_argument("--color", default="MATERIAL")
a = ap.parse_args()
loc = tuple(float(x) for x in a.loc.split(","))
A = f"""
import math
from mathutils import Vector, Euler
c = view3d_ctx(); sp = c['area'].spaces.active; r3d = sp.region_3d
sp.shading.type = {a.shading!r}; sp.shading.color_type = {a.color!r}; sp.overlay.show_overlays = False
r3d.view_perspective = 'ORTHO'; r3d.view_location = Vector({loc!r}); r3d.view_distance = {a.dist}
r3d.view_rotation = Euler((math.radians({a.rx}), 0, math.radians({a.rz}))).to_quaternion()
"""
B = f"""
print(shot2({a.name!r}))
"""
for tag, src in (("a", A), ("b", B)):
    r = subprocess.run([sys.executable, os.path.join(HERE, "run.py"), f"snap_{int(time.time()*1000)}_{tag}", "120"],
                       input=src, text=True, capture_output=True)
    if tag == "b":
        print(r.stdout.strip())
    time.sleep(1.2 if tag == "a" else 0)
