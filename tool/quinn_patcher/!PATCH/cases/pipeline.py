#!/usr/bin/env python3
"""What proves `framework/pipeline.py`, emitting its own stages onto a copy; nothing is spliced."""
from copy import deepcopy

from tools.project import gv, guard
from tools.hlcode import kind_named, lands_at, register_like, template, written
from framework.record import FIELDS
from framework.pipeline import (EFFECT, EXIT, OWED, KINDS, NAME, Pipeline, Place, READABLE,
                            SCOPE_IS, Stage, roads)

# what each of the cases' stages writes, so one op names one kind of stage in the road below
GATE_OP, ACT_OP, MARK_OP = "JNull", "Label", "Mov"
# a kind that really is in the file, for the cases' own note to be of -- named, never numbered
from framework.loadguard import READY_ENTITY as A_KIND


def a_function_and_a_row(bc):
    """A copy of a real function, with one register for each part of the row a stage may read."""
    real = [f for f in bc.functions if getattr(f, "nregs", None) is not None and f.ops]
    fn = deepcopy(min(real, key=lambda f: len(f.ops)))
    kind = gv(list(fn.regs)[0])
    row = {}
    # every part of the row a stage may read, less the effect's, which has no register yet
    for part in (piece for piece in READABLE if piece != EFFECT):
        fn.regs.append(deepcopy(register_like(bc, kind)))
        fn.nregs.value = len(fn.regs)
        row[part] = len(fn.regs) - 1
    return fn, row


def turns_it_away(place):
    """A gate: when the part it declared is empty, jump to the road's one exit."""
    return [(place.op(GATE_OP, reg=place.row["holder"]), place.refused)]


def does_the_thing(place):
    """An act: one instruction that stands for the effect."""
    return [place.op(ACT_OP)]


def leaves_the_holder(place):
    """A resolve: put its answer in the register the road made for its note."""
    return [place.op(MARK_OP, dst=place.note, src=place.row["holder"])]


def marks_it_spent(place):
    """The other end of the mark's latch, which the road writes after the last act."""
    return [place.op(MARK_OP, dst=place.scratch_like(place.row["reader"]),
                     src=place.row["reader"])]


def watching(seen, who, writes=does_the_thing):
    """A stage body that records what it was handed before writing what it was going to."""
    def body(place):
        seen[who] = place
        return writes(place)
    return body


def refusal(what):
    """The sentence something was refused with, or nothing at all when it was not refused."""
    try:
        what()
    except RuntimeError as no:
        return str(no)
    return None


def refused(what, why, saying=None):
    """Something that must be refused, with the words the refusal has to contain."""
    said = refusal(what)
    guard(said is not None, why)
    guard(saying is None or saying in said, "%s -- it said: %s" % (why, said))
    return said


def check(bc):
    """The cases: the four rules, the three kinds, and the shape of what a stage is handed."""
    _the_bake_refuses()
    _the_declaration_refuses()
    ops = _a_refusal_ends_the_road(bc)
    _the_seam_is_past_every_gate(bc)
    _a_note_is_a_register(bc)
    _a_stage_gets_what_it_declared(bc)
    _the_spine_writes_itself(bc)
    return len(ops)


def _the_bake_refuses():
    """RULES 2 AND 4, both at bake time, before anything is written at all."""
    refused(lambda: Pipeline("nobody leaves it", (
        Stage("a gate", "GATE", body=turns_it_away, needs=("the stamp",)),)),
        "a stage needing a note nobody leaves was baked", saying="no stage before it leaves one")
    refused(lambda: Pipeline("left too late", (
        Stage("a gate", "GATE", body=turns_it_away, needs=("the stamp",)),
        Stage("the stamp", "RESOLVE", body=leaves_the_holder, holds=A_KIND))),
        "a note left by a LATER stage was accepted", saying="it runs later")
    refused(lambda: Pipeline("the wrong kind", (
        Stage("the stamp", "ACT", body=does_the_thing),
        Stage("a gate", "GATE", body=turns_it_away, needs=("the stamp",)))),
        "a note was taken from a stage that leaves none", saying="only a RESOLVE leaves one")
    refused(lambda: Pipeline("two writers", (
        Stage("first", "GATE", body=turns_it_away, store=OWED),
        Stage("second", "GATE", body=turns_it_away, store=OWED))),
        "two stages wrote one store", saying="a store has one writer")
    refused(lambda: Pipeline("two of a name", (
        Stage("a gate", "GATE", body=turns_it_away),
        Stage("a gate", "ACT", body=does_the_thing))),
        "one road had two stages of one name")


