"""Treaties held: how many treaties a faction holds, of every kind (`HasTreaties`)."""
from types import SimpleNamespace

from framework.compmatch import emit_compared
from framework.questions.owns_development import owning_faction
from framework.questions.treaties_active import TALLIES, _between, emit_diplomacy
from framework.questions.treaty_partner import emit_summed
from framework.trailing import ASKS_ITS_OWN, OWES_ITS_TREATIES

QUESTION = "treaties held"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS = ("a comparison",)
OFFERS_OWED = {"a treaty pick": OWES_ITS_TREATIES}
NEEDS, NEEDS_NONE = (), ASKS_ITS_OWN
# the game's own tally, asked with no kind
ASKS = TALLIES
# `With` after it counts only the treaties held with the partners it picks or names
PARTNER = "With"
# ⛔ ITS ONE WALK: the factions `With`'s owner word picks, each one's treaties summed
WALKS = 1
# what `With` after it reads of the road: its own column, its owner word, the factions it picks
READS_TOO = ("name.numbers", "columns.named for the narrowing", "whose_rule", "foreign",
             "every_faction", "how_many_factions")
# the faction asked: the faction itself, or the faction owning the thing in hand, as `HasDev` asks
ASKED_OF = "ent.Faction"
# compared with the row's `val`: at or above keeps it, unless a comparison word says otherwise
AT_LEAST = "value"
WEIGHED_BY = "framework.questions.treaties_held"
# an owner word in front picks the factions asked, judged against the row's writer
OWNERS_PICK = True

# said while `respath` is on, one per way out of the question
ENOUGH = "SPINE `%s` passed: the faction holds enough treaties"
WRONG = "SPINE `%s` refused: no faction, no game running, or the wrong number of treaties"


def _saying(place, text):
    """One line while `respath` is on; nothing otherwise."""
    return place.said("respath", lambda: place.said_now(text))


def _named_or_any(at, named, between):
    """`between(named)` when the row's column names a treaty, else `between(None)`: any kind."""
    if named is None:
        return between(None)
    anyone, done = (at.here("%s, %s" % (QUESTION, w)) for w in ("any kind", "counted"))
    return [(at.op("JNull", reg=named), anyone)] + between(named) + [
        (at.op("JAlways"), done), anyone + ":", at.op("Label")] + between(None) + [
        done + ":", at.op("Label")]


def emit(place, holder, named, word, compared, picked=None):
    """Past this, the faction (or `picked`) holds `val` treaties, of the kind named or any."""
    least = place.row.get(AT_LEAST)
    # a gate handed no `val` cannot weigh what is held, so the row narrows to nobody
    if least is None:
        return [(place.op("JAlways"), place.refused)]
    name = word.WORD
    short, passed = (place.here("%s, %s" % (name, what)) for what in ("wrong count", "enough"))
    faction, hop = (picked, []) if picked is not None else owning_faction(place, holder, short)
    diplomacy, reaching = emit_diplomacy(place, short)
    held, kind = place.scratch_return(TALLIES), place.scratch_arg(TALLIES, 1)
    weighed, made = held, []
    if place.kind_of(held) != place.kind_of(least):
        weighed = place.scratch_like(least)
        made = [place.op("ToSFloat", dst=weighed, src=held)]
    # ⛔ the game's own tally with no kind counts every treaty the faction holds; marked, the one
    plain = ([place.op("Null", dst=kind)] if named is None else []) + [
        place.op("Call3", dst=held, fun=place.named_function(TALLIES), arg0=diplomacy,
                 arg1=faction, arg2=kind if named is None else named)]
    # USER: `WithAlly` after it counts only the treaties held with each ally, summed
    counting = emit_summed(place, name, held, plain, SimpleNamespace(
        partner=PARTNER, added=lambda at, other: _named_or_any(at, named, lambda n: _between(
            at, diplomacy, faction, other, held, n))))
    return hop + reaching + counting + made + emit_compared(
        place, weighed, least, short, compared, name) + _saying(
        place, ENOUGH % name) + [
        (place.op("JAlways"), passed),
        short + ":", place.op("Label")] + _saying(place, WRONG % name) + [
        (place.op("JAlways"), place.refused),
        passed + ":", place.op("Label")]
