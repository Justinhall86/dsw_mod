import os
from PIL import Image

ROOT = r"C:\Users\justi\OneDrive\Python\dsw_mod"
PROJ = os.path.join(ROOT, "model_projects", "thorvald_vehicles")
pairs = [
    ("Vehicle/Smuggler/Wraith/Wraith_Albedo.png", "fighter/Wraith_Albedo.png"),
    ("Vehicle/Smuggler/DroneS/CombatDrone_Smuggler_Albedo.png", "drone/CombatDrone_Smuggler_Albedo.png"),
    ("Vehicle/Atreide/Harvester/Harvester_Albedo.png", "claw/Harvester_Albedo.png"),
    ("Vehicle/Atreide/CarryAll/CarryAll_Albedo.png", "carryall/CarryAll_Albedo.png"),
]
cell = 340
sheet = Image.new("RGB", (cell * 2, cell * len(pairs)), (24, 24, 24))
for i, (src, dst) in enumerate(pairs):
    paths = [os.path.join(ROOT, "model_inputs", src),
             os.path.join(PROJ, "04_textures", dst)]
    for j, p in enumerate(paths):
        im = Image.open(p).convert("RGB").resize((cell - 4, cell - 4), Image.NEAREST)
        sheet.paste(im, (j * cell + 2, i * cell + 2))
out = os.path.join(PROJ, "02_progress_photos", "v2_textures.png")
sheet.save(out)
print(out, sheet.size)
