#!/usr/bin/env python3
"""Every other faction's store, visited on a thing's own pass; only worded rows are offered."""
from tools.project import gv
from tools.hlcode import field_by_name, kind_named, number, template, written
from framework.parsed import a_new_place

# how the game reaches its own state (read off `ent.Entity.isAtWarWith`): class, game, state
THE_CLASS = "$Game"
THE_GAME = "inst"
THE_STATE = "state"
# and what the state keeps every faction in
EVERY_FACTION = "factions"
# the state's own kind, taken from the file that already names it for the load guard
from framework.loadguard import READY_ENTITY as STATE_KIND
# what a row carries to say which kind of pass found it. Nothing is a pass of the thing's own
FROM_FOREIGN = "foreign"
# and WHICH FACTION the row belongs to: on a foreign pass the rule is theirs, not the payee's
WHOSE_RULE = "whose_rule"
from framework.ownermatch import ASKED_AS as ASKED_AS_FACTION  # noqa: E402
# AND THE GAME'S OWN LIST OF FACTIONS, handed to a stage already open (for `ForAll`)
EVERY_ONE = "every_faction"
HOW_MANY = "how_many_factions"
OPENED = (EVERY_ONE, HOW_MANY)


def _op(bc, name, **operands):
    return written(template(bc, name), **operands)


# instrument, once per world: a carrier's pass met one another faction owns, read as foreign
FOREIGN_CARRIER = "SPINE the `%s` road read another faction's carrier as foreign"


def emit_theirs(bc, fn, op, word, where, theirs, mine, whose_rule, their_owner, flag):
    """A carrier another faction owns is read as FOREIGN, the rule its owner's; ours as own."""
    from framework import sayonce
    ours = "%s: the %s carrier is my own faction's" % (word, where)
    same = gv(list(fn.regs)[whose_rule]) == gv(list(fn.regs)[their_owner])
    return ([(op("JEq", a=theirs, b=mine), ours),
             op("Int", dst=flag, ptr=number(bc, 1)),
             op("Mov" if same else "UnsafeCast", dst=whose_rule, src=their_owner)]
            + sayonce.emit(bc, fn, FOREIGN_CARRIER % word, even_when_quiet=True)
            + [ours + ":", op("Label")])


def the_global_of(bc, class_name):
    """The one global holding a named class, found BY KIND rather than by its number."""
    want = kind_named(bc, class_name)
    holding = [i for i, g in enumerate(bc.global_types) if gv(g) == want]
    if len(holding) != 1:
        from tools.project import guard
        guard(False, "%d global(s) hold `%s`, and the game keeps exactly one"
              % (len(holding), class_name))
    return holding[0]


def the_global(bc):
    """The one global holding the game's own class."""
    return the_global_of(bc, THE_CLASS)


def the_list_kind(bc):
    """What the state keeps its factions IN, off the field; ⛔ not the kind our own lists are."""
    _at, holds = field_by_name(bc, kind_named(bc, STATE_KIND), EVERY_FACTION, "the state")
    return gv(holds)


# ⛔ THE GAME'S LIST IS THREE DEEP (proxy, dynamic array, base), every step by name
THE_INNER = "array"
from framework.tray import ARRAY_OF_ENTRIES as OBJECTS_IN, COUNT_ON as HOW_LONG


def emit_the_length(bc, fn, holds, into, past):
    """How many factions there are, walked down the game's own three layers by name."""
    _at, dyn_kind = field_by_name(bc, the_list_kind(bc), THE_INNER, "the faction list")
    dyn_at, _d = field_by_name(bc, the_list_kind(bc), THE_INNER, "the faction list")
    dyn = a_new_place(bc, fn, gv(dyn_kind))
    base_at, base_kind = field_by_name(bc, gv(dyn_kind), THE_INNER, "the dynamic array")
    base = a_new_place(bc, fn, gv(base_kind))
    long_at, _l = field_by_name(bc, gv(base_kind), HOW_LONG, "the array base")
    return [
        _op(bc, "Field", dst=dyn, obj=holds, field=dyn_at),
        (_op(bc, "JNull", reg=dyn), past),
        _op(bc, "Field", dst=base, obj=dyn, field=base_at),
        (_op(bc, "JNull", reg=base), past),
        _op(bc, "Field", dst=into, obj=base, field=long_at),
    ]


