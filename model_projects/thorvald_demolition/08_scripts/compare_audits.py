"""Compare two audit_unit.py JSON snapshots (plain Python, no Blender).

    python compare_audits.py before.json after.json

Prints triangle / texture-size deltas and flags the regressions that make an upscale look WORSE than the original:
  * a material whose mean colour or saturation moved by more than 8% (washed out / darkened albedo)
  * any new problem (all-zero map, flat map, alpha < 1, wrong normals)
  * triangle count past the 12k ceiling, or fewer triangles than before
Exit code 1 when a regression is found, so it can gate a build script.
"""
import json
import sys

a = json.load(open(sys.argv[1], encoding="utf-8"))
b = json.load(open(sys.argv[2], encoding="utf-8"))
bad = []
print("tris  %6d -> %6d  (%+d)" % (a["total_tris"], b["total_tris"], b["total_tris"] - a["total_tris"]))
if b["total_tris"] > 12000:
    bad.append("triangle count above 12k")
if b["total_tris"] < a["total_tris"]:
    bad.append("fewer triangles than before")
am = {(m["object"], m["material"]): m for m in a["materials"]}
for m in b["materials"]:
    old = am.get((m["object"], m["material"]))
    if not old or not m.get("albedo") or not old.get("albedo"):
        continue
    sa, sb = old["albedo"], m["albedo"]
    line = "%-18s %-18s %4dx%-4d -> %4dx%-4d" % (m["object"], m["material"], sa["size"][0], sa["size"][1], sb["size"][0], sb["size"][1])
    if "mean_rgb" in sa and "mean_rgb" in sb:
        drift = max(abs(x - y) / max(x, 0.02) for x, y in zip(sa["mean_rgb"], sb["mean_rgb"]))
        sat = (sb["mean_saturation"] - sa["mean_saturation"]) / max(sa["mean_saturation"], 0.02)
        shp = sb["sharpness"] / max(sa["sharpness"], 1e-6) * sb["size"][0] / sa["size"][0]      # per-texel gradient scales 1/size; x width = edge contrast kept
        line += "  colour drift %4.1f%%  saturation %+5.1f%%  edge contrast x%.2f" % (drift * 100, sat * 100, shp)
        if drift > 0.08:
            bad.append("%s/%s mean colour drifted %.0f%%" % (m["object"], m["material"], drift * 100))
        if sat < -0.08:
            bad.append("%s/%s saturation dropped %.0f%% (washed out)" % (m["object"], m["material"], -sat * 100))
    print(line)
old_p = set(a["problems"])
for p in b["problems"]:
    if p not in old_p:
        bad.append("new problem: " + p)
for x in bad:
    print("REGRESSION", x)
print("RESULT:", "REGRESSIONS" if bad else "OK")
sys.exit(1 if bad else 0)
