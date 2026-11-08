#!/usr/bin/env python3
"""What an application is owed: events that happened (outer map) vs what each thing took (inner)."""
from copy import copy, deepcopy

from tools.project import gv, guard
from tools.hlcode import (SLOTS_ON, function_named, kind_named, number, register_like,
                          returns_type, slot_global, template, written)
from tools.hlcode import argument_kind
from framework.loadguard import clear_site, emit_empty
from framework.oneshot import ASK, MAKE, MAP, TELL
from framework.triggermatch import NAMED as HOOK_NAMED, NOTHING_NAMED
from framework.parsed import READ, a_new_place
from framework.rowreader import STARTS_AT, reader_for

# our own place for the map: one count per application, and nothing else in it
SLOT = "what each application is owed"
# and the count each application's payment had reached when it closed to later arrivals
CLOSED = "what each application had paid when it closed"
# the reading that says which way out of the pay-once question a row took
SAYS_ITS_WAY = "oncepath"
# its two words: the payment closing, and a thing that arrived after it turned away
CLOSED_NOW = "SPINE a one-time payment closed: a thing arriving later pays nothing"
TOO_LATE = "SPINE a thing that arrived after a one-time payment was turned away"
# where the names of every map made through here are remembered, ON the file
MADE_ON = "_spine_keyed_by_application"
# what the road calls this stage
STAGE = "has this row's trigger happened"
# what this gate reads off the row to know whether its question applies at all
NAMES_NO_TRIGGER = "name.%s" % HOOK_NAMED
# and whether the effect accumulates when repeated (never authored without an event)
ONLY_ON_AN_EVENT = "effect.lump"
# ⛔ A NARROWING THAT REFUSES AN EVENT ROW WRITES OFF WHAT IT OWED: judged at the event
WRITTEN_OFF = "SPINE a narrowing refused an event row: what it owed this thing is lost"
LOST_AT = "a narrowing refused it"
# WHO ACTED: per application, a map from the faction that acted to the key its counts live under
ACTED = "who acted on each application"
# WHERE: per application, the thing its trigger last fired in, which an act may point at
FIRED_AT = "where each application last fired"
# whose thing is in hand, by the name `framework/scopematch.py` gives the payee
PAID = "owner"
# said once a game: a thing paid because its owner acted, or turned away because it did not
PAID_MATCHED = "SPINE a trigger paid a thing whose owner acted"
PAID_REFUSED = "SPINE a trigger turned away a thing whose owner did not act"
# what the write-off reads off the row: which application, whether an event weighs it, whose
LOSING_READS = ("source.application", NAMES_NO_TRIGGER, ONLY_ON_AN_EVENT, PAID)
# and what the gate reads: the same four
GATE_READS = LOSING_READS
# where the raising and the spending leave
RAISED, SPENT = "the mark is raised", "the mark is spent"
# THE ROAD'S FIRST REGISTER, the thing being ticked: a count is kept UNDER it, per thing
THE_THING = 0
# what this thing has TAKEN of an application's events (the inner map)
MINE = "this thing has a count of its own"
# where the gate leaves when this thing has taken nothing of an application yet
NOTHING_TAKEN = "this thing has taken none of it"
# nothing owed (a never-marked application), and the floor taken from it
NOTHING_OWED = 0
OWED_AT_LEAST = NOTHING_OWED + 1
# ⛔ ALL OWED AT ONCE: how many events the row in hand is paid for, boxed; none on a plain row
COVERS = "how many events this payment covers"
# ⛔ MADE AFTER THE EVENT: the game's last object number when each event was first asked about
NEWEST, NEWEST_AT = "the newest thing at each application's event", "which event that was"
# the game's counter of objects and each thing's number; the mask a loaded number is put through
NUMBERS, COUNTER, NUMBERED = "hxbit.$Serializer", "UID", "__uid"
MASKED_IN, BORN_LATE = "hxbit.Serializer.makeRef", "was this thing made after the event"