def emit_the_faction_at(bc, fn, holds, which, into, past):
    """The faction at that place in the game's list, as a thing a store can be read off."""
    dyn_at, dyn_kind = field_by_name(bc, the_list_kind(bc), THE_INNER, "the faction list")
    dyn = a_new_place(bc, fn, gv(dyn_kind))
    base_at, base_kind = field_by_name(bc, gv(dyn_kind), THE_INNER, "the dynamic array")
    base = a_new_place(bc, fn, gv(base_kind))
    objects = a_new_place(bc, fn, kind_named(bc, OBJECTS_IN))
    held_at, held_kind = field_by_name(bc, kind_named(bc, OBJECTS_IN), THE_INNER, "an object array")
    backing = a_new_place(bc, fn, gv(held_kind))
    got = a_new_place(bc, fn, kind_named(bc, "Dyn"))
    return [
        _op(bc, "Field", dst=dyn, obj=holds, field=dyn_at),
        (_op(bc, "JNull", reg=dyn), past),
        _op(bc, "Field", dst=base, obj=dyn, field=base_at),
        (_op(bc, "JNull", reg=base), past),
        _op(bc, "UnsafeCast", dst=objects, src=base),
        _op(bc, "Field", dst=backing, obj=objects, field=held_at),
        (_op(bc, "JNull", reg=backing), past),
        _op(bc, "GetArray", dst=got, array=backing, index=which),
        _op(bc, "UnsafeCast", dst=into, src=got),
    ]


def the_backing_kind(bc):
    """What the faction list's own object array holds its members IN, off the field itself."""
    _at, held_kind = field_by_name(bc, kind_named(bc, OBJECTS_IN), THE_INNER, "an object array")
    return gv(held_kind)


def emit_the_backing(bc, fn, holds, into, count_into, past):
    """The faction list UNWRAPPED ONCE a pass (array, count), handed to stages as row parts."""
    dyn_at, dyn_kind = field_by_name(bc, the_list_kind(bc), THE_INNER, "the faction list")
    dyn = a_new_place(bc, fn, gv(dyn_kind))
    base_at, base_kind = field_by_name(bc, gv(dyn_kind), THE_INNER, "the dynamic array")
    base = a_new_place(bc, fn, gv(base_kind))
    long_at, _l = field_by_name(bc, gv(base_kind), HOW_LONG, "the array base")
    held_at, _h = field_by_name(bc, kind_named(bc, OBJECTS_IN), THE_INNER, "an object array")
    objects = a_new_place(bc, fn, kind_named(bc, OBJECTS_IN))
    return [
        _op(bc, "Field", dst=dyn, obj=holds, field=dyn_at),
        (_op(bc, "JNull", reg=dyn), past),
        _op(bc, "Field", dst=base, obj=dyn, field=base_at),
        (_op(bc, "JNull", reg=base), past),
        _op(bc, "Field", dst=count_into, obj=base, field=long_at),
        _op(bc, "UnsafeCast", dst=objects, src=base),
        _op(bc, "Field", dst=into, obj=objects, field=held_at),
        (_op(bc, "JNull", reg=into), past),
    ]


def emit_unwrapped(place, holds, past):
    """A game list a stage holds, as (array, count, the way there); nothing there goes to `past`."""
    dyn_at, dyn = place.field_of(holds, THE_INNER)
    base_at, base = place.field_of(dyn, THE_INNER)
    objects = place.scratch_of(OBJECTS_IN)
    long_at, count = place.field_of(OBJECTS_IN, HOW_LONG)
    held_at, held = place.field_of(OBJECTS_IN, THE_INNER)
    return held, count, [
        (place.op("JNull", reg=holds), past),
        place.op("Field", dst=dyn, obj=holds, field=dyn_at),
        (place.op("JNull", reg=dyn), past),
        place.op("Field", dst=base, obj=dyn, field=base_at),
        (place.op("JNull", reg=base), past),
        place.op("UnsafeCast", dst=objects, src=base),
        place.op("Field", dst=count, obj=objects, field=long_at),
        place.op("Field", dst=held, obj=objects, field=held_at),
        (place.op("JNull", reg=held), past)]


def counter_for(word):
    """The way one picked faction's count of `word` is written: per holder, or straight."""
    from framework.membercount import each_of
    from framework.multmatch import emit_counted_on
    return emit_counted_each if each_of(word) else emit_counted_on


def _reached(place, at, hops, refused):
    """The way from `at` along `hops`, each step a field or a getter; a missing one leaves."""
    out = []
    for hop in hops:
        if "." in hop:
            got = place.scratch_return(hop)
            out.append(place.op("Call1", dst=got, fun=place.named_function(hop), arg0=at))
        else:
            where, got = place.field_of(at, hop)
            out.append(place.op("Field", dst=got, obj=at, field=where))
        out.append((place.op("JNull", reg=got), refused))
        at = got
    return out, at


