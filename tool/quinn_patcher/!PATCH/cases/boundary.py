#!/usr/bin/env python3
"""What proves `framework/boundary.py`. Nothing here goes into the game."""
import os
import re

from tools.project import gv, guard
from framework.boundary import CONSTANTS, LOOKUP, emit_gate, id_lookup, minted, open_the_road


def check(bc):
    """The cases. They mint nothing and change nothing: the work happens on a copy."""
    from cases.pipeline import a_function_and_a_row
    from framework.pipeline import Pipeline, Stage
    from tools.hlcode import argument_kind, lands_at, returns_type

    lookup = id_lookup(bc)
    guard(minted(bc) is not None, "the cases run after the sentinel is minted, never before")
    globals_before = len(bc.global_types)

    fn, row = a_function_and_a_row(bc)
    # UNDER A REAL SCOPE'S NAME: a name of this case's own would mint text, a change it refuses
    from framework.scopematch import first_scope
    road = Pipeline("the boundary on its own", (
        Stage("is this row ours", "GATE", reads=("source.row",),
              opening=open_the_road, body=emit_gate),), road=first_scope())
    # the body may not be written before the opening it reads back from
    try:
        road.emit(bc, fn, row)
    except RuntimeError as no:
        guard("has not been written yet" in str(no), "the wrong refusal: %s" % no)
    else:
        guard(False, "the gate was written before the opening it reads")

    once = road.opening(bc, fn)
    ops = road.emit(bc, fn, row)

    # ONCE, before any row: load the minted sentinel and ask the game where it sits
    guard([o.op for o in once] == ["GetGlobal", "Call1"],
          "the opening wrote %s" % [o.op for o in once])
    guard(gv(once[0].df["global"]) == minted(bc), "the lookup is handed the wrong text")
    guard(gv(once[1].df["fun"]) == gv(lookup.findex), "the opening calls somewhere else")
    # neither register is chosen: one is what the lookup TAKES, the other what it HANDS BACK
    text, kept = gv(once[0].df["dst"]), gv(once[1].df["dst"])
    guard(gv(list(fn.regs)[text]) == argument_kind(bc, LOOKUP),
          "the lookup is handed a t@%s and it takes a t@%s"
          % (gv(list(fn.regs)[text]), argument_kind(bc, LOOKUP)))
    guard(gv(list(fn.regs)[kept]) == returns_type(lookup, LOOKUP),
          "what the opening keeps is a t@%s and the lookup hands back a t@%s"
          % (gv(list(fn.regs)[kept]), returns_type(lookup, LOOKUP)))

    # ⛔ PER ROW: one comparison and nothing else -- no lookup, and no word said
    guard([o.op for o in ops] == ["JSGte"],
          "the gate wrote %s" % [o.op for o in ops])
    guard(not [o.op for o in once + ops if o.op in CONSTANTS],
          "the boundary loads a value written into the code")
    # and the comparison is the last of them, which is the only instruction that decides anything
    asks = ops[-1]
    guard(gv(asks.df["a"]) == kept, "the gate compares against something other than the kept row")
    guard(gv(asks.df["b"]) == row["source.row"],
          "the gate reads register %s and the row's id is %s"
          % (gv(asks.df["b"]), row["source.row"]))
    guard(gv(asks.df["a"]) != gv(asks.df["b"]), "the gate compares a row against itself")
    guard(lands_at(asks, len(ops) - 1) >= len(ops),
          "the gate's refusal lands inside its own block")

    # this file may not write a row-sized number down anywhere, which is the old defect
    here = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    for what in ("boundary.py", "columns.py"):
        source = open(os.path.join(here, "FEATURES", "attribute_framework", "framework", what),
                      encoding="utf-8").read()
        written_down = re.findall("[0-9]{4,}", source)
        guard(not written_down, "%s writes a row-sized number: %s" % (what, written_down))
    # and the cases themselves left the game file exactly as they found it
    guard(len(bc.global_types) == globals_before, "the cases changed the game file")
    return len(once) + len(ops)