def make_slot(bc, which=SLOT):
    """MAKE a place for a map keyed by the application, remembered so a new world empties it."""
    made = getattr(bc, MADE_ON, None)
    if made is None:
        made = []
        setattr(bc, MADE_ON, made)
    if which not in made:
        made.append(which)
    return slot_global(bc, which, kind_named(bc, MAP))


def every_slot(bc):
    """Every map made through here, in the order they were made."""
    return list(getattr(bc, MADE_ON, None) or [])


def slot(bc, which=SLOT):
    """READ that place: the one this file already has. Reading never makes."""
    return (getattr(bc, SLOTS_ON, None) or {}).get(which)


def _op(bc, name, **operands):
    return written(template(bc, name), **operands)


def ready(bc, fn, which=SLOT):
    """The map, read into a place of its own on `fn`, and MADE when there is not one there."""
    where = slot(bc, which)
    guard(where is not None, "there is no place for `%s` yet -- install goes first" % which)
    holds = a_new_place(bc, fn, kind_named(bc, MAP))
    there = "there is a map of marks at %d" % holds
    return [
        _op(bc, "GetGlobal", **{"dst": holds, "global": where}),
        (_op(bc, "JNotNull", reg=holds), there),
        _op(bc, "New", dst=holds),
        _op(bc, "Call1", dst=a_new_place(bc, fn, returns_type(function_named(bc, MAKE), MAKE)),
            fun=gv(function_named(bc, MAKE).findex), arg0=holds),
        _op(bc, "SetGlobal", **{"global": where, "src": holds}),
        there + ":",
        _op(bc, "Label"),
    ], holds


def emit_raise(bc, fn, holds, key, reader=None, actor=None):
    """ONE MORE OWED for `actor` (the application itself when nobody acts), at a trigger's place."""
    reader = reader or reader_for(bc)
    reading = function_named(bc, READ)
    making, telling = function_named(bc, MAKE), function_named(bc, TELL)
    owed = a_new_place(bc, fn, returns_type(reading, READ))
    # a count is a primitive, so its kind comes from a signature that hands one back
    count = a_new_place(bc, fn, reader.count_kind)
    wrapped = a_new_place(bc, fn, returns_type(reading, READ))
    told = a_new_place(bc, fn, returns_type(telling, TELL))
    # nobody acted: the count lives under the application itself, which every thing may collect
    token, filing = key, []
    if actor is not None:
        opening, acted = ready(bc, fn, ACTED)
        inner = a_new_place(bc, fn, kind_named(bc, MAP))
        token = a_new_place(bc, fn, kind_named(bc, MAP))
        made = a_new_place(bc, fn, returns_type(making, MAKE))
        has_inner = "the application has a map of who acted at %d" % inner
        has_token = "whoever acted has a key of its own at %d" % token
        # ⛔ THE COUNTS LIVE UNDER A KEY PER ACTOR, so only the actor's things can collect them
        filing = opening + [
            _op(bc, "Call2", dst=owed, fun=gv(reading.findex), arg0=acted, arg1=key),
            _op(bc, "SafeCast", dst=inner, src=owed),
            (_op(bc, "JNotNull", reg=inner), has_inner),
            _op(bc, "New", dst=inner),
            _op(bc, "Call1", dst=made, fun=gv(making.findex), arg0=inner),
            _op(bc, "Call3", dst=told, fun=gv(telling.findex), arg0=acted, arg1=key, arg2=inner),
            has_inner + ":",
            _op(bc, "Label"),
            _op(bc, "Call2", dst=owed, fun=gv(reading.findex), arg0=inner, arg1=actor),
            _op(bc, "SafeCast", dst=token, src=owed),
            (_op(bc, "JNotNull", reg=token), has_token),
            _op(bc, "New", dst=token),
            _op(bc, "Call1", dst=made, fun=gv(making.findex), arg0=token),
            _op(bc, "Call3", dst=told, fun=gv(telling.findex), arg0=inner, arg1=actor, arg2=token),
            has_token + ":",
            _op(bc, "Label")]
    return filing + [
        _op(bc, "Call2", dst=owed, fun=gv(reading.findex), arg0=holds, arg1=token),
        _op(bc, "Int", dst=count, ptr=number(bc, NOTHING_OWED)),
        (_op(bc, "JNull", reg=owed), RAISED),
        _op(bc, "SafeCast", dst=count, src=owed),
        RAISED + ":",
        _op(bc, "Label"),
        _op(bc, "Incr", dst=count),
        _op(bc, "ToDyn", dst=wrapped, src=count),
        _op(bc, "Call3", dst=told, fun=gv(telling.findex),
            arg0=holds, arg1=token, arg2=wrapped),
    ]


