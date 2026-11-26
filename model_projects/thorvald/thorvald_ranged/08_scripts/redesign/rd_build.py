"""Thorvald Ranger REDESIGN recipes (2026-11-26): make the Ranger read as a different unit from the melee Trooper,
the way the Atreides Ranger differs from the Atreides Trooper (no hat / helmet bulk, no tabard, slim trousers, pouches, light upper body).

    python bl.py rd_build.py -- RD1 RD2 ...

Loads ../03_variants_trooper.py (the shared builder, unchanged), adds the RD recipes, writes
03_blender/redesign/<name>.blend and 02_progress_photos/05_redesign/variants/<name>_*.png.
"""
import os, sys
HERE = os.path.dirname(os.path.abspath(__file__))
SRC = os.path.join(os.path.dirname(HERE), "03_variants_trooper.py")
sys.path.insert(0, os.path.abspath(os.path.join(HERE, "..", "..", "..", "..", "..", ".claude", "skills", "dsw-part-kitbash", "scripts")))
code = open(SRC, encoding="utf-8").read()
code = code[:code.rindex("keys = script_args()")]
g = {"__file__": SRC, "__name__": "rd_builder"}
exec(compile(code, SRC, "exec"), g)
V = g["VARIANTS"]
# the project moved under model_projects/thorvald/: point units.py at the real model_inputs (its own path is one level short)
sys.modules["units"].MI = os.path.abspath(os.path.join(HERE, "..", "..", "..", "..", "..", "model_inputs", "Character"))
sys.modules["units"]._INDEX.clear()
g["SHOTS"] = os.path.join(g["PROJ"], "02_progress_photos", "05_redesign", "variants")
g["BLENDS"] = os.path.join(g["PROJ"], "03_blender", "redesign")

R5 = V["R5_Ranged"]
LEGS = dict(donor="AtreidesSoldier", tag="legs", keep_comps=[4, 5, 13, 14, 20, 21, 30, 31, 61, 62, 79, 80])
# RD1: the R5 Ranger with the two Trooper signatures taken off: no kasa hat, no rust sash/apron. Bare masked head, slim trousers.
RD = {}
SASH_BELT = dict(R5["fill"][1], zmin=1.12)          # Duncan's sash cut to the belt band + a short hem: closes the waist, no apron
RD["RD1"] = dict(R5, hat=None, fill=[R5["fill"][0], SASH_BELT, R5["fill"][2]], title="Ranger RD1: no hat, no apron")
RD["RD2"] = dict(RD["RD1"], donor="Raider", title="Ranger RD2: Raider hood + mask")
RD["RD3"] = dict(RD["RD1"], donor="HeavyWeapon", title="Ranger RD3: HeavyWeapon helmet")
RD["RD4"] = dict(RD["RD1"], donor="Feydakin", title="Ranger RD4: Feydakin breather")
V.update(RD)

keys = [k for k in sys.argv[sys.argv.index("--") + 1:]] if "--" in sys.argv else list(RD)
for k in keys:
    print("=== BUILD", k)
    g["build"](k, V[k])
