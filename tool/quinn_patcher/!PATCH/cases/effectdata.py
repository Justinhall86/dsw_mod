#!/usr/bin/env python3
"""What proves `framework/effectdata.py`. Nothing here goes into the game."""
from tools.project import gv, guard
from tools.hlcode import assemble, lands_at, minted_text, number
from framework.effectdata import (ADDS, CARRIES, LUMP, STAMP_IS, behaviours, emit_forget,
                             emit_row, known_effects, registers)
from framework.effecttable import STAMPS, checked_row, held_rows, table
from framework.names import vocabulary
from framework.pieceword import emit_classify, spellings
from framework.pieceword import registers as piece_registers
from framework.rowreader import reader_for

# the shipped row's declarations, bent by the cases the way `cases/effecttable.py` bends them
GAIN = {"WORD": "GainRes", "PART": "resource", "BEHAVIOUR": "add-resource", "SIGN": "+",
        "REPEAT": "LUMP", "COST": "ordinary", "STAMP": "me"}
WHERE = "a case's own effect"


def check(bc):
    """The cases: what a row writes down, what it does not, and one branch per effect spelling."""
    reader = reader_for(bc)
    rows = table()
    fn, r = _a_function(bc, reader)
    ops = _what_a_row_writes(bc, r, rows)
    _nothing_it_writes_is_a_position(bc, r, rows)
    _the_places_are_forgotten_first(bc, r, rows)
    _one_branch_per_effect(bc, r, reader, rows, fn)
    return len(ops)


def _a_function(bc, reader):
    from cases.pieceword import a_function_with_a_piece
    fn, _ = a_function_with_a_piece(bc, reader)
    return fn, registers(bc, fn, reader)


def _what_a_row_writes(bc, r, rows):
    """THE SEVEN: written, which way round, flag, credit, which act, the number's source, part."""
    ops = emit_row(bc, r, rows["GainRes"])
    written_to = [gv(op.df["dst"]) for op in ops]
    guard(sorted(written_to) == sorted(r[name] for name, _, _ in CARRIES),
          "the row filled %s and there are %d places" % (written_to, len(CARRIES)))
    # the part is one of our words as minted text, because it NAMES what to read
    guard(gv(ops[-1].df["global"]) == minted_text(bc, "resource"),
          "the part is not `resource`")
    # and the credit is a number of ours, settled here rather than compared as text there
    guard(gv(ops[3].df["ptr"]) == number(bc, STAMP_IS["me"]), "the credit is not `me`")
    guard(gv(ops[0].df["ptr"]) == number(bc, 1), "a row does not say that it was written")

    # A SECOND NAME OVER THE SAME BEHAVIOUR DIFFERS IN ONE INSTRUCTION: the sign
    lose = checked_row(WHERE, dict(GAIN, WORD="LoseRes", SIGN="-"), "required")
    other = emit_row(bc, r, lose)
    differ = [i for i in range(len(ops)) if ops[i].op != other[i].op
              or ops[i].df.keys() != other[i].df.keys()
              or any(gv(ops[i].df[k]) != gv(other[i].df[k]) for k in ops[i].df)]
    guard(differ == [1], "taking away instead of adding changed %s, and only which way\n"
          "          round it goes may" % differ)

    # AND AN EFFECT THAT READS NO PART OF A TARGET WRITES NOTHING RATHER THAN A WRONG WORD
    reveal = checked_row(WHERE, dict(GAIN, WORD="RevealMap", PART=None, REPEAT="SUSTAINED"),
                         "never")
    nothing = emit_row(bc, r, reveal)
    guard(nothing[-1].op == "Null" and gv(nothing[-1].df["dst"]) == r["part"],
          "an effect that reads no target still wrote a part")
    guard(gv(nothing[2].df["ptr"]) != gv(ops[2].df["ptr"]),
          "a SUSTAINED effect and a LUMP one wrote the same flag")
    return ops


