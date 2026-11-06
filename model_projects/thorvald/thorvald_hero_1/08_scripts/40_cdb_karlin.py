"""data.cdb edit for Karlin Thorvald (unit TH_Hero_1, model row Th_Hero_2): the Corrino/Wensicia clone becomes our
Male01 dual-sword commander. Choices confirmed by the user 2026-11-03: melee (Free Company's dual-sword combo), Iakin's
voice and sounds, name + description rewritten from house_thorvald/heroes.md.

  python 40_cdb_karlin.py --dry-run      # print what would change
  python 40_cdb_karlin.py                # backup, then edit mod_files/data.cdb
  python 40_cdb_karlin.py --revert       # restore 07_data_cdb/data_BEFORE_karlin_hero.cdb

Character Karlin: lastname Mallenor -> Thorvald, description without "(working name)".
Unit TH_Hero_1:
  * name "Karlin Thorvald", new description (War Academy commandant, aura commander, two blades)
  * attacks: Generic_Ranged (Wensicia's pistol) -> Generic_Flanker_Melee (S_Elite / Free Company); stats.range (35, the
    pistol's) dropped like every melee unit's (S_Elite has none). health/power/armor unchanged (stat choices are the user's)
  * voices and move/melee/ability sounds -> Iakin Nefud's (H_Hero_2); the ability FX are left as they were
Model Th_Hero_2 (the row TH_Hero_1 uses - the Corrino clone swapped the two hero model ids):
  * mesh -> CharMOD/Male01_ThorvaldKarlin/Prefab_ThorvaldKarlin.prefab (NOT exported yet: the export must stage it
    before the pak is built - cdb_validate.py reports it as a missing file until then)
  * rigName 1 (Female01) -> 0 (Male01); inherit Wensicia -> ThorvaldKarlin
New model row ThorvaldKarlin (anim set; inserted right after its vanilla sibling MilitaryDualSwords):
  * MilitaryDualSwords' entries, which all exist as Anim/Male01/DualSwords clips except IdleVariant (Female01 only) -
    that one plays DualSwords_IdleStance instead
  * + Skill = Nefud_Skill (Anim/Male01/Nefud; MilitaryDualSwords has no Skill and the hero ability needs one)
"""
import argparse
import copy
import os
import shutil
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = os.path.abspath(os.path.join(PROJ, os.pardir, os.pardir, os.pardir))
sys.path.insert(0, os.path.join(REPO, ".claude", "skills", "dsw-model-modding", "scripts"))
import cdb_tools as C  # noqa: E402

CDB = os.path.join(REPO, "mod_files", "data.cdb")
BEFORE = os.path.join(PROJ, "07_data_cdb", "data_BEFORE_karlin_hero.cdb")
UNIT, MODEL, ANIMSET = "TH_Hero_1", "Th_Hero_2", "ThorvaldKarlin"
MESH = "CharMOD/Male01_ThorvaldKarlin/Prefab_ThorvaldKarlin.prefab"
NAME = "Karlin Thorvald"
DESC = ("Karlin Thorvald commands the War Academy, where the Earl's officers learn tactics and logistics side by side. "
        "He fights with two blades at the head of the line, and the soldiers around him hold harder, hit harder and "
        "strike faster for it.")
IAKIN_SOUNDS = {1: "Move_Run_Iakinnefud", 3: "Nefud_Attackmelee", 37: "Nefud_Ability"}
IAKIN_VOICES = [{"action": 2, "event": "Voice_H_Iakinnefud_Attack"}, {"action": 1, "event": "Voice_H_Iakinnefud_Move"},
                {"action": 0, "event": "Voice_H_Iakinnefud_Select"},
                {"action": 6, "event": "Voice_H_Iakinnefud_Abilityon"}]

ap = argparse.ArgumentParser()
ap.add_argument("--dry-run", action="store_true")
ap.add_argument("--revert", action="store_true")
a = ap.parse_args()

