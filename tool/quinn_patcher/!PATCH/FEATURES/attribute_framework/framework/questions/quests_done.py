"""Quests completed: how many quests a faction has completed, all counted (`HasDoneQuests`)."""
from tools.project import guard, gv
from tools.hlcode import native_named, native_returns
from framework.compmatch import emit_compared
from framework.questions.owns_development import owning_faction
from framework.trailing import ASKS_ITS_OWN

QUESTION = "quests completed"
# what it takes from its left, and why nothing
NEEDS, NEEDS_NONE = (), ASKS_ITS_OWN
# the faction's quests, then the game's own tally on them: quest id to times completed
THROUGH = ASKS = "ent.Faction.get_quests"
QUESTS, TALLY = "logic.faction.Quests", "completionsCount"
# a marked count's one entry in that tally, asked by the quest's id as `completeQuest` asks it
TALLIES = "haxe.ds.StringMap.get"
TALLY_KIND, HELD_IN = "hxbit.MapData", "map"
# ⛔ only ever this map: `completeQuest` and the game's own quest condition cast it the same way
AS_MAP, STORE = "haxe.ds.StringMap", "h"
# the game's native handing back every count in that store, as `StringMap.iterator` asks it
VALUES = ("std", "hbvalues")
# what holds them, as the game's own iterator over them is handed it: its place is that kind
HELD_AS = ("hl.$NativeArrayIterator_Dynamic.__constructor__", 1)
# what the count is kept in: a number, as `val` is compared with it
COUNTED_AS = "I32"
# the faction asked: the faction itself, or the faction owning the thing in hand, as `HasDev` asks
ASKED_OF = "ent.Faction"
# compared with the row's `val`: at or above keeps it, unless a comparison word says otherwise
AT_LEAST = "value"
OFFERS = ("a comparison", "a quest pick")
WEIGHED_BY = "framework.questions.quests_done"
# what it reads of the road beyond `val`: the names its `Of` words narrow the quests to
READS_TOO = ("columns.named for the narrowing",)
# an owner word in front picks the factions asked, judged against the row's writer
OWNERS_PICK = True
# its own jump back: the tally walked one count at a time
WALKS = 1

# said while `respath` is on, one per way out of the question
ENOUGH = "SPINE `%s` passed: the faction has completed enough quests"
WRONG = "SPINE `%s` refused: no faction, or it has completed the wrong number of quests"


def _saying(place, text):
    """One line while `respath` is on; nothing otherwise."""
    return place.said("respath", lambda: place.said_now(text))


def refusing(place, name, exit):
    """The same place, its refusals leaving at `exit` and its own places named after `name`."""
    from copy import copy
    turned = copy(place)
    turned.refused, turned.name = exit, place.here(name)
    return turned


def emit_map(place, quests, missing):
    """The game's tally on `quests` as the map it reads, and the steps there; else `missing`."""
    tally_at, tally = place.field_of(QUESTS, TALLY)
    held_at, held = place.field_of(TALLY_KIND, HELD_IN)
    as_map = place.scratch_of(AS_MAP)
    return as_map, [
        place.op("Field", dst=tally, obj=quests, field=tally_at),
        (place.op("JNull", reg=tally), missing),
        place.op("Field", dst=held, obj=tally, field=held_at),
        (place.op("JNull", reg=held), missing),
        place.op("SafeCast", dst=as_map, src=held)]


def emit_named(place, quests, total, named, whole, kept_as=None):
    """The tally's entry for the quest `named` (`kept_as` after its id) added to `total`."""
    from framework.questions.quest_done import JOINED_BY
    as_map, reaching = emit_map(place, quests, place.refused)
    # ⛔ an unmarked spelling reaches the same count handed no quest: `whole` sums every one
    plain, past = (place.here("the quest named, %s" % w) for w in ("none", "counted"))
    key, got = place.scratch_like(named), place.scratch_return(TALLIES)
    held = place.scratch_like(total)
    keyed = [place.op("Mov", dst=key, src=named)]
    if kept_as is not None:
        mark = place.scratch_like(key)
        keyed = [place.op("GetGlobal", **{"dst": mark, "global": place.text_object(kept_as)}),
                 place.op("Call2", dst=key, fun=place.named_function(JOINED_BY), arg0=named,
                          arg1=mark)]
    return [(place.op("JNull", reg=named), plain)] + reaching + keyed + [
        place.op("Call2", dst=got, fun=place.named_function(TALLIES), arg0=as_map, arg1=key),
        (place.op("JNull", reg=got), past),
        place.op("SafeCast", dst=held, src=got),
        place.op("Add", dst=total, a=total, b=held),
        (place.op("JAlways"), past),
        plain + ":", place.op("Label")] + whole(place, quests, total) + [
        past + ":", place.op("Label")]


