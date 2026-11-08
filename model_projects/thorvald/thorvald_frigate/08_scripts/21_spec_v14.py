"""Write frigate.json v14 from v13 (backup kept as 01_input/frigate_v13_backup.json).
v14: host holes sealed, gold Wraith domes removed, Tank spine cannon, Hammer engine-pod drum arms."""
import json, os, shutil
P = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "01_input")
src = os.path.join(P, "frigate.json")
bak = os.path.join(P, "frigate_v13_backup.json")
if not os.path.exists(bak):
    shutil.copy(src, bak)
s = json.load(open(bak))
v = s["variants"][0]
v["name"] = "frigate_v14"
v["_note"] = "v14: holes sealed, gold domes removed, Tank spine cannon, Hammer pod drum arms. NOSE +X."
v["host_seal"] = True
v["grafts"] = v["grafts"][:3]          # g3/g4 were the two gold Wraith domes
v["grafts"] += [
    {"donor": "tank", "role": "steel", "box_abs": [0.2, 2.2, -0.2, 0.2, 1.05, 1.4], "scale": 2.3,
     "at": [1.2, 0.0, None], "sink": 0.08, "min_island_faces": 4},
    {"donor": "hammer", "role": "steel", "box_abs": [0.38, 0.76, -1.0, -0.2, -0.5, 0.3],
     "scale": [3.2, 1.7, 3.2], "at": [-3.1, 1.0, -0.4], "mirror_y": True, "min_island_faces": 4},
]
json.dump(s, open(src, "w"), indent=2)
print("wrote", src)
