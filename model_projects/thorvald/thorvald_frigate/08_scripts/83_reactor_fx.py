"""Thorvald cruiser reactor flare = a copy of the Chronos's (cyan 0,0.9,1; ReactorTriangle plates + tube), with the
single Chronos reactor replaced by one per engine bell of the cruiser.

    python 83_reactor_fx.py
Writes 06_game_ready/Fx/Vehicle/Ships/Thorvald/FX_Thorvald_Reactor.fx (res-tree path
Fx/Vehicle/Ships/Thorvald/FX_Thorvald_Reactor.fx, attached by the TH_Frigate unit's kind-28 event to B_Body).

Frame: the FX is attached to B_Body; children sit in B_Body's local frame = raw HMD frame minus the joint position
(Renegade rig: B_Body at raw y 1.3146, no rotation after the bind fix). Engines come from 80_export_cruiser.py.
The Chronos's reactor sits at -z (its stern); ours is at +z, so each reactor is turned 180 deg about Y.
Dropped: the Chronos-only warm strips (Cronos_Lights mesh), the editor-only Chronos preview model and the
constraint that pointed at it.
"""
import copy, json, os

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = PROJ
while not os.path.isdir(os.path.join(REPO, "model_inputs")):
    REPO = os.path.dirname(REPO)
SRC = os.path.join(REPO, "model_inputs", "Fx", "Vehicle", "Ships", "Chronos", "FX_Chronos_Reactor.fx")
OUT = os.path.join(PROJ, "06_game_ready", "Fx", "Vehicle", "Ships", "Thorvald", "FX_Thorvald_Reactor.fx")
B_BODY_Y = 1.3146438598632812
F = 0.59                                   # plate size vs the Chronos's (fits our bells; matches the approved GIF)

fx = json.load(open(SRC, encoding="utf-8"))
root = fx["children"][0]
lights = next(c for c in root["children"] if c["name"] == "Lights")
reactor = next(c for c in lights["children"] if c["name"] == "Reactor")
eng = json.load(open(os.path.join(PROJ, "05_fbx_export", "cruiser_muzzles_raw.json")))["engines_raw"]

new_lights = {k: v for k, v in lights.items() if k != "children"}
new_lights["children"] = []
for i, (x, y, z) in enumerate(eng):
    r = copy.deepcopy(reactor)
    r["name"] = "Reactor%s" % ("L" if x > 0 else "R")
    r.pop("x", None); r.pop("y", None); r.pop("z", None)
    r["x"], r["y"], r["z"] = round(x, 4), round(y - B_BODY_Y, 4), round(z, 4)
    r["rotationY"] = 180
    for c in r["children"]:
        for k in ("x", "y", "z"):
            if k in c:
                c[k] = round(c[k] * F, 5)
        for k in ("scaleX", "scaleY", "scaleZ"):
            c[k] = round(c.get(k, 1.0) * F, 5)
    new_lights["children"].append(r)
root["children"] = [new_lights]                      # no Chronos preview model, no constraint to it
os.makedirs(os.path.dirname(OUT), exist_ok=True)
with open(OUT, "w", encoding="utf-8", newline="\n") as f:
    json.dump(fx, f, indent="\t"); f.write("\n")
for r in new_lights["children"]:
    print(r["name"], {k: r[k] for k in ("x", "y", "z", "rotationY")},
          [(c["name"], c.get("scaleX"), c.get("scaleZ")) for c in r["children"]])
print("FX written", OUT)
