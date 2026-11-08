"""Researching: whether a faction researches the named development, or any (`ResearchingDev`)."""
from framework import columns
from framework.questions.owns_development import owning_faction
from framework.trailing import ASKS_ITS_OWN

QUESTION = "researching"
# what it hands the words on its right and takes from its left; why, when nothing
NEEDS, NEEDS_NONE = (), ASKS_ITS_OWN
# the faction's developments, then the one in the game's single research slot: none while idle
THROUGH = "ent.Faction.get_developments"
ASKS = "logic.faction.Developments.getResearched"
# what the slot holds names its development by this, as the cdb names it
KIND = "kind"
# the named development as the faction's own version of it, as `GainTDev` reads it
VALID = "logic.faction.Developments.getValidDevelopmentKind"
# the development's cdb row and that row's domain, as `OnDev_OfTDomain2` reads them
ITS_ROW = "logic.faction.Development.get_inf"
ITS_DOMAIN = "_Data.$Development_Impl_.get_domainId"
# the faction asked: the faction itself, or the faction owning the thing in hand, as `HasDev` asks
ASKED_OF = "ent.Faction"
# `val` is never read: the gate opens `WEIGHED_BY` only for a word declaring `AT_LEAST`
AT_LEAST = "value"
WEIGHED_BY = "framework.questions.researching"
# with no development named, `OfTDomain` on its right narrows it to research in the domains named
OFFERS = ("a development count", "a domain")
# an owner word in front picks the factions asked, judged against the row's writer
OWNERS_PICK = True
# its own jumps back, the row's names walked for the domain, past the two of a weighed group
WALKS = 3

# said while `respath` is on, one per way out of the question
RESEARCHING = "SPINE `%s` passed: the faction is researching what the row asks"
IDLE = "SPINE `%s` refused: no faction, no research, or not what the row asks"


def _saying(place, text):
    """One line while `respath` is on; nothing otherwise."""
    return place.said("respath", lambda: place.said_now(text))


def _in_a_named_domain(place, researched, refused):
    """Past this, the row named no domain, or the research's domain is one it names."""
    from framework import raisewalk
    from framework.modifiers import ofdomain
    listed = place.row.get(columns.PART_FOR_COUNT)
    if listed is None:
        return []
    row, domain = place.scratch_return(ITS_ROW), place.scratch_return(ITS_DOMAIN)
    looked = place.here("the research's domain, looked for")
    return [place.op("Null", dst=domain),
            place.op("Call1", dst=row, fun=place.named_function(ITS_ROW), arg0=researched),
            (place.op("JNull", reg=row), looked),
            place.op("Call1", dst=domain, fun=place.named_function(ITS_DOMAIN), arg0=row),
            looked + ":", place.op("Label"),
            ] + raisewalk.emit_listed(place, ofdomain.WORD, listed, domain, refused)


def emit(place, holder, named, word, compared, picked=None):
    """Past this, the faction (or `picked`) researches `named`, or anything; else refused."""
    from framework.memberwalk import _same_text
    # a road carrying no `val` place opens no weighed word, this one included
    if place.row.get(AT_LEAST) is None:
        return [(place.op("JAlways"), place.refused)]
    developments = place.scratch_return(THROUGH)
    researched = place.scratch_return(ASKS)
    valid = place.scratch_return(VALID)
    kind_at, kind = place.field_of(researched, KIND)
    idle, yes, passed, anything = (place.here("%s, %s" % (word.WORD, what)) for what in (
        "not researching it", "researching it", "past it", "any"))
    faction, hop = (picked, []) if picked is not None else owning_faction(place, holder, idle)
    return hop + [
        place.op("Call1", dst=developments, fun=place.named_function(THROUGH), arg0=faction),
        (place.op("JNull", reg=developments), idle),
        place.op("Call1", dst=researched, fun=place.named_function(ASKS), arg0=developments),
        (place.op("JNull", reg=researched), idle),
        (place.op("JNull", reg=named), anything),
        place.op("Call2", dst=valid, fun=place.named_function(VALID), arg0=developments,
                 arg1=named),
        (place.op("JNull", reg=valid), idle),
        place.op("Field", dst=kind, obj=researched, field=kind_at),
        (place.op("JNull", reg=kind), idle),
    ] + _same_text(place, valid, kind, idle) + [
        (place.op("JAlways"), yes),
        anything + ":", place.op("Label"),
    ] + _in_a_named_domain(place, researched, idle) + [
        yes + ":", place.op("Label")] + _saying(place, RESEARCHING % word.WORD) + [
        (place.op("JAlways"), passed),
        idle + ":", place.op("Label")] + _saying(place, IDLE % word.WORD) + [
        (place.op("JAlways"), place.refused),
        passed + ":", place.op("Label")]
