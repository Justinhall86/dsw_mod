"""data.cdb edit for the cruiser frigate: only the TH_Frigate unit's reactor FX (event kind 28) changes, from the
Chronos's to FX_Thorvald_Reactor.fx (83_reactor_fx.py), so the cyan flare sits in the cruiser's two engine bells.
The model rows (Th_Frigate / A_Frigate -> VehMOD/Thorvald_Frigate/Prefab_Thorvald_Frigate.prefab, rig 29, scale 1.2)
already point at the folder 81_convert_cruiser.py rebuilt, so they are not touched.

    python 84_cdb_cruiser.py [--dry] [--revert]
"""
import json, os, shutil, sys

HERE = os.path.dirname(os.path.abspath(__file__))
PROJ = os.path.dirname(HERE)
REPO = PROJ
while not os.path.isdir(os.path.join(REPO, "model_inputs")):
    REPO = os.path.dirname(REPO)
os.environ.setdefault("DSW_PROJECT_DIR", REPO)
sys.path.insert(0, os.path.join(REPO, ".claude", "skills", "dsw-model-modding", "scripts"))
import cdb_tools as C  # noqa: E402
from dsw_common import cdb_path  # noqa: E402

OLD = "Fx/Vehicle/Ships/Chronos/FX_Chronos_Reactor.fx"
NEW = "Fx/Vehicle/Ships/Thorvald/FX_Thorvald_Reactor.fx"
revert = "--revert" in sys.argv
src, dst = (NEW, OLD) if revert else (OLD, NEW)

path = cdb_path()
before = os.path.join(PROJ, "07_data_cdb", "data_BEFORE_cruiser.cdb")
if not revert and not os.path.exists(before) and "--dry" not in sys.argv:
    os.makedirs(os.path.dirname(before), exist_ok=True); shutil.copyfile(path, before)
    print("saved", before)
data, _ = C.load(path)
u = C.by_id(C.sheets(data)["unit"])["TH_Frigate"]
n = 0
for ev in u["effects"]["events"]:
    if ev.get("kind") == 28:
        for f in ev["fxs"]:
            if f.get("fx") == src:
                f["fx"] = dst; n += 1
print("TH_Frigate reactor fx: %s -> %s (%d changed)" % (src, dst, n))
if n and "--dry" not in sys.argv:
    # this data.cdb does not re-serialise byte for byte, so patch the text: the one path inside the TH_Frigate row
    raw = open(path, "r", encoding="utf-8", newline="").read()
    start = raw.find('"id": "TH_Frigate"')
    assert start > 0 and raw.count('"id": "TH_Frigate"') == 1, "TH_Frigate row not unique"
    nxt = raw.find('"id": "', start + 10)                 # next row id = end of this row's search window
    i = raw.find('"%s"' % src, start)
    if i < 0 or (0 < nxt < i):                            # the row may list its id after the effects: search back
        row_start = raw.rfind('"id": "', 0, start)
        i = raw.find('"%s"' % src, row_start + 10)
        assert 0 < i < start, "reactor path not found inside the TH_Frigate row"
    new_raw = raw[:i] + '"%s"' % dst + raw[i + len(src) + 2:]
    # verify: parsed, the ONLY difference in the whole cdb is that one field
    old_j, new_j = json.loads(raw), json.loads(new_raw)
    diffs = []

    def cmp(a, b, p=""):
        if type(a) != type(b):
            diffs.append(p); return
        if isinstance(a, dict):
            for k in set(a) | set(b):
                cmp(a.get(k), b.get(k), p + "/" + k)
        elif isinstance(a, list):
            if len(a) != len(b):
                diffs.append(p); return
            for j, (x, y) in enumerate(zip(a, b)):
                cmp(x, y, p + "[%d]" % j)
        elif a != b:
            diffs.append(p)
    cmp(old_j, new_j)
    print("parsed diff:", diffs)
    assert len(diffs) == 1 and "/effects/events" in diffs[0], "unexpected change"
    shutil.copyfile(path, os.path.join(REPO, "mod_files", "backups", "data_before_%s.cdb" % ("cruiser_revert" if revert else "cruiser"))) \
        if os.path.isdir(os.path.join(REPO, "mod_files", "backups")) else None
    open(path, "w", encoding="utf-8", newline="").write(new_raw)
    with open(os.path.join(PROJ, "07_data_cdb", "cruiser_cdb_edit.json"), "w") as fh:
        json.dump({"unit": "TH_Frigate", "event": 28, "before": src, "after": dst}, fh, indent=2)
    print("CDB_SAVED")