def emit_fired_at(bc, fn, key, thing):
    """The thing `key`'s trigger fired in, kept for its act; a later event in the tick wins."""
    telling = function_named(bc, TELL)
    opening, holds = ready(bc, fn, FIRED_AT)
    kept = a_new_place(bc, fn, argument_kind(bc, TELL, 1))
    return opening + [
        _op(bc, "UnsafeCast", dst=kept, src=thing),
        _op(bc, "Call3", dst=a_new_place(bc, fn, returns_type(telling, TELL)),
            fun=gv(telling.findex), arg0=holds, arg1=key, arg2=kept)]


def _whose_key(place, key, leave, saying=True):
    """The key this thing's counts live under: its owner's if one acted, else the application."""
    acted, inner = place.scratch_of(MAP), place.scratch_of(MAP)
    application, payee = place.row["source.application"], place.row[PAID]
    # what the map of who acted holds, read beside the key so the key stays the application
    got = place.scratch_like(key)
    not_theirs = place.here("this thing's owner did not act")
    past = place.here("whose key it is, settled")
    return [
        # ⛔ AN OBJECT INTO A DYNAMIC PLACE IS AN UnsafeCast, never a ToDyn; nobody acted: this
        place.op("UnsafeCast", dst=key, src=application),
        place.op("GetGlobal", **{"dst": acted, "global": place.slot(ACTED)}),
        (place.op("JNull", reg=acted), past),
        place.op("Call2", dst=got, fun=place.named_function(READ), arg0=acted, arg1=application),
        place.op("SafeCast", dst=inner, src=got),
        (place.op("JNull", reg=inner), past),
        (place.op("JNull", reg=payee), not_theirs),
        place.op("Call2", dst=key, fun=place.named_function(READ), arg0=inner, arg1=payee),
        (place.op("JNull", reg=key), not_theirs),
    ] + (place.said_now(PAID_MATCHED, once=True) if saying else []) + [
        (place.op("JAlways"), past),
        not_theirs + ":", place.op("Label"),
        # ⛔ A THING THAT ACTED ITSELF (a killer) holds a key of its own, and only it collects
        place.op("Call2", dst=key, fun=place.named_function(READ), arg0=inner, arg1=THE_THING),
        (place.op("JNotNull", reg=key), past),
    ] + (place.said_now(PAID_REFUSED, once=True) if saying else []) + [
        (place.op("JAlways"), leave),
        past + ":", place.op("Label"),
    ]


