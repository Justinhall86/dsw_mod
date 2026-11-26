"""Bake the vanilla DroneC animation clips onto the two Corrino artillery-drone HMDs as animated FBX files.

    python 10_bake_clips.py            # -> 01_input/anim_fbx/<Part>__<Clip>.fbx   (regenerable, not committed)

The drone is two skinned HMDs that share one rig (bone names): ImperiumDroneBase (the four legs) and
ImperiumDroneCanon (hull, hex lid, gun mount, twin barrels). The game plays every clip of /Anim/DroneC on both.
Uses the toolkit's hmdanim2fbx (same X mirroring as hmd2fbx, so what Blender shows is what the game shows).
"""
import glob
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = os.path.abspath(os.path.join(PROJ, "..", "..", ".."))
sys.path.insert(0, os.path.join(REPO, "HMD_toolkit", "HMD_toolkit", "Animations"))
import hmdanim2fbx  # noqa: E402

VAN = os.path.join(REPO, "model_inputs", "Vehicle", "Imperial", "DroneI")
ANIM = os.path.join(REPO, "model_inputs", "Anim", "DroneC")
OUT = os.path.join(PROJ, "01_input", "anim_fbx")
PARTS = ("ImperiumDroneBase", "ImperiumDroneCanon")


def main(clips=None):
    os.makedirs(OUT, exist_ok=True)
    for a in sorted(glob.glob(os.path.join(ANIM, "Anim_DroneC_*.fbx"))):
        clip = os.path.basename(a)[len("Anim_DroneC_"):-4]
        if clips and clip not in clips:
            continue
        for part in PARTS:
            dst = os.path.join(OUT, "%s__%s.fbx" % (part, clip))
            hmdanim2fbx.export(os.path.join(VAN, part + ".fbx"), a, dst)


if __name__ == "__main__":
    main(sys.argv[1:] or None)
