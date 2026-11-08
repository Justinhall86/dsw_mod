"""Region borders an owner's: whether the thing's region borders that owner's (`Borders`)."""
from framework.trailing import ASKS_ITS_OWN, NO_FAMILY_TRAILER
QUESTION = "region borders an owner's"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), NO_FAMILY_TRAILER
NEEDS, NEEDS_NONE = (), ASKS_ITS_OWN
# `BordersTFaction` names the faction in a target column, in place of an owner word
MARKED_SPELLING = "TFaction"
# the game's own question, walked here as it walks it, on whatever region the holder stands in
ASKS = "$HStructure.hasAdjacentRegionOwnedBy"
ASKED_OF = "ent.Structure"
# what it is handed for a picked faction: the faction's own kind, read by name
FACTION, ITS_KIND = "ent.Faction", "kind"
ZONE, NEIGHBOURS, HELD_BY = "ent.Zone", "neighbors", "owner"
ENTITY, ITS_ZONE = "ent.Entity", "ent.Entity.get_zone"
# a building stands in its village's region
BUILDING, ITS_VILLAGE = "ent.BaseBuilding", "structure"
# a faction borders when any region it owns does
OWNED_ZONES = "zones"
# an agent stands in a region only while supervising one, or posted to a sietch
AGENT, POSTED, POSTINGS = "logic.faction.Agent", "assignment", "EAgentAssignment"
SUPERVISES, IN_SIETCH = "RegionSupervision", "Sietch"
# the game's lists, three deep, every step by name
PROXY, INNER, OBJECTS, LENGTH = "hxbit.ArrayProxyData", "array", "hl.types.ArrayObj", "length"
# each question walks back over a region's neighbours, or a faction's regions and theirs
WALKS = 3
# `val` is never read: the gate opens `WEIGHED_BY` only for a word declaring `AT_LEAST`
AT_LEAST = "value"
WEIGHED_BY = "framework.questions.borders_owner"
# the owner word picks the factions bordered, judged against the row's writer; bare is refused
OWNERS_PICK = True
# and it is written AFTER the word, as its object: `BordersEnemy`, never `EnemyBorders`
OWNER_AFTER = True
# with no owner word it is asked once, of the faction its column names
BARE_ASKS_ITSELF = True
# `Not` may sit before its owner word: `BordersNotEnemy` asks every faction it does not pick
NOT_BEFORE_THE_OWNER = True
# the counts of things standing in a region; its owner word picks the neighbour each is asked of
NARROWS_TOO = ("a unit count", "a building count", "a structure count", "an agent count",
               "a region count", "a faction count")

# said while `respath` is on, one per way out of the question
BORDERS = "SPINE `%s` passed: a neighbouring region is held by the faction picked or named"
APART = "SPINE `%s` refused: nothing picked or named, no region to stand in, or no such neighbour"


def _saying(place, text):
    """One line while `respath` is on; nothing otherwise."""
    return place.said("respath", lambda: place.said_now(text))


def _the_list(place, proxy, objects, many, empty):
    """One of the game's own lists unwrapped: its object array and its length."""
    dyn_at, dyn = place.field_of(PROXY, INNER)
    base_at, base = place.field_of(dyn, INNER)
    long_at, _l = place.field_of(base, LENGTH)
    return [place.op("Field", dst=dyn, obj=proxy, field=dyn_at),
            (place.op("JNull", reg=dyn), empty),
            place.op("Field", dst=base, obj=dyn, field=base_at),
            (place.op("JNull", reg=base), empty),
            place.op("Field", dst=many, obj=base, field=long_at),
            place.op("UnsafeCast", dst=objects, src=base)]