def emit_total(place, quests, total, named=None, _partner=None):
    """Every completion in the game's tally on `quests` added to `total`; none, `place.refused`."""
    if named is not None:
        return emit_named(place, quests, total, named, emit_total)
    bc = place._hands["bc"]()
    as_map, reaching = emit_map(place, quests, place.refused)
    store_at, store = place.field_of(AS_MAP, STORE)
    values = place.scratch_arg(*HELD_AS)
    guard(place.kind_of(values) == native_returns(bc, *VALUES),
          "%s, argument %s, is not the kind %s.%s hands back" % (HELD_AS + VALUES))
    size, at, one = (place.scratch_like(total) for _ in range(3))
    got = place.scratch_of("Dyn")
    again, skip, counted = (place.here("quests completed, %s" % what) for what in (
        "the next count", "past this count", "every count added"))
    # ⛔ ONE jump back per walk: an empty entry goes forward to the shared turn
    return reaching + [
        place.op("Field", dst=store, obj=as_map, field=store_at),
        (place.op("JNull", reg=store), place.refused),
        place.op("Call1", dst=values, fun=gv(native_named(bc, *VALUES).findex), arg0=store),
        (place.op("JNull", reg=values), place.refused),
        place.op("ArraySize", dst=size, array=values),
        place.op("Int", dst=at, ptr=place.number(0)),
        again + ":", place.op("Label"),
        (place.op("JSGte", a=at, b=size), counted),
        place.op("GetArray", dst=got, array=values, index=at),
        place.op("Incr", dst=at),
        (place.op("JNull", reg=got), skip),
        place.op("SafeCast", dst=one, src=got),
        place.op("Add", dst=total, a=total, b=one),
        skip + ":", place.op("Label"),
        (place.op("JAlways"), again),
        counted + ":", place.op("Label")]


def emit_kept(place, head, quests, total):
    """Each completion of a quest the Of words keep."""
    from framework.questpick import emit_tally_kept
    return emit_tally_kept(place, head, quests, total)


def emit(place, holder, named, word, compared, picked=None, total_of=None, kept=None):
    """Past this, the faction (or `picked`) has `val` of what `total_of` sums, else refused."""
    from framework.questpick import narrowed
    total_of = narrowed(word.WORD, total_of or emit_total, kept or emit_kept)
    least = place.row.get(AT_LEAST)
    # a gate handed no `val` cannot weigh what was completed, so the row narrows to nobody
    if least is None:
        return [(place.op("JAlways"), place.refused)]
    quests = place.scratch_return(THROUGH)
    total = place.scratch_of(COUNTED_AS)
    weighed, made = total, []
    if place.kind_of(total) != place.kind_of(least):
        weighed = place.scratch_like(least)
        made = [place.op("ToSFloat", dst=weighed, src=total)]
    name = word.WORD
    short, passed = (place.here("%s, %s" % (name, what)) for what in ("wrong count", "enough"))
    faction, hop = (picked, []) if picked is not None else owning_faction(place, holder, short)
    return hop + [
        place.op("Int", dst=total, ptr=place.number(0)),
        place.op("Call1", dst=quests, fun=place.named_function(THROUGH), arg0=faction),
        (place.op("JNull", reg=quests), short),
    ] + total_of(refusing(place, name, short), quests, total, named if getattr(
        word, "TARGET", "never") != "never" else None) + made + emit_compared(
        place, weighed, least, short, compared, name) + _saying(place, ENOUGH % name) + [
        (place.op("JAlways"), passed),
        short + ":", place.op("Label")] + _saying(place, WRONG % name) + [
        (place.op("JAlways"), place.refused),
        passed + ":", place.op("Label")]
