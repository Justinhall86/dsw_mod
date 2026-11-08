"""Treaties active: a faction holds the named treaty (`HasTreaty`); how many (`PerTreaty`)."""
from framework.ownermatch import THE_GAME_CLASS, THE_GAME_ON, THE_STATE_ON
from framework.questions.owns_development import owning_faction
from framework.trailing import ASKS_ITS_OWN, OWES_ITS_TREATIES

QUESTION = "treaties active"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS = ()
OFFERS_OWED = {"a treaty pick": OWES_ITS_TREATIES}
NEEDS, NEEDS_NONE = (), ASKS_ITS_OWN
# the word the probe's line opens with
SAID_AS = "PerTreaty"
# the game's running diplomacy, off its state by name
DIPLOMACY_ON = "diplomacy"
# the game's own questions of it: one treaty held by id, and how many held (no id: every kind)
ASKS = "logic.state.DiplomacyManager.hasTreaty"
TALLIES = "logic.state.DiplomacyManager.getFactionTreatiesNumber"
# and with one partner: every treaty between the two, or one kind held between them
BETWEEN, WITH = ("logic.state.DiplomacyManager.%s" % n for n in ("getTreatiesBetween",
                                                                  "hasTreatyWith"))
# what the game's list calls its own count
LENGTH_ON = "length"
# a multiplier's way in is the faction's developments, which name their faction, as `OnDev` reads
THE_WAY_IN, ITS_FACTION = "logic.faction.Developments", "owner"
# what the count is kept in: a number, as `val` is compared with it
COUNTED_AS = "I32"
# the faction asked: the faction itself, or the faction owning the thing in hand, as `HasDev` asks
ASKED_OF = "ent.Faction"
# `val` is never read: the gate opens `WEIGHED_BY` only for a word declaring `AT_LEAST`
AT_LEAST = "value"
WEIGHED_BY = "framework.questions.treaties_active"
# an owner word in front picks the factions asked, judged against the row's writer
OWNERS_PICK = True

# said while `respath` is on, one per way out of the question
HELD = "SPINE `%s` passed: the faction holds the treaty named, or any when none is"
UNHELD = "SPINE `%s` refused: no faction, no game running, or the treaty not held"


def _saying(place, text):
    """One line while `respath` is on; nothing otherwise."""
    return place.said("respath", lambda: place.said_now(text))


def emit_diplomacy(place, missing):
    """The game's running diplomacy, and the steps there; with no game yet, to `missing`."""
    holding = place.scratch_of(THE_GAME_CLASS)
    at_game, game = place.field_of(THE_GAME_CLASS, THE_GAME_ON)
    at_state, state = place.field_of(game, THE_STATE_ON)
    at_diplomacy, diplomacy = place.field_of(state, DIPLOMACY_ON)
    return diplomacy, [
        place.op("GetGlobal", dst=holding, **{"global": place.the_one_global(THE_GAME_CLASS)}),
        place.op("Field", dst=game, obj=holding, field=at_game),
        (place.op("JNull", reg=game), missing),
        place.op("Field", dst=state, obj=game, field=at_state),
        (place.op("JNull", reg=state), missing),
        place.op("Field", dst=diplomacy, obj=state, field=at_diplomacy),
        (place.op("JNull", reg=diplomacy), missing)]


def emit_total(place, developments, total, named=None, partner=None):
    """The treaties the faction holds added to `total`: of the kind `named`, or of any kind."""
    diplomacy, reaching = emit_diplomacy(place, place.refused)
    owner_at, faction = place.field_of(THE_WAY_IN, ITS_FACTION)
    if partner is not None:
        return [place.op("Field", dst=faction, obj=developments, field=owner_at),
                (place.op("JNull", reg=faction), place.refused),
                (place.op("JNull", reg=partner), place.refused)] + reaching + _between(
            place, diplomacy, faction, partner, total, named)
    kind = place.scratch_arg(TALLIES, 1) if named is None else named
    held = place.scratch_return(TALLIES)
    return [place.op("Field", dst=faction, obj=developments, field=owner_at),
            (place.op("JNull", reg=faction), place.refused)] + reaching + (
        [place.op("Null", dst=kind)] if named is None else []) + [
        place.op("Call3", dst=held, fun=place.named_function(TALLIES), arg0=diplomacy,
                 arg1=faction, arg2=kind),
        place.op("Add", dst=total, a=total, b=held)] + (
        [] if named is None else _said_counted(place, faction, held, named))


