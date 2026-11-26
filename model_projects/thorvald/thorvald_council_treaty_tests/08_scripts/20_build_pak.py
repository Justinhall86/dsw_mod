"""Build (and with --install, install) the pak for one experiment through mod_files/stage_and_pack.py,
with asset folders pinned to the copies that were in the last installed pak, so the only change is data.cdb.

    py -3.14 20_build_pak.py [--install] [--launch]

PINNED: pak path -> folder under 01_input/staged_2026-11-13 (saved from <editor res>/res before the rebuild).
Remove a pin when the owner has installed that asset change on purpose."""
import os, sys
HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.abspath(os.path.join(HERE, "..", "..", "..", ".."))
SP = os.path.join(REPO, "mod_files", "stage_and_pack.py")
PIN = os.path.join(HERE, "..", "01_input", "staged_2026-11-13")
PINNED = {"CharMOD/Male01_ThorvaldSwornSword": os.path.join(PIN, "Male01_ThorvaldSwornSword")}
src = open(SP, encoding="utf-8").read(); cut = src.index("def sha(p)")
ns = {"__file__": SP, "__name__": "__main__"}
exec(compile(src[:cut], SP, "exec"), ns)
for k, v in PINNED.items():
    assert k in ns["SOURCES"] and os.path.isdir(v), k
    ns["SOURCES"][k] = v; print("pinned", k, "->", os.path.relpath(v, REPO))
exec(compile("\n" * src[:cut].count("\n") + src[cut:], SP, "exec"), ns)
