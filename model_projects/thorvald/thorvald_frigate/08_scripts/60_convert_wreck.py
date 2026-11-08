"""Convert the SpaceCruiserWreck POI (HMD-behind-.fbx) to real FBX + PNG textures for Blender.
Writes model_inputs/Structure/Point_Of_Interest/SpaceCruiserWreck/preview_textures/.

    python 60_convert_wreck.py
"""
import importlib.util, os, sys

HERE = os.path.dirname(os.path.abspath(__file__))
R = HERE
while not os.path.isdir(os.path.join(R, "model_inputs")):
    R = os.path.dirname(R)
BP = os.path.join(R, ".claude", "skills", "dsw-vehicle-preview", "scripts", "build_previews.py")
spec = importlib.util.spec_from_file_location("bp", BP)
bp = importlib.util.module_from_spec(spec); spec.loader.exec_module(bp)

SRC = os.path.join(R, "model_inputs", "Structure", "Point_Of_Interest", "SpaceCruiserWreck")
OUT = os.path.join(SRC, "preview_textures"); os.makedirs(OUT, exist_ok=True)
for stem in ["SpaceCruiserWreck", "SpaceCruiserWreck_02", "Debris_01", "Debris_02", "Debris_03"]:
    try:
        print("model", bp.convert_model(os.path.join(SRC, stem + ".fbx"), os.path.join(OUT, stem + "_real.fbx")))
    except Exception as e:
        print("FAILED", stem, e)
for t in ["Albedo", "MetallicGlossAO", "Normal"]:
    print("tex", bp.dds_as_png(os.path.join(SRC, "CrashedShip_%s.png" % t), os.path.join(OUT, "CrashedShip_%s.png" % t)))