def _between(place, diplomacy, faction, partner, total, named):
    """The treaties held between `faction` and `partner` added to `total`; of `named` only, 1."""
    if named is None:
        listed = place.scratch_return(BETWEEN)
        at, many = place.field_of(listed, LENGTH_ON)
        return [place.op("Call3", dst=listed, fun=place.named_function(BETWEEN), arg0=diplomacy,
                         arg1=faction, arg2=partner),
                (place.op("JNull", reg=listed), place.refused),
                place.op("Field", dst=many, obj=listed, field=at),
                place.op("Add", dst=total, a=total, b=many)]
    held, unheld = place.scratch_return(WITH), place.here("%s, not held with it" % QUESTION)
    return [place.op("Call4", dst=held, fun=place.named_function(WITH), arg0=diplomacy,
                     arg1=named, arg2=faction, arg3=partner),
            (place.op("JFalse", cond=held), unheld),
            place.op("Incr", dst=total),
            unheld + ":", place.op("Label")]


def _said_counted(place, faction, held, named):
    """PROBE, speaking from boot: `PerTreaty counted: <faction> holds <n> <kind>`."""
    from framework.rescount import AS_TEXT, JOINS, NAMED_BY, PLAIN_HEAD, PLAIN_HOLDS, PROBE
    from framework.parsed import READ
    from framework.sayonce import COMPLAIN
    texts = [place.scratch_return(JOINS) for _ in range(5)] + [place.scratch_return(COMPLAIN)]
    wide, quiet = place.scratch_return(READ), place.here("%s, said plainly" % QUESTION)
    head = place.text_object(PLAIN_HEAD % SAID_AS)
    said = [place.op("GetGlobal", **{"dst": texts[0], "global": head}),
            place.op("Call1", dst=texts[1], fun=place.named_function(NAMED_BY), arg0=faction),
            place.op("GetGlobal", **{"dst": texts[2], "global": place.text_object(PLAIN_HOLDS)}),
            place.op("ToDyn", dst=wide, src=held),
            place.op("Call1", dst=texts[3], fun=place.named_function(AS_TEXT), arg0=wide),
            place.op("GetGlobal", **{"dst": texts[4], "global": place.text_object(" ")})]
    for piece in texts[1:5] + [named]:
        said += [(place.op("JNull", reg=piece), quiet),
                 place.op("Call2", dst=texts[0], fun=place.named_function(JOINS),
                          arg0=texts[0], arg1=piece)]
    return place.said(PROBE, lambda: said + [
        place.op("Call1", dst=texts[5], fun=place.named_function(COMPLAIN), arg0=texts[0]),
        quiet + ":", place.op("Label")])


def emit(place, holder, named, word, compared, picked=None):
    """Past this, the faction (or `picked`) holds the treaty `named`, or bare, any; else refused."""
    # a road carrying no `val` place opens no weighed word, this one included
    if place.row.get(AT_LEAST) is None:
        return [(place.op("JAlways"), place.refused)]
    unheld, passed, anything, bound = (place.here("%s, %s" % (word.WORD, what)) for what in (
        "not held", "held", "any", "bound"))
    faction, hop = (picked, []) if picked is not None else owning_faction(place, holder, unheld)
    diplomacy, reaching = emit_diplomacy(place, unheld)
    held, many = place.scratch_return(ASKS), place.scratch_return(TALLIES)
    kind, none = place.scratch_arg(TALLIES, 1), place.scratch_of(COUNTED_AS)
    return hop + reaching + [
        (place.op("JNull", reg=named), anything),
        place.op("Call3", dst=held, fun=place.named_function(ASKS), arg0=diplomacy,
                 arg1=faction, arg2=named),
        (place.op("JFalse", cond=held), unheld),
        (place.op("JAlways"), bound),
        # ⛔ BARE: the game's own tally with no kind counts every treaty the faction holds
        anything + ":", place.op("Label"),
        place.op("Null", dst=kind),
        place.op("Int", dst=none, ptr=place.number(0)),
        place.op("Call3", dst=many, fun=place.named_function(TALLIES), arg0=diplomacy,
                 arg1=faction, arg2=kind),
        (place.op("JSGte", a=none, b=many), unheld),
        bound + ":", place.op("Label"),
    ] + _saying(place, HELD % word.WORD) + [
        (place.op("JAlways"), passed),
        unheld + ":", place.op("Label")] + _saying(place, UNHELD % word.WORD) + [
        (place.op("JAlways"), place.refused),
        passed + ":", place.op("Label")]