def _neighbour_held(place, zone, kind, passed, none, tag):
    """To `passed` when a region next to `zone`, across a border, is held by that kind."""
    loop, step = place.here("%s next neighbour" % tag), place.here("%s on to the next" % tag)
    near_at, near = place.field_of(ZONE, NEIGHBOURS)
    many_at, many = place.field_of(OBJECTS, LENGTH)
    _a, at = place.field_of(OBJECTS, LENGTH)
    _o, one = place.field_of(OBJECTS, LENGTH)
    back_at, back = place.field_of(OBJECTS, INNER)
    got, other = place.scratch_of("Dyn"), place.scratch_of(ZONE)
    held_at, held = place.field_of(ZONE, HELD_BY)
    kind_at, its = place.field_of(FACTION, ITS_KIND)
    # ⛔ a BORDER: a neighbour held by whoever holds `zone` is the same land, never bordered
    _h, across = place.field_of(ZONE, HELD_BY)
    return [
        (place.op("JNull", reg=zone), none),
        place.op("Field", dst=across, obj=zone, field=held_at),
        place.op("Field", dst=near, obj=zone, field=near_at),
        (place.op("JNull", reg=near), none),
        place.op("Int", dst=at, ptr=place.number(0)),
        place.op("Int", dst=one, ptr=place.number(1)),
        loop + ":", place.op("Label"),
        place.op("Field", dst=many, obj=near, field=many_at),
        (place.op("JSGte", a=at, b=many), none),
        place.op("Field", dst=back, obj=near, field=back_at),
        place.op("GetArray", dst=got, array=back, index=at),
        (place.op("JNull", reg=got), step),
        place.op("UnsafeCast", dst=other, src=got),
        place.op("Field", dst=held, obj=other, field=held_at),
        (place.op("JNull", reg=held), step),
        (place.op("JEq", a=held, b=across), step),
        place.op("Field", dst=its, obj=held, field=kind_at),
        (place.op("JNotEq", a=its, b=kind), step),
        (place.op("JAlways"), passed),
        step + ":", place.op("Label"),
        place.op("Add", dst=at, a=at, b=one),
        (place.op("JAlways"), loop),
    ]


def _zone_of(place, holder, zone, have, apart, tag=QUESTION):
    """To `have` with the region the holder stands in, asked in the game what the holder is."""
    not_zone, not_agent, not_building = (place.here("%s, %s" % (tag, what)) for what in (
        "not a region", "not an agent", "not a building"))
    region, as_region = place.narrowed(holder, place.scratch_of(ZONE), goes_to=not_zone)
    agent, as_agent = place.narrowed(holder, place.scratch_of(AGENT), goes_to=not_agent)
    building, as_building = place.narrowed(holder, place.scratch_of(BUILDING),
                                           goes_to=not_building)
    entity, as_entity = place.narrowed(holder, place.scratch_of(ENTITY), goes_to=apart)
    at, village = place.field_of(BUILDING, ITS_VILLAGE)
    return as_region + [
        place.op("Mov", dst=zone, src=region),
        (place.op("JAlways"), have),
        not_zone + ":", place.op("Label")] + as_agent + _posted_in(
            place, agent, zone, apart, tag) + [
        (place.op("JAlways"), have),
        not_agent + ":", place.op("Label")] + as_building + [
        place.op("Field", dst=village, obj=building, field=at),
        (place.op("JNull", reg=village), apart),
        place.op("Call1", dst=zone, fun=place.named_function(ITS_ZONE), arg0=village),
        (place.op("JAlways"), have),
        not_building + ":", place.op("Label")] + as_entity + [
        place.op("Call1", dst=zone, fun=place.named_function(ITS_ZONE), arg0=entity)]


def _posted_in(place, agent, zone, apart, tag=QUESTION):
    """An agent's region: the one it supervises, or its sietch's; none on any other posting."""
    sietch = place.here("%s, posted to a sietch" % tag)
    found = place.here("%s, the agent's region found" % tag)
    at, posting = place.field_of(AGENT, POSTED)
    _c, which = place.field_of(OBJECTS, LENGTH)
    _w, wanted = place.field_of(OBJECTS, LENGTH)
    supervises = place.enum_case(POSTINGS, SUPERVISES)
    in_sietch = place.enum_case(POSTINGS, IN_SIETCH)
    structure = place.scratch_of(ASKED_OF)
    return [
        place.op("Field", dst=posting, obj=agent, field=at),
        (place.op("JNull", reg=posting), apart),
        place.op("EnumIndex", dst=which, value=posting),
        place.op("Int", dst=wanted, ptr=place.number(supervises)),
        (place.op("JNotEq", a=which, b=wanted), sietch),
        place.op("EnumField", dst=zone, value=posting, construct=supervises, field=0),
        (place.op("JAlways"), found),
        sietch + ":", place.op("Label"),
        place.op("Int", dst=wanted, ptr=place.number(in_sietch)),
        (place.op("JNotEq", a=which, b=wanted), apart),
        place.op("EnumField", dst=structure, value=posting, construct=in_sietch, field=0),
        (place.op("JNull", reg=structure), apart),
        place.op("Call1", dst=zone, fun=place.named_function(ITS_ZONE), arg0=structure),
        found + ":", place.op("Label"),
    ]


