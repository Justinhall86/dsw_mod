"""Five NEW frigate designs, each on a different vanilla core (no Renegade parts at all).
Coordinates are host-centred (the builder centres the host's bbox on the origin).

    python 26_new_designs.py
    blender -b --factory-startup --python 20_build_variant.py -- 01_input/frigate_new_designs.json

Core hull frames (host-centred half-extents, nose):
  kraken   x+-3.0  y+-4.0  z+-0.94   nose +Y (twin prongs)
  carryall x+-2.15 y+-1.28 z+-0.64   nose -X (twin booms)
  stockdrone x+-1.39 y+-1.02 z+-0.71 nose +X
  banshee  x+-1.83 y+-3.13 z+-1.0    nose -Y (pod), blades are tall vertical panels
  hammer   x+-2.04 y+-1.21 z+-0.77   nose -Y (delta)
"""
import json, os

P = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "01_input")


def g(donor, box, at, scale=1.0, rot=(0, 0, 0), role="steel", mirror=False, strict=True, sink=0.1, frag=6):
    frag = 2 if donor == "tank" else frag
    return {"donor": donor, "box_abs": box, "at": list(at), "scale": scale, "rot_deg": list(rot), "role": role,
            "mirror_y": mirror, "strict": strict, "sink": sink, "min_island_faces": frag}


def gx(donor, box, at, scale=1.0, rot=(0, 0, 0), role="steel", strict=True, sink=0.1, frag=6):
    """mirror across X (for hosts whose long axis is Y) = two grafts at +x and -x."""
    a, b = list(at), list(at)
    b[0] = -a[0]
    r2 = list(rot)
    return [g(donor, box, a, scale, rot, role, False, strict, sink, frag),
            g(donor, box, b, scale, r2, role, False, strict, sink, frag)]


KRAKEN = [-2.3, 2.3, -3.6, 3.6, 1.15, 2.4]          # chamfered carapace with emblem panel, long on Y
ARM = [-3.05, -0.9, 0.55, 1.4, 0.6, 1.8]            # carryall nacelle arm + cowl, long on X
POD = [-0.9, -0.05, -0.9, 1.0, 1.6, 2.4]            # kulon 4-tube rocket pod, tubes face -Y
VISOR = [-2.0, -1.0, -0.7, 0.8, 0.6, 1.6]           # ravager shuttle intake frame, opens -X
HPOD = [0.38, 0.76, -1.0, -0.2, -0.5, 0.3]          # hammer twin-ball engine pod
TGUN = [0.2, 2.2, -0.2, 0.2, 1.05, 1.4]             # tank sleeve + barrel, points +X
BLADE = [0.75, 1.85, -0.9, 4.65, -0.3, 1.5]         # banshee tall blade wing (right one), long on Y

designs = {
    # 1. Kraken shield-wing core, carryall engine nacelles slung under the tail, bridge = shuttle intake frame
    "new1_bastion": dict(host="kraken", grafts=[
        *gx("carryall", ARM, (1.9, -3.2, -0.95), [1.5, 1.4, 1.4], (0, 0, 90), role="copper"),
        g("ravshuttle", VISOR, (0, -1.6, None), 1.1, (0, 0, -90), sink=0.15),
        *gx("kuloncannon", POD, (2.4, 1.2, None), 1.1, (0, 0, 180), strict=False),
        g("tank", TGUN, (0, 4.3, -0.55), 1.6, (0, 0, 90))]),
    # 2. Carryall twin-boom core, banshee blades as tall aft fins, kraken crest, rocket pods on the booms
    "new2_lancer": dict(host="carryall", grafts=[
        g("banshee", BLADE, (1.0, 1.55, 0.35), 0.55, (0, 0, 90), mirror=True),
        g("kraken", KRAKEN, (0.6, 0, None), [0.32, 0.3, 0.5], (0, 0, 90), sink=0.15),
        g("kuloncannon", POD, (-1.4, 0.95, None), 0.8, (0, 0, -90), role="copper", mirror=True, strict=False)]),
    # 3. Stock-drone brick core (hex nozzles under), shuttle intake bow, twin tank guns, banshee skirts
    "new3_iron_brick": dict(host="stockdrone", grafts=[
        g("ravshuttle", VISOR, (1.55, 0, 0.1), 0.8, (0, 0, 180)),
        g("tank", TGUN, (0.5, 0.42, None), 0.75, mirror=True, sink=0.05, role="copper"),
        g("banshee", BLADE, (0.0, 1.1, 0.05), 0.42, (0, 0, 90), mirror=True)]),
    # 4. Banshee blade-wing core, kraken carapace as a roof between the blades, rocket pods, chin gun
    "new4_blade_corsair": dict(host="banshee", grafts=[
        g("kraken", KRAKEN, (0, 0.6, 1.15), [0.62, 0.72, 0.6]),
        *gx("kuloncannon", POD, (1.25, -2.2, 0.4), 0.9, role="copper", strict=False),
        g("tank", TGUN, (0, -3.4, -0.35), 1.3, (0, 0, -90))]),
    # 5. Hammer delta core, carryall nacelles under the wings, kraken crest, rocket pods under the nose
    "new5_hammerhead": dict(host="hammer", grafts=[
        *gx("carryall", ARM, (1.35, 0.4, -0.55), 1.0, (0, 0, 90), role="copper"),
        g("kraken", KRAKEN, (0, 0.35, None), [0.3, 0.32, 0.6], sink=0.1),
        *gx("kuloncannon", POD, (0.55, -1.0, -0.45), 0.6, strict=False)]),
}

variants = []
for name, d in designs.items():
    variants.append({
        "name": name, "host": d["host"], "host_role": "hull", "host_seal": False, "res": 640, "margin": 1.25,
        "pieces": [], "grafts": d["grafts"],
        "views": {"tq": [0.78, -0.78, 0.34], "tq_b": [-0.78, 0.78, 0.34], "top": [-0.001, 0, 1],
                  "side": [-1, 0, 0.06]},
    })
out = os.path.join(P, "frigate_new_designs.json")
json.dump({"variants": variants}, open(out, "w"), indent=1)
print("wrote", out, len(variants))
