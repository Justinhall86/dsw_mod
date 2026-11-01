"""hlboot.dat patch 2: keep the 2-day first-drop threshold when Renegades switch on.

    python 31_patch_hlboot_keep_first_threshold.py            # DRY RUN
    python 31_patch_hlboot_keep_first_threshold.py --apply    # back up to pak_archive/hlboot_before31_<sha>.dat, then patch
    python 31_patch_hlboot_keep_first_threshold.py --revert   # restore that backup (patch 30 stays)

Why: logic.state.Raids.set_renegadesEnabled is
    if (__host != null && __host.isAuth) setupNextRenegadeDrop();   // threshold = random(ScoreThreshold_Bounds) = 20..40 days
so the 2.0 that patch 30 puts in the constructor is overwritten the moment Renegades are enabled. Without this patch
the first drop came 20-40 days after enabling (the 2026-10-31 Corrino test: no drop by day 6).
The patch flips that one JFalse to JTrue (same encoding length, one opcode byte), so the call is skipped on the host.
The first drop then fires at day 2 (60 s). After it, regularUpdate calls setupNextRenegadeDrop itself,
so later drops keep the vanilla 20-40 day rhythm.
Needs patch 30 (threshold 2.0). Without it the constructor's -1 would make the drop immediate.
A Steam update or file verification restores vanilla hlboot.dat: re-run 30 and then 31.
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
FN = "logic.state.Raids.set_renegadesEnabled"


def sha(path):
    return hashlib.sha256(open(path, "rb").read()).hexdigest()[:16]


if REVERT:
    b = sorted((f for f in os.listdir(ARCHIVE) if f.startswith("hlboot_before31_")),
               key=lambda f: os.path.getmtime(os.path.join(ARCHIVE, f)))
    if not b:
        sys.exit("no pak_archive/hlboot_before31_*.dat to restore")
    shutil.copy2(os.path.join(ARCHIVE, b[-1]), DAT)
    sys.exit(f"restored {DAT} from {b[-1]} (sha {sha(DAT)})")

m = hlboot.parse(DAT)
code = hlboot.Code(m)
fn = next(i for i, f in enumerate(code.F) if code.name(f["fi"]) == FN)
m = hlboot.parse(DAT, track=[fn])
code = hlboot.Code(m)
f = m["funcs"][fn]
ops = f["ops"]
names = [hlboot.OPN[op] for op, _ in ops]
# the guard right before the call to setupNextRenegadeDrop
call = next(i for i, (op, a) in enumerate(ops) if names[i].startswith("Call") and "setupNextRenegadeDrop" in code.fmt(f, op, a))
k = call - 1
raw = open(DAT, "rb").read()
off = m["offsets"][fn][k]
JTRUE, JFALSE = hlboot.OPN.index("JTrue"), hlboot.OPN.index("JFalse")
print(f"{FN} op {k}: {names[k]} {ops[k][1]}  byte {raw[off]:#04x} at {off}; op {call}: {code.fmt(f, *ops[call])}")
if names[k] == "JTrue":
    sys.exit("already patched")
if names[k] != "JFalse" or ops[k][1][1] != 1 or raw[off] != JFALSE:
    sys.exit("file does not look like the layout this patch was written for; refusing")
new = bytearray(raw)
new[off] = JTRUE
print(f"patch: opcode {JFALSE} (JFalse) -> {JTRUE} (JTrue)")
if not APPLY:
    sys.exit("dry run: nothing written")
os.makedirs(ARCHIVE, exist_ok=True)
bk = os.path.join(ARCHIVE, f"hlboot_before31_{sha(DAT)}.dat")
if not os.path.exists(bk):
    shutil.copy2(DAT, bk)
print("backup:", bk)
open(DAT, "wb").write(bytes(new))
check = hlboot.parse(DAT, track=[fn])
print("patched; re-parse ok:", hlboot.OPN[check["funcs"][fn]["ops"][k][0]] == "JTrue", "| new sha", sha(DAT))
