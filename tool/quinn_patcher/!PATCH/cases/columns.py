#!/usr/bin/env python3
"""What proves `framework/columns.py`. Nothing here goes into the game."""
import os
import re
from copy import deepcopy

from tools.hlcode import assemble, calls
from tools.project import gv, guard
from framework.columns import CONSTANTS, REG_SLOTS, emit_walk
from framework.rowreader import reader_for


def mentions(op, reg):
    # the places this instruction names that register, jump distances never counted among them
    return [k for k in REG_SLOTS if k in op.df and gv(op.df[k]) == reg]


def written_into(ops, reg):
    # every instruction that fills that register
    return [o for o in ops if "dst" in o.df and gv(o.df["dst"]) == reg]


def _the_word_is_tested_before_it_is_used(ops, regs, reader):
    """The word is never used before it has been tested: a global is empty until init fills it."""
    uses = (gv(reader.finding.findex),)
    checked = 0
    for at, op in enumerate(ops):
        if not (op.op.startswith("Call") and gv(op.df.get("fun", -1)) in uses):
            continue
        tested = [i for i in range(at) if ops[i].op in ("JNull", "JNotNull")
                  and gv(ops[i].df["reg"]) == regs["word"]]
        filled = [i for i in range(at) if "dst" in ops[i].df
                  and gv(ops[i].df["dst"]) == regs["word"]]
        guard(tested and max(tested) > max(filled or [-1]),
              "the walk uses the word at %d (%s) without testing it after it was last filled, "
              "and a word that is not there takes the game down" % (at, op.op))
        checked += 1
    guard(checked == 1,
          "%d search(es) were weighed, and the walk searches exactly once per name" % checked)


def check(bc):
    """The cases. The walk is written onto a COPY of a real function, so nothing is touched."""
    reader = reader_for(bc)
    pool = bc.ints.value if hasattr(bc.ints, "value") else bc.ints
    globals_before, numbers_before = len(bc.global_types), len(pool)

    real = [f for f in bc.functions if getattr(f, "nregs", None) is not None and f.ops]
    guard(real, "no function in the file carries registers to copy")
    probe = deepcopy(min(real, key=lambda f: len(f.ops)))
    # the row a driver would already be holding, standing in for it here
    row_reg = reader.borrow_register(bc, probe, "row_kind")
    regs = reader.registers(bc, probe)
    ops = assemble(emit_walk(bc, fn=probe, row_reg=row_reg, regs=regs, reader=reader))
    _the_word_is_tested_before_it_is_used(ops, regs, reader)

    # a row that has been converted answers nothing, so the walk must refuse to be handed one
    wrong = reader.borrow_register(bc, probe, "text_kind")
    try:
        emit_walk(bc, fn=probe, row_reg=wrong, regs=regs, reader=reader)
    except RuntimeError:
        refused = True
    else:
        refused = False
    guard(refused, "the walk accepted something that is not the raw row")

    # the walk ends when it has been round as many times as the row said, and not before
    ends = [o for o in ops if o.op == "JSGte"]
    guard(len(ends) == 1, "the walk has %d end tests, expected 1" % len(ends))
    guard(gv(ends[0].df["a"]) == regs["index"] and gv(ends[0].df["b"]) == regs["howmany"],
          "the end test does not compare where we are against how many there are")
    # and how many there are is READ off the row's answer, never written into the code
    counting = written_into(ops, regs["howmany"])
    guard([o.op for o in counting] == ["Field"],
          "how many there are comes from %s" % [o.op for o in counting])
    guard(gv(counting[0].df["field"]) == reader.length_field,
          "that is not the field the answer keeps its own length in")
    # ⛔ THE WALK ADDS NOTHING TO THE ROW'S ANSWER: its one word is the search's, READ, not pushed
    given = [gv(o.df["global"]) for o in ops if o.op == "GetGlobal"]
    guard(set(given) == {reader.word},
          "the walk loads %d word(s) and there is one it may load" % len(set(given)))
    # the walk's only plain numbers are nothing and one, in four loads, no count among them
    loaded = [gv(o.df["ptr"]) for o in ops if o.op == "Int"]
    guard(set(loaded) <= {reader.zero, reader.one},
          "the walk loads a number that is neither nothing nor one")
    # and a column numbered below one is refused rather than filed under that number
    low = [o for o in ops if o.op == "JSLt"]
    guard(len(low) == 1 and gv(low[0].df["a"]) == regs["number"]
          and gv(low[0].df["b"]) == regs["lowest"],
          "nothing refuses a column numbered below one")
    # how long the word is comes off the word itself, so the word can be changed freely
    guard([o.op for o in written_into(ops, regs["wordlen"])] == ["Field"],
          "the word's length is written into the code")
    # every column is read off the row by the name the ROW gave us, one way only
    reads = [o for o in ops if calls(o, reader.reading)]
    guard(len(reads) == 1, "the walk reads a column %d ways, expected 1" % len(reads))
    guard(gv(reads[0].df["arg0"]) == row_reg and gv(reads[0].df["arg1"]) == regs["name"],
          "the column read does not use the row and the name the row gave")
    # it goes round exactly once, and the way back is a real jump backwards
    backs = [o for o in ops if o.op == "JAlways" and gv(o.df["offset"]) < 0]
    guard(len(backs) == 1, "the walk loops %d ways, expected 1" % len(backs))
    # none of them loads a value written into the code beyond those four numbers
    guard(not [o.op for o in ops if o.op in CONSTANTS and o.op != "Int"],
          "the walk loads a constant of another kind")

    # this file may not write a row-sized number down anywhere, which is the old defect
    source = open(os.path.join(os.path.dirname(os.path.dirname(
        os.path.abspath(__file__))), "FEATURES", "attribute_framework", "framework", "columns.py"),
        encoding="utf-8").read()
    written_down = re.findall("[0-9]{4,}", source)
    guard(not written_down,
          "the walk's own file writes a row-sized number: %s" % written_down)
    # and the cases left the game file exactly as they found it
    guard(len(bc.global_types) == globals_before, "the cases minted something")
    guard(len(pool) == numbers_before, "the cases added a number to the file")
    return len(ops)
