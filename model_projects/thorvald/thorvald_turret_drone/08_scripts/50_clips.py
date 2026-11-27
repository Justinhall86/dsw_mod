"""Tank clips for the turret gunship: the vanilla DroneR clips with the hover motion taken out of B_Body.

    python 50_clips.py            # -> 06_game_ready/VehMOD/<NAME>/Anim/Anim_DroneR_<Clip>.fbx  (HMDs, like the game's)

The Renegade drone hovers: Idle/FightIdle bob B_Body about 0.1 up and down, Run rolls it about +-8 deg. On tracks that reads as a
floating tank, so each clip is copied byte for byte and only B_Body's frame values are rewritten:
  Idle, FightIdle, Run : B_Body held still and level at the height the model is built at (hold_pose): tracks on the ground.
  AttackRange          : B_Body at that pose plus the vanilla recoil jolt along the barrel axis only (no lift).
  Death                : unchanged.
Idle and FightIdle have no B_Body rotation track, so the engine uses the model's default joint rotation; 60_write_gunship.py
sets that default to the same level pose. Cannon and _Shoot tracks are untouched (AttackRange's roll about the barrel axis and the recoil kick).
File names stay Anim_DroneR_<Clip> (the engine looks clips up as Anim_<Rig>_<Name>); the model's props.json lists only this
folder in hmd.animPaths, so these replace the vanilla clips for this model alone.
"""
import glob
import os
import shutil
import struct
import sys

import numpy as np

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = os.path.abspath(os.path.join(PROJ, "..", "..", ".."))
sys.path.insert(0, os.path.join(REPO, "HMD_toolkit", "HMD_toolkit", "Animations"))
sys.path.insert(0, os.path.join(REPO, "HMD_toolkit", "HMD_toolkit", "Models"))
import hmd_anim as HA  # noqa: E402
import hmd_reader as H  # noqa: E402
from hmd2fbx import pos_to_mat4  # noqa: E402

NAME = sys.argv[sys.argv.index("--name") + 1] if "--name" in sys.argv else "ThorvaldGunDrone"
SRC = os.path.join(REPO, "model_inputs", "Anim", "DroneR")
HOST = os.path.join(REPO, "model_inputs", "Vehicle", "Common", "Ravager_Drone", "Ravager_Drone.fbx")
OUT = os.path.join(PROJ, "06_game_ready", "VehMOD", NAME, "Anim")
HOLD = ("Idle", "FightIdle", "Run")
RECOIL = ("AttackRange",)


def hold_pose():
    """The level 'parked' pose of B_Body in clip space: the clips keep B_Body at (0, ~0.81, 0) with no rotation (B_ROOT
    carries the Y-up -> Z-up turn); the model is built with B_Body at its bind height, so hold it there: (0, h, 0), identity,
    h = |bind translation of B_Body| = 0.8553. Skinned hull = exactly the built geometry, tracks on the ground."""
    d = H.load(HOST)
    j = {x.name: x for x in d.models[0].skin.joints}
    h = float(np.linalg.norm(np.linalg.inv(pos_to_mat4(j["B_Body"].transpos))[3, :3]))
    return (0.0, h, 0.0), (0.0, 0.0, 0.0, 1.0)


def offsets(a, tracks):
    """Byte offset of B_Body's position and rotation values in each frame (single-frame tracks first, then frames)."""
    singles = [t for t in tracks.values() if t.single]
    others = [t for t in tracks.values() if not t.single]
    base = a.dataPosition + 4 * sum(t.value_stride() for t in singles)
    stride = 4 * sum(t.value_stride() for t in others)
    inner = 0
    for t in others:
        if t.name == "B_Body":
            break
        inner += 4 * t.value_stride()
    return base, stride, inner


def main():
    os.makedirs(OUT, exist_ok=True)
    for src in sorted(glob.glob(os.path.join(SRC, "Anim_DroneR_*.fbx"))):
        clip = os.path.basename(src)[len("Anim_DroneR_"):-4]
        dst = os.path.join(OUT, os.path.basename(src))
        d, a, tracks = HA.load_animation(src)
        t = tracks.get("B_Body")
        if clip not in HOLD + RECOIL or t is None or t.single:
            shutil.copyfile(src, dst)
            print("%-12s copied unchanged" % clip)
            continue
        pos0, rot0 = hold_pose()
        raw = bytearray(open(src, "rb").read())
        data_start = len(raw) - len(d.data)                                 # frame offsets are relative to the data section
        base, stride, inner = offsets(a, tracks)
        p_first = np.array(t.position[0]) if t.position is not None else None
        for f in range(a.frames):
            at = data_start + base + f * stride + inner
            if t.position is not None:
                p = np.array(pos0)
                if clip in RECOIL:                                           # keep the jolt along the barrel axis (raw z)
                    p[2] += t.position[f][2] - p_first[2]
                struct.pack_into("<3f", raw, at, *p)
                at += 12
            if t.rotation is not None:
                struct.pack_into("<3f", raw, at, *rot0[:3])
        open(dst, "wb").write(bytes(raw))
        _, _, chk = HA.load_animation(dst)
        cp = np.array(chk["B_Body"].position) if chk["B_Body"].position is not None else np.zeros((1, 3))
        print("%-12s B_Body rewritten: %d frames, position range %s" % (clip, a.frames, np.round(np.ptp(cp, 0), 3)))


if __name__ == "__main__":
    main()
