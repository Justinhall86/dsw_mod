"""Running a quest: whether a faction is running the named quest, or any (`HasQuestActive`)."""
from framework.questions.owns_development import owning_faction
from framework.questions.quests_active import emit_total
from framework.questions.quests_done import ASKED_OF, COUNTED_AS, THROUGH, refusing
from framework.trailing import ASKS_ITS_OWN

QUESTION = "running a quest"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS = ("a quest pick",)
NEEDS, NEEDS_NONE = (), ASKS_ITS_OWN
# the game's own answer to whether a faction is running a quest of that id
ASKS = "logic.faction.Quests.hasQuest"
# `val` is never read: the gate opens `WEIGHED_BY` only for a word declaring `AT_LEAST`
AT_LEAST = "value"
WEIGHED_BY = "framework.questions.quest_active"
# what it reads of the road beyond `val`: the names its `Of` words narrow the quests to
READS_TOO = ("columns.named for the narrowing",)
# an owner word in front picks the factions asked, judged against the row's writer
OWNERS_PICK = True

# said while `respath` is on, one per way out of the question
RUNS = "SPINE `%s` passed: the faction is running what the row asks"
DOES_NOT = "SPINE `%s` refused: no faction, or it is not running what the row asks"


def _saying(place, text):
    """One line while `respath` is on; nothing otherwise."""
    return place.said("respath", lambda: place.said_now(text))


def emit(place, holder, named, word, compared, picked=None):
    """Past this, the faction (or `picked`) is running `named`, or any quest."""
    from framework.questpick import emit_kept, emit_running_kept, narrowed
    if place.row.get(AT_LEAST) is None:
        return [(place.op("JAlways"), place.refused)]
    total_of = narrowed(word.WORD, emit_total, emit_running_kept)
    quests, answer = place.scratch_return(THROUGH), place.scratch_return(ASKS)
    total, none = place.scratch_of(COUNTED_AS), place.scratch_of(COUNTED_AS)
    no, anything, passed = (place.here("%s, %s" % (word.WORD, what)) for what in (
        "not running", "any", "running"))
    faction, hop = (picked, []) if picked is not None else owning_faction(place, holder, no)
    return hop + [
        place.op("Int", dst=total, ptr=place.number(0)),
        place.op("Int", dst=none, ptr=place.number(0)),
        place.op("Call1", dst=quests, fun=place.named_function(THROUGH), arg0=faction),
        (place.op("JNull", reg=quests), no),
        (place.op("JNull", reg=named), anything),
        place.op("Call2", dst=answer, fun=place.named_function(ASKS), arg0=quests, arg1=named),
        (place.op("JFalse", cond=answer), no),
    ] + emit_kept(place, word.WORD, named, no) + [
        (place.op("JAlways"), passed),
        anything + ":", place.op("Label"),
    ] + total_of(refusing(place, word.WORD, no), quests, total) + [
        (place.op("JSGte", a=none, b=total), no),
        (place.op("JAlways"), passed),
        no + ":", place.op("Label")] + _saying(place, DOES_NOT % word.WORD) + [
        (place.op("JAlways"), place.refused),
        passed + ":", place.op("Label")] + _saying(place, RUNS % word.WORD)
