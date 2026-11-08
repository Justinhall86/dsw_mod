#!/usr/bin/env python3
"""What proves `framework/record.py`. Nothing here goes into the game."""
from copy import deepcopy

from tools.hlcode import assemble
from tools.project import gv, guard
from framework.record import FIELDS, Records
from framework.columns import emit_walk
from framework.names import vocabulary
from framework.rowreader import reader_for


def cdb_readers(ops, reader):
    """How many of the instructions we wrote go back to the cdb. The answer has to be one."""
    return [i for i, op in enumerate(ops)
            if op.op.startswith("Call") and "fun" in op.df
            and getattr(op.df["fun"], "value", op.df["fun"]) == getattr(reader.findex, "value",
                                                                       reader.findex)]


def check(bc):
    """The cases. Nothing here touches the game; the last one counts what the walk emits."""
    words, rowreader = vocabulary(), reader_for(bc)
    # the seven the plan names are all readable on a record
    made = Records()
    columns = {1: "Fremen", 2: "Harkonnen"}
    first = made.of("trait", "Faction_OnSiegeAction_GainTRes2", "TraitTest1",
                    columns, 50, "TraitTest1", words)
    guard(first is not None, "a good row was refused")
    for field in FIELDS:
        guard(hasattr(first, field), "the record has no `%s`" % field)
    guard(first.name.effect.column == 2, "the effect's column came through as %r"
          % first.name.effect)
    guard(first.column(2) == "Harkonnen", "column 2 came through as %r" % first.column(2))
    guard(first.column(3) is None, "a column the row does not carry answered something")

    # TWO ATTRIBUTES ON ONE TRAIT ARE TWO ROWS -- what the user's review of this file caught
    second = made.of("trait", "Faction_OnSiegeAction_GainTRes", "TraitTest1",
                     columns, 99, "TraitTest1", words)
    guard(second is not first, "two rows on one trait came back as one record")
    guard(second.value == 99 and second.name.text.endswith("GainTRes"),
          "the second row came back as %r worth %r" % (second.name.text, second.value))
    # the same row and the same reader, twice, is one record
    guard(made.of("trait", "Faction_OnSiegeAction_GainTRes2", "TraitTest1",
                  columns, 50, "TraitTest1", words) is first,
          "one row and one reader were built twice")
    # and a different reader is a different record, which is what a foreign rule is
    guard(made.of("trait", "Faction_OnSiegeAction_GainTRes2", "TraitTest1",
                  columns, 50, "SomeoneElse", words) is not first,
          "two readers shared one record")

    # A ROW WHOSE NAME DOES NOT PARSE GETS NO RECORD, and is remembered once
    guard(made.of("trait", "Faction_Wibble_GainTRes", "X", {}, 1, "X", words) is None,
          "a row whose name did not parse still got a record")
    guard(made.of("trait", "Faction_Wibble_GainTRes", "X", {}, 1, "X", words) is None,
          "the same unreadable row was refused a second time over")
    guard(len(made.complaints()) == 1,
          "%d complaints for one unreadable row" % len(made.complaints()))
    guard("Wibble" in made.complaints()[0][1], "the complaint does not name the piece")

    # a note has one writer, and NEITHER store can be written behind its back
    first.note("the scope gate", "the holder's own faction")
    guard(first.noted("the scope gate") == "the holder's own faction", "a note did not come back")
    guard(first.noted("a stage that never ran") is None, "a note nobody left answered something")
    for store, key in ((first.notes, "the scope gate"), (first.columns, 9)):
        try:
            store[key] = "straight past the rule"
        except TypeError:
            continue
        guard(False, "one of the record's own stores could be written from outside")
    try:
        first.note("the scope gate", "something else")
    except RuntimeError:
        pass
    else:
        guard(False, "one note took two writers")
    # a stage cannot invent a field to pass state through
    try:
        first.somewhere_else = "state"
    except AttributeError:
        pass
    else:
        guard(False, "a stage added a field to the record")

    # THE ONE THAT MATTERS: the cdb is read in exactly ONE of the instructions we write
    probe = _walk_ops(bc, rowreader)
    reads = cdb_readers(probe, rowreader.reading)
    guard(len(reads) == 1,
          "the instructions we write read the cdb in %d places, and the record exists so that "
          "there is one" % len(reads))
    return len(FIELDS)


def _walk_ops(bc, rowreader):
    # the walk, written onto a copy of a real function, purely to be counted
    real = [f for f in bc.functions if getattr(f, "nregs", None) is not None and f.ops]
    probe = deepcopy(min(real, key=lambda f: len(f.ops)))
    row = rowreader.borrow_register(bc, probe, "row_kind")
    regs = rowreader.registers(bc, probe)
    return assemble(emit_walk(bc, fn=probe, row_reg=row, regs=regs, reader=rowreader))
