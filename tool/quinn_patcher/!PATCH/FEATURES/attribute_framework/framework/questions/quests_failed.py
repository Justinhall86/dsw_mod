"""Quests failed: how many quests a faction has failed or let run out (`HasFailedQuests`)."""
from framework.questions import quests_done
from framework.questions.quest_done import ASKS
from framework.questions.quests_done import (ASKED_OF, COUNTED_AS, TALLIES, THROUGH,  # noqa: F401
                                             emit_map, emit_named)
from framework.trailing import ASKS_ITS_OWN

QUESTION = "quests failed"
# what it takes from its left, and why nothing
NEEDS, NEEDS_NONE = (), ASKS_ITS_OWN
# ⛔ ours in the game's tally: `<id>#failed` per quest, and `#failed` minus all, so sums hold
KEPT_AS = "#failed"
MINTS = (KEPT_AS,)
AT_LEAST = "value"
OFFERS = ("a comparison", "a quest pick")
WEIGHED_BY = "framework.questions.quests_failed"
# what it reads of the road beyond `val`: the names its `Of` words narrow the quests to
READS_TOO = ("columns.named for the narrowing",)
# an owner word in front picks the factions asked, judged against the row's writer
OWNERS_PICK = True


def emit_total(place, quests, total, named=None, _partner=None):
    """Every failure of the faction's, from our running entry, added to `total`; or one quest's."""
    if named is not None:
        return emit_named(place, quests, total, named, emit_total, KEPT_AS)
    as_map, reaching = emit_map(place, quests, place.refused)
    mark, got = place.scratch_arg(ASKS, 0), place.scratch_return(ASKS)
    held = place.scratch_like(total)
    none = place.here("quests failed, none yet")
    return reaching + [
        place.op("GetGlobal", **{"dst": mark, "global": place.text_object(KEPT_AS)}),
        place.op("Call2", dst=got, fun=place.named_function(ASKS), arg0=as_map, arg1=mark),
        (place.op("JNull", reg=got), none),
        place.op("SafeCast", dst=held, src=got),
        place.op("Sub", dst=total, a=total, b=held),
        none + ":", place.op("Label")]


def emit(place, holder, named, word, compared, picked=None):
    """Past this, the faction (or `picked`) failed `val` quests, else refused."""
    return quests_done.emit(place, holder, named, word, compared, picked, total_of=emit_total,
                            kept=emit_kept)


def emit_kept(place, head, quests, total):
    """Each failure of a quest the Of words keep, from our entry beside its id."""
    from framework.questpick import emit_tally_kept
    return emit_tally_kept(place, head, quests, total, KEPT_AS)
