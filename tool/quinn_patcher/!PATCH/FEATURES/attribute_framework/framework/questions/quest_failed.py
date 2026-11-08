"""Failed a quest: whether a faction failed the named quest, or any (`HasFailedQuest`)."""
from framework.questions import quest_done
from framework.questions.quests_done import ASKED_OF, COUNTED_AS, THROUGH  # noqa: F401
from framework.questions.quests_failed import KEPT_AS, emit_total
from framework.trailing import ASKS_ITS_OWN

QUESTION = "failed a quest"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS = ("a quest pick",)
NEEDS, NEEDS_NONE = (), ASKS_ITS_OWN
ASKS = quest_done.ASKS
# `val` is never read: the gate opens `WEIGHED_BY` only for a word declaring `AT_LEAST`
AT_LEAST = "value"
WEIGHED_BY = "framework.questions.quest_failed"
# what it reads of the road beyond `val`: the names its `Of` words narrow the quests to
READS_TOO = ("columns.named for the narrowing",)
# an owner word in front picks the factions asked, judged against the row's writer
OWNERS_PICK = True


def emit(place, holder, named, word, compared, picked=None):
    """Past this, the faction (or `picked`) failed `named` at least once, or any quest."""
    return quest_done.emit(place, holder, named, word, compared, picked, total_of=emit_total,
                           kept_as=KEPT_AS)
