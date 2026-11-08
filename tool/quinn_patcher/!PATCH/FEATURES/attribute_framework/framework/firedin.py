#!/usr/bin/env python3
"""The place a trigger fired in, asked every narrowing spelled after the trigger; one for all."""
from tools.project import guard
from framework import columns
from framework.foreignwalk import EVERY_ONE, FROM_FOREIGN, HOW_MANY, WHOSE_RULE
from framework.narrowmatch import AFTER_THE_TRIGGER, SUBJECT as FOUND

# what a trigger's file names: the field its place is on, and the question who holds that place
FIRED_IN_BY, HELD_BY_BY = "FIRED_IN", "FIRED_IN_HELD_BY"
# and, when that place may be a building, the building's own question (its `_owner` is empty)
BUILDING_HELD_BY_BY = "FIRED_IN_BUILDING_HELD_BY"
# a trigger with two things names them (`OnKill`); a word asks one by name (`By`), and its holder
SIDES_BY, SIDE_BY, OWNER_OF = "SIDES", "SIDE", "who holds %s"
# the row's `val`, under the name a weighed narrowing's `AT_LEAST` reads it by
VALUE = "value"
# everything a raise hands over: the four sets spelled after the trigger, and what they ask with
READS = ("numbers", columns.PART_FOR_NARROWING, columns.PART_FOR_COUNT, VALUE,
    WHOSE_RULE, FROM_FOREIGN, EVERY_ONE, HOW_MANY)
# and, from a raise whose event has another side (a treaty's partner), that faction
PARTNER = "the trigger's other side"
# what the place's gate is called, which is what makes its places its own
ASKING = "where `%s` fired"
# AT THE ACT: the row's application (its trigger's place is kept under it), the road's thing
APPLICATION, THING = "source.application", "ticked"
PLACE_READS = (THING, APPLICATION)
# what an act's place may be, each by the game's class name: a thing on the map, a region, a faction
ENTITY, ZONE, FACTION = "ent.Entity", "ent.Zone", "ent.Faction"


def emit_where(place, into):
    """At an act, `into` is where its trigger last fired, else the road's thing, else null."""
    from framework.mark import FIRED_AT
    from framework.oneshot import MAP
    from framework.parsed import READ
    road = place.here("no place is kept for this trigger")
    found = place.here("a place is in hand")
    holds = place.scratch_of(MAP)
    # a faction is no place (a day began for it): the road's own thing is where it happened
    _faction, as_faction = place.narrowed(into, place.scratch_of(FACTION), goes_to=found)
    return [
        place.op("GetGlobal", **{"dst": holds, "global": place.slot(FIRED_AT)}),
        (place.op("JNull", reg=holds), road),
        place.op("Call2", dst=into, fun=place.named_function(READ), arg0=holds,
                 arg1=place.row[APPLICATION]),
        (place.op("JNull", reg=into), road)] + as_faction + [
        road + ":", place.op("Label"),
        place.op("UnsafeCast", dst=into, src=place.row[THING]),
        found + ":", place.op("Label")]


def emit_each_kind(place, into, kinds, otherwise):
    """Per `(kind, body)`: `into` as that kind handed to `body(it, done)`; none of them, on."""
    done, none = place.here("the place is used"), place.here("no place at all")
    out = [(place.op("JNull", reg=into), none)]
    for kind, body in kinds:
        other = place.here("the place is no %s" % kind)
        it, narrowing = place.narrowed(into, place.scratch_of(kind), goes_to=other)
        out += narrowing + body(it, done) + [other + ":", place.op("Label")]
    return out + [none + ":", place.op("Label")] + otherwise + [done + ":", place.op("Label")]


def declared(word):
    """The field a trigger's place is on, and who holds it, both off the trigger's own file."""
    on, held_by = getattr(word, FIRED_IN_BY, None), getattr(word, HELD_BY_BY, None)
    guard(on and held_by, "`%s` names no place it fires in, or nobody holding it" % word.WORD)
    return on, held_by


def sided(place, word):
    """`place`, or, for a word asking one side of a two-sided trigger (`By`), that side's."""
    from copy import copy
    from framework.scopematch import PAYEE
    side = getattr(word, SIDE_BY, None)
    if not side or OWNER_OF % side not in place.row:
        return place
    # ⛔ A COPY OF THE SAME ROW: a function made apart learns what it reads off its reads
    out = copy(place)
    out.row = copy(place.row)
    out.row[PAYEE] = place.row[OWNER_OF % side]
    return out


def _held(place, word, thing, owner, tag):
    """`owner` holds whoever holds `thing`, or nothing; a building asked its own question."""
    unheld = place.here("%s: nobody holds it" % tag)
    _on, held_by = declared(word)
    # the question is a method, so what it is asked of is the class its name is under
    held, as_held = place.narrowed(thing, place.scratch_of(held_by.rsplit(".", 1)[0]),
                                   goes_to=unheld)
    return [place.op("Null", dst=owner)] + _a_building(
        place, word, thing, owner, unheld) + as_held + [
        place.op("Call1", dst=owner, fun=place.named_function(held_by), arg0=held),
        unheld + ":", place.op("Label")]


def _a_building(place, word, thing, owner, asked):
    """A building in the place: its own question answers whose it is, then on to `asked`."""
    held_by = getattr(word, BUILDING_HELD_BY_BY, None)
    if held_by is None:
        return []
    other = asked + ", no building"
    building, as_building = place.narrowed(thing, place.scratch_of(held_by.rsplit(".", 1)[0]),
                                           goes_to=other)
    return as_building + [
        place.op("Call1", dst=owner, fun=place.named_function(held_by), arg0=building),
        (place.op("JAlways"), asked),
        other + ":", place.op("Label")]


def emit(bc, fn, word, row, thing, refused):
    """Past this, `thing` answers every narrowing the row spelled after `word`; else `refused`."""
    from framework.parsed import NUMBERS, NUMBERS_PART, loaded
    from framework.pipeline import Place, hands_for
    from framework.scopematch import PAYEE, _the_narrowings_asked
    guard(set(READS) <= set(row), "a raise hands no %s" % sorted(set(READS) - set(row)))
    _on, held_by = declared(word)
    asked = dict(row, **{NUMBERS_PART: row[NUMBERS]})
    place = Place(name=ASKING % word.WORD, row=asked, notes={}, note=None, kept=None,
                  store=None, refused=refused, hands=hands_for(bc, fn))
    # the narrowings spelled after the trigger, read under the names the gate reads them by
    place.looked["renamed"] = {name: AFTER_THE_TRIGGER % name for name, _kind in FOUND}
    asked[PAYEE] = place.scratch_return(held_by)
    holding = _held(place, word, thing, asked[PAYEE], "the place")
    # a two-sided trigger's things, each held by someone, for a word asking one side (`By`)
    for side in [s for s in getattr(word, SIDES_BY, ()) if s in row]:
        asked[OWNER_OF % side] = place.scratch_return(held_by)
        holding += _held(place, word, row[side], asked[OWNER_OF % side], side)
    # ⛔ NO SET READ PER WORD HERE: the chain of narrowing checks passes a row that spelled none
    return loaded(place, holding + _the_narrowings_asked(place, thing))
