"""Completed a quest: whether a faction completed the named quest, or any (`HasDoneQuest`)."""
from framework.questions.owns_development import owning_faction
from framework.questions.quests_done import (ASKED_OF, COUNTED_AS, THROUGH, emit_map, emit_total,
                                             refusing)
from framework.trailing import ASKS_ITS_OWN

QUESTION = "completed a quest"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS = ("a quest pick",)
NEEDS, NEEDS_NONE = (), ASKS_ITS_OWN
# the game's own tally, asked by the quest's id, as its own quest condition asks it
ASKS = "haxe.ds.StringMap.get"
# the game's own joining of two texts: a quest's id and what our own entries carry after it
JOINED_BY = "$String.__add__"
# `val` is never read: the gate opens `WEIGHED_BY` only for a word declaring `AT_LEAST`
AT_LEAST = "value"
WEIGHED_BY = "framework.questions.quest_done"
# what it reads of the road beyond `val`: the names its `Of` words narrow the quests to
READS_TOO = ("columns.named for the narrowing",)
# an owner word in front picks the factions asked, judged against the row's writer
OWNERS_PICK = True
# with no quest named, its own jump back: the tally walked one count at a time
WALKS = 1

# said while `respath` is on, one per way out of the question
DONE = "SPINE `%s` passed: the faction has completed what the row asks"
NOT_DONE = "SPINE `%s` refused: no faction, or it has not completed what the row asks"


def _saying(place, text):
    """One line while `respath` is on; nothing otherwise."""
    return place.said("respath", lambda: place.said_now(text))


def emit(place, holder, named, word, compared, picked=None, total_of=None, kept_as=None):
    """Past this, the faction (or `picked`) has `named` (`kept_as` after it) tallied, or any."""
    from framework.questpick import emit_kept, emit_tally_kept, narrowed
    total_of = narrowed(word.WORD, total_of or emit_total, lambda p, head, quests, total: (
        emit_tally_kept(p, head, quests, total, kept_as)))
    key, keyed = named, []
    if kept_as is not None:
        key, mark = place.scratch_like(named), place.scratch_like(named)
        keyed = [place.op("GetGlobal", **{"dst": mark, "global": place.text_object(kept_as)}),
                 place.op("Call2", dst=key, fun=place.named_function(JOINED_BY), arg0=named,
                          arg1=mark)]
    # a road carrying no `val` place opens no weighed word, this one included
    if place.row.get(AT_LEAST) is None:
        return [(place.op("JAlways"), place.refused)]
    quests = place.scratch_return(THROUGH)
    total, none = place.scratch_of(COUNTED_AS), place.scratch_of(COUNTED_AS)
    got = place.scratch_return(ASKS)
    no, anything, weigh, passed = (place.here("%s, %s" % (word.WORD, what)) for what in (
        "not completed", "any", "weighed", "completed"))
    faction, hop = (picked, []) if picked is not None else owning_faction(place, holder, no)
    as_map, reaching = emit_map(place, quests, no)
    return hop + [
        place.op("Int", dst=total, ptr=place.number(0)),
        place.op("Int", dst=none, ptr=place.number(0)),
        place.op("Call1", dst=quests, fun=place.named_function(THROUGH), arg0=faction),
        (place.op("JNull", reg=quests), no),
        (place.op("JNull", reg=named), anything),
    ] + emit_kept(place, word.WORD, named, no) + reaching + keyed + [
        place.op("Call2", dst=got, fun=place.named_function(ASKS), arg0=as_map, arg1=key),
        (place.op("JNull", reg=got), no),
        place.op("SafeCast", dst=total, src=got),
        (place.op("JAlways"), weigh),
        anything + ":", place.op("Label"),
    ] + total_of(refusing(place, word.WORD, no), quests, total) + [
        weigh + ":", place.op("Label"),
        (place.op("JSGte", a=none, b=total), no),
    ] + _saying(place, DONE % word.WORD) + [
        (place.op("JAlways"), passed),
        no + ":", place.op("Label")] + _saying(place, NOT_DONE % word.WORD) + [
        (place.op("JAlways"), place.refused),
        passed + ":", place.op("Label")]
