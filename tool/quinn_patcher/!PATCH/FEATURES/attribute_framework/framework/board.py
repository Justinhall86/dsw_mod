#!/usr/bin/env python3
"""The board of words: which reading of ours speaks, at what tempo, and what it dropped."""
from tools.project import guard
from tools.hlcode import (SLOTS_ON, function_named, number, returns_type, slot_global, template,
                          written)

# NOTHING is what a place nobody has written holds, so it reads as whatever the build left
UNTOUCHED, AT_GAME, AT_TICK, AT_PASS, FREE, OFF = 0, 1, 2, 3, 4, 5
TEMPO_IS = {"game": AT_GAME, "tick": AT_TICK, "pass": AT_PASS, "free": FREE}
PER_FRAME = "frame"
# what each state reads as on the board, which is the only place these words are spelled
READS_AS = {AT_GAME: "once a game", AT_TICK: "once a tick", AT_PASS: "once a pass",
            FREE: "as often as it asks", OFF: "silent"}

# a word's two places, one gate's own latch, and the two counts a tempo is measured against
STATE = "say: %s"
LAST = "say last said at: %s"
DROPPED = "say dropped since: %s"
TICK_NOW = "say which tick the world is on"
PASS_NOW = "say which pass the roads are on"

# the kind a plain count is, taken off the one call the row reader already asks for a number
from framework.rowreader import STARTS_AT as A_COUNT

_INSIDE = []
_TAGS = [0]
# every place the world's own emptying was BUILT to empty; a gate made after it is not in here
_ARMED = []


def a_number(bc):
    """The kind every place here is, read off the game rather than named as a number of ours."""
    return returns_type(function_named(bc, A_COUNT), A_COUNT)


def words():
    """Every reading the board carries, in the order the switch board declares them."""
    from standalone import onoff
    return list(onoff.A_READING)


def tempo_of(word):
    """The number that word's place holds while it speaks at its own declared tempo."""
    from standalone import onoff
    return TEMPO_IS[onoff.TEMPO[word]]


def boot_of(word):
    """What that word does before anyone types anything -- silent, unless the build says else."""
    from standalone import onoff
    return tempo_of(word) if word in onoff.SPEAKING_AT_BOOT else OFF


def in_this_build(word):
    """Is that word's own code in the file at all? A board row says so when it is not."""
    from standalone import onoff
    return bool(onoff.ON.get(word))


class saying(object):
    """Name the reading whose words are being built, so each one carries its own gate."""

    def __init__(self, word):
        self.word = word

    def __enter__(self):
        _INSIDE.append(self.word)
        return self

    def __exit__(self, *_):
        _INSIDE.pop()


def current():
    """Which reading's words are being built right now, or nothing when none said."""
    return _INSIDE[-1] if _INSIDE else None


def _op(bc, what, **operands):
    return written(template(bc, what), **operands)


def make_slots(bc):
    """Make every word's two places and the two counts, each empty until something writes."""
    made = {which: slot_global(bc, which, a_number(bc)) for which in (TICK_NOW, PASS_NOW)}
    for word in words():
        for which in (STATE, DROPPED):
            made[which % word] = slot_global(bc, which % word, a_number(bc))
    return made


def every_latch(bc):
    """Every gate's own latch, by the name each was made under. One per gate, never per word."""
    made = getattr(bc, SLOTS_ON, None) or {}
    return {name: at for name, at in made.items() if name.startswith(LAST % "")}


def slot(bc, which, word=None):
    """Read one place this file made. A place's name is spelled here and nowhere else."""
    return slot_global(bc, which if word is None else which % word, a_number(bc))


def emit_state(bc, op, word, state, mark, chosen):
    """That word's state right now: what was typed, or what the build left when nothing was."""
    # a gate JUMPS WHEN IT IS, never when it is not: a case counts an act's own stepping-over
    return [
        op("GetGlobal", **{"dst": state, "global": slot(bc, STATE, word)}),
        op("Int", dst=mark, ptr=number(bc, UNTOUCHED)),
        (op("JEq", a=state, b=mark), chosen + " from the build"),
        (op("JAlways"), chosen),
        chosen + " from the build:", op("Label"),
        op("Int", dst=state, ptr=number(bc, boot_of(word))),
        chosen + ":", op("Label"),
    ]


