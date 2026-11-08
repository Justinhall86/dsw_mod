"""Detail budget: triangles, mesh size, in-game size (x cdb scale) and texture size of vanilla frigates vs ours.

    python 70_detail_stats.py
"""
import os, sys
import numpy as np
from PIL import Image

HERE = os.path.dirname(os.path.abspath(__file__))
R = HERE
while not os.path.isdir(os.path.join(R, "model_inputs")):
    R = os.path.dirname(R)
sys.path.insert(0, os.path.join(R, "HMD_toolkit", "HMD_toolkit", "Models"))
import hmd_reader as H
from hmd2fbx import pos_to_mat4

V = os.path.join(R, "model_inputs", "Vehicle")
SHIPS = [("Chronos", "Imperial/Chronos/Chronos", 1.7), ("Kraken", "Atreide/Kraken/Kraken", 1.6),
         ("Renegade", "Common/Renegade_Frigate/Renegade_Frigate", 1.2), ("Overlord", "Harkonnen/Overlord/Overlord", 1.2)]
for name, stem, sc in SHIPS:
    p = os.path.join(V, stem + ".fbx")
    if not os.path.exists(p):
        print(name, "missing", p); continue
    d = H.load(p)
    tris, pts = 0, []
    for i, m in enumerate(d.models):
        if m.geometry < 0:
            continue
        g = d.geometries[m.geometry]
        tris += sum(len(x) for x in H.decode_indices(d, g)) // 3
        P = np.array([v["position"][:3] for v in H.decode_vertices(d, g)])
        pts.append(P)
    P = np.vstack(pts); ext = P.max(0) - P.min(0)
    alb = os.path.join(V, stem + "_Albedo.png")
    ts = Image.open(alb).size if os.path.exists(alb) else None
    print("%-9s tris %5d  mesh %s  in game (x%.1f) %s  tex %s" % (name, tris, ext.round(2), sc, (ext * sc).round(1), ts))