def _the_declaration_refuses():
    """What a stage may not say about itself, each refused as it is written."""
    guard(len(KINDS) == 3, "there are %d kinds" % len(KINDS))
    refused(lambda: Stage("a gate", "SOMETHING", body=turns_it_away), "an unknown kind was taken")
    refused(lambda: Stage("a gate", "GATE"), "a stage with no body and nothing to wait on")
    refused(lambda: Stage("a gate", "GATE", body=turns_it_away, owed="S9"),
            "a stage was both written and owed")
    refused(lambda: Stage("the stamp", "RESOLVE", body=leaves_the_holder, holds=A_KIND,
                          needs=("the stamp",)), "a stage needed its own note")
    refused(lambda: Stage("a gate", "GATE", body=turns_it_away, reads=("the whole cdb",)),
            "a stage read a part of the row that does not exist", saying="a row has")
    refused(lambda: Stage("a gate", "GATE", body=turns_it_away, holds=A_KIND),
            "a gate said what kind of note it leaves")
    refused(lambda: Stage("the stamp", "RESOLVE", body=leaves_the_holder),
            "a resolve did not say what kind its note is")
    # a kind written as a NUMBER is one loader's answer, and two loaders ship
    refused(lambda: Stage("the stamp", "RESOLVE", body=leaves_the_holder, holds=2104),
            "a note's kind was written down as a number", saying="a kind is named")
    refused(lambda: Stage("an act", "ACT", body=does_the_thing, mark=marks_it_spent),
            "a stage marked a store it does not own", saying="does not own")
    # a stage may read every field of the record, whole or a piece at a time, and the effect's row
    for field in FIELDS:
        if field == "notes":
            guard(not [p for p in READABLE if p.split(".")[0] == field],
                  "a stage may read the notes as though they were part of the row")
            continue
        guard([p for p in READABLE if p.split(".")[0] == field],
              "`%s` is a field of the record and no stage may read it" % field)
    # ANYTHING MADE OF NAMED PARTS IS READ A PART AT A TIME, and never whole
    for whole in ("source", "columns", NAME, EFFECT):
        guard(whole not in READABLE and any(p.startswith(whole + ".") for p in READABLE),
              "`%s` is read whole, and it is made of parts: %s" % (whole, (READABLE,)))
    # `source` is two things, so it is read a piece at a time and never whole
    guard("source" not in READABLE and "source.row" in READABLE and
          "source.place" in READABLE, "the row's source is %s" % (READABLE,))


def _a_refusal_ends_the_road(bc):
    """RULE 1 AND THE MARK: every refusal jumps past everything, marks included."""
    fn, row = a_function_and_a_row(bc)
    seen = {}
    road = Pipeline("the mark, a later gate, then the act", (
        Stage("has this row's trigger happened", "GATE", body=turns_it_away,
              reads=("holder", "reader"),
              store=OWED, mark=watching(seen, "the mark", marks_it_spent)),
        Stage("a gate somebody adds later", "GATE", body=turns_it_away, reads=("holder",)),
        Stage("gain the resource", "ACT", body=does_the_thing)))
    ops = road.emit(bc, fn, row)

    # A MARK ONLY RECORDS: it runs after the act, so it may not turn the row away there
    guard(seen["the mark"].refused is None,
          "the mark of a gate was handed %r, so it could refuse after the effect had run"
          % seen["the mark"].refused)
    guard(seen["the mark"].note is None, "the mark was given a register to leave a note in")
    guard(seen["the mark"].store == OWED, "the mark was handed %r" % seen["the mark"].store)

    gates = [i for i, op in enumerate(ops) if op.op == GATE_OP]
    acts = [i for i, op in enumerate(ops) if op.op == ACT_OP]
    marks = [i for i, op in enumerate(ops) if op.op == MARK_OP]
    guard(len(gates) == 2 and len(acts) == 1 and len(marks) == 1,
          "the road wrote %d gate(s), %d act(s) and %d mark(s)" % (
              len(gates), len(acts), len(marks)))
    # THE FIX: the latch is set after the effect, so a later refusal spends no application
    guard(marks[0] > acts[0],
          "the mark is written at %d and the act at %d, so an application is spent before the "
          "effect runs" % (marks[0], acts[0]))
    for at in gates:
        guard(lands_at(ops[at], at) >= len(ops),
              "the gate at %d lands at %d, inside a road %d long -- a refusal must leave it"
              % (at, lands_at(ops[at], at), len(ops)))
    guard(EXIT == "REFUSED", "the road's exit is called %r" % EXIT)
    return ops


