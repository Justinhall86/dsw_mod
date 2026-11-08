"""Treaty partner: `HasTTreaty`'s treaty, the trigger's, or a count's, is with a faction picked."""
from copy import copy
from types import SimpleNamespace

from framework.questions.owns_development import owning_faction
from framework.questions.treaties_active import BETWEEN, LENGTH_ON, emit_diplomacy
from framework.trailing import NOTHING_TRAILS_IT

QUESTION = "treaty partner"
# what it hands the words on its right and takes from its left; why, when nothing
WITH_OWES = (
    "it is tied to `HasTreaty` by name; once built it keeps, of the treaties any treaty word "
    "hands over, those held with the faction it names")
OFFERS, OFFERS_NONE = (), NOTHING_TRAILS_IT
NEEDS = ()
NEEDS_OWED = {"a treaty pick": WITH_OWES}
# `WithTFaction` names the partner in a target column, in place of an owner word
MARKED_SPELLING = "TFaction"
# ⛔ ITS ONE WALK: a named partner is searched for by kind, among the factions in play
FACTION, ITS_KIND, WALKS = "ent.Faction", "kind", 1
# the game's own question: that treaty held between two factions, in either order
ASKS = "logic.state.DiplomacyManager.hasTreatyWith"
# USER: it narrows the treaty on its left, the one this word names in its own column
REFINES = "HasTreaty"
# USER: after `HasTreaties`, that count sums each partner's treaties itself, so this gate passes
COUNTED_IN = "HasTreaties"
# the faction asked: the faction itself, or the faction owning the thing in hand, as `HasDev` asks
ASKED_OF = "ent.Faction"
# `val` is never read: the gate opens `WEIGHED_BY` only for a word declaring `AT_LEAST`
AT_LEAST = "value"
WEIGHED_BY = "framework.questions.treaty_partner"
# the owner word picks the partners, judged against the row's writer; bare is refused
OWNERS_PICK = True
# and it is written AFTER the word, as its object: `WithAlly`, never `AllyWith`
OWNER_AFTER = True
# USER: only these owner words glue on; `Any` stands in for every faction
ONLY_OWNERS = ("Any", "Enemy", "Ally", "AtWar", "InTruce")
# why no count on its left is narrowed by it
NARROWS_OWED = "its owner word names the other side; a count's members are not asked it yet"

# said while `respath` is on, one per way out of the question
BOUND = "SPINE `%s` passed: the treaty named, or any, is held with the faction picked"
UNBOUND = "SPINE `%s` refused: no partner picked, or no such treaty held with it"


def _saying(place, text):
    """One line while `respath` is on; nothing otherwise."""
    return place.said("respath", lambda: place.said_now(text))


def named_partner(place, named, partner, unbound):
    """The faction in play whose kind the column names, into `partner`; none is `unbound`."""
    from framework.foreignwalk import EVERY_FACTION, emit_unwrapped
    from framework.ownermatch import THE_GAME_CLASS, THE_GAME_ON, THE_STATE_ON
    from framework.pipeline import Place
    from tools.hlcode import assemble
    kinds = [place.kind_of(named)]

    # ⛔ A FUNCTION OF ITS OWN, off the game's own list: every road asks it the same way
    def body(hands):
        made = Place("%s, the named faction" % QUESTION, {}, {}, None, None, None,
                     "%s, no such faction" % QUESTION, hands)
        found, again, onwards = (made.here(what) for what in ("found", "next", "not it"))
        holding = made.scratch_of(THE_GAME_CLASS)
        at_game, game = made.field_of(THE_GAME_CLASS, THE_GAME_ON)
        at_state, state = made.field_of(game, THE_STATE_ON)
        at_list, listed = made.field_of(state, EVERY_FACTION)
        every, many, unwrapping = emit_unwrapped(made, listed, made.refused)
        at, one = made.scratch_like(many), made.scratch_of("Dyn")
        faction = made.scratch_of(FACTION)
        kind_at, its = made.field_of(FACTION, ITS_KIND)
        return assemble([
            made.op("GetGlobal", dst=holding, **{"global": made.the_one_global(THE_GAME_CLASS)}),
            made.op("Field", dst=game, obj=holding, field=at_game),
            (made.op("JNull", reg=game), made.refused),
            made.op("Field", dst=state, obj=game, field=at_state),
            (made.op("JNull", reg=state), made.refused),
            made.op("Field", dst=listed, obj=state, field=at_list)] + unwrapping + [
                         made.op("Int", dst=at, ptr=made.number(0)),
                         again + ":", made.op("Label"),
                         (made.op("JSGte", a=at, b=many), made.refused),
                         made.op("GetArray", dst=one, array=every, index=at),
                         made.op("Incr", dst=at),
                         (made.op("JNull", reg=one), onwards),
                         made.op("UnsafeCast", dst=faction, src=one),
                         made.op("Field", dst=its, obj=faction, field=kind_at),
                         (made.op("JEq", a=its, b=0), found),
                         onwards + ":", made.op("Label"),
                         (made.op("JAlways"), again),
                         made.refused + ":", made.op("Label"),
                         made.op("Null", dst=faction),
                         found + ":", made.op("Label"),
                         made.op("Ret", ret=faction)])
    shared = place._hands["shared"](("named faction",) + tuple(kinds), kinds,
                                    place.kind_of(partner), body)
    return [place.op("CallN", dst=partner, fun=shared, args=[named]),
            (place.op("JNull", reg=partner), unbound)]


