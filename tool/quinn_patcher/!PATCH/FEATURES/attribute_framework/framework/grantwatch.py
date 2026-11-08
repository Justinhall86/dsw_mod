#!/usr/bin/env python3
"""An instrument: the engine's own decision about a stack, said where the engine makes it."""
from copy import deepcopy

from tools.hlcode import (argument_kind, assemble, function_named, is_static, number,
                          register_like, returns_type, template, text_object, written)
from tools.project import gv, guard
from tools.splice import insert
from framework.acts.gain_ttrait_stacks import GRANT
from framework.sayonce import COMPLAIN
from framework.traps import IN_PLAY

# ⛔ FROM THE SHIPPED FIX, NOT THE OTHER WAY ROUND: this diagnosis is off by default
from framework.ownmark import HAS, MAKES, THE_ATB, _a_place

NAME = "grantwatch"
# the other changes, by NAME, this one cannot work without; "attributes" is the framework
RELIES_ON = ("ownmark", "attributes")

# the rest are this file's own, and the channel is the saying's
TOTAL = "logic.TraitsManager.setTraitStacks"
TAKES = "logic.TraitsManager.remove"
FIRES = "$HEffect.fireEffect"
CROSSES = "ent.Unit.onZoneChange"
# what a unit answers when asked what it is -- the word a modder would recognise it by
WHICH_UNIT = "ent.Unit.get_baseKind"
GIVES = "ent.Zone.updateGiveTraits"
WALK = "logic.TraitsManager.updateTraitConditions"
DROPS = "logic.TraitsManager.removeApp"
BLOCKS = "logic.TraitsManager.block"
ASKS = "logic.TraitsManager.hasBlock"

# what each block is called where the splice is written down
AT_THE_GRANT = "the engine's own grant decision"
AT_THE_TOTAL = "the whole-trait grant decision"
AT_A_MAKING = "an application being made"
AT_A_TAKING = "an application being taken away"
AT_A_FIRING = "an effect being fired"
AT_A_CROSSING = "a unit crossing a zone"
AT_A_BLOCK = "a trait blocked by the condition walk"
AT_A_DROP = "an application dropped by the condition walk"

# the two buckets, told apart by the SIGN of the id: ours is fabricated negative on purpose
OURS = "SPINE grant ours"
THEIRS = "SPINE grant the game's own"
WHOLE = "SPINE whole-trait grant"
# what the row is worth and what the engine will do, each number a word minted for the channel
WANTS = tuple((n, "SPINE wants %d" % n) for n in range(0, 9))
WANTS_MORE = "SPINE wants more than 8"
# a direction and a size, never a signed number: the file's pool of numbers is unsigned
CHANGE_NONE = "SPINE change none"
CHANGE_UP = "SPINE change up"
CHANGE_DOWN = "SPINE change down"
SIZE = tuple((n, "SPINE by %d" % n) for n in range(1, 9))
SIZE_MORE = "SPINE by more than 8"
BLOCKED = "SPINE blocked"
DROPPED = "SPINE conditions failed"
MADE = "SPINE applied"
TAKEN = "SPINE taken"
FIRED = "SPINE effect fired"
CROSSED = "SPINE a unit crossed a zone"
GIVING = "SPINE the zone gives its trait"
STEPPING_BACK = "SPINE the zone steps back, the unit has it already"

THE_TRAIT = 0


def _op(bc, name, **operands):
    return written(template(bc, name), **operands)


def _channel(bc):
    return function_named(bc, COMPLAIN)


def _say_word(bc, word, holds, discarded):
    """One minted word down the game's own complaint channel."""
    return [_op(bc, "GetGlobal", **{"dst": holds, "global": text_object(bc, word)}),
            _op(bc, "Call1", dst=discarded, fun=gv(_channel(bc).findex), arg0=holds)]


def _say_place(bc, where, discarded):
    """Whatever text is already in that place -- a trait id, in its own words."""
    return [_op(bc, "Call1", dst=discarded, fun=gv(_channel(bc).findex), arg0=where)]


def _say_number(bc, reads, words, otherwise, holds, discarded, num, tag):
    """A number, as one of the minted words. Nothing here borrows a way to print an integer."""
    out, done = [], "%s said" % tag
    for value, word in words:
        past = "%s is not %d" % (tag, value)
        out += [_op(bc, "Int", dst=num, ptr=number(bc, value)),
                (_op(bc, "JNotEq", a=reads, b=num), past)]
        out += _say_word(bc, word, holds, discarded)
        out += [(_op(bc, "JAlways"), done), past + ":", _op(bc, "Label")]
    return out + _say_word(bc, otherwise, holds, discarded) + [done + ":", _op(bc, "Label")]


