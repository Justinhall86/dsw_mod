"""Thorvald recolour for the Ranger redesign: ../09_thorvald_recolour.py (unchanged) plus head rules per head donor.

    python rd_recolour.py <variant> <uv_regions.json> <out_dir>
"""
import importlib.util, json, os, sys
HERE = os.path.dirname(os.path.abspath(__file__))
spec = importlib.util.spec_from_file_location("rc", os.path.join(os.path.dirname(HERE), "09_thorvald_recolour.py"))
rc = importlib.util.module_from_spec(spec); spec.loader.exec_module(rc)
rc.PAL["oxblood"] = (96, 26, 32)          # house_thorvald art direction: oxblood accents
EYES = (None, (0, 0.2), (0.82, 1), "keep", (0, 1))
HEAD = {
    "RD2": [EYES,                                                        # Raider wrap: the whole hood + mask -> oxblood cloth
            (None, (0, 0.30), (0.22, 1), "oxblood", (0.16, 0.36)),
            ((180, 270), (0.25, 1), (0.2, 1), "skin_dark", (0.10, 0.22)),
            (None, (0, 0.30), (0, 1), "black", (0.05, 0.14))],
    "RD3": [EYES,                                                        # HeavyWeapon helmet: teal visor -> copper, white shell -> gunmetal
            ((140, 210), (0.25, 1), (0.15, 1), "copper", (0.40, 0.70)),
            (None, (0, 0.22), (0.45, 1), "gunmetal", (0.12, 0.28)),
            (None, (0, 0.30), (0, 1), "black", (0.05, 0.14))],
    "RD4": [EYES,                                                        # Feydakin: yellow collar -> copper, hair -> black
            ((38, 65), (0.5, 1), (0.5, 1), "copper", (0.45, 0.75)),
            ((180, 270), (0.25, 1), (0.2, 1), "skin_dark", (0.10, 0.22)),
            (None, (0, 0.28), (0, 1), "black", (0.05, 0.14))],
}
v = sys.argv[1]
base = v.split("_")[0][:3]
for k, r in HEAD.items():
    if v.startswith(k):
        rc.RULES["head"] = r
data = json.load(open(sys.argv[2]))
# grafted rigid mask (Harkonnen Trooper texture): all its faces -> region "mask" (dark gunmetal plates, black recesses, red trim -> black)
rc.RULES["mask"] = [((0, 30), (0.35, 1), (0.2, 1), "black", (0.05, 0.13)),          # Harkonnen red -> black
                    ((330, 360), (0.35, 1), (0.2, 1), "black", (0.05, 0.13)),
                    (None, (0, 0.35), (0.42, 1), "gunmetal", (0.12, 0.30)),          # plates
                    (None, (0, 1), (0, 1), "black", (0.04, 0.12))]
for tex in list(data):
    if "Harkonnen_Trooper" in os.path.basename(tex):
        data[tex] = {"mask": [p for polys in data[tex].values() for p in polys]}
out_dir = os.path.abspath(sys.argv[3]); os.makedirs(out_dir, exist_ok=True)
mapping = {}
for tex, regions in data.items():
    stem = os.path.splitext(os.path.basename(tex))[0]
    dst = os.path.join(out_dir, stem.replace("_Albedo", "") + "_Thorvald_Albedo.png")
    rc.recolour(tex, regions, dst)
    mapping[tex] = dst
json.dump(mapping, open(os.path.join(out_dir, "thorvald_texture_map.json"), "w"), indent=1)