def _any_owned(place, faction, kind, passed, apart):
    """To `passed` when any region the faction owns has a neighbour held by that kind."""
    loop, step = (place.here("%s, %s" % (QUESTION, what)) for what in (
        "the faction's next region", "on to the faction's next region"))
    zones_at, zones = place.field_of(FACTION, OWNED_ZONES)
    objects = place.scratch_of(OBJECTS)
    _m, many = place.field_of(OBJECTS, LENGTH)
    _a, at = place.field_of(OBJECTS, LENGTH)
    _o, one = place.field_of(OBJECTS, LENGTH)
    back_at, back = place.field_of(OBJECTS, INNER)
    got, zone = place.scratch_of("Dyn"), place.scratch_of(ZONE)
    return [place.op("Field", dst=zones, obj=faction, field=zones_at),
            (place.op("JNull", reg=zones), apart)] + _the_list(
                place, zones, objects, many, apart) + [
        place.op("Field", dst=back, obj=objects, field=back_at),
        (place.op("JNull", reg=back), apart),
        place.op("Int", dst=at, ptr=place.number(0)),
        place.op("Int", dst=one, ptr=place.number(1)),
        loop + ":", place.op("Label"),
        (place.op("JSGte", a=at, b=many), apart),
        place.op("GetArray", dst=got, array=back, index=at),
        (place.op("JNull", reg=got), step),
        place.op("UnsafeCast", dst=zone, src=got),
    ] + _neighbour_held(place, zone, kind, passed, step, "%s, owned region's" % QUESTION) + [
        step + ":", place.op("Label"),
        place.op("Add", dst=at, a=at, b=one),
        (place.op("JAlways"), loop),
    ]


def emit(place, holder, named, word, compared, picked=None):
    """Past this, a region next to the holder's is held by `picked`, or the faction `named`."""
    if place.row.get(AT_LEAST) is None:
        return [(place.op("JAlways"), place.refused)]
    apart, found, passed = (place.here("%s, %s" % (QUESTION, what)) for what in (
        "borders none it picks", "a neighbour held", "borders one it picks"))
    # bare and unmarked, `named` is empty and nothing is bordered
    if picked is None:
        kind, reading = named, [(place.op("JNull", reg=named), apart)]
    else:
        kind_at, kind = place.field_of(FACTION, ITS_KIND)
        reading = [place.op("Field", dst=kind, obj=picked, field=kind_at),
                   (place.op("JNull", reg=kind), apart)]
    not_faction, have = (place.here("%s, %s" % (QUESTION, what)) for what in (
        "not a faction", "its region in hand"))
    faction, as_faction = place.narrowed(holder, place.scratch_of(FACTION), goes_to=not_faction)
    zone = place.scratch_of(ZONE)
    walk = as_faction + _any_owned(place, faction, kind, found, apart) + [
        not_faction + ":", place.op("Label")] + _zone_of(place, holder, zone, have, apart) + [
        have + ":", place.op("Label")] + _neighbour_held(
            place, zone, kind, found, apart, "%s, its region's" % QUESTION)
    return reading + walk + [
        (place.op("JAlways"), apart),
        found + ":", place.op("Label"),
    ] + _saying(place, BORDERS % word.WORD) + [
        (place.op("JAlways"), passed),
        apart + ":", place.op("Label")] + _saying(place, APART % word.WORD) + [
        (place.op("JAlways"), place.refused),
        passed + ":", place.op("Label")]
