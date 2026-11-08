#!/usr/bin/env python3
"""
`props.costToEquip`: equipping charges the item's own `props.cost`, refused when unaffordable.

The refusal, the charge on commit and the tooltip are `armoury_charge.apply_w30bc`; the price into a
filled slot (old removal fee plus this cost) is `slotprice`; free removal is `armouryfee`.
NO: an override price list (`alwaysCostsOverride`) -- removed at the user's word; the item's cost is the price.
"""
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
from armoury_lib import HLBOOT                     # noqa: E402
from armoury_charge import apply_w30bc             # noqa: E402
from crashlink import Bytecode, disasm             # noqa: E402

OUT = os.path.join(HERE, "hlboot_w30.dat")


def apply_w30d(bc, verbose=True):
    fn, ui, C, KA, KB, iC, KC = apply_w30bc(bc, verbose=verbose)
    return fn, ui


if __name__ == "__main__":
    import time
    t0 = time.time()
    bc = Bytecode.from_path(HLBOOT)
    print("loaded in %.1fs (%d fns, %d strings)" % (time.time() - t0, len(bc.functions), len(bc.strings.value)))
    assert (len(bc.functions), len(bc.natives)) == (43222, 661), "not the pristine base"
    fn, ui = apply_w30d(bc)
    with open(os.path.join(HERE, "_w30_patched.txt"), "w", encoding="utf-8") as fh:
        for f, nm in ((fn, "implInlineApply"), (ui, "UnitEquipments tooltip")):
            fh.write("\n===== %s f@%d nops=%d nregs=%d =====\n" % (nm, f.findex.value, len(f.ops), len(f.regs)))
            for i, o in enumerate(f.ops):
                fh.write("%4d. %s\n" % (i, disasm.fmt_op_compact(bc, f.regs, o, i, func=f)))
    with open(OUT, "wb") as f:
        f.write(bc.serialise())
    print("saved %s in %.1fs\nNOT DEPLOYED." % (OUT, time.time() - t0))