def _nothing_it_writes_is_a_position(bc, r, rows):
    """THE FIRST PRINCIPLE: a modder rewriting the cdb moves nothing that is written here."""
    guard(sorted(ADDS.values()) == [0, 1], "which way round is %s" % sorted(ADDS.values()))
    # the flag is only ever 0 or 1; `EITHER` writes 0, as the act reads the ROW's own trigger
    guard(set(LUMP.values()) == {0, 1}, "the flag is %s" % sorted(set(LUMP.values())))
    # every number a row writes is one of OURS: a flag, one of the credits, or an act's own
    ours = {number(bc, value)
            for value in [0, 1] + list(STAMP_IS.values()) + list(behaviours().values())
            + [held.number for held in held_rows()]}
    for row in rows.values():
        for op in emit_row(bc, r, row):
            guard(op.op != "Int" or gv(op.df["ptr"]) in ours,
                  "`%s` writes a number that is none of ours" % row.name)
    # THE CREDITS ARE WRITTEN OUT, each its own number, never taken from where a word sits
    guard(set(STAMP_IS) == set(STAMPS), "the credits are %s and the numbers name %s"
          % (list(STAMPS), sorted(STAMP_IS)))
    guard(len(set(STAMP_IS.values())) == len(STAMP_IS),
          "two credits share a number: %s" % STAMP_IS)
    guard([STAMP_IS[word] for word in STAMPS] != list(range(len(STAMPS))),
          "the credits are numbered by where they sit, which reordering them would move")


def _the_places_are_forgotten_first(bc, r, rows):
    """THE OTHER END OF THE LATCH: nothing is left over from the id before this one."""
    forget = emit_forget(bc, r)
    emptied = {gv(op.df["dst"]) for op in forget}
    guard(emptied == {r[name] for name, _, _ in CARRIES},
          "forgetting leaves %d of the %d places holding something"
          % (len(CARRIES) - len(emptied), len(CARRIES)))
    was = [op for op in forget if gv(op.df["dst"]) == r["known"]]
    guard(len(was) == 1 and gv(was[0].df["ptr"]) == number(bc, 0),
          "forgetting does not say that no row was written")
    # and a row that IS written says so, so the two ends cannot be confused
    wrote = emit_row(bc, r, rows["GainRes"])[0]
    guard(gv(wrote.df["dst"]) == r["known"] and gv(wrote.df["ptr"]) == number(bc, 1),
          "a row does not open by saying it was written")


def _one_branch_per_effect(bc, r, reader, rows, fn):
    """EVERY EFFECT SPELLING GETS ITS OWN BRANCH, and each one writes that effect's row."""
    words = vocabulary()
    every = spellings(words)
    known = known_effects(bc, r, every, rows)
    # a place of a kind nothing knows how to empty is refused, not left holding a row
    was = CARRIES[0]
    try:
        import framework.effectdata as under
        under.CARRIES = ((was[0], was[1], "Mov"),) + CARRIES[1:]
        emit_forget(bc, r)
    except RuntimeError as no:
        guard("emptying is" in str(no), "the wrong refusal: %s" % no)
    else:
        guard(False, "a place nothing knows how to empty was passed over")
    finally:
        under.CARRIES = CARRIES
    effects = [one for one in every if one.word.family == "effects"]
    guard(len(known) == len(effects),
          "%d branch(es) for %d effect spelling(s)" % (len(known), len(effects)))
    # taken from the vocabulary, so shipping a second effect does not break this
    guard({one.word.spelling for one, _ in known}
          == {w.spelling for w in words.values() if w.family == "effects"},
          "a branch was made for something other than the effects we ship")
    # the three spellings of one effect all write the SAME row, because a spelling is not an effect
    wrote = {}
    for one, block in known:
        wrote.setdefault(one.word.spelling, []).append([(op.op, sorted(op.df)) for op in block])
    guard(all(block == blocks[0] for blocks in wrote.values() for block in blocks),
          "two spellings of one effect wrote different rows")

    # and the branches go into the classifier, which is what makes the answer a branch at all
    piece = reader.borrow_register(bc, fn, "text_kind")
    regs = piece_registers(bc, fn, reader)
    ops = assemble(emit_classify(bc, fn=fn, piece_reg=piece, regs=regs, known=known,
                                 reader=reader))
    for i, op in enumerate(ops):
        if "offset" in op.df:
            guard(0 <= lands_at(op, i) <= len(ops),
                  "a jump at %d lands at %d once the rows are in the branches"
                  % (i, lands_at(op, i)))
    filled = [op for op in ops if op.op in ("Int", "GetGlobal", "Null")
              and gv(op.df["dst"]) in [r[name] for name, _, _ in CARRIES]]
    from framework.pieceword import grouped
    slots = sum(len(g.slots) for g in grouped(known, words))
    guard(len(filled) == len(CARRIES) * slots,
          "%d place(s) filled for %d branch(es) of %d" % (len(filled), slots, len(CARRIES)))
