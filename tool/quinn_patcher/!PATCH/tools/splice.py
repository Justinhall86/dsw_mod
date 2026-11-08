#!/usr/bin/env python3
"""Put a block of ours inside a game function, every jump landing where it did, reach proved."""
from crashlink.opcodes import opcodes

from tools.project import gv, guard

# instructions after which control does not simply carry on to the next one
TERMINATORS = ("Ret", "Throw", "Rethrow", "JAlways", "Switch")
# where every splice is written down, ON the file, one entry per named block
SPLICED_ON = "_spine_spliced"
# and what kind each block said it was; a case crosses it with the declared kinds, not this file
KINDS_ON = "_spine_spliced_kinds"


def where(bc, what):
    """Where that block went and how many went in, or nothing; a splice cannot be found again."""
    found = (getattr(bc, SPLICED_ON, None) or {}).get(what)
    return found[:2] if found else found


def site_of(bc, what):
    """WHICH function that block went into, as the game's own number for it, written down."""
    found = (getattr(bc, SPLICED_ON, None) or {}).get(what)
    return found[2] if found else None


def distances_in(op):
    """The operands of one instruction that are a distance to somewhere else in the function."""
    return [name for name, kind in opcodes.get(op.op or "", {}).items()
            if kind == "JumpOffset" and op.df.get(name) is not None]


def every_distance_in(op):
    """The same plus a switch's whole TABLE, which `distances_in` misses, each as its wrapper."""
    out = []
    for name, kind in opcodes.get(op.op or "", {}).items():
        slot = op.df.get(name)
        if slot is None:
            continue
        if kind == "JumpOffset":
            out.append(slot)
        elif kind == "JumpOffsets":
            out.extend(getattr(slot, "value", None) or [])
    return out


def stops_past_the_last(op):
    """A switch's `end` is where its body STOPS, so at the tail it may land past the last one."""
    return op.op == "Switch"


def insert(bc, fn, at, block, what, kind):
    """Put `block` before `at`, named `what` and of trap `kind`; hand back how many went in."""
    guard(0 <= at <= len(fn.ops),
          "%s goes at %d and the function has %d instruction(s)" % (what, at, len(fn.ops)))
    guard(block, "%s is empty, and splicing nothing in is not a change" % what)
    guard(what and isinstance(what, str), "a block went in with no name of its own")
    guard(kind and isinstance(kind, str),
          "`%s` names no kind, so no trap could ever be about it" % what)
    how_many = len(block)
    # first, while the function is still the game's own -- the reason is on the function itself
    _something_reaches_it(fn, at, what)
    _stretch_what_spans_the_point(fn, at, how_many)
    _one_line_to_blame_each(fn, at, how_many, what)
    fn.ops[:] = list(fn.ops[:at]) + list(block) + list(fn.ops[at:])
    if getattr(fn, "nops", None) is not None:
        fn.nops.value = len(fn.ops)
    _every_jump_lands_inside(fn, what)
    _move_what_it_pushed(bc, at, how_many, gv(fn.findex))
    _write_it_down(bc, what, at, how_many, gv(fn.findex), kind)
    _feeds(bc, what, block)  # FEEDS
    return how_many


def _move_what_it_pushed(bc, at, how_many, findex):
    """Every earlier block in this function at or past the point moves on; one it lands in grows."""
    made = getattr(bc, SPLICED_ON, None) or {}
    for name, (was, length, site) in list(made.items()):
        if site != findex:
            continue
        if was >= at:
            made[name] = (was + how_many, length, site)
        elif at < was + length:
            made[name] = (was, length + how_many, site)


def _write_it_down(bc, what, at, how_many, findex, kind):
    """Remember where this block went, WHICH function it went into, and what KIND it is."""
    made = getattr(bc, SPLICED_ON, None)
    if made is None:
        made = {}
        setattr(bc, SPLICED_ON, made)
    guard(what not in made, "`%s` was spliced twice into this file" % what)
    made[what] = (at, how_many, findex)
    kinds = getattr(bc, KINDS_ON, None)
    if kinds is None:
        kinds = {}
        setattr(bc, KINDS_ON, kinds)
    kinds[what] = kind
    return made[what]


