#!/usr/bin/env python3
"""A game gate before its grant asks for any stack but a modder's, and the game's filter obliges."""
from tools.hlcode import (argument_kind, argument_kinds, assemble, field_by_name, function_named,
                          number, returns_type, slot_global, template, text_object, written)
from tools.project import gv, guard
from tools.splice import insert
from framework.traps import IN_PLAY
from framework import board, sayonce
from copy import deepcopy

from framework.acts.gain_ttrait_stacks import (GRANT, OUR_EVENT_BUCKET, OUR_OWN_BUCKET, ROADS_FROM,
                                           SOURCE_IS_AN_ATTRIBUTE)
from tools.hlcode import register_like

# ⛔ the engine's own, by name, HELD HERE: `framework/grantwatch.py` reads them from this file
HAS = "logic.TraitsManager.has"
MAKES = "logic.TraitsManager.apply"
# which argument of the grant is its attribute id, counted past the thing it is about
THE_ATB = 2
# the engine's own test of one stack against an ask, and where a stack keeps its source
FILTER = "logic.TraitsManager.applicationFilter"
STACK_SOURCE = "src"


def _a_place(bc, fn, kind):
    """One more place on `fn`, of a kind the game itself declares somewhere."""
    fn.regs.append(deepcopy(register_like(bc, kind)))
    fn.nregs.value = len(fn.regs)
    return len(fn.regs) - 1

NAME = "ownmark"
# the other changes, by NAME, this one cannot work without; "attributes" is the framework
RELIES_ON = ("attributes",)

# ⛔ NAMED BY ITS PLACE IN THE WALK, NOT BY A FINDEX, which renumbers as the build grows
SEEDED = "the mark the game's gates ask with, pass %s"
# ⚠ NEGATIVE, as every stamp of ours is: no stack the game makes can ever carry it
THE_GATES_ASK = -6100
# where the source sits in a CALL: the thing it is about goes first, then the trait, then this
THE_SOURCE = 2
# and the trait, which a gate and the grant it guards must share
THE_TRAIT = 1
# a GATE jumps over its grant on a yes; any other ask is a condition, and stays the game's own
OVER_ON_YES = "JTrue"
SAYS_NO, OVER_ON_NO = "Bool", "JFalse"
# said once a game where a gate asks past our stacks, behind this reading
READING = "gateown"
SAID = "SPINE a game gate asked for any stack but ours"
# raised in the filter, said at a gate pass's entry: a call inside a loop is one per row
FLAG = "a game gate has asked for any stack but ours"
SAYS_AT = "the gate's word, pass %d"
FILTERED = "the filter reads the gates' mark"


def _op(bc, name, **operands):
    return written(template(bc, name), **operands)


def _as_held(n):
    """A number as the file's pool holds it: unsigned, read back signed."""
    return n & 0xFFFFFFFF


def _built_from_a_number(bc, kind):
    """Which constructor of that kind the GAME builds from a single plain number, ⛔ read."""
    plain = argument_kind(bc, GRANT, THE_ATB)
    seen = {}
    for fn in bc.functions:
        regs = list(fn.regs or [])
        for o in (fn.ops or []):
            if o.op != "MakeEnum" or gv(o.df.get("dst", -1)) >= len(regs):
                continue
            if gv(regs[gv(o.df["dst"])]) != kind:
                continue
            args = list(o.df["args"].value) if "args" in o.df else []
            if len(args) != 1 or gv(args[0]) >= len(regs):
                continue
            if gv(regs[gv(args[0])]) == plain:
                seen[gv(o.df["construct"])] = seen.get(gv(o.df["construct"]), 0) + 1
    guard(seen, "nothing in the file builds that source from one plain number, so its shape "
                "cannot be copied")
    guard(len(seen) == 1,
          "the game builds that source from a number in %d different ways, and this copies one"
          % len(seen))
    guard(list(seen)[0] == SOURCE_IS_AN_ATTRIBUTE,
          "the game's numbered source is constructor %d and our grants stamp %d"
          % (list(seen)[0], SOURCE_IS_AN_ATTRIBUTE))
    return list(seen)[0]