def emit_ready(place):
    """THE OPENING: the map of counts, and inside it THIS thing's own. Runs once per road."""
    holds = place.scratch_of(MAP)
    made = place.scratch_return(MAKE)
    mine = place.scratch_of(MAP)
    filed = place.scratch_return(MAKE)
    got = place.scratch_return(READ)
    told = place.scratch_return(TELL)
    closed = place.scratch_of(MAP)
    shut = place.scratch_return(MAKE)
    # what has happened for the row in hand, left by the gate for the advancing to read
    happened = place.scratch_return(STARTS_AT)
    # and the key this row's counts live under, left by the gate for the advancing (none: skip)
    key = place.scratch_return(READ)
    there, ours = place.here("a map already"), place.here(MINE)
    closings = place.here("a map of closings already")
    return ([
        place.op("GetGlobal", **{"dst": holds, "global": place.slot(SLOT)}),
        (place.op("JNotNull", reg=holds), there),
        place.op("New", dst=holds),
        place.op("Call1", dst=made, fun=place.named_function(MAKE), arg0=holds),
        place.op("SetGlobal", **{"global": place.slot(SLOT), "src": holds}),
        there + ":",
        place.op("Label"),
        place.op("GetGlobal", **{"dst": closed, "global": place.slot(CLOSED)}),
        (place.op("JNotNull", reg=closed), closings),
        place.op("New", dst=closed),
        place.op("Call1", dst=shut, fun=place.named_function(MAKE), arg0=closed),
        place.op("SetGlobal", **{"global": place.slot(CLOSED), "src": closed}),
        closings + ":",
        place.op("Label"),
        # and the one under the thing in hand, made the first time this thing is ticked
        place.op("Call2", dst=got, fun=place.named_function(READ),
                 arg0=holds, arg1=THE_THING),
        place.op("SafeCast", dst=mine, src=got),
        (place.op("JNotNull", reg=mine), ours),
        place.op("New", dst=mine),
        place.op("Call1", dst=filed, fun=place.named_function(MAKE), arg0=mine),
        place.op("Call3", dst=told, fun=place.named_function(TELL),
                 arg0=holds, arg1=THE_THING, arg2=mine),
        ours + ":",
        place.op("Label"),
    ], (holds, mine, closed, happened, key))


def emit_gate(place):
    """PER ROW: end the road unless this application is owed something; asks, never spends."""
    owed = place.scratch_return(READ)
    taken = place.scratch_return(STARTS_AT)
    closed_at = place.scratch_return(STARTS_AT)
    wrapped = place.scratch_return(READ)
    told = place.scratch_return(TELL)
    kept, mine, closed, count, key = place.kept
    # A ROW THAT NAMES NO TRIGGER IS NOT ASKED: it holds while the rule applies
    none = place.scratch_like(place.row[NAMES_NO_TRIGGER])
    accumulates = place.scratch_like(place.row[ONLY_ON_AN_EVENT])
    through = place.here("this row names no trigger, so nothing had to happen")
    asked = place.here("this row is asked whether its event happened")
    open_or_shut = place.here("whether the payment has closed is known")
    arrived = place.here(NOTHING_TAKEN)
    covers, boxed = place.scratch_like(count), place.scratch_return(READ)
    owing = place.here("how many events it is paid for, known")
    return [
        place.op("Null", dst=key),
        place.op("Int", dst=count, ptr=place.number(NOTHING_OWED)),
        # \u26d4 THE EFFECT DECIDES: an effect that ACCUMULATES is never skipped past this question
        place.op("Int", dst=accumulates, ptr=place.number(1)),
        (place.op("JEq", a=place.row[ONLY_ON_AN_EVENT], b=accumulates), asked),
        place.op("Int", dst=none, ptr=place.number(NOTHING_NAMED)),
        (place.op("JEq", a=place.row[NAMES_NO_TRIGGER], b=none), through),
        asked + ":", place.op("Label"),
    ] + _whose_key(place, key, place.refused) + [
        # what has HAPPENED for this application and this owner, over the whole world
        place.op("Call2", dst=owed, fun=place.named_function(READ), arg0=kept, arg1=key),
        (place.op("JNull", reg=owed), place.refused),
        place.op("SafeCast", dst=count, src=owed),
        # and where its payment stood when it closed (never closed reads as none)
        place.op("Int", dst=closed_at, ptr=place.number(NOTHING_OWED)),
        place.op("Call2", dst=owed, fun=place.named_function(READ), arg0=closed, arg1=key),
        (place.op("JNull", reg=owed), open_or_shut),
        place.op("SafeCast", dst=closed_at, src=owed),
        open_or_shut + ":",
        place.op("Label"),
        # and what THIS thing has already taken of it
        place.op("Int", dst=taken, ptr=place.number(NOTHING_OWED)),
        place.op("Call2", dst=owed, fun=place.named_function(READ), arg0=mine, arg1=key),
        (place.op("JNull", reg=owed), arrived),
        place.op("SafeCast", dst=taken, src=owed),
        # it has taken before, so it was there: behind, it pays for every event since
        place.op("Sub", dst=covers, a=count, b=taken),
        (place.op("JSLt", a=taken, b=count), owing),
        # ⛔ PAID IN FULL AND WALKED AGAIN: every thing there at the event has been walked since
        (place.op("JSGte", a=closed_at, b=count), place.refused),
        place.op("ToDyn", dst=wrapped, src=count),
        place.op("Call3", dst=told, fun=place.named_function(TELL),
                 arg0=closed, arg1=key, arg2=wrapped),
    ] + place.said(SAYS_ITS_WAY, lambda: place.said_now(CLOSED_NOW)) + [
        (place.op("JAlways"), place.refused),
        # ⛔ NEVER TAKEN: it pays only while the payment is open, so an arrival after pays nothing
        arrived + ":",
        place.op("Label"),
    ] + _owed_since(place, (key, THE_THING, count, closed_at), covers) + [
        # ⛔ `taken` is none here, so anything it covers is owed
        (place.op("JSLt", a=taken, b=covers), owing),
    ] + place.said(SAYS_ITS_WAY, lambda: place.said_now(TOO_LATE)) + [
        (place.op("JAlways"), place.refused),
        owing + ":",
        place.op("Label"),
        place.op("ToDyn", dst=boxed, src=covers),
        place.op("SetGlobal", **{"global": place.slot(COVERS), "src": boxed}),
        through + ":",
        place.op("Label"),
    ]


