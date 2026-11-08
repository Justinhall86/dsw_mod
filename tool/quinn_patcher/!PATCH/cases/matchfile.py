#!/usr/bin/env python3
"""What proves `testrun/matchfile.py`. Nothing here goes into the game."""
from tools.project import gv, guard


def check(bc, kit, regs, ops, result):
    """The body's shape, and that the hook still answers the same kind; `result` is handed in."""
    guard([o.op for o in ops] == ["GetGlobal", "Null", "Call2", "JNull", "Call1", "Call1",
                                  "ToVirtual", "Ret", "Null", "Ret"],
          "the body came out as %s" % [o.op for o in ops])
    # the three calls go where they are meant to, in order
    guard(gv(ops[2].df["fun"]) == gv(kit["ask"].findex), "the switch is asked of the wrong place")
    guard(gv(ops[4].df["fun"]) == gv(kit["read"].findex), "the file is read by the wrong place")
    guard(gv(ops[5].df["fun"]) == gv(kit["parse"].findex), "the contents go to the wrong place")
    # with no switch, control skips every one of them and lands on the empty answer
    lands = 3 + 1 + gv(ops[3].df["offset"])
    guard(lands == 8 and ops[lands].op == "Null",
          "with no switch, control lands on %s rather than the empty answer" % ops[lands].op)
    # and the hook still hands back the same kind of thing it always did
    guard(gv(list(kit["stub"].regs)[result]) == kit["config"],
          "the hook's answer changed kind")
    return len(ops)
