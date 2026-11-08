#!/usr/bin/env python3
"""What proves `framework/acts/gain_res.py`. Nothing here goes into the game."""
from tools.project import gv, guard
from tools.hlcode import function_named
from framework import tray
from tools.hlcode import (argument_kind, argument_kinds, calls, function_named, kind_named,
                          lands_at)
from framework.acts.gain_res import GAIN, PAYS, READS, emit_act
from framework.scopematch import PAYEE
from framework.pipeline import Pipeline, Stage


def check(bc):
    """The cases: one call, the amount turned round when the row does not add, nothing else."""
    from cases.pipeline import a_function_and_a_row

    fn, row = a_function_and_a_row(bc)
    for part in READS:
        guard(part in row, "the act reads `%s` and the cases hand it %s" % (part, sorted(row)))
    # THE ROW'S VALUE AND ITS PAYEE are handed of the right sort, as a splice does; payee != holder
    row = dict(row, value=borrow(bc, fn, argument_kind(bc, GAIN, 1)),
               **{PAYEE: borrow(bc, fn, kind_named(bc, PAYS))})
    _the_value_has_to_be_a_number(bc, fn, row)
    _the_payee_has_to_be_a_faction(bc, fn, row)
    road = Pipeline("the act on its own", (
        Stage("add-resource", "ACT", body=emit_act, reads=READS),))
    ops = road.emit(bc, fn, row)

    _one_call_and_nothing_else(bc, ops, row)
    _turned_round_only_when_it_takes_away(bc, ops, row)
    _a_second_act_is_one_more_line(bc, fn, row)
    return len(ops)


def _a_second_act_is_one_more_line(bc, fn, row):
    """ITS PLACES ARE ITS OWN: two acts on one road, which is what the catalogue is."""
    road = Pipeline("two acts on one road", (
        Stage("add-resource", "ACT", body=emit_act, reads=READS),
        Stage("add-resource once more", "ACT", body=emit_act, reads=READS)))
    ops = road.emit(bc, fn, row)
    calls_out = [op for op in ops if calls(op, function_named(bc, GAIN))]
    guard(len(calls_out) == 2, "two acts came to %d call(s)" % len(calls_out))
    for i, op in enumerate(ops):
        if "offset" in op.df:
            guard(0 <= lands_at(op, i) <= len(ops),
                  "a jump at %d lands at %d once there are two acts" % (i, lands_at(op, i)))


def borrow(bc, fn, kind):
    """One more place on `fn`, of a kind the game itself declares somewhere."""
    from copy import deepcopy
    from tools.hlcode import register_like
    fn.regs.append(deepcopy(register_like(bc, kind)))
    fn.nregs.value = len(fn.regs)
    return len(fn.regs) - 1


def _the_value_has_to_be_a_number(bc, fn, row):
    """A row whose value is not the kind the game counts in is refused, not quietly moved."""
    wrong = dict(row, value=row["holder"])
    try:
        Pipeline("a value of the wrong sort", (
            Stage("add-resource", "ACT", body=emit_act, reads=READS),)).emit(bc, fn, wrong)
    except RuntimeError as no:
        guard("counts in" in str(no), "the wrong refusal: %s" % no)
    else:
        guard(False, "the row's value was moved into the game's own amount unasked")


def _the_payee_has_to_be_a_faction(bc, fn, row):
    """A row whose payee is not a faction is refused, which a signature diff cannot catch."""
    wrong = dict(row, **{PAYEE: row["holder"]})
    try:
        Pipeline("a payee of the wrong sort", (
            Stage("add-resource", "ACT", body=emit_act, reads=READS),)).emit(bc, fn, wrong)
    except RuntimeError as no:
        guard("pays a" in str(no), "the wrong refusal: %s" % no)
    else:
        guard(False, "a payee that is not a faction was handed to the payment")