def _owed_since(place, handed, covers):
    """`covers`: the events since the payment closed; none for a thing made after the event."""
    from tools.hlcode import fields_of
    _key, _thing, count, closed_at = handed
    bc, thing = place._hands["bc"](), place.kind_of(THE_THING)
    named = getattr(bc.types[thing], "definition", None)
    if not hasattr(named, "resolve_fields") or NUMBERED not in fields_of(bc, thing)[0]:
        return [place.op("Sub", dst=covers, a=count, b=closed_at)]
    kinds = [place.kind_of(r) for r in handed]
    made = place._hands["shared"]((BORN_LATE,) + tuple(kinds), kinds, place.kind_of(covers),
                                  _owed_unless_late)
    return [place.op("CallN", dst=covers, fun=made, args=list(handed))]


def _owed_unless_late(hands):
    """Events since the close; none when the thing's number is past the event's newest."""
    from tools.hlcode import assemble
    from framework.pipeline import Place
    at = Place(BORN_LATE, {}, {}, None, None, None, "%s: done" % BORN_LATE, hands)
    key, thing, count, closed_at = 0, 1, 2, 3
    maps = (at.scratch_of(MAP), at.scratch_of(MAP))
    got, told, made = at.scratch_return(READ), at.scratch_return(TELL), at.scratch_return(MAKE)
    (counter_at, last), (numbered_at, mine) = at.field_of(NUMBERS, COUNTER), at.field_of(
        thing, NUMBERED)
    asked, mask, answer = at.scratch_like(count), at.scratch_like(mine), at.scratch_like(count)
    numbers = at.scratch_of(NUMBERS)
    first, before, out = at.here("the first ask of this event"), at.here("made before it"), []
    for kept, which in zip(maps, (NEWEST_AT, NEWEST)):
        there = at.here("a map of %s already" % which)
        out += [at.op("GetGlobal", **{"dst": kept, "global": at.slot(which)}),
                (at.op("JNotNull", reg=kept), there), at.op("New", dst=kept),
                at.op("Call1", dst=made, fun=at.named_function(MAKE), arg0=kept),
                at.op("SetGlobal", **{"global": at.slot(which), "src": kept}),
                there + ":", at.op("Label")]
    return assemble(out + [
        # ⛔ THE FIRST ASK OF AN EVENT comes before any act it pays, so nothing it made is counted
        at.op("Call2", dst=got, fun=at.named_function(READ), arg0=maps[0], arg1=key),
        (at.op("JNull", reg=got), first), at.op("SafeCast", dst=asked, src=got),
        (at.op("JNotEq", a=asked, b=count), first),
        at.op("Call2", dst=got, fun=at.named_function(READ), arg0=maps[1], arg1=key),
        (at.op("JNull", reg=got), before), at.op("SafeCast", dst=last, src=got),
        at.op("Field", dst=mine, obj=thing, field=numbered_at),
        at.op("Int", dst=mask, ptr=at.number(_the_mask(at._hands["bc"]()))),
        at.op("And", dst=mine, a=mine, b=mask), (at.op("JSGte", a=last, b=mine), before),
        at.op("Int", dst=answer, ptr=at.number(NOTHING_OWED)), at.op("Ret", ret=answer),
        first + ":", at.op("Label"), at.op("ToDyn", dst=got, src=count),
        at.op("Call3", dst=told, fun=at.named_function(TELL), arg0=maps[0], arg1=key, arg2=got),
        at.op("GetGlobal", **{"dst": numbers, "global": at._hands["the_one_global"](NUMBERS)}),
        at.op("Field", dst=last, obj=numbers, field=counter_at), at.op("ToDyn", dst=got, src=last),
        at.op("Call3", dst=told, fun=at.named_function(TELL), arg0=maps[1], arg1=key, arg2=got),
        before + ":", at.op("Label"), at.op("Sub", dst=answer, a=count, b=closed_at),
        at.op("Ret", ret=answer)])


