"""Quests running: how many quests a faction is running now (`HasActiveQuests`)."""
from framework.questions import quests_done
from framework.questions.quests_done import ASKED_OF, ASKS, COUNTED_AS, THROUGH  # noqa: F401
from framework.trailing import ASKS_ITS_OWN

QUESTION = "quests running"
# what it takes from its left, and why nothing
NEEDS, NEEDS_NONE = (), ASKS_ITS_OWN
# the faction's quests under way, a solve inside its own quest and never one of these
RUNNING = "currentQuests"
AT_LEAST = "value"
OFFERS = ("a comparison", "a quest pick")
WEIGHED_BY = "framework.questions.quests_active"
# what it reads of the road beyond `val`: the names its `Of` words narrow the quests to
READS_TOO = ("columns.named for the narrowing",)
# an owner word in front picks the factions asked, judged against the row's writer
OWNERS_PICK = True


def emit_total(place, quests, total):
    """How many quests the faction is running, added to `total`; no list counts none."""
    from framework.foreignwalk import emit_unwrapped
    where, running = place.field_of(quests, RUNNING)
    none = place.here("quests running, no list")
    _held, count, unwrapping = emit_unwrapped(place, running, none)
    return [place.op("Field", dst=running, obj=quests, field=where)] + unwrapping + [
        place.op("Add", dst=total, a=total, b=count),
        none + ":", place.op("Label")]


def emit(place, holder, named, word, compared, picked=None):
    """Past this, the faction (or `picked`) is running `val` quests, else refused."""
    from framework.questpick import emit_running_kept
    return quests_done.emit(place, holder, named, word, compared, picked, total_of=emit_total,
                            kept=emit_running_kept)