FEEDS_ON = "_spine_block_feeds"
READS_ON = "_spine_block_reads"


def _feeds(bc, what, block):
    """FEEDS: the framework files behind a block's instructions and behind its splice."""
    from tools.hlcode import FEEDS, feeding
    made = getattr(bc, FEEDS_ON, None)
    if made is None:
        made = {}
        setattr(bc, FEEDS_ON, made)
    files = set(feeding())
    for op in block:
        files |= FEEDS.get(id(op), frozenset())
    made[what] = sorted(files)
    from tools.hlcode import reads_of
    _filed_reads(bc)[what] = reads_of(block)


def _filed_reads(bc):
    """READS: {block name: what its writers read off the words}, kept on the file."""
    if getattr(bc, READS_ON, None) is None:
        setattr(bc, READS_ON, {})
    return getattr(bc, READS_ON)


def reads_by_block(bc):
    """READS: {block name: what its writers read off the words}."""
    return dict(getattr(bc, READS_ON, None) or {})


def feeds_of(bc):
    """FEEDS: {block name: the framework files behind it}."""
    return dict(getattr(bc, FEEDS_ON, None) or {})


def kind_of(bc, what):
    """Which kind one spliced block said it was, by the name it went in under."""
    return (getattr(bc, KINDS_ON, None) or {}).get(what)


def every_kind(bc):
    """Every block that went into this file, and the kind each named."""
    return dict(getattr(bc, KINDS_ON, None) or {})


def _stretch_what_spans_the_point(fn, at, how_many):
    # only a jump that crosses the point moves, and one that lands ON it lands on the new block
    for i, op in enumerate(fn.ops):
        for distance in every_distance_in(op):
            target = i + 1 + gv(distance)
            if i < at < target:
                distance.value = gv(distance) + how_many
            elif target <= at <= i:
                distance.value = gv(distance) - how_many


def _one_line_to_blame_each(fn, at, how_many, what):
    # done BEFORE the instructions go in, so the entry read here is still the point's own
    marks = getattr(getattr(fn, "debuginfo", None), "value", None)
    if not marks:
        return
    guard(len(marks) == len(fn.ops),
          "%s: the function has %d instruction(s) and %d line(s) to blame before the splice"
          % (what, len(fn.ops), len(marks)))
    blamed = marks[at] if at < len(marks) else marks[-1]
    marks[:] = marks[:at] + [blamed] * how_many + marks[at:]


def _every_jump_lands_inside(fn, what):
    for i, op in enumerate(fn.ops):
        for distance in every_distance_in(op):
            target = i + 1 + gv(distance)
            # ON an instruction, never one past the last -- except a switch's `end`
            last = len(fn.ops) if stops_past_the_last(op) else len(fn.ops) - 1
            guard(0 <= target <= last,
                  "%s: the %s at %d lands at %d and the function has %d"
                  % (what, op.op, i, target, len(fn.ops)))


def _something_reaches_it(fn, at, what):
    """Something reaches the point, a jump or the one before; asked while it is the game's own."""
    # THE ENTRY IS REACHED by the one thing no instruction can show: the call
    if at == 0:
        return [-1]
    reached = [i for i, op in enumerate(fn.ops)
               for name in distances_in(op) if i + 1 + gv(op.df[name]) == at]
    if fn.ops[at - 1].op not in TERMINATORS:
        reached.append(at - 1)
    guard(reached,
          "%s: NOTHING REACHES THE BLOCK AT %d -- the instruction in front of it is %s, and no "
          "jump lands there. This is the defect that made three of v1's builds do nothing."
          % (what, at, fn.ops[at - 1].op if at else "the start of the function"))
    return reached
