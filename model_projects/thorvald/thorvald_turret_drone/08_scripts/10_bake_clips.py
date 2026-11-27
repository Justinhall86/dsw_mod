"""Bake the vanilla DroneR clips (the Renegade drone's set, /Anim/DroneR) onto the Renegade drone HMD as animated FBX.

    python 10_bake_clips.py           # vanilla DroneR clips -> 01_input/anim_fbx/Ravager_Drone__<Clip>.fbx  (regenerable)
    python 10_bake_clips.py --tank    # our level clips (50_clips.py) -> 01_input/anim_fbx_tank/
"""
import glob
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = os.path.abspath(os.path.join(PROJ, "..", "..", ".."))
sys.path.insert(0, os.path.join(REPO, "HMD_toolkit", "HMD_toolkit", "Animations"))
import hmdanim2fbx  # noqa: E402

HOST = os.path.join(REPO, "model_inputs", "Vehicle", "Common", "Ravager_Drone", "Ravager_Drone.fbx")
OUT = os.path.join(PROJ, "01_input", "anim_fbx")
ANIM = os.path.join(REPO, "model_inputs", "Anim", "DroneR")
if "--tank" in sys.argv:            # our level tank clips (50_clips.py) instead of the vanilla hover clips
    NAME = sys.argv[sys.argv.index("--name") + 1] if "--name" in sys.argv else "ThorvaldGunDrone"
    ANIM = os.path.join(PROJ, "06_game_ready", "VehMOD", NAME, "Anim")
    OUT = os.path.join(PROJ, "01_input", "anim_fbx_tank")
os.makedirs(OUT, exist_ok=True)
for a in sorted(glob.glob(os.path.join(ANIM, "Anim_DroneR_*.fbx"))):
    clip = os.path.basename(a)[len("Anim_DroneR_"):-4]
    hmdanim2fbx.export(HOST, a, os.path.join(OUT, "Ravager_Drone__%s.fbx" % clip))