def _the_events_partner(place, partner, unbound, bound):
    """After a treaty's trigger with no `HasTreaty` there: `partner` is the event's other side."""
    from framework.firedin import PARTNER
    from framework.narrowmatch import bits, set_bit, spelled_in
    if PARTNER not in place.row:
        return []
    bit = bits()[REFINES]
    spelled, none = place.scratch_of("I32"), place.scratch_of("I32")
    by_column = place.here("%s, the treaty its left names" % QUESTION)
    other = place.row[PARTNER]
    return [place.op("Int", dst=spelled, ptr=place.number(set_bit(bit))),
            place.op("And", dst=spelled, a=spelled_in(place, bit), b=spelled),
            place.op("Int", dst=none, ptr=place.number(0)),
            (place.op("JNotEq", a=spelled, b=none), by_column),
            (place.op("JNull", reg=other), unbound),
            (place.op("JNotEq", a=partner, b=other), unbound),
            (place.op("JAlways"), bound),
            by_column + ":", place.op("Label")]


def emit(place, holder, named, word, compared, picked=None):
    """Past this, the treaty its left names is held with `picked`, or the faction `named`."""
    from framework.narrowmatch import bits, emit_its_own_column
    if place.row.get(AT_LEAST) is None or picked is None:
        return [(place.op("JAlways"), place.refused)]
    unbound, passed = (place.here("%s, %s" % (word.WORD, what)) for what in (
        "not held with it", "held with it"))
    # ⛔ WITH NO `HasTreaty` ON ITS LEFT, a count it narrows does the narrowing: the gate passes
    counting = emit_passed(place, word.WORD, REFINES, passed)
    # ⛔ A NAMED COLUMN OUTRANKS THE PICK: with no owner word, the pick is the asker's own
    partner, by_pick = place.scratch_like(picked), place.here("%s, picked" % QUESTION)
    naming = [place.op("Mov", dst=partner, src=picked),
              (place.op("JNull", reg=named), by_pick)] + named_partner(
        place, named, partner, unbound) + [by_pick + ":", place.op("Label")]
    picked = partner
    # ⛔ ITS OWN NAME for the treaty's column: inline, `HasTTreaty` read that column here too
    reader = copy(place)
    reader.name = "%s, %s" % (place.name, unbound)
    reading, _at, treaty, _which = emit_its_own_column(reader, bits()[REFINES])
    faction, hop = owning_faction(place, holder, unbound)
    diplomacy, reaching = emit_diplomacy(place, unbound)
    held = place.scratch_return(ASKS)
    bound, any_kind = (place.here("%s, %s" % (word.WORD, what)) for what in ("bound", "any kind"))
    listed, none = place.scratch_return(BETWEEN), place.scratch_of("I32")
    at, many = place.field_of(listed, LENGTH_ON)
    return counting + naming + _the_events_partner(place, picked, unbound, bound) + reading + (
        hop + reaching + [
            (place.op("JNull", reg=treaty), any_kind),
            place.op("Call4", dst=held, fun=place.named_function(ASKS), arg0=diplomacy,
                     arg1=treaty, arg2=faction, arg3=picked),
            (place.op("JFalse", cond=held), unbound),
            (place.op("JAlways"), bound),
            # ⛔ A BARE `HasTreaty`: any treaty at all between the two
            any_kind + ":", place.op("Label"),
            place.op("Call3", dst=listed, fun=place.named_function(BETWEEN), arg0=diplomacy,
                     arg1=faction, arg2=picked),
            (place.op("JNull", reg=listed), unbound),
            place.op("Field", dst=many, obj=listed, field=at),
            place.op("Int", dst=none, ptr=place.number(0)),
            (place.op("JSGte", a=none, b=many), unbound),
            bound + ":", place.op("Label")]) + _saying(place, BOUND % word.WORD) + [
        (place.op("JAlways"), passed),
        unbound + ":", place.op("Label")] + _saying(place, UNBOUND % word.WORD) + [
        (place.op("JAlways"), place.refused),
        passed + ":", place.op("Label")]


