#!/usr/bin/env python3
"""What proves `framework/idwalk.py`. Nothing here goes into the game."""
from copy import deepcopy

from tools.project import gv, guard
from tools.hlcode import assemble, calls, lands_at, template, written
from framework.idwalk import JOIN, WANTED, emit_walk, registers
from framework.rowreader import reader_for

# what the cases put in the body, so one instruction says where the body was written
BODY_OP = "Mov"
# ids worth walking: the plain one, and every shape of join that is easy to get wrong
IDS = ("Faction_OnSiegeAction_GainTRes", "Faction", "", "_", "__",
       "A_", "_A", "A__B", "Faction_OnSiegeAction_GainTRes3")


def what_the_walk_would_read(text):
    """The SAME arithmetic as the walk's block, in the open; ⚠ checked against a plain split."""
    pieces, at = [], 0
    while True:
        tail = text[at:]                    # substr(id, at); then indexOf(tail, join) from there
        nxt = tail.find(JOIN)
        pieces.append(tail if nxt < 0 else tail[:nxt])
        if nxt < 0:
            return pieces
        at = at + nxt + 1                   # just past the join, so at least one further on


def a_function_with_an_id(bc, reader):
    """A copy of a real function, with one register holding the id the walk reads."""
    real = [f for f in bc.functions if getattr(f, "nregs", None) is not None and f.ops]
    fn = deepcopy(min(real, key=lambda f: len(f.ops)))
    return fn, reader.borrow_register(bc, fn, "text_kind")


def check(bc):
    """The cases: the pieces it would read, the shape it writes, and one walk inside another."""
    _the_pieces_it_reads()
    ops = _the_shape_it_writes(bc)
    _one_walk_inside_another(bc)
    return len(ops)


def _the_pieces_it_reads():
    """THE ARITHMETIC: what the walk would hand over is what splitting on the join gives."""
    for text in IDS:
        guard(what_the_walk_would_read(text) == text.split(JOIN),
              "walking `%s` reads %r and splitting it gives %r"
              % (text, what_the_walk_would_read(text), text.split(JOIN)))
    # and it always moves on: every round starts further into the id than the one before it
    seen, at = [], 0
    for piece in what_the_walk_would_read("A__B_C"):
        guard(at not in seen, "the walk read from %d twice, so it would never end" % at)
        seen.append(at)
        at += len(piece) + 1
    guard(len(seen) == 4, "`A__B_C` was read as %d piece(s)" % len(seen))


def _the_shape_it_writes(bc):
    """THE INSTRUCTIONS: what it borrows, where it goes round, and where every jump lands."""
    reader = reader_for(bc)
    fn, id_reg = a_function_with_an_id(bc, reader)
    before = len(fn.regs)
    regs = registers(bc, fn, reader)
    guard(len(fn.regs) == before + len(WANTED), "the walk took %d register(s), not %d"
          % (len(fn.regs) - before, len(WANTED)))
    guard(gv(fn.nregs) == len(fn.regs), "the function does not declare what it now holds")

    body = [written(template(bc, BODY_OP), dst=regs["piece"], src=regs["piece"])]
    ops = assemble(emit_walk(bc, fn=fn, id_reg=id_reg, regs=regs, reader=reader, body=body))

    # the body is written ONCE, inside the loop, told from the walk's own `Mov` by both places
    mine = [i for i, op in enumerate(ops) if op.op == BODY_OP
            and gv(op.df["dst"]) == regs["piece"] and gv(op.df["src"]) == regs["piece"]]
    guard(len(mine) == 1, "the body was written %d time(s)" % len(mine))

    # the tail is taken from the id, then the join is looked for INSIDE that tail
    taking = [i for i, op in enumerate(ops) if calls(op, reader.tailing)]
    looking = [i for i, op in enumerate(ops) if calls(op, reader.finding)]
    guard(len(taking) == 2 and len(looking) == 1,
          "the walk takes %d time(s) and looks %d" % (len(taking), len(looking)))
    guard(gv(ops[taking[0]].df["arg0"]) == id_reg and gv(ops[taking[0]].df["arg1"]) == regs["at"],
          "the tail is not taken from the id at where the piece starts")
    guard(gv(ops[looking[0]].df["arg0"]) == regs["tail"],
          "the join is looked for in something other than the tail")
    # THE FIX: the search is never asked to start part way through, which would be a hang
    guard(gv(ops[looking[0]].df["arg2"]) == regs["nothing"],
          "the search is handed a place to start from, and that is the one thing it cannot be")

    # it goes round exactly once, back to before the tail is taken
    backwards = [i for i, op in enumerate(ops)
                 if op.op.startswith("J") and lands_at(op, i) < i]
    guard(len(backwards) == 1, "%d instruction(s) send the walk round again" % len(backwards))
    guard(lands_at(ops[backwards[0]], backwards[0]) <= taking[0],
          "the walk goes round to after the tail is taken, so it would read the same one again")
    # and where it starts from moves on before it does
    moves = [i for i in range(backwards[0]) if ops[i].op == "Add"
             and gv(ops[i].df["dst"]) == regs["at"]]
    guard(moves, "nothing moves where the next piece starts, so the walk would not end")

    for i, op in enumerate(ops):
        if "offset" in op.df:
            guard(0 <= lands_at(op, i) <= len(ops),
                  "a jump at %d lands at %d, outside a block %d long"
                  % (i, lands_at(op, i), len(ops)))

    # a walk handed something that is not text is refused before it can read it
    try:
        emit_walk(bc, fn=fn, id_reg=regs["at"], regs=regs, reader=reader)
    except RuntimeError as no:
        guard("not the text an id is" in str(no), "the wrong refusal: %s" % no)
    else:
        guard(False, "the walk was handed a number and read it as an id")
    return ops


def _one_walk_inside_another(bc):
    """ITS PLACES ARE ITS OWN: a walk goes inside a walk, which is what the classifier needs."""
    reader = reader_for(bc)
    fn, id_reg = a_function_with_an_id(bc, reader)
    outer, inner = registers(bc, fn, reader), registers(bc, fn, reader)
    within = emit_walk(bc, fn=fn, id_reg=outer["piece"], regs=inner, reader=reader,
                       places="the piece")
    ops = assemble(emit_walk(bc, fn=fn, id_reg=id_reg, regs=outer, reader=reader,
                             body=within, places="the id"))
    guard(len(ops) > 2 * len(WANTED), "one walk inside another came to %d instructions" % len(ops))
    for i, op in enumerate(ops):
        if "offset" in op.df:
            guard(0 <= lands_at(op, i) <= len(ops),
                  "a jump at %d lands at %d once one walk is inside another" % (i, lands_at(op, i)))
    # and two walks whose places are called the same thing are refused rather than crossed
    try:
        assemble(emit_walk(bc, fn=fn, id_reg=id_reg, regs=outer, reader=reader,
                           body=emit_walk(bc, fn=fn, id_reg=outer["piece"], regs=inner,
                                          reader=reader)))
    except RuntimeError as no:
        guard("named twice" in str(no), "the wrong refusal: %s" % no)
    else:
        guard(False, "two walks shared their places and nothing refused it")
