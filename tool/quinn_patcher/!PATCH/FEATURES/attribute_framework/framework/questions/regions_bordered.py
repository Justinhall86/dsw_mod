"""Regions bordered: how many regions of an owner's border the thing's (`BordersRegions`)."""
from framework.compmatch import emit_compared
from framework.questions.borders_owner import (  # noqa: F401
    ASKED_OF, ASKS, BARE_ASKS_ITSELF, FACTION, HELD_BY, INNER, ITS_KIND, LENGTH, MARKED_SPELLING,
    NARROWS_TOO, NEIGHBOURS, NOT_BEFORE_THE_OWNER, OBJECTS, OWNED_ZONES, OWNER_AFTER, OWNERS_PICK,
    ZONE, _the_list, _zone_of)
from framework.trailing import ASKS_ITS_OWN

QUESTION = "regions bordered"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS = ("a comparison",)
NEEDS, NEEDS_NONE = (), ASKS_ITS_OWN
# the owner word and the mark go straight after this, inside the spelling: `BordersEnemyRegions`
OWNER_STEM = "Borders"
# a region's neighbours; a faction's regions, their neighbours, the earlier ones and theirs
WALKS = 1 + 4
# compared with the row's `val`: at or above keeps it, unless a comparison word says otherwise
AT_LEAST = "value"
WEIGHED_BY = "framework.questions.regions_bordered"

# said while `respath` is on, one per way out of the question
ENOUGH = "SPINE `%s` passed: enough neighbouring regions are held by the faction picked or named"
WRONG = "SPINE `%s` refused: nothing picked or named, no region, or the wrong number bordered"


def _saying(place, text):
    """One line while `respath` is on; nothing otherwise."""
    return place.said("respath", lambda: place.said_now(text))


def _each(place, back, many, tag, body, over):
    """`body(region, following)` per region of a game array, then on to `over`."""
    at, step = place.scratch_of("I32"), place.scratch_of("I32")
    got, item = place.scratch_of("Dyn"), place.scratch_of(ZONE)
    loop, following = place.here("%s, the next" % tag), place.here("%s, past this one" % tag)
    return [place.op("Int", dst=at, ptr=place.number(0)),
            place.op("Int", dst=step, ptr=place.number(1)),
            loop + ":", place.op("Label"),
            (place.op("JSGte", a=at, b=many), over),
            place.op("GetArray", dst=got, array=back, index=at),
            place.op("Add", dst=at, a=at, b=step),
            (place.op("JNull", reg=got), following),
            place.op("UnsafeCast", dst=item, src=got),
            ] + body(item, following) + [
            following + ":", place.op("Label"),
            (place.op("JAlways"), loop)]


def _neighbours(place, zone, tag, body, over):
    """`body(region, following)` per region next to `zone`, then on to `over`."""
    near_at, near = place.field_of(ZONE, NEIGHBOURS)
    many_at, many = place.field_of(OBJECTS, LENGTH)
    back_at, back = place.field_of(OBJECTS, INNER)
    return [(place.op("JNull", reg=zone), over),
            place.op("Field", dst=near, obj=zone, field=near_at),
            (place.op("JNull", reg=near), over),
            place.op("Field", dst=many, obj=near, field=many_at),
            place.op("Field", dst=back, obj=near, field=back_at),
            (place.op("JNull", reg=back), over),
            ] + _each(place, back, many, tag, body, over)


def _held(place, region, kind, following, across):
    """Past this, `region` is held by that kind and not by `across`; else to `following`."""
    held_at, held = place.field_of(ZONE, HELD_BY)
    kind_at, its = place.field_of(FACTION, ITS_KIND)
    # ⛔ a BORDER: land held by whoever holds the region looked from is never bordered
    return [place.op("Field", dst=held, obj=region, field=held_at),
            (place.op("JNull", reg=held), following),
            (place.op("JEq", a=held, b=across), following),
            place.op("Field", dst=its, obj=held, field=kind_at),
            (place.op("JNotEq", a=its, b=kind), following)]


