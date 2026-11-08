"""Owns development: whether a faction owns the column-named development, or any (`HasDev`)."""
from framework.trailing import ASKS_ITS_OWN
QUESTION = "owns development"
# what it hands the words on its right and takes from its left: bare, `OfTDomain` on its count
OFFERS = ("a development count", "a domain")
NEEDS, NEEDS_NONE = (), ASKS_ITS_OWN
# the faction's developments, then the game's own question by id
THROUGH = "ent.Faction.get_developments"
ASKS = "logic.faction.Developments.has"
# a development another player has blacked out is still `has`, and is not owned
BLACKED_OUT_BY = "logic.faction.Developments.getBlackoutOwner"
# the faction asked: the faction itself, or the faction owning the thing in hand
ASKED_OF = "ent.Faction"
# `val` is never read: the gate opens `WEIGHED_BY` only for a word declaring `AT_LEAST`
AT_LEAST = "value"
WEIGHED_BY = "framework.questions.owns_development"
# an owner word in front picks the factions asked, judged against the row's writer: `EnemyHasTDev`
OWNERS_PICK = True

# said while `respath` is on, one per way out of the question
OWNED = "SPINE `%s` passed: the faction owns the development named"
UNOWNED = "SPINE `%s` refused: no faction, the development not owned, or it is blacked out"


def _saying(place, text):
    """One line while `respath` is on; nothing otherwise."""
    return place.said("respath", lambda: place.said_now(text))


def owning_faction(place, holder, nobody):
    """The thing's faction, as its walk asked once (a faction is its own); else `nobody`."""
    from framework.scopematch import PAYEE
    owner = place.row.get(PAYEE)
    if owner is None:
        return place.scratch_of(ASKED_OF), [(place.op("JAlways"), nobody)]
    faction, cast = place.narrowed(owner, place.scratch_of(ASKED_OF), goes_to=nobody)
    return faction, [(place.op("JNull", reg=owner), nobody)] + cast


def _any(place, faction, word, unowned):
    """Bare: past this, the faction owns one development or more, as `OfTDomain` narrows them."""
    from framework.questions import developments_owned
    developments = place.scratch_return(THROUGH)
    held = place.scratch_return(developments_owned.ASKS)
    one = place.scratch_like(held)
    counted = place.here("%s, counted" % word.WORD)
    return [
        place.op("Call1", dst=developments, fun=place.named_function(THROUGH), arg0=faction),
        (place.op("JNull", reg=developments), unowned),
    ] + developments_owned._counted(place, developments, held, counted, word.WORD) + [
        place.op("Int", dst=one, ptr=place.number(1)),
        (place.op("JSGt", a=one, b=held), unowned)]


def emit(place, holder, named, word, compared, picked=None):
    """Past this, the faction (or `picked`) owns the development `named`, or any; else refused."""
    # a road carrying no `val` place opens no weighed word, this one included
    if place.row.get(AT_LEAST) is None:
        return [(place.op("JAlways"), place.refused)]
    developments = place.scratch_return(THROUGH)
    owned = place.scratch_return(ASKS)
    blacked_by = place.scratch_return(BLACKED_OUT_BY)
    unowned, passed, anything, held = (place.here("%s, %s" % (word.WORD, what))
                                       for what in ("not owned", "owned", "any", "held"))
    faction, hop = (picked, []) if picked is not None else owning_faction(place, holder, unowned)
    return hop + [
        (place.op("JNull", reg=named), anything),
        place.op("Call1", dst=developments, fun=place.named_function(THROUGH), arg0=faction),
        (place.op("JNull", reg=developments), unowned),
        place.op("Call2", dst=owned, fun=place.named_function(ASKS), arg0=developments,
                 arg1=named),
        (place.op("JFalse", cond=owned), unowned),
        place.op("Call2", dst=blacked_by, fun=place.named_function(BLACKED_OUT_BY),
                 arg0=developments, arg1=named),
        (place.op("JNotNull", reg=blacked_by), unowned),
        (place.op("JAlways"), held),
        anything + ":", place.op("Label"),
    ] + _any(place, faction, word, unowned) + [
        held + ":", place.op("Label"),
    ] + _saying(place, OWNED % word.WORD) + [
        (place.op("JAlways"), passed),
        unowned + ":", place.op("Label")] + _saying(place, UNOWNED % word.WORD) + [
        (place.op("JAlways"), place.refused),
        passed + ":", place.op("Label")]
