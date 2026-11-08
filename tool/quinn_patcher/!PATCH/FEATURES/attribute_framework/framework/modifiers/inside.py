"""`Inside` -- a trailing word (`PerTBuilding2_Inside`): only those in the row's own region."""
from tools.project import guard
from framework.trailing import NOTHING_TO_NAME, NOTHING_TRAILS_IT, VAL_NOT_ITS
WORD = "Inside"
# its family on the catalogue
KIN = 'Region'
# the editor text it adds as its counting word's `{more}`
PHRASE = " in this region"
# nothing is named: the row's own region is the one meant
TARGET = "never"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), NOTHING_TRAILS_IT
NEEDS = ("a building count", "a unit count")
# it narrows that count: only the members standing where the row's own thing stands
NARROWS_TOO = NEEDS
# asked by this file's own `emit`, of each member, against the row's own thing
EMITS = "framework.modifiers.inside"
READS_TOO = ("holder",)
# `NotInside`: `Not` in front counts every one standing anywhere else
TURNED_AFTER = ""
TURNED_PHRASE = " outside this region"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
NAMED_NONE = NOTHING_TO_NAME
VAL_NONE = VAL_NOT_ITS
# a region is its own place (an object, never an entity); a village or building stands in one
ZONE, ENTITY, ITS_ZONE = "ent.Zone", "ent.Entity", "ent.Entity.get_zone"
# what the row's own thing may be, and why a row under any other scope is never offered it
HELD_BY = (ZONE, "ent.Structure", "ent.BaseBuilding")
HELD_WHY = "only a region, or a place standing in one, has a region of its own"


def _region(place, thing, into, tag):
    """`into` holds the region `thing` stands in, itself when a region; none is refused."""
    found, not_zone = (place.here("%s, %s" % (tag, w)) for w in ("found", "not a region"))
    region, as_region = place.narrowed(thing, place.scratch_of(ZONE), goes_to=not_zone)
    entity, as_entity = place.narrowed(thing, place.scratch_of(ENTITY))
    return as_region + [place.op("Mov", dst=into, src=region), (place.op("JAlways"), found),
                        not_zone + ":", place.op("Label")] + as_entity + [
        place.op("Call1", dst=into, fun=place.named_function(ITS_ZONE), arg0=entity),
        found + ":", place.op("Label"),
        (place.op("JNull", reg=into), place.refused)]


def _a_place(place, own, tag):
    """Past this, the row's own thing is of a kind `HELD_BY` names; else refused."""
    placed, out = place.here("%s, a place" % tag), []
    for kind in HELD_BY[:-1]:
        other = place.here("%s, its own not %s" % (tag, kind))
        out += place.narrowed(own, place.scratch_of(kind), goes_to=other)[1] + [
            (place.op("JAlways"), placed), other + ":", place.op("Label")]
    return out + place.narrowed(own, place.scratch_of(HELD_BY[-1]))[1] + [
        placed + ":", place.op("Label")]


def emit(place, holder, tag):
    """Past this, the member stands in the region the row's own thing stands in; else refused."""
    from framework.scopematch import HOLDER
    own = place.row.get(HOLDER)
    guard(own is not None, "`%s` is asked where the row's own thing is not in hand" % WORD)
    mine, theirs = place.scratch_of(ZONE), place.scratch_of(ZONE)
    return _a_place(place, own, tag + ", its own") + _region(
        place, own, mine, tag + ", its own region") + _region(place, holder, theirs, tag) + [
        (place.op("JNotEq", a=mine, b=theirs), place.refused)]