def _say_change(bc, reads, holds, discarded, num, size):
    """Which way the engine is about to move the bucket, and by how much, never negative."""
    return ([_op(bc, "Int", dst=num, ptr=number(bc, 0)),
             (_op(bc, "JNotEq", a=reads, b=num), "it changes")]
            + _say_word(bc, CHANGE_NONE, holds, discarded)
            + [(_op(bc, "JAlways"), "the change is said"), "it changes:", _op(bc, "Label"),
               (_op(bc, "JSLt", a=reads, b=num), "it comes down")]
            + _say_word(bc, CHANGE_UP, holds, discarded)
            + [_op(bc, "Mov", dst=size, src=reads),
               (_op(bc, "JAlways"), "the size is in hand"), "it comes down:", _op(bc, "Label")]
            + _say_word(bc, CHANGE_DOWN, holds, discarded)
            + [_op(bc, "Neg", dst=size, src=reads), "the size is in hand:", _op(bc, "Label")]
            + _say_number(bc, size, SIZE, SIZE_MORE, holds, discarded, num, "the size")
            + ["the change is said:", _op(bc, "Label")])


def _the_decision_in(bc, name):
    """Where a grant has both numbers and has not acted: the comparison in front of the exit."""
    fn = function_named(bc, name)
    ops = fn.ops
    tests = [i for i in range(len(ops) - 1)
             if ops[i].op == "JNotEq" and ops[i + 1].op == "Ret"]
    guard(len(tests) == 1,
          "%s has %d comparison(s) in front of an exit, expected 1" % (name, len(tests)))
    test = tests[0]
    change = gv(ops[test].df["a"])
    # ⚠ THE FIRST WRITE TO THAT PLACE, NEVER THE LAST: one door subtracts in a loop
    seeds = [i for i in range(test)
             if gv(ops[i].df.get("dst", -1)) == change and ops[i].op in ("Mov", "Sub")]
    guard(seeds, "nothing in %s seeds the place the difference is counted in" % name)
    first = ops[seeds[0]]
    wants = gv(first.df["src" if first.op == "Mov" else "a"])
    at = test - 1
    guard(ops[at].op == "Int",
          "the zero in %s is not set up in front of its own test" % name)
    guard(argument_kind(bc, name, THE_TRAIT) == argument_kind(bc, COMPLAIN),
          "%s's trait id is a t@%s and %s says a t@%s"
          % (name, argument_kind(bc, name, THE_TRAIT), COMPLAIN, argument_kind(bc, COMPLAIN)))
    return fn, at, change, wants


def _named(bc, fn, block):
    """Every word of this diagnosis behind its own name on the board, tempo and all."""
    from framework import board
    return assemble(board.gated(bc, fn, block, "grantwatch"))


def _a_plain_number(bc, fn):
    """A place for a number of ours, of the kind the grant's own attribute id is."""
    return _a_place(bc, fn, argument_kind(bc, GRANT, THE_ATB))


def _at_the_grant(bc):
    """The per-attribute door: its own bucket, and ours is the one with a negative id."""
    fn, at, change, wants = _the_decision_in(bc, GRANT)
    trait, atb = THE_TRAIT + 1, THE_ATB + 1
    guard(gv(fn.regs[atb]) == argument_kind(bc, GRANT, THE_ATB),
          "%s's place %d is not the attribute id it declares" % (GRANT, atb))
    holds = _a_place(bc, fn, argument_kind(bc, COMPLAIN))
    discarded = _a_place(bc, fn, returns_type(_channel(bc), COMPLAIN))
    num, size = _a_plain_number(bc, fn), _a_plain_number(bc, fn)
    block = assemble(
        # which bucket, by the sign of the id -- a fabricated one is negative and the game's is not
        [_op(bc, "Int", dst=num, ptr=number(bc, 0)),
         (_op(bc, "JSLt", a=atb, b=num), "ours")]
        + _say_word(bc, THEIRS, holds, discarded)
        + [(_op(bc, "JAlways"), "said which bucket"), "ours:", _op(bc, "Label")]
        + _say_word(bc, OURS, holds, discarded)
        + ["said which bucket:", _op(bc, "Label")]
        + _say_place(bc, trait, discarded)
        + _say_number(bc, wants, WANTS, WANTS_MORE, holds, discarded, num, "what it wants")
        + _say_change(bc, change, holds, discarded, num, size))
    return fn, at, block


def _at_the_total(bc):
    """The whole-trait door, which counts EVERY application of the trait on the thing."""
    fn, at, change, wants = _the_decision_in(bc, TOTAL)
    holds = _a_place(bc, fn, argument_kind(bc, COMPLAIN))
    discarded = _a_place(bc, fn, returns_type(_channel(bc), COMPLAIN))
    num, size = _a_plain_number(bc, fn), _a_plain_number(bc, fn)
    block = assemble(
        _say_word(bc, WHOLE, holds, discarded)
        + _say_place(bc, THE_TRAIT + 1, discarded)
        + _say_number(bc, wants, WANTS, WANTS_MORE, holds, discarded, num, "what it wants")
        + _say_change(bc, change, holds, discarded, num, size))
    return fn, at, block


