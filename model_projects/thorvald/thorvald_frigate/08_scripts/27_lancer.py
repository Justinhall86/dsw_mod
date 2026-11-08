"""Lancer frigate (chosen 2026-11-07 from the five new-core designs in 26_new_designs.py).
Carryall core (nose -X), Banshee blades as swept aft fins, Kraken emblem crest, Kulon rocket pods on the booms.
Two colourways, mesh scaled to ~11.5 long (x1.2 cdb scale ~= 14 in game, vs Renegade 12.2, Kraken 12.8).

    python 27_lancer.py
    blender -b --factory-startup --python 20_build_variant.py -- 01_input/frigate_lancer.json
"""
import importlib.util, json, os

HERE = os.path.dirname(os.path.abspath(__file__))
spec = importlib.util.spec_from_file_location("nd", os.path.join(HERE, "26_new_designs.py"))
# reuse the part boxes / helper without re-writing the five designs
src = open(os.path.join(HERE, "26_new_designs.py")).read().split("designs = {")[0]
ns = {"__file__": os.path.join(HERE, "26_new_designs.py")}
exec(src, ns)
g, KRAKEN, POD, BLADE = ns["g"], ns["KRAKEN"], ns["POD"], ns["BLADE"]

LENGTH = 11.5
CORE_LEN = 4.672                     # new2_lancer FINAL dims x


def lancer(name, blade_role, crest_role, pod_role):
    return {
        "name": name, "host": "carryall", "host_role": "hull", "res": 720, "margin": 1.2,
        "final_scale": round(LENGTH / CORE_LEN, 4), "pieces": [],
        "grafts": [
            g("banshee", BLADE, (1.0, 1.55, 0.35), 0.55, (0, 0, 90), role=blade_role, mirror=True),
            g("kraken", KRAKEN, (0.6, 0, None), [0.4, 0.38, 0.6], (0, 0, 90), role=crest_role, sink=0.15),
            g("kuloncannon", POD, (-1.4, 0.95, None), 0.8, (0, 0, -90), role=pod_role, mirror=True, strict=False),
        ],
        "views": {"tq": [-0.78, -0.78, 0.34], "tq_rear": [0.78, -0.78, 0.34], "top": [-0.001, 0, 1],
                  "side": [0, -1, 0.06], "front": [-1, 0, 0.08]},
    }


POD_BODY = [-1.0, 0.05, -1.0, 0.55, 1.5, 2.5]    # 4-tube pod without the thin strut plate behind it
KRAKEN_MID = [-2.3, 2.3, -1.3, 1.3, 1.15, 2.4]     # middle band of the carapace (emblem plate, now plain)
BLADE_TRIM = [0.75, 1.85, -0.15, 4.65, -0.3, 1.5]   # blade minus its notched end


def lancer_v2(name):
    """Colourway B + user tweaks 2026-11-07: fins pulled onto the hull (no black gap) and their notched
    end trimmed, a carapace-tail plate filling the black slot between the bow booms, rocket pods sealed
    and seated lower, then cleanup + edge bevel so parts stop reading as the donors' crisp boxes.
    Green and the Atreides sigil are removed in the textures (29_clean_textures.py)."""
    return {
        "name": name, "host": "carryall", "host_role": "hull", "res": 900, "margin": 1.2,
        "final_scale": round(LENGTH / CORE_LEN, 4), "pieces": [],
        "cleanup": True, "bevel": {"width": 0.05, "angle": 40, "segments": 1, "skip": ["banshee", "kuloncannon"]},
        "grafts": [
            dict(g("banshee", BLADE_TRIM, (1.0, 1.36, 0.22), 0.55, (0, 0, 90), role="copper", mirror=True), min_island_size=1.5),
            g("kraken", KRAKEN, (0.6, 0, None), [0.4, 0.38, 0.6], (0, 0, 90), role="oxblood", sink=0.15),
            dict(g("kraken", KRAKEN_MID, (-0.95, 0, 0.3), [0.26, 0.85, 0.5], (0, 0, 90), role="hull", strict=False, frag=4), seal=True),
            dict(g("kuloncannon", POD_BODY, (-1.4, 0.95, None), 0.8, (0, 0, -90), role="steel", mirror=True,
                   strict=True, sink=0.22, frag=6), seal=True),
        ],
        "views": {"tq": [-0.78, -0.78, 0.34], "tq_rear": [0.78, -0.78, 0.34], "top": [-0.001, 0, 1],
                  "side": [0, -1, 0.06], "front": [-1, 0, 0.08]},
    }


import sys
if "--v2" in sys.argv:
    variants = [lancer_v2("lancer_v2")]
else:
    variants = [lancer("lancer_A_oxblood_fins", "oxblood", "copper", "copper"),
                lancer("lancer_B_copper_fins", "copper", "oxblood", "steel")]
out = os.path.join(os.path.dirname(HERE), "01_input", "frigate_lancer%s.json" % ("_v2" if "--v2" in sys.argv else ""))
json.dump({"variants": variants}, open(out, "w"), indent=1)
print("wrote", out)