def emit_passed(place, narrowing, refines, passed):
    """At the gate: with no `refines` spelled and a count this narrows, on to `passed`."""
    from framework.forwhom import counted_by
    from framework.multmatch import TIMES
    from framework.narrowmatch import bits, set_bit, spelled_in
    from framework.parsed import kept_number
    if not counted_by(narrowing):
        return []
    bit = bits()[refines]
    spelled, none = place.scratch_of("I32"), place.scratch_of("I32")
    asked = place.here("%s, asked of %s" % (narrowing, refines))
    out = [place.op("Int", dst=spelled, ptr=place.number(set_bit(bit))),
           place.op("And", dst=spelled, a=spelled_in(place, bit), b=spelled),
           place.op("Int", dst=none, ptr=place.number(0)),
           (place.op("JNotEq", a=spelled, b=none), asked)]
    for word in counted_by(narrowing):
        out.append((place.op("JSGt", a=kept_number(place, TIMES % word), b=none), passed))
    return out + [asked + ":", place.op("Label")]


def emit_counted(place, word, count, named, plain, partner):
    """`word`'s count into `count`; with `partner` spelled, summed over each partner it picks."""
    return emit_summed(place, word, count, plain, SimpleNamespace(
        partner=partner, added=lambda at, faction: _added(at, word, count, named, faction)))


def emit_summed(place, word, count, plain, how):
    """`how.added` into `count` per partner `how.partner` picks or names; unspelled, `plain`."""
    from framework import ownerpicks
    from framework.narrowmatch import OWNER, bits, emit_its_own_column, kept_for, set_bit
    from framework.narrowmatch import spelled_in
    partner = how.partner
    bit = bits()[partner]
    unspelled, by_owner, done = (place.here("%s, %s" % (word, what)) for what in (
        "no partner word", "each partner its owner word picks", "every partner counted"))
    spelled, none, one = place.scratch_of("I32"), place.scratch_of("I32"), place.scratch_of(FACTION)
    # ⛔ ITS OWN NAME for the partner's column, so the gate's reading of it names no label twice
    reader = copy(place)
    reader.name = place.here("%s, its partner's column" % word)
    reading, _at, kind, _which = emit_its_own_column(reader, bit)
    return [place.op("Int", dst=spelled, ptr=place.number(set_bit(bit))),
            place.op("And", dst=spelled, a=spelled_in(place, bit), b=spelled),
            place.op("Int", dst=none, ptr=place.number(0)),
            (place.op("JEq", a=spelled, b=none), unspelled),
            place.op("Int", dst=count, ptr=place.number(0))] + reading + [
        (place.op("JNull", reg=kind), by_owner)] + named_partner(
        place, kind, one, done) + how.added(place, one) + [
        (place.op("JAlways"), done),
        by_owner + ":", place.op("Label")] + ownerpicks.every_picked(
        place, kept_for(place, OWNER, bit), bit, partner, done, how.added) + [
        (place.op("JAlways"), done),
        unspelled + ":", place.op("Label")] + plain + [
        done + ":", place.op("Label")]


def _added(place, word, count, named, partner):
    """`word`'s count between the payee and `partner`, of any kind `named`, added to `count`."""
    from tools.hlcode import kind_named
    from framework import multmatch
    from framework.forwhom import COUNTED_ON, LINK
    from framework.rowreader import reader_for
    bc, fn = place._hands["bc"](), place._hands["fn"]()
    on = place.row.get(COUNTED_ON)
    if on is None or place.kind_of(on) != kind_named(bc, multmatch.declared(word)[0]):
        return []
    got = place.scratch_like(count)
    site = SimpleNamespace(word="%s, with a partner" % (LINK % word),
                           named=None if named is None else 1, partner=1 + (named is not None))
    return multmatch._calling_the_count(bc, fn, place.op, site, reader_for(bc), word, got, on,
                                        named, partner) + [
        place.op("Add", dst=count, a=count, b=got)]