def _around_a_region(place, zone, kind, total, over):
    """Each region next to `zone` held by that kind, counted into `total`; then `over`."""
    held_at, across = place.field_of(ZONE, HELD_BY)

    def one(region, following):
        return _held(place, region, kind, following, across) + [place.op("Incr", dst=total)]
    return [(place.op("JNull", reg=zone), over),
            place.op("Field", dst=across, obj=zone, field=held_at)] + _neighbours(
        place, zone, "%s, a neighbour" % QUESTION, one, over)


def _around_a_faction(place, faction, kind, total, over):
    """Each region held by that kind next to any of the faction's, counted ONCE; then `over`."""
    zones_at, zones = place.field_of(FACTION, OWNED_ZONES)
    objects, many = place.scratch_of(OBJECTS), place.scratch_of("I32")
    back_at, back = place.field_of(OBJECTS, INNER)

    def mine(zone, following_mine):
        def theirs(region, following):
            fresh = place.here("%s, not next to an earlier region" % QUESTION)

            # ⛔ ONCE: a region next to an earlier region of the faction's was counted there
            def earlier(other, following_other):
                def same(near, following_near):
                    return [(place.op("JNotEq", a=near, b=other), following_near),
                            (place.op("JAlways"), following)]
                return [(place.op("JEq", a=other, b=zone), fresh)] + _neighbours(
                    place, region, "%s, its neighbour" % QUESTION, same, following_other)
            return _held(place, region, kind, following, faction) + _each(
                place, back, many, "%s, an earlier region" % QUESTION, earlier, fresh) + [
                fresh + ":", place.op("Label"),
                place.op("Incr", dst=total)]
        return _neighbours(place, zone, "%s, a faction region's neighbour" % QUESTION, theirs,
                           following_mine)
    return [place.op("Field", dst=zones, obj=faction, field=zones_at),
            (place.op("JNull", reg=zones), over)] + _the_list(
                place, zones, objects, many, over) + [
        place.op("Field", dst=back, obj=objects, field=back_at),
        (place.op("JNull", reg=back), over),
    ] + _each(place, back, many, "%s, the faction's region" % QUESTION, mine, over)


def emit(place, holder, named, word, compared, picked=None):
    """Past this, `val` regions by the holder's are held by `picked`, or the faction `named`."""
    least = place.row.get(AT_LEAST)
    if least is None:
        return [(place.op("JAlways"), place.refused)]
    name = word.WORD
    short, counted, passed, not_faction, have = (place.here("%s, %s" % (name, what)) for what in (
        "wrong count", "counted", "enough", "not a faction", "its region in hand"))
    # bare and unmarked, `named` is empty and nothing is bordered
    if picked is None:
        kind, reading = named, [(place.op("JNull", reg=named), short)]
    else:
        kind_at, kind = place.field_of(FACTION, ITS_KIND)
        reading = [place.op("Field", dst=kind, obj=picked, field=kind_at),
                   (place.op("JNull", reg=kind), short)]
    total = place.scratch_of("I32")
    weighed, made = total, []
    if place.kind_of(total) != place.kind_of(least):
        weighed = place.scratch_like(least)
        made = [place.op("ToSFloat", dst=weighed, src=total)]
    faction, as_faction = place.narrowed(holder, place.scratch_of(FACTION), goes_to=not_faction)
    zone = place.scratch_of(ZONE)
    return reading + [place.op("Int", dst=total, ptr=place.number(0))] + as_faction + (
        _around_a_faction(place, faction, kind, total, counted)) + [
        not_faction + ":", place.op("Label")] + _zone_of(
            place, holder, zone, have, short, QUESTION) + [
        have + ":", place.op("Label")] + _around_a_region(place, zone, kind, total, counted) + [
        counted + ":", place.op("Label"),
    ] + made + emit_compared(place, weighed, least, short, compared, name) + _saying(
        place, ENOUGH % name) + [
        (place.op("JAlways"), passed),
        short + ":", place.op("Label")] + _saying(place, WRONG % name) + [
        (place.op("JAlways"), place.refused),
        passed + ":", place.op("Label")]
