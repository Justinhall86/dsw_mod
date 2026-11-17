"""Pick the transform conventions: the one that puts vanilla reactors nearest to their own hulls. Prints a table."""
import importlib.util, itertools, os, sys
import numpy as np
HERE = os.path.dirname(os.path.abspath(__file__))
spec = importlib.util.spec_from_file_location("fxlib", os.path.join(HERE, "60_fx_lib.py")); L = importlib.util.module_from_spec(spec); spec.loader.exec_module(L)
MI = os.path.join(L.REPO, "model_inputs")
CASES = [("Hammer", "Vehicle/Imperial/Hammer/Hammer.fbx", "Fx/Vehicle/Ships/Hammer/FX_Hammer_Reactors.fx", "B_Body"),
         ("Hawk", "Vehicle/Atreide/Hawk/Hawk.fbx", "Fx/Vehicle/Ships/Hawk/FX_Hawk_Reactors.fx", "B_Body")]
rows = []
for order, sign, bone in itertools.product(("xyz", "zyx"), (1, -1), ("fwd", "inv")):
    conv = {"order": order, "sign": sign, "bone": bone}
    tot = []
    for name, hmd, fx, b in CASES:
        v = L.verts(os.path.join(MI, hmd)); bm = L.bone_matrix(os.path.join(MI, hmd), b, conv)
        pts = [L.to_model(q, bm) for n, q, s in L.anchors(L.load_fx(os.path.join(MI, fx)), conv) if "Reactor_" in n or "Light_" in n]
        tot.append(np.mean([np.min(np.linalg.norm(v - p, axis=1)) for p in pts]))
    rows.append((sum(tot), conv, tot))
for t, conv, tot in sorted(rows, key=lambda r: r[0]):
    print("%.3f  %s  per ship %s" % (t, conv, [round(x, 3) for x in tot]))