def _args(o):
    """The places a call reads, the thing it is about first."""
    # ⚠ `CallN` holds a list of arguments; `Call1`..`Call4` hold one operand each
    if "args" in o.df:
        return [gv(a) for a in o.df["args"].value]
    return [gv(o.df[k]) for k in sorted(o.df) if k.startswith("arg")]


def _last_write(ops, before, place):
    """The nearest instruction above `before` that writes that place, or None."""
    for at in range(before - 1, -1, -1):
        if gv(ops[at].df.get("dst", -1)) == place:
            return at
    return None


def _gates(ops, asking, making):
    """Each ask whose yes jumps over a grant of the same trait."""
    for at, o in enumerate(ops[:-1]):
        after = ops[at + 1]
        if gv(o.df.get("fun", -1)) != asking or after.op != OVER_ON_YES:
            continue
        if gv(after.df["cond"]) != gv(o.df["dst"]) or gv(after.df["offset"]) <= 0:
            continue
        trait = _args(o)[THE_TRAIT]
        windows = [(at + 2, gv(after.df["offset"]))]
        landed = sum(windows[0])
        # `has || other` lands its yes on a written no, and that no jumps over the grant
        if (landed + 1 < len(ops) and ops[landed].op == SAYS_NO and not gv(ops[landed].df["value"])
                and ops[landed + 1].op == OVER_ON_NO
                and gv(ops[landed + 1].df["cond"]) == gv(ops[landed].df["dst"])
                and gv(ops[landed + 1].df["offset"]) > 0):
            windows.append((landed + 2, gv(ops[landed + 1].df["offset"])))
        if any(gv(ops[g].df.get("fun", -1)) == making and _args(ops[g])[THE_TRAIT] == trait
               for start, width in windows for g in range(start, start + width)):
            yield at


def _emptied(fn, asking, making):
    """Each gate's empty source, and how many gates already asked a source of their own."""
    ops = fn.ops or []
    found, left = set(), 0
    for ask in _gates(ops, asking, making):
        at = _last_write(ops, ask, _args(ops[ask])[THE_SOURCE])
        if at is None or ops[at].op != "Null":
            left += 1
            continue
        found.add(at)
    return found, left


def _say_if_raised(bc, fn):
    """At the pass's entry, outside every loop: the word, once a game, if the filter raised it."""
    said = board.said(bc, fn, READING, lambda: sayonce.emit(bc, fn, SAID, even_when_quiet=True))
    if not said:
        return []
    held = _a_place(bc, fn, argument_kind(bc, sayonce.COMPLAIN))
    flag = slot_global(bc, FLAG, argument_kind(bc, sayonce.COMPLAIN))
    return assemble([_op(bc, "GetGlobal", **{"dst": held, "global": flag}),
                     (_op(bc, "JNull", reg=held), "no gate yet")]
                    + said + ["no gate yet:", _op(bc, "Label")])