def _in_the_walk(bc):
    """The two ends an application can come to in the condition walk, each with its trait named."""
    fn = function_named(bc, WALK)
    ops = fn.ops
    blocking, dropping = gv(function_named(bc, BLOCKS).findex), gv(function_named(bc, DROPS).findex)
    asking = gv(function_named(bc, ASKS).findex)
    blocks = [i for i, o in enumerate(ops) if o.op == "Call3" and gv(o.df["fun"]) == blocking]
    guard(len(blocks) == 1, "%s blocks in %d place(s), expected 1" % (WALK, len(blocks)))
    # the drop this is about is the one the walk CARRIES ON past: the other two end the pass
    drops = [i for i, o in enumerate(ops) if o.op == "Call2" and gv(o.df["fun"]) == dropping
             and i + 1 < len(ops) and ops[i + 1].op != "Ret"]
    guard(len(drops) == 1,
          "%s drops and carries on in %d place(s), expected 1" % (WALK, len(drops)))
    # which field of an application its trait id is, taken off the game's own read of it
    asked = [i for i, o in enumerate(ops) if o.op == "Call3" and gv(o.df["fun"]) == asking]
    guard(len(asked) == 1, "%s asks about a block in %d place(s), expected 1" % (WALK, len(asked)))
    named = gv(ops[asked[0]].df["arg1"])
    reads = [i for i in range(asked[0]) if ops[i].op == "Field" and gv(ops[i].df["dst"]) == named]
    guard(reads, "nothing in %s reads the trait id it asks about" % WALK)
    where_id = gv(ops[reads[-1]].df["field"])

    holds = _a_place(bc, fn, argument_kind(bc, COMPLAIN))
    discarded = _a_place(bc, fn, returns_type(_channel(bc), COMPLAIN))
    said = _a_place(bc, fn, argument_kind(bc, COMPLAIN))
    # the block's own call already holds the trait id it is about
    blocked = (_say_word(bc, BLOCKED, holds, discarded)
               + _say_place(bc, gv(ops[blocks[0]].df["arg1"]), discarded))
    # the drop's does not, so the application is asked for it, by the field the game itself read
    application = gv(ops[drops[0]].df["arg1"])
    dropped = (_say_word(bc, DROPPED, holds, discarded)
               + [_op(bc, "Field", dst=said, obj=application, field=where_id)]
               + _say_place(bc, said, discarded))
    return fn, [(blocks[0], blocked, AT_A_BLOCK), (drops[0], dropped, AT_A_DROP)]


def _at_the_door_itself(bc, name, word):
    """Every application made or taken away, at the choke point itself, by whatever route."""
    fn = function_named(bc, name)
    guard(argument_kind(bc, name, THE_TRAIT) == argument_kind(bc, COMPLAIN),
          "%s's first id is not the kind %s says" % (name, COMPLAIN))
    holds = _a_place(bc, fn, argument_kind(bc, COMPLAIN))
    discarded = _a_place(bc, fn, returns_type(_channel(bc), COMPLAIN))
    # a method's first argument sits one place along; a static one's does not (`is_static` says)
    first = THE_TRAIT if is_static(bc, fn) else THE_TRAIT + 1
    return fn, (_say_word(bc, word, holds, discarded) + _say_place(bc, first, discarded))


def _at_the_zone_gate(bc):
    """Both sides of the gate a zone puts in front of its own trait, and which trait."""
    fn = function_named(bc, GIVES)
    ops = fn.ops
    asking = gv(function_named(bc, HAS).findex)
    gates = [i for i, o in enumerate(ops)
             if o.op in ("CallN", "Call4") and gv(o.df["fun"]) == asking]
    guard(gates, "%s never asks whether the unit has the trait" % GIVES)
    holds = _a_place(bc, fn, argument_kind(bc, COMPLAIN))
    discarded = _a_place(bc, fn, returns_type(_channel(bc), COMPLAIN))
    points = []
    for n, at in enumerate(gates):
        # the trait is whatever the gate itself was handed, never a place counted to
        named = gv(list(ops[at].df["args"].value)[1])
        # past the ask: the refusal comes first, the giving second, and each says the trait
        points.append((at + 2, _say_word(bc, STEPPING_BACK, holds, discarded)
                       + _say_place(bc, named, discarded), "the zone stepping back %d" % n))
        points.append((at + 3, _say_word(bc, GIVING, holds, discarded)
                       + _say_place(bc, named, discarded), "the zone giving %d" % n))
    return fn, points