def _the_seam_is_past_every_gate(bc):
    """The caller's work lands past the last gate and the last act; a refusal jumps over both."""
    fn, row = a_function_and_a_row(bc)
    at_the_seam, on_the_way_out = row["holder"], row["source.row"]

    def mine(where):
        return [written(template(bc, "Incr"), dst=where)]

    road = Pipeline("a gate, an act, and the caller's own work", (
        Stage("a gate", "GATE", body=turns_it_away, reads=("holder",)),
        Stage("an act", "ACT", body=does_the_thing)))
    ops = road.emit(bc, fn, row, once_past_the_gates=mine(at_the_seam),
                    before_leaving=mine(on_the_way_out))
    mark_at = {op.df["dst"].value: i for i, op in enumerate(ops) if op.op == "Incr"}
    gate = [i for i, op in enumerate(ops) if op.op == GATE_OP][0]
    act = [i for i, op in enumerate(ops) if op.op == ACT_OP][0]
    guard(sorted(mark_at) == sorted((at_the_seam, on_the_way_out)),
          "the road wrote %d of the caller's own instructions" % len(mark_at))
    guard(gate < mark_at[at_the_seam] < act,
          "the gate is at %d, the seam at %d and the act at %d -- the caller's work is meant to "
          "sit between the last gate and the first act"
          % (gate, mark_at[at_the_seam], act))
    guard(act < mark_at[on_the_way_out],
          "the act is at %d and the way out at %d" % (act, mark_at[on_the_way_out]))
    # AND THE REFUSAL JUMPS OVER BOTH -- which is the property, not the order
    guard(lands_at(ops[gate], gate) > mark_at[on_the_way_out],
          "the gate lands at %d and the caller's last instruction is at %d, so a refused row "
          "would run it" % (lands_at(ops[gate], gate), mark_at[on_the_way_out]))
    # a road with no acts at all still has a seam: past its gates is past all of it
    guard(Pipeline("gates only", (
        Stage("a gate", "GATE", body=turns_it_away, reads=("holder",)),)).past_the_gates() == 1,
        "a road of one gate says its seam is somewhere other than past that gate")
    # ⛔ AND A GATE AFTER AN ACT HAS NO SEAM AT ALL: the row acted, then was turned away
    refused(lambda: Pipeline("a gate after an act", (
        Stage("an act", "ACT", body=does_the_thing),
        Stage("a gate", "GATE", body=turns_it_away, reads=("holder",)))).emit(
            bc, *a_function_and_a_row(bc)),
        "a road that gates a row after it has acted was written", saying="past the gates")


def _a_note_is_a_register(bc):
    """A resolve is given a register for its note, and the stage that declared it gets that one."""
    fn, row = a_function_and_a_row(bc)
    before = len(fn.regs)
    seen = {}
    road = Pipeline("a note travels", (
        Stage("the stamp", "RESOLVE", body=leaves_the_holder, reads=("holder",),
              holds=A_KIND),
        Stage("asked for it", "GATE", body=watching(seen, "asked", turns_it_away),
              reads=("holder",), needs=("the stamp",)),
        Stage("did not ask", "ACT", body=watching(seen, "did not ask"))))
    ops = road.emit(bc, fn, row)
    guard(len(fn.regs) > before, "the road made no register for the note")
    left_in = ops[0].df["dst"].value
    guard(seen["asked"].notes["the stamp"] == left_in,
          "the resolve left its note in %d and the stage that declared it was handed %r"
          % (left_in, seen["asked"].notes))
    guard(seen["did not ask"].notes == {},
          "a stage that declared no note was handed %r" % seen["did not ask"].notes)
    # THE FIX: the register the road made is of the kind the stage NAMED, looked up in the file
    guard(gv(list(fn.regs)[left_in]) == kind_named(bc, A_KIND),
          "the note's register is of kind t@%s and `%s` is t@%s in this file"
          % (gv(list(fn.regs)[left_in]), A_KIND, kind_named(bc, A_KIND)))
    # and a kind this file does not have is refused where it is looked up, not written wrongly
    refused(lambda: Pipeline("a kind nobody has", (
        Stage("the stamp", "RESOLVE", body=leaves_the_holder, reads=("holder",),
              holds="ent.NoSuchThing"),)).emit(bc, *a_function_and_a_row(bc)),
        "a note claimed a kind the file does not have", saying="ent.NoSuchThing")