def _filter_reads_the_mark(bc, numbered):
    """The game's filter, asked with the gates' mark: any source passes but a stamp of ours."""
    fn = function_named(bc, FILTER)
    source_kind = argument_kind(bc, HAS, 1)
    kinds = argument_kinds(bc, FILTER)
    guard(kinds.count(source_kind) == 1, "%s takes %d source(s), and this reads one"
                                         % (FILTER, kinds.count(source_kind)))
    # a method's argument N sits in place N + 1, past the thing it is about
    asked, stack = kinds.index(source_kind) + 1, 1
    held_at, held_kind = field_by_name(bc, kinds[0], STACK_SOURCE, FILTER)
    guard(held_kind == source_kind, "a stack's `%s` is not the kind an ask carries" % STACK_SOURCE)
    whole = argument_kind(bc, GRANT, THE_ATB)
    kind_of, wanted, carried, zero = (_a_place(bc, fn, whole) for _ in range(4))
    theirs = _a_place(bc, fn, source_kind)
    no = _a_place(bc, fn, returns_type(fn, FILTER))
    flag = slot_global(bc, FLAG, argument_kind(bc, sayonce.COMPLAIN))
    word = _a_place(bc, fn, argument_kind(bc, sayonce.COMPLAIN))
    block = assemble([
        (_op(bc, "JNull", reg=asked), "not the mark"),
        _op(bc, "EnumIndex", dst=kind_of, value=asked),
        _op(bc, "Int", dst=wanted, ptr=number(bc, numbered)),
        (_op(bc, "JNotEq", a=kind_of, b=wanted), "not the mark"),
        _op(bc, "EnumField", dst=carried, value=asked, construct=numbered, field=0),
        _op(bc, "Int", dst=zero, ptr=number(bc, _as_held(THE_GATES_ASK))),
        (_op(bc, "JNotEq", a=carried, b=zero), "not the mark"),
        # the mark: the ask is the game's own "from anyone", past every stamp of ours
        _op(bc, "GetGlobal", **{"dst": word, "global": text_object(bc, SAID)}),
        _op(bc, "SetGlobal", **{"global": flag, "src": word}),
        _op(bc, "Null", dst=asked),
        _op(bc, "NullCheck", reg=stack),
        _op(bc, "Field", dst=theirs, obj=stack, field=held_at),
        (_op(bc, "JNull", reg=theirs), "not the mark"),
        _op(bc, "EnumIndex", dst=kind_of, value=theirs),
        (_op(bc, "JNotEq", a=kind_of, b=wanted), "not the mark"),
        _op(bc, "EnumField", dst=carried, value=theirs, construct=numbered, field=0),
        _op(bc, "Int", dst=zero, ptr=number(bc, 0)),
        (_op(bc, "JSGte", a=carried, b=zero), "not the mark"),
        _op(bc, "Bool", dst=no, value=False),
        _op(bc, "Ret", ret=no),
        "not the mark:",
        _op(bc, "Label"),
    ])
    insert(bc, fn, 0, block, FILTERED, IN_PLAY)


def install(bc):
    asking, making = gv(function_named(bc, HAS).findex), gv(function_named(bc, MAKES).findex)
    guard(argument_kind(bc, HAS, 1) == argument_kind(bc, MAKES, 1),
          "the ask and the grant disagree about what a source is")
    guard(THE_GATES_ASK < 0 and THE_GATES_ASK not in (OUR_OWN_BUCKET, OUR_EVENT_BUCKET)
          and THE_GATES_ASK > ROADS_FROM, "the gates' mark could be read as a stamp of ours")
    numbered = _built_from_a_number(bc, argument_kind(bc, HAS, 1))
    _filter_reads_the_mark(bc, numbered)
    passes, marked, left = 0, 0, 0
    for fn in list(bc.functions):
        emptied, skipped = _emptied(fn, asking, making)
        left += skipped
        if not emptied:
            continue
        passes += 1
        kept = _a_place(bc, fn, argument_kind(bc, GRANT, THE_ATB))
        # one instruction for one, so no jump in the function moves
        for at in emptied:
            fn.ops[at] = _op(bc, "MakeEnum", dst=gv(fn.ops[at].df["dst"]),
                             construct=numbered, args=[kept])
        marked += len(emptied)
        moved = insert(bc, fn, 0,
                       [_op(bc, "Int", dst=kept, ptr=number(bc, _as_held(THE_GATES_ASK)))],
                       SEEDED % passes, IN_PLAY)
        said = _say_if_raised(bc, fn)
        if said:
            insert(bc, fn, moved, said, SAYS_AT % passes, IN_PLAY)
    guard(marked, "no gate in the file jumps over a grant, which cannot be right")
    return ("OWN MARK: %d gate(s) ask for any stack but ours across %d pass(es); %d already "
            "asked a source of their own, and every grant and every other ask is the game's own"
            % (marked, passes, left))
