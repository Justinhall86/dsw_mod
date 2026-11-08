"""Write 01_input/frigate_designs.json: five design proposals built on the v13 base
(Renegade hull, holes sealed). Coordinates are host-centred, nose +X, hull ~10.2 x 3.4 x 2.6.

    python 25_designs.py
    blender -b --factory-startup --python 20_build_variant.py -- 01_input/frigate_designs.json
"""
import copy, json, os

P = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "01_input")
base = json.load(open(os.path.join(P, "frigate_v13_backup.json")))["variants"][0]
base["host_seal"] = True
base["res"] = 640
BELLS, PLUG, STACK = base["grafts"][:3]
DRUM = base["pieces"][0]


def g(donor, box, at, scale=1.0, rot=(0, 0, 0), role="steel", mirror=False, strict=True, sink=0.1, frag=6):
    return {"donor": donor, "box_abs": box, "at": list(at), "scale": scale, "rot_deg": list(rot), "role": role,
            "mirror_y": mirror, "strict": strict, "sink": sink, "min_island_faces": frag}


KRAKEN = [-2.3, 2.3, -3.6, 3.6, 1.15, 2.4]
ARM = [-3.05, -0.9, 0.55, 1.4, 0.6, 1.8]          # carryall nacelle arm (long on donor X)
POD = [-0.9, -0.05, -0.9, 1.0, 1.6, 2.4]          # kulon 4-tube pod, tubes face -Y -> rot Z 90 faces +X
DISH = [0.0, 0.95, 0.05, 0.8, 1.85, 2.75]
VISOR = [-2.0, -1.0, -0.7, 0.8, 0.6, 1.6]         # ravager shuttle intake, opens -X -> rot Z 180
HPOD = [0.38, 0.76, -1.0, -0.2, -0.5, 0.3]        # hammer twin-ball pod
TGUN = [0.2, 2.2, -0.2, 0.2, 1.05, 1.4]


def drum(seat_at=1.224):
    d = copy.deepcopy(DRUM); d["seat"]["at"] = seat_at; return d


designs = {
    "design1_shieldback": dict(
        pieces=[drum()],
        grafts=[BELLS, PLUG,
                g("kraken", KRAKEN, (0.6, 0, None), [0.6, 0.8, 0.7], (0, 0, 90), sink=0.35),
                g("carryall", ARM, (-3.25, 1.25, -0.45), 1.1, (0, 0, 90), mirror=True),
                g("kuloncannon", DISH, (-2.4, 0, None), 1.8, role="copper")]),
    "design2_anvil": dict(
        pieces=[drum(2.3)],
        grafts=[BELLS, PLUG, STACK,
                g("carryall", ARM, (-3.25, 1.75, -0.35), [1.3, 1.6, 1.3], (0, 0, 90), mirror=True),
                g("kuloncannon", POD, (-3.0, 3.95, -0.36), 1.3, (0, 0, 90), mirror=True, strict=False),
                g("hammer", HPOD, (0.6, 0.75, -1.35), 1.7, mirror=True)]),
    "design3_siege_battery": dict(
        pieces=[drum()],
        grafts=[BELLS, PLUG, STACK,
                g("kuloncannon", POD, (1.4, 2.0, -0.1), 1.1, (0, 0, 90), mirror=True, strict=False),
                g("kuloncannon", POD, (-0.6, 2.0, 0.15), 1.1, (0, 0, 90), mirror=True, strict=False),
                g("ravshuttle", VISOR, (5.25, 0, -0.05), 1.3, (0, 0, 180)),
                g("tank", TGUN, (4.4, 0, -1.3), 1.6)]),
    "design4_command_lantern": dict(
        pieces=[drum()],
        grafts=[BELLS, PLUG,
                dict(STACK, scale=[1.65, 1.45, 3.2]),
                g("kraken", KRAKEN, (2.0, 0, None), [0.4, 0.42, 0.6], (0, 0, 90), sink=0.3),
                g("kuloncannon", DISH, (-0.5, 0, None), 2.3, role="copper", sink=0.05),
                g("ravshuttle", VISOR, (5.25, 0, -0.05), 1.3, (0, 0, 180))]),
    "design5_ironclad": dict(
        pieces=[],
        grafts=[BELLS, PLUG,
                g("kraken", KRAKEN, (0.0, 0, None), [0.75, 1.25, 0.9], (0, 0, 90), sink=0.35),
                g("hammer", HPOD, (-2.8, 1.95, -0.6), 2.2, mirror=True),
                g("kuloncannon", POD, (1.2, 2.05, -0.2), 1.2, (0, 0, 90), mirror=True, strict=False)]),
}

variants = []
for name, d in designs.items():
    v = copy.deepcopy(base)
    v["name"] = name
    v.pop("_note", None)
    v["pieces"], v["grafts"] = d["pieces"], d["grafts"]
    v["views"] = {"tq": [0.78, -0.78, 0.34], "top": [-0.001, 0, 1], "side": [0, -1, 0.06],
                  "tq_rear": [-0.78, -0.78, 0.34]}
    variants.append(v)
out = os.path.join(P, "frigate_designs.json")
json.dump({"variants": variants}, open(out, "w"), indent=1)
print("wrote", out, len(variants))
