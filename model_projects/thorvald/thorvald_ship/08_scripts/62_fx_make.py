"""Make the Ipyr Lancer's own FX files from the vanilla Hawk's (small cone reactors, cannon muzzle flashes), placed on OUR hull.

    py -3.14 62_fx_make.py      -> ../06_game_ready/Fx/Vehicle/Ships/Thorvald/FX_Thorvald_Ship_Reactors.fx and _Muzzle.fx

Targets are in the HMD's stored vertex space (x right, y up, z towards the tail; measured from the mesh, see 63_fx_preview.py):
two tail nozzles, wing-tip lights and trails, and the two chin barrels (the prefab's MuzzleA/B). Everything else of the Hawk
files (shaders, curves, timings) is kept. SIZE shrinks the reactor cones.
"""
import copy, importlib.util, json, os
import numpy as np
HERE = os.path.dirname(os.path.abspath(__file__))
spec = importlib.util.spec_from_file_location("fxlib", os.path.join(HERE, "60_fx_lib.py")); L = importlib.util.module_from_spec(spec); spec.loader.exec_module(L)
PROJ = os.path.dirname(HERE)
HMD = os.path.join(PROJ, "06_game_ready", "VehMOD", "Thorvald_Ship", "Thorvald_Ship.hmd")
SRC = os.path.join(L.REPO, "model_inputs", "Fx", "Vehicle", "Ships", "Hawk")
OUT = os.path.join(PROJ, "06_game_ready", "Fx", "Vehicle", "Ships", "Thorvald")
NOZZLE = (0.13, 0.28, 1.72)        # +-x
WINGTIP = (1.56, 0.57, -0.80)
BARREL = (0.109, 0.235, -1.70)
SIZE = 0.8
bm = L.bone_matrix(HMD)
os.makedirs(OUT, exist_ok=True)


def child(parent, name):
    return next(c for c in parent["children"] if c.get("name") == name)


def place(node, group_m, stored):
    """Set node x,y,z so that it lands on `stored` (group_m = matrix of its parent in the FX frame)."""
    loc = np.linalg.inv(group_m) @ np.append(L.from_model(np.array(stored, float), bm), 1.0)
    node["x"], node["y"], node["z"] = (round(float(v), 5) for v in loc[:3])


def side_of(node, group_m):
    return 1 if L.to_model((group_m @ L.local(node, L.CONV))[:3, 3], L.bone_matrix(os.path.join(L.REPO, "model_inputs", "Vehicle", "Atreide", "Hawk", "Hawk.fbx")))[0] > 0 else -1


# ---- reactors
fx = L.load_fx(os.path.join(SRC, "FX_Hawk_Reactors.fx"))
root = child(fx, "FXRoot")
root_m = L.local(root, L.CONV)
lights, reactor = child(root, "Lights"), child(root, "Reactor")
lm, rm = root_m @ L.local(lights, L.CONV), root_m @ L.local(reactor, L.CONV)
for n in lights["children"]:
    s = side_of(n, lm)
    place(n, lm, (s * WINGTIP[0], WINGTIP[1], WINGTIP[2]))
keep = []
for n in reactor["children"]:
    name = n.get("name", "")
    if name in ("Reactor_RB", "Reactor_LB", "trails_RB", "trails_LB", "trails_Light"):
        continue                                           # two nozzles, not four
    s = side_of(n, rm)
    if name.startswith("Reactor_"):
        place(n, rm, (s * NOZZLE[0], NOZZLE[1], NOZZLE[2]))
        for k in ("scaleX", "scaleY", "scaleZ"):
            n[k] = round(n.get(k, 1) * SIZE, 4)
    elif name in ("trails_RT", "trails_LT"):
        place(n, rm, (s * NOZZLE[0], NOZZLE[1], NOZZLE[2] + 0.12))
    elif name == "trails":
        place(n, rm, (s * WINGTIP[0], WINGTIP[1], WINGTIP[2] + 0.1))
    keep.append(n)
reactor["children"] = keep
json.dump(fx, open(os.path.join(OUT, "FX_Thorvald_Ship_Reactors.fx"), "w", encoding="utf-8"), indent="\t")

# ---- cannon muzzles
fx = L.load_fx(os.path.join(SRC, "FX_Hawk_AttackRange_Muzzle.fx"))
root = child(fx, "FXRoot")
shot = child(root, "Shot")
sm = L.local(root, L.CONV) @ L.local(shot, L.CONV)
hawk_bm = L.bone_matrix(os.path.join(L.REPO, "model_inputs", "Vehicle", "Atreide", "Hawk", "Hawk.fbx"))
ref = {}
for n in shot["children"]:
    if n.get("name", "").startswith("Muzzle_"):
        p = L.to_model((sm @ L.local(n, L.CONV))[:3, 3], hawk_bm)
        ref[1 if p[0] > 0 else -1] = p
for n in shot["children"]:
    p = L.to_model((sm @ L.local(n, L.CONV))[:3, 3], hawk_bm)
    s = 1 if p[0] > 0 else -1
    off = (p - ref[s]) * 0.5                               # shell-casing ports keep half their offset from the muzzle
    place(n, sm, (s * BARREL[0] + off[0], BARREL[1] + off[1], BARREL[2] + off[2]))
json.dump(fx, open(os.path.join(OUT, "FX_Thorvald_Ship_Muzzle.fx"), "w", encoding="utf-8"), indent="\t")
print("wrote", sorted(os.listdir(OUT)))
