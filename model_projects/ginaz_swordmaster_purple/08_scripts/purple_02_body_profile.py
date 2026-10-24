"""Step 02 - measure the base body's horizontal/vertical extent per height.

The coat has to enclose the body, so the reference profile (which is a slimmer
figure) cannot be used as-is.  This writes the body's real profile so the coat
profile can be derived as max(reference, body + clearance).

Run inside Blender.
"""
import bpy
import json
import os
import sys
from collections import defaultdict

PROJ = r"C:/Users/justi/OneDrive/Python/dsw_mod/model_projects/ginaz_swordmaster_purple"
MID = os.path.join(PROJ, "08_scripts", "intermediate_data")
os.makedirs(MID, exist_ok=True)

obj = bpy.data.objects["GinazSwordmaster"]
me = obj.data

SLICE = 0.02
bins = defaultdict(lambda: {"x": [], "y": [], "n": 0})
for v in me.vertices:
    z = v.co.z
    b = int(round(z / SLICE))
    bins[b]["x"].append(v.co.x)
    bins[b]["y"].append(v.co.y)
    bins[b]["n"] += 1

prof = []
for b in sorted(bins):
    d = bins[b]
    if d["n"] < 3:
        continue
    z = b * SLICE
    xs, ys = d["x"], d["y"]
    prof.append({
        "z": round(z + SLICE / 2, 4),
        "n": d["n"],
        "max_x": round(max(xs), 4), "min_x": round(min(xs), 4),
        "max_y": round(max(ys), 4), "min_y": round(min(ys), 4),
        # torso-only slice: ignore the arms (|x| > 0.30) for the body profile
        "core_max_x": round(max([x for x in xs if abs(x) <= 0.30], default=0.0), 4),
        "core_min_x": round(min([x for x in xs if abs(x) <= 0.30], default=0.0), 4),
        "core_max_y": round(max(ys), 4), "core_min_y": round(min(ys), 4),
    })

with open(os.path.join(MID, "body_profile.json"), "w") as f:
    json.dump({"slice": SLICE, "profile": prof}, f, indent=1)

print("z      n   x-range            y-range        core-x")
for p in prof:
    if 0.15 < p["z"] < 1.70:
        print("%5.2f %4d  %6.3f..%6.3f  %6.3f..%6.3f  %6.3f" % (
            p["z"], p["n"], p["min_x"], p["max_x"], p["min_y"], p["max_y"], p["core_max_x"]))
result = {"slices": len(prof), "path": os.path.join(MID, "body_profile.json")}