def _the_mask(bc):
    """The one number `MASKED_IN` masks what it is handed with, before it raises the counter."""
    opening = function_named(bc, MASKED_IN).ops[:4]
    ints = [op for op in opening if op.op == "Int"]
    guard(len(ints) == 1 and [op.op for op in opening].count("And") == 1,
          "%s does not open by masking the number it is handed" % MASKED_IN)
    return gv(bc.ints[gv(ints[0].df["ptr"])])


def emit_spend(place):
    """AFTER THE LAST ACT: the count UNDER THE THING to where the events stand; all are paid."""
    wrapped = place.scratch_return(READ)
    told = place.scratch_return(TELL)
    _kept, mine, _closed, happened, key = place.kept
    # a row that named no trigger was never keyed, and has nothing to advance
    unkeyed = place.here("this row was never keyed")
    return [
        (place.op("JNull", reg=key), unkeyed),
        # ⛔ EVERY EVENT OWED WAS PAID IN THIS ONE PAYMENT, so the thing has taken them all
        place.op("ToDyn", dst=wrapped, src=happened),
        place.op("Call3", dst=told, fun=place.named_function(TELL),
                 arg0=mine, arg1=key, arg2=wrapped),
        unkeyed + ":", place.op("Label"),
    ]


def losing(place):
    """That place with its refusals sent to a write-off, and the place itself to leave by after."""
    lost = copy(place)
    lost.refused = place.here(LOST_AT)
    return lost, place


def emit_lost(place, losing_place, asked):
    """`asked`, and where it refuses: this thing's count taken to what happened; it never pays."""
    past = place.here("nothing refused it")
    # inside a gate of its own, the road writes it off: the function only says it was lost
    off = place._hands.get(LOST_AT) or (lambda: _written_off(place) + [
        (place.op("JAlways"), place.refused)])
    return asked + [(place.op("JAlways"), past), losing_place.refused + ":", place.op("Label")] + (
        off() + [past + ":", place.op("Label")])


def emit_written_off(place, lost):
    """Where the road's gate said `lost`: this thing's count written off, then the road refuses."""
    if any(part not in place.row for part in LOSING_READS):
        return []
    two, past = place.scratch_like(lost), place.here("it was not lost")
    return [place.op("Int", dst=two, ptr=place.number(2)),
            (place.op("JNotEq", a=lost, b=two), past)] + _written_off(place) + [
        (place.op("JAlways"), place.refused), past + ":", place.op("Label")]