def _who_makes_them(bc):
    """The name of whatever is about to make an application, said at the call itself."""
    from crashlink import disasm
    making = gv(function_named(bc, MAKES).findex)
    done, points = 0, 0
    for fn in list(bc.functions):
        sites = [i for i, o in enumerate(fn.ops or [])
                 if o.op in ("CallN", "Call4", "Call3") and gv(o.df.get("fun", -1)) == making]
        if not sites:
            continue
        try:
            whose = (disasm.func_header(bc, fn) or "").split("(")[0].strip().split(" ")[-1]
        except Exception:
            whose = ""
        # ⚠ THE GAME'S OWN NUMBER GOES IN THE NAME: two makers print as `<none>`
        whose = "%s f@%s" % (whose or "something unnamed", gv(fn.findex))
        holds = _a_place(bc, fn, argument_kind(bc, COMPLAIN))
        discarded = _a_place(bc, fn, returns_type(_channel(bc), COMPLAIN))
        said = _named(bc, fn, _say_word(bc, "SPINE made by %s" % whose, holds, discarded))
        # later site first: a splice moves every instruction after it
        for n, at in enumerate(sorted(sites, reverse=True)):
            insert(bc, fn, at, [deepcopy(o) for o in said],
                   "who makes one in %s, %d" % (whose, n), IN_PLAY)
            points += 1
        done += 1
    guard(points, "nothing in the file makes an application, which cannot be right")
    return done, points


def _at_a_moment(bc, name, word, asking=None):
    """One word every time the game reaches that function, and what `asking` answers about it."""
    fn = function_named(bc, name)
    holds = _a_place(bc, fn, argument_kind(bc, COMPLAIN))
    discarded = _a_place(bc, fn, returns_type(_channel(bc), COMPLAIN))
    said = _say_word(bc, word, holds, discarded)
    if asking:
        answers = function_named(bc, asking)
        guard(returns_type(answers, asking) == argument_kind(bc, COMPLAIN),
              "%s does not answer with the kind %s says" % (asking, COMPLAIN))
        named = _a_place(bc, fn, argument_kind(bc, COMPLAIN))
        said = said + [_op(bc, "Call1", dst=named, fun=gv(answers.findex), arg0=0)] \
            + _say_place(bc, named, discarded)
    return fn, said


def install(bc):
    """Both grant doors, the choke point, the walk's two ends; off unless `onoff.py` asks."""
    from standalone import onoff
    if not onoff.on(NAME):
        return "grantwatch: OFF -- the diagnosis is not in this build"
    fn, at, block = _at_the_grant(bc)
    whole, whole_at, whole_block = _at_the_total(bc)
    walk, points = _in_the_walk(bc)
    # THE LATER POINT FIRST: a splice moves every instruction after it, and both are in one function
    counts = {}
    for where, what, name in sorted(points, key=lambda p: -p[0]):
        counts[name] = insert(bc, walk, where, _named(bc, walk, what), name, IN_PLAY)
    counts[AT_THE_GRANT] = insert(bc, fn, at, _named(bc, fn, block), AT_THE_GRANT, IN_PLAY)
    counts[AT_THE_TOTAL] = insert(bc, whole, whole_at, _named(bc, whole, whole_block),
                                  AT_THE_TOTAL, IN_PLAY)
    for door, word, named in ((MAKES, MADE, AT_A_MAKING), (TAKES, TAKEN, AT_A_TAKING),
                              (FIRES, FIRED, AT_A_FIRING)):
        into, block_of_its_own = _at_the_door_itself(bc, door, word)
        counts[named] = insert(bc, into, 0, _named(bc, into, block_of_its_own), named, IN_PLAY)
    # and the moment a unit changes zone, which is what a territory rule is about
    crossing, said = _at_a_moment(bc, CROSSES, CROSSED, asking=WHICH_UNIT)
    counts[AT_A_CROSSING] = insert(bc, crossing, 0, _named(bc, crossing, said),
                                   AT_A_CROSSING, IN_PLAY)
    # and both sides of the zone's own gate, later point first for the same reason as the walk's
    gate, gates = _at_the_zone_gate(bc)
    for where, what, named in sorted(gates, key=lambda p: -p[0]):
        counts[named] = insert(bc, gate, where, _named(bc, gate, what), named, IN_PLAY)
    # LAST, because it walks every function in the file and must not see our own blocks
    callers, sites = _who_makes_them(bc)
    counts["who makes an application"] = sites
    return ("GRANT WATCH: %d block(s) in all -- which bucket a grant is about, what it wants and "
            "what it changes; the trait named at each end an application comes to; and %d site(s) "
            "in %d function(s) saying who is about to make one"
            % (len(counts), sites, callers))
