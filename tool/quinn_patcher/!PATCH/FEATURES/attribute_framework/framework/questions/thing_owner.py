"""Owner of a thing: whether the thing in hand belongs to a faction picked or named (`Of`, `By`)."""
from framework.trailing import ASKS_ITS_OWN, NO_FAMILY_TRAILER
QUESTION = "owner of a thing"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), NO_FAMILY_TRAILER
NEEDS, NEEDS_NONE = (), ASKS_ITS_OWN
# `OfTFaction` names the faction in a target column, in place of an owner word
MARKED_SPELLING = "TFaction"
# the faction a column names, by its own kind; after a trigger, the thing is the trigger's place
FACTION, ITS_KIND = "ent.Faction", "kind"
# the game's own question, asked by the walk of the thing in hand, and the faction it answers
ASKS, ASKED_OF = "ent.Entity.get_owner", "ent.Faction"
# `val` is never read: the gate opens `WEIGHED_BY` only for a word declaring `AT_LEAST`
AT_LEAST = "value"
WEIGHED_BY = "framework.questions.thing_owner"
# the owner word picks the factions, judged against the row's writer
OWNERS_PICK = True
# and it is written AFTER the word, as its object: `OfEnemy`, never `EnemyOf`
OWNER_AFTER = True
# with no owner word it is asked once, of the faction its column names
BARE_ASKS_ITSELF = True
# with one, the word judges the thing's own owner, so an unowned raider reaches `Neutral`
JUDGES_ITS_OWNER = True
# why no count on its left is narrowed by it
NARROWS_OWED = "its owner word names the owner judged; a count's members are not judged yet"

# said while `respath` is on, one per way out of the question
OWNED = "SPINE `%s` passed: the thing belongs to the faction picked or named"
UNOWNED = "SPINE `%s` refused: nobody holds it, nothing is picked or named, or another holds it"


def _saying(place, text):
    """One line while `respath` is on; nothing otherwise."""
    return place.said("respath", lambda: place.said_now(text))


def emit(place, holder, named, word, *_compared, **picking):
    """Past this, the thing's faction is `picked`, or the faction of the kind `named`."""
    from framework.questions.owns_development import owning_faction
    picked = picking.get("picked")
    if place.row.get(AT_LEAST) is None:
        return [(place.op("JAlways"), place.refused)]
    unowned, passed = (place.here("%s, %s" % (word.WORD, what)) for what in (
        "held by another", "held by the one asked"))
    faction, hop = owning_faction(place, holder, unowned)
    if picked is not None:
        weighed = [(place.op("JNotEq", a=faction, b=picked), unowned)]
    else:
        kind_at, kind = place.field_of(FACTION, ITS_KIND)
        weighed = [(place.op("JNull", reg=named), unowned),
                   place.op("Field", dst=kind, obj=faction, field=kind_at),
                   (place.op("JNotEq", a=kind, b=named), unowned)]
    return hop + weighed + _saying(place, OWNED % word.WORD) + [
        (place.op("JAlways"), passed),
        unowned + ":", place.op("Label")] + _saying(place, UNOWNED % word.WORD) + [
        (place.op("JAlways"), place.refused),
        passed + ":", place.op("Label")]