def _a_stage_gets_what_it_declared(bc):
    """RULE 3: what is on a Place, and what is not -- neither the game file nor the road."""
    fn, row = a_function_and_a_row(bc)
    seen = {}
    Pipeline("what a stage is handed", (
        Stage("a gate", "GATE", body=watching(seen, "gate", turns_it_away), reads=("holder",)),
        Stage("the owner", "ACT", body=watching(seen, "owner"), store=OWED),
        Stage("an act", "ACT", body=watching(seen, "act")))).emit(bc, fn, row)

    place = seen["gate"]
    guard(sorted(place.row) == ["holder"],
          "a stage that reads the holder was handed %s" % sorted(place.row))
    guard(place.refused == EXIT, "a gate was handed %r to jump to" % place.refused)
    guard(seen["act"].refused is None, "an act was handed somewhere to refuse to")
    guard(seen["owner"].store == OWED and seen["act"].store is None,
          "the store went to %r and %r" % (seen["owner"].store, seen["act"].store))
    guard(seen["act"].note is None, "a stage that leaves no note was given a register for one")
    # THE EFFECT'S ROW IS NOT THE RECORD'S but may be read; a part of nothing at all refuses
    refused(lambda: Pipeline("reads what nobody carries", (
        Stage("an act", "ACT", body=does_the_thing, reads=("effect.wibble",)),)),
        "a stage read a part of the effect's row that does not exist", saying="a row has")
    # nothing on a Place is the file or the road, so there is no route back to either
    guard(not hasattr(place, "_record"), "a Place still carries the row it came from")
    for slot in Place.__slots__:
        held = getattr(place, slot)
        guard(not hasattr(held, "functions"), "`%s` on a Place is the game file" % slot)
        guard(not isinstance(held, Pipeline), "`%s` on a Place is the road itself" % slot)
    try:
        place.invented = "state"
    except AttributeError:
        pass
    else:
        guard(False, "a stage added a field to the place it was handed")


def _lands_inside(ops, scope):
    """Every jump in a road lands inside it or on its own exit, and never past either."""
    guard(ops, "the `%s` road wrote nothing at all" % scope)
    for at, one in enumerate(ops):
        if "offset" in one.df:
            guard(0 <= lands_at(one, at) <= len(ops),
                  "a jump at %d of the `%s` road lands at %d of %d"
                  % (at, scope, lands_at(one, at), len(ops)))


def _written_here(bc, fn, row, road):
    """A road the build never wrote, written on the stand-in so it is checked all the same."""
    road.opening(bc, fn)
    return road.emit(bc, fn, row)


def _the_spine_writes_itself(bc):
    """Every scope's road bakes, and now writes itself: no stage of the spine is owed."""
    from cases.gain_res import borrow
    from framework.acts.gain_res import GAIN, PAYS
    from framework.rowreader import reader_for
    from framework.scopematch import PAYEE
    from tools.hlcode import argument_kind, kind_named
    from framework.effectdata import behaviours

    fn, row = a_function_and_a_row(bc)
    # three places a splice gives and the stand-in cannot: the amount, the scope's number, payee
    row = dict(row, value=borrow(bc, fn, argument_kind(bc, GAIN, 1)),
               **{SCOPE_IS: borrow(bc, fn, reader_for(bc).count_kind),
                  PAYEE: borrow(bc, fn, kind_named(bc, PAYS))})
    from framework.walk import WRITTEN_ON
    written = bc.__dict__.get(WRITTEN_ON, {})
    for scope, road in sorted(roads().items()):
        # five gates, the how-much step, and each ACT stepping over itself unless named
        guard(len(road.stages) == 6 + len(behaviours()),
              "the `%s` road has %d stages" % (scope, len(road.stages)))
        guard(len(road.stores) == 1, "the `%s` road has %d stores" % (scope, len(road.stores)))
        guard(not road.owed,
              "the `%s` road still owes %s" % (scope, [s.name for s in road.owed]))
        # the road as the build already wrote it into the game; written again only if it was not
        for ops in written.get(road.name) or [_written_here(bc, fn, row, road)]:
            _lands_inside(ops, scope)
    # and a road with a stage nobody has written yet still refuses to write itself
    said = refused(lambda: Pipeline("still owed", (
        Stage("a gate", "GATE", owed="something that has not landed yet"),)).emit(bc, fn, row),
        "an unfinished road wrote itself anyway", saying="waits on")
    guard("a gate" in said, "the refusal does not name the owed stage: %s" % said)
