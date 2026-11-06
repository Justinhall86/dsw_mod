"""hlboot.dat patch: the first Renegade drop happens 2 game days (60 s) after Renegades unlock, not immediately.

    python 30_patch_hlboot_drop_timer.py            # DRY RUN: find the op, show the bytes, change nothing
    python 30_patch_hlboot_drop_timer.py --apply    # back up the game's hlboot.dat to pak_archive/, then patch it in place
    python 30_patch_hlboot_drop_timer.py --revert   # put the backed-up vanilla hlboot.dat back

What it changes (one operand byte): logic.state.$Raids.__constructor__ sets
    nextRenegadesDropThreshold = Float(table[5])   (-1.0, so the first drop fires as soon as Renegades are enabled)
and we point it at the float table's 2.0 instead. The drop score grows by Raid_Renegades_Drop_ScorePerDay (1) per day,
so with Raid_Renegades_HegemonyUnlock = 0 (enabled from the first tick) the first drop lands at day 2 = 60 s.
Later drops use the normal Raid_Renegades_Drop_ScoreThreshold_Bounds. Saved games keep their stored threshold.

A Steam update or "verify integrity of game files" restores the vanilla hlboot.dat. Re-run --apply after that. The
script refuses to patch a file it doesn't recognise.
"""
import hashlib
import os
import shutil
import sys

REPO = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))
sys.path.insert(0, os.path.join(REPO, ".claude", "skills", "dsw-hlboot-reverse", "scripts"))
import hlboot  # noqa: E402

DAT = hlboot.DEFAULT_DAT
ARCHIVE = os.path.join(REPO, "pak_archive")
APPLY, REVERT = "--apply" in sys.argv, "--revert" in sys.argv


def sha(path):
    return hashlib.sha256(open(path, "rb").read()).hexdigest()[:16]


def backups():
    return sorted(f for f in os.listdir(ARCHIVE) if f.startswith("hlboot_vanilla_") and f.endswith(".dat"))


if REVERT:
    b = backups()
    if not b:
        sys.exit("no pak_archive/hlboot_vanilla_*.dat to restore")
    shutil.copy2(os.path.join(ARCHIVE, b[-1]), DAT)
    sys.exit(f"restored {DAT} from {b[-1]} (sha {sha(DAT)})")

m = hlboot.parse(DAT)
code = hlboot.Code(m)
fn = next(i for i, f in enumerate(code.F) if code.name(f["fi"]) == "logic.state.$Raids.__constructor__")
m = hlboot.parse(DAT, track=[fn])
f = m["funcs"][fn]
code = hlboot.Code(m)
# the Float op that feeds `this.nextRenegadesDropThreshold = rX`
k = next(k for k, (op, a) in enumerate(f["ops"])
         if hlboot.OPN[op] == "SetThis" and code.field(f, 0, a[0]) == "nextRenegadesDropThreshold")
op, a = f["ops"][k - 1]
if hlboot.OPN[op] != "Float":
    sys.exit(f"unexpected op before the threshold assignment: {hlboot.OPN[op]} {a}; refusing")
want = m["floats"].index(2.0)
off = m["offsets"][fn][k - 1]
raw = open(DAT, "rb").read()
print(f"{code.name(f['fi'])} op {k - 1}: Float r{a[0]} = table[{a[1]}] = {m['floats'][a[1]]}  bytes {raw[off:off + 3].hex()} at {off}")
if a[1] == want:
    sys.exit("already patched (threshold 2.0)")
if m["floats"][a[1]] != -1.0 or raw[off] != 2 or a[0] >= 0x80 or a[1] >= 0x80 or want >= 0x80:
    sys.exit("file does not look like the vanilla layout this patch was written for; refusing")
new = bytearray(raw)
new[off + 2] = want  # Float opcode (2), dst reg, float index: all one-byte indexes
print(f"patch: float index {a[1]} -> {want} ({m['floats'][want]}); bytes -> {bytes(new[off:off + 3]).hex()}")
if not APPLY:
    sys.exit("dry run: nothing written")
os.makedirs(ARCHIVE, exist_ok=True)
bk = os.path.join(ARCHIVE, f"hlboot_vanilla_{sha(DAT)}.dat")
if not os.path.exists(bk):
    shutil.copy2(DAT, bk)
print("backup:", bk)
open(DAT, "wb").write(bytes(new))
check = hlboot.parse(DAT)  # must still parse to the last byte
cf = check["funcs"][fn]
print("patched; re-parse ok:", check["floats"][cf["ops"][k - 1][1][1]] == 2.0, "| new sha", sha(DAT))