def emit_counted_each(place, word, faction, total, _named=None):
    """Each holder's own list's length added to `total` (`PerAllBuilding`); no list, passed."""
    from framework.membercount import each_of, inner_hops
    from framework.multmatch import NOTHING_SPELLED, declared, only_of
    hops, inner = declared(word)[1], inner_hops(word)
    out, listed = _reached(place, faction, hops[:len(hops) - len(inner)], place.refused)
    held, length, unwrapping = emit_unwrapped(place, listed, place.refused)
    index, one = place.scratch_like(length), place.scratch_of("Dyn")
    holder = place.scratch_of(each_of(word))
    walking, past, counted = (place.here("%s, %s" % (word, what)) for what in (
        "the next holder", "past that holder", "every holder counted"))
    out += unwrapping + [
        place.op("Int", dst=index, ptr=place.number(NOTHING_SPELLED)),
        walking + ":", place.op("Label"),
        (place.op("JSGte", a=index, b=length), counted),
        place.op("GetArray", dst=one, array=held, index=index),
        place.op("Incr", dst=index),
        (place.op("JNull", reg=one), past),
        place.op("UnsafeCast", dst=holder, src=one)]
    reaching, store = _reached(place, holder, inner, past)
    members, size, opening = emit_unwrapped(place, store, past)
    tally = _each_counted(place, word, (members, size), total, past) if only_of(word) else [
        place.op("Add", dst=total, a=total, b=size)]
    # ⛔ ONE jump back per walk: a holder with no store goes forward to the shared turn
    return out + reaching + opening + tally + [
        past + ":", place.op("Label"),
        (place.op("JAlways"), walking),
        counted + ":", place.op("Label")]


def _each_counted(place, word, listed, total, past):
    """Each member of one holder's list added to `total` when it answers its word's questions."""
    from copy import copy
    from framework.membercount import emit_asked, entity_of
    from framework.multmatch import NOTHING_SPELLED, only_of
    held, size = listed
    index, one = place.scratch_like(size), place.scratch_of("Dyn")
    member = place.scratch_of(entity_of(word))
    walking, skip = (place.here("%s, %s" % (word, what)) for what in (
        "the next member held", "this member held not counted"))
    asking = copy(place)
    asking.refused = skip
    return [place.op("Int", dst=index, ptr=place.number(NOTHING_SPELLED)),
            walking + ":", place.op("Label"),
            (place.op("JSGte", a=index, b=size), past),
            place.op("GetArray", dst=one, array=held, index=index),
            place.op("Incr", dst=index),
            (place.op("JNull", reg=one), skip),
            place.op("UnsafeCast", dst=member, src=one)] + emit_asked(
        asking, member, only_of(word)) + [place.op("Incr", dst=total),
                                          skip + ":", place.op("Label"),
                                          (place.op("JAlways"), walking)]


def emit_the_list(bc, fn, into, past):
    """Put the game's list of factions in `into`, or leave at `past` when there is no game yet."""
    got = a_new_place(bc, fn, kind_named(bc, THE_CLASS))
    # ⛔ `field_by_name` HANDS BACK A NUMBER AND A KIND, NEVER A PLACE
    game_at, game_kind = field_by_name(bc, kind_named(bc, THE_CLASS), THE_GAME, "the game's class")
    game = a_new_place(bc, fn, gv(game_kind))
    state_at, state_kind = field_by_name(bc, gv(game_kind), THE_STATE, "the running game")
    state = a_new_place(bc, fn, gv(state_kind))
    list_at, _holds = field_by_name(bc, kind_named(bc, STATE_KIND), EVERY_FACTION, "the state")
    return [
        _op(bc, "GetGlobal", **{"dst": got, "global": the_global(bc)}),
        (_op(bc, "JNull", reg=got), past),
        _op(bc, "Field", dst=game, obj=got, field=game_at),
        (_op(bc, "JNull", reg=game), past),
        _op(bc, "Field", dst=state, obj=game, field=state_at),
        (_op(bc, "JNull", reg=state), past),
        _op(bc, "Field", dst=into, obj=state, field=list_at),
        (_op(bc, "JNull", reg=into), past),
    ]


def emit_the_one_at(bc, fn, holds, which, into, backing_at, backing_kind):
    """The faction at that place in the list, as a thing a store can be read off."""
    backing = a_new_place(bc, fn, backing_kind)
    got = a_new_place(bc, fn, kind_named(bc, "Dyn"))
    return [_op(bc, "Field", dst=backing, obj=holds, field=backing_at),
            _op(bc, "GetArray", dst=got, array=backing, index=which),
            _op(bc, "UnsafeCast", dst=into, src=got)]