def around(bc, fn, word, block):
    """That reading's words behind its own gate: silent unless the board says otherwise."""
    if not block:
        return []
    from framework.parsed import a_new_place
    _TAGS[0] += 1
    tag = "%s says %d" % (word, _TAGS[0])
    past, speak, dropped = tag + ": past", tag + ": may", tag + ": dropped"
    each_tick, each_pass = tag + ": each tick", tag + ": each pass"
    each_game = tag + ": each game"
    chosen, straight = tag + ": chosen", tag + ": straight through"
    state = a_new_place(bc, fn, a_number(bc))
    now = a_new_place(bc, fn, a_number(bc))
    last = a_new_place(bc, fn, a_number(bc))
    mark = a_new_place(bc, fn, a_number(bc))
    # THIS GATE'S OWN LATCH: one per word lets the first place a reading speaks swallow the rest
    at_last = slot(bc, LAST, tag)

    def op(what, **operands):
        return _op(bc, what, **operands)

    return emit_state(bc, op, word, state, mark, chosen) + [
        op("Int", dst=mark, ptr=number(bc, OFF)),
        (op("JEq", a=state, b=mark), past),
        # the one state with no latch at all: every reach speaks, which is what a door is
        op("Int", dst=mark, ptr=number(bc, FREE)),
        (op("JEq", a=state, b=mark), straight),
        op("Int", dst=mark, ptr=number(bc, AT_TICK)),
        (op("JEq", a=state, b=mark), each_tick),
        op("Int", dst=mark, ptr=number(bc, AT_PASS)),
        (op("JEq", a=state, b=mark), each_pass),
        op("Int", dst=mark, ptr=number(bc, AT_GAME)),
        (op("JEq", a=state, b=mark), each_game),
        (op("JAlways"), past),
        # once a game is the one tempo with no count behind it: the first time is the only time
        each_game + ":", op("Label"),
        op("Int", dst=now, ptr=number(bc, 1)),
        (op("JAlways"), speak),
        each_tick + ":", op("Label"),
        op("GetGlobal", **{"dst": now, "global": slot(bc, TICK_NOW)}),
        op("Incr", dst=now),
        (op("JAlways"), speak),
        each_pass + ":", op("Label"),
        op("GetGlobal", **{"dst": now, "global": slot(bc, PASS_NOW)}),
        op("Incr", dst=now),
        speak + ":", op("Label"),
        op("GetGlobal", **{"dst": last, "global": at_last}),
        (op("JEq", a=last, b=now), dropped),
        op("SetGlobal", **{"global": at_last, "src": now}),
        straight + ":", op("Label"),
    ] + list(block) + [
        (op("JAlways"), past),
        dropped + ":", op("Label"),
        # a repeat the tempo turned away is COUNTED, never lost -- `mod say` reads the count back
        op("GetGlobal", **{"dst": mark, "global": slot(bc, DROPPED, word)}),
        op("Incr", dst=mark),
        op("SetGlobal", **{"global": slot(bc, DROPPED, word), "src": mark}),
        past + ":", op("Label"),
    ]


def gated(bc, fn, block, word=None):
    """A DOOR's gate. Nothing once a reading has named itself: `said` gates the whole lot once."""
    if current() is not None or word is None or not block:
        return list(block)
    return around(bc, fn, word, block)


def said(bc, fn, word, build):
    """THE ONE CALL A READING'S SITE MAKES: named as it is built, gated once, off its door."""
    if not in_this_build(word):
        return []
    _INSIDE.append(word)
    try:
        block = list(build())
    finally:
        _INSIDE.pop()
    return around(bc, fn, word, block) if block else []


def emit_bump(bc, fn, which):
    """One on the count a tempo is measured against, where the game reaches that moment."""
    from framework.parsed import a_new_place
    got = a_new_place(bc, fn, a_number(bc))
    at = slot(bc, which)
    return [_op(bc, "GetGlobal", **{"dst": got, "global": at}),
            _op(bc, "Incr", dst=got),
            _op(bc, "SetGlobal", **{"global": at, "src": got})]


def emptied(bc):
    """Every place a new world puts back to nothing. A word's own STATE is not one of them."""
    return ([slot(bc, which) for which in (TICK_NOW, PASS_NOW)]
            + [slot(bc, DROPPED, word) for word in words()]
            + sorted(every_latch(bc).values()))


def armed():
    """Every place the world's own emptying was built to arm again, as it was built."""
    return list(_ARMED)


def emit_at_a_new_world(bc, fn):
    """Every latch and every dropped count back to nothing, so a second game says it again."""
    from framework.parsed import a_new_place
    zero = a_new_place(bc, fn, a_number(bc))
    _ARMED[:] = emptied(bc)
    return [_op(bc, "Int", dst=zero, ptr=number(bc, 0))] + [
        _op(bc, "SetGlobal", **{"global": at, "src": zero}) for at in _ARMED]


def refusals():
    """Every reason a word could not sit on the board. A gate keyed on one of these would raise."""
    from standalone import onoff
    out = ["`%s` is a reading and declares no tempo" % w for w in words() if w not in onoff.TEMPO]
    out += ["`%s` declares the tempo `%s`, which is not one of %s"
            % (w, onoff.TEMPO[w], ", ".join(sorted(TEMPO_IS)))
            for w in words() if w in onoff.TEMPO and onoff.TEMPO[w] not in TEMPO_IS]
    out += ["`%s` speaks before anything is typed and is not a reading at all" % w
            for w in onoff.SPEAKING_AT_BOOT if w not in words()]
    out += ["`%s` speaks before anything is typed and is not in this build" % w
            for w in onoff.SPEAKING_AT_BOOT if w in words() and not onoff.ON.get(w)]
    return out


def install(bc):
    """Make the board's places. Nothing is spliced here -- each reading carries its own gate."""
    bad = refusals()
    guard(not bad, "the board cannot be made: " + "; ".join(bad))
    made = make_slots(bc)
    here = [w for w in words() if in_this_build(w)]
    away = [w for w in words() if not in_this_build(w)]
    loud = [w for w in words() if boot_of(w) != OFF]
    return ("THE BOARD: %d place(s) for %d word(s), %d in this build and %d of those speaking "
            "before anything is typed%s"
            % (len(made), len(words()), len(here), len(loud),
               "" if not away else "; a build of its own for " + ", ".join(away)))