def _one_call_and_nothing_else(bc, ops, row):
    """THE BEHAVIOUR: the game's own way of changing what a faction has, called once."""
    gain = function_named(bc, GAIN)
    calling = [i for i, op in enumerate(ops) if calls(op, gain)]
    guard(len(calling) == 1, "the act calls it %d time(s)" % len(calling))
    handed = [gv(a) for a in ops[calling[0]].df["args"].value]
    guard(len(handed) == 1 + len(argument_kinds(bc, GAIN)),
          "it is handed %d thing(s) and it takes the faction and %d more"
          % (len(handed), len(argument_kinds(bc, GAIN))))
    # THE PAYEE, NOT THE HOLDER: the act's own place, copied from the row's payee before the call
    copied = [i for i, op in enumerate(ops)
              if op.op == "Mov" and gv(op.df["dst"]) == handed[0]
              and gv(op.df["src"]) == row[PAYEE]]
    guard(copied and copied[0] < calling[0],
          "the faction it pays is never copied from the row's payee before the payment")
    guard(handed[0] != row["holder"], "the payment still goes to whatever held the row")
    guard(handed[1] == row["columns.named"],
          "the resource's name is not the ONE column the effect's own number picked")
    guard(handed[2] not in (row["holder"], row["columns.named"], row["value"]),
          "the amount handed over is one of the row's own places, unturned")
    # each of the two it may answer in has its OWN place, and each is handed nothing
    guard(handed[3] != handed[4], "the two it may answer in share one place")
    for answer in handed[3:]:
        emptied = [i for i, op in enumerate(ops)
                   if op.op == "Null" and gv(op.df["dst"]) == answer]
        guard(emptied and emptied[0] < calling[0],
              "what it may answer in is handed something, or handed nothing too late")
    _it_pays_once_and_says_so(bc, ops, calling[0])


def _it_pays_once_and_says_so(bc, ops, paying):
    """The payment, then saying what was paid -- AFTER it, so no number shows an unpaid payment."""
    others = [i for i, op in enumerate(ops) if op.op.startswith("Call") and i != paying]
    guard(others, "the act pays and never says what it paid")
    from framework.sayonce import COMPLAIN
    # THE GAME'S OWN *IS IT THIS KIND*, the narrowing for a rider's payee; a cast raises
    from framework.ofthekind import IS_REALLY
    choosing = gv(function_named(bc, IS_REALLY).findex)
    # AND EACH NARROWED COUNT'S OWN LIST, asked before the payment to size the amount
    from framework import membercount, narrowcount
    sizing = {gv(function_named(bc, narrowcount.lists_named(word)).findex)
              for word in narrowcount.narrowers_of()} | {
        gv(function_named(bc, name).findex) for name in membercount.asked()}
    from standalone import onoff
    for which in others:
        # only choosing WHOM to pay, sizing the amount, and the asking words, may come first
        early = {choosing} | sizing
        if onoff.on("respath"):
            early.add(gv(function_named(bc, COMPLAIN).findex))
        guard(which > paying or gv(ops[which].df["fun"]) in early,
              "the act says what it paid BEFORE paying, so a refused payment would still show")


def _turned_round_only_when_it_takes_away(bc, ops, row):
    """WHICH WAY ROUND IS READ: the amount is negated, and only when the row does not add."""
    turning = [i for i, op in enumerate(ops) if op.op == "Neg"]
    guard(len(turning) == 1, "the amount is turned round %d time(s)" % len(turning))
    over = [i for i, op in enumerate(ops)
            if op.op == "JNotEq" and lands_at(op, i) > turning[0]]
    # TWO: did the row name THIS act, and which way round; whom it pays is settled around the act
    guard(len(over) == 2, "%d test(s) step over the turning" % len(over))
    # told apart by what they READ, never by which comes first
    picks = [i for i in over if gv(ops[i].df["a"]) == row["effect.adds"]]
    guard(len(picks) == 1, "%d test(s) read the row's own which-way-round" % len(picks))
    whichever = picks[0]
    guard([i for i in over if i != whichever
           and gv(ops[i].df["a"]) == row["effect.does"]],
          "the other test does not read which act the row named")
    # a row that ADDS steps over it; one that does not falls into it
    guard(whichever < turning[0], "the test comes after the turning it is meant to step over")
    guard(lands_at(ops[whichever], whichever) == turning[0] + 1,
          "stepping over the turning lands at %d and the turning is at %d"
          % (lands_at(ops[whichever], whichever), turning[0]))
    # the amount that is turned round is the one handed over
    call = next(i for i, op in enumerate(ops) if calls(op, function_named(bc, GAIN)))
    guard(gv(ops[turning[0]].df["dst"]) == gv(ops[call].df["args"].value[2]),
          "one place is turned round and another is handed over")
    for i, op in enumerate(ops):
        if "offset" in op.df:
            guard(0 <= lands_at(op, i) <= len(ops),
                  "a jump at %d lands at %d, outside a block %d long"
                  % (i, lands_at(op, i), len(ops)))