def _written_off(place):
    """This thing's count for the row's application taken to what has happened; nothing else."""
    # a road that hands no application has nothing to write off
    if any(part not in place.row for part in LOSING_READS):
        return []
    holds, mine, key = place.scratch_of(MAP), place.scratch_of(MAP), place.scratch_return(READ)
    got, told = place.scratch_return(READ), place.scratch_return(TELL)
    accumulates = place.scratch_like(place.row[ONLY_ON_AN_EVENT])
    none = place.scratch_like(place.row[NAMES_NO_TRIGGER])
    nothing = place.here("it was owed nothing")
    weighs = place.here("this row is weighed by its event")
    return [
        place.op("Int", dst=accumulates, ptr=place.number(1)),
        (place.op("JEq", a=place.row[ONLY_ON_AN_EVENT], b=accumulates), weighs),
        place.op("Int", dst=none, ptr=place.number(NOTHING_NAMED)),
        (place.op("JEq", a=place.row[NAMES_NO_TRIGGER], b=none), nothing),
        weighs + ":", place.op("Label"),
        place.op("GetGlobal", **{"dst": holds, "global": place.slot(SLOT)}),
        (place.op("JNull", reg=holds), nothing),
        place.op("Call2", dst=got, fun=place.named_function(READ), arg0=holds, arg1=THE_THING),
        place.op("SafeCast", dst=mine, src=got),
        (place.op("JNull", reg=mine), nothing),
    ] + _whose_key(place, key, nothing, saying=False) + [
        place.op("Call2", dst=got, fun=place.named_function(READ), arg0=holds, arg1=key),
        (place.op("JNull", reg=got), nothing),
        place.op("Call3", dst=told, fun=place.named_function(TELL),
                 arg0=mine, arg1=key, arg2=got),
    ] + place.said(SAYS_ITS_WAY, lambda: place.said_now(WRITTEN_OFF)) + [
        nothing + ":", place.op("Label"),
    ]


def emit_at_a_new_world(bc, fn, into):
    """NOT A STAGE. EVERY map keyed by the application goes when a new state begins."""
    every = every_slot(bc)
    guard(every, "there is no place for any of these maps yet -- install goes first")
    # ONE place emptied once serves them all: only the first emptying keeps its `Null`
    emptied = [emit_empty(bc, fn, slot(bc, name), into) for name in every]
    return emptied[0] + [op for each in emptied[1:] for op in each[1:]]


def check_what_we_borrow(bc):
    """Reading a count back and telling one agree about what a key is."""
    kind = kind_named(bc, MAP)
    for what in (READ, TELL, MAKE, ASK):
        guard(gv(list(function_named(bc, what).regs)[0]) == kind,
              "%s does not take one of our maps first" % what)


def install(bc):
    """Make the place the counts live in, and check what this borrows."""
    make_slot(bc)
    make_slot(bc, CLOSED)
    make_slot(bc, ACTED)
    make_slot(bc, FIRED_AT)
    make_slot(bc, NEWEST)
    make_slot(bc, NEWEST_AT)
    _the_mask(bc)
    slot_global(bc, COVERS, returns_type(function_named(bc, READ), READ))
    check_what_we_borrow(bc)
    beginning = deepcopy(clear_site(bc))
    beginning.regs.append(deepcopy(register_like(bc, kind_named(bc, MAP))))
    beginning.nregs.value = len(beginning.regs)
    emptying = emit_at_a_new_world(bc, beginning, len(beginning.regs) - 1)
    return ("MARK: `%s` is a slot of its own holding a %s -- one COUNT per application of what "
            "HAPPENED, raised at a trigger's own place, and under each thing a second count of "
            "what IT took, advanced past the last act; %d instruction(s) empty every one of them "
            "when a new world begins" % (SLOT, MAP, len(emptying)))
