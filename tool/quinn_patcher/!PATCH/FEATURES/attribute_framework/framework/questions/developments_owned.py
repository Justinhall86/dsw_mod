"""Developments owned: how many developments a faction owns (`HasDevs`)."""
from framework.compmatch import emit_compared
from framework.questions.owns_development import owning_faction
from framework.trailing import ASKS_ITS_OWN

QUESTION = "developments owned"
# what it hands the words on its right and takes from its left; why, when nothing
NEEDS, NEEDS_NONE = (), ASKS_ITS_OWN
# the faction's developments, then the game's own count of them, the one `PerDev` reads
THROUGH = "ent.Faction.get_developments"
ASKS = "logic.faction.Developments.get_ownedCount"
# the faction asked: the faction itself, or the faction owning the thing in hand, as `HasDev` asks
ASKED_OF = "ent.Faction"
# compared with the row's `val`: at or above keeps it, unless a comparison word says otherwise
AT_LEAST = "value"
# what a trailing word on its right may attach to: a comparison, and `OfTDomain` on the count
OFFERS = ("a comparison", "a development count", "a domain")
WEIGHED_BY = "framework.questions.developments_owned"
# an owner word in front picks the factions asked, judged against the row's writer: `EnemyHasDevs`
OWNERS_PICK = True

# said while `respath` is on, one per way out of the question
ENOUGH = "SPINE `%s` passed: the faction owns enough developments"
WRONG = "SPINE `%s` refused: no faction, or it owns the wrong number of developments"


def _saying(place, text):
    """One line while `respath` is on; nothing otherwise."""
    return place.said("respath", lambda: place.said_now(text))


def _counted(place, developments, held, counted, name):
    """`held` as each narrower's weighed group sums it, else the game's whole count."""
    from framework import columns, narrowcount
    from framework.names import vocabulary
    listed = place.row.get(columns.PART_FOR_COUNT)
    def everything(asked, into):
        return [asked.op("Call1", dst=into, fun=asked.named_function(ASKS), arg0=developments)]
    out = []
    for narrower in narrowcount.weighed_by(vocabulary()[name]) if listed is not None else ():
        out += narrowcount.emit_weighed(place, narrower, listed, developments, held, counted,
                                        everything)
    return out + everything(place, held) + [counted + ":", place.op("Label")]


def emit(place, holder, named, word, compared, picked=None):
    """Past this, the thing's faction (or `picked`) owns `val` developments, else refused."""
    least = place.row.get(AT_LEAST)
    # a gate handed no `val` cannot weigh what is owned, so the row narrows to nobody
    if least is None:
        return [(place.op("JAlways"), place.refused)]
    developments = place.scratch_return(THROUGH)
    held = place.scratch_return(ASKS)
    weighed, made = held, []
    if place.kind_of(held) != place.kind_of(least):
        weighed = place.scratch_like(least)
        made = [place.op("ToSFloat", dst=weighed, src=held)]
    name = word.WORD
    short, passed, counted = (place.here("%s, %s" % (name, what))
                              for what in ("wrong count", "enough", "counted"))
    faction, hop = (picked, []) if picked is not None else owning_faction(place, holder, short)
    return hop + [
        place.op("Call1", dst=developments, fun=place.named_function(THROUGH), arg0=faction),
        (place.op("JNull", reg=developments), short),
    ] + _counted(place, developments, held, counted, name) + made + emit_compared(
        place, weighed, least, short, compared, name) + _saying(place, ENOUGH % name) + [
        (place.op("JAlways"), passed),
        short + ":", place.op("Label")] + _saying(place, WRONG % name) + [
        (place.op("JAlways"), place.refused),
        passed + ":", place.op("Label")]