if a.revert:
    if not os.path.exists(BEFORE):
        sys.exit("no %s to revert to" % BEFORE)
    C.backup(CDB, "before_karlin_revert")
    shutil.copy2(BEFORE, CDB)
    sys.exit("reverted %s from %s" % (CDB, BEFORE))

data, exact = C.load(CDB)
if not exact:
    sys.exit("data.cdb does not round-trip byte for byte; refusing (run cdb_tools.py verify)")
sh = {s["name"]: s for s in data["sheets"]}
units = sh["unit"]["lines"]
models = sh["model"]["lines"]
u = next(r for r in units if r["id"] == UNIT)
m = next(r for r in models if r["id"] == MODEL)
by_id = {r["id"]: r for r in models}
if ANIMSET in by_id:
    sys.exit("%s already exists - already applied? (--revert first to redo)" % ANIMSET)

log = []
ch = next(r for r in sh["character"]["lines"] if r["id"] == "Karlin")
log.append("character Karlin lastname %r -> 'Thorvald'" % ch.get("lastname"))
ch["lastname"] = "Thorvald"
ch["desc"] = ("Karlin Thorvald, commandant of the War Academy: a buff-and-support commander whose presence hardens the "
              "ranks around him.")
log.append("unit %s name %r -> %r" % (UNIT, u["texts"]["name"], NAME))
u["texts"]["name"] = NAME
u["texts"]["plural"] = {"name": "Karlin"}
u["texts"]["desc"] = DESC
log.append("unit %s combos %s -> Generic_Flanker_Melee" % (UNIT, [c["ref"] for c in u["attacks"]["combos"]]))
u["attacks"]["combos"] = [{"ref": "Generic_Flanker_Melee"}]
for st in u["stats"]:
    if "range" in st:
        log.append("unit %s stats.range %s dropped (melee)" % (UNIT, st.pop("range")))
for ev in u["effects"]["events"]:
    if ev["kind"] in IAKIN_SOUNDS:
        log.append("unit %s event kind %d sound %s -> %s" % (UNIT, ev["kind"], ev.get("sound"), IAKIN_SOUNDS[ev["kind"]]))
        ev["sound"] = IAKIN_SOUNDS[ev["kind"]]
u["effects"]["sound"]["voices"] = copy.deepcopy(IAKIN_VOICES)
log.append("unit %s voices -> Voice_H_Iakinnefud_*" % UNIT)

log.append("model %s mesh %s -> %s" % (MODEL, m["mesh"][0]["path"], MESH))
m["mesh"] = [{"path": MESH}]
log.append("model %s rigName %s -> 0, inherit %s -> %s" % (MODEL, m.get("rigName"), m.get("inherit"), ANIMSET))
m["rigName"] = 0
m["inherit"] = ANIMSET

anim = copy.deepcopy(by_id["MilitaryDualSwords"])
anim["id"] = ANIMSET
for e in anim["anim"]:
    if e["id"] == "IdleVariant":
        e["animName"] = "DualSwords_IdleStance"
skill = copy.deepcopy(next(e for e in by_id["Nefud"]["anim"] if e["id"] == "Skill"))
pos = next(i for i, e in enumerate(anim["anim"]) if e["id"] == "AttackLaunch")
anim["anim"].insert(pos + 1, skill)
at = models.index(by_id["MilitaryDualSwords"]) + 1
models.insert(at, anim)
log.append("model %s added at row %d (after MilitaryDualSwords): %s" % (ANIMSET, at, [(e["id"], e.get("animName"))
                                                                                     for e in anim["anim"]]))

print("\n".join(log))
if a.dry_run:
    sys.exit("dry run - nothing written")
os.makedirs(os.path.dirname(BEFORE), exist_ok=True)
if not os.path.exists(BEFORE):
    shutil.copy2(CDB, BEFORE)
    print("saved", BEFORE)
C.save(CDB, data, "karlin_hero")
print("written", CDB)
