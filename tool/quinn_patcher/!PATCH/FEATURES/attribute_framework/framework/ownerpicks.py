#!/usr/bin/env python3
"""An owner word in front of a weighed narrowing (`EnemyHasTRes`): any faction it picks may pass."""
from copy import copy

from framework import ownermatch
from framework.foreignwalk import EVERY_ONE, FROM_FOREIGN, HOW_MANY, WHOSE_RULE
from framework.narrowmatch import (OWNER, OWNERS_PICK_BY, kept_for, owner_at,
                                   owner_mask)
from framework.scopematch import PAYEE
from framework.storewalk import IS_DEAD

# where the row keeps which owner word stands in front of which narrowing, one per kept number
KEPT = ("name.numbers",)
# declared True by a word asked of no faction when no owner word picks one
BARE_ASKS_ITSELF_BY = "BARE_ASKS_ITSELF"
# declared True by a word whose owner word judges the thing's own owner, never walks factions
JUDGES_ITS_OWNER_BY = "JUDGES_ITS_OWNER"
# declared by a word whose narrowing another word, when spelled, does itself (`With`)
COUNTED_IN_BY = "COUNTED_IN"
# everything a walk over the picked factions reads off the row, and a picked question with it
WALKED = (WHOSE_RULE, FROM_FOREIGN, EVERY_ONE, HOW_MANY)
READS = KEPT + WALKED


def weighed(place, holder, named, word, compared, bit, negated=None):
    """The word weighed on the holder's faction, or on each faction its owner word picks."""
    from framework.firedin import sided
    weigh = __import__(word.WEIGHED_BY, fromlist=["emit"]).emit
    # `By` after `OnKill`: the killer's holder, not the place the trigger fired in
    place = sided(place, word)
    # a gate handed no owner-in-front place, or no factions to pick from, asks the holder's own
    if not getattr(word, OWNERS_PICK_BY, False) or any(part not in place.row for part in READS):
        return _unless_spelled(place, word, weigh(place, holder, named, word, compared))
    if getattr(word, JUDGES_ITS_OWNER_BY, False) and PAYEE in place.row:
        return _unless_spelled(place, word, _judged(place, word, bit, weigh(
            place, holder, named, word, compared)))
    from framework.questions import emit_asked_of, shares_its_ask
    # ⛔ ONE COPY PER QUESTION: a faction's check is the same function on every road and count
    def ask(at, picked):
        if shares_its_ask(word):
            return emit_asked_of(at, word, picked, named, compared)
        return weigh(at, holder, named, word, compared, picked=picked)
    picking = _picked(place, holder, word.WORD, bit, ask, negated=negated)
    others = _the_others(place, word, bit, named, ask) if _before(word, negated) else []
    if not getattr(word, BARE_ASKS_ITSELF_BY, False):
        return _unless_spelled(place, word, _either(place, word, negated, picking, others))
    # with no owner word in front it is asked of no faction at all: `BordersTFaction` names one
    kept = kept_for(place, OWNER, bit)
    this, none = place.scratch_like(kept), place.scratch_like(kept)
    owned = place.here("%s has an owner word" % word.WORD)
    done = place.here("%s, asked" % word.WORD)
    return _unless_spelled(place, word, _either(place, word, negated, [
        place.op("Int", dst=this, ptr=place.number(owner_mask(bit))),
        place.op("And", dst=this, a=kept, b=this),
        place.op("Int", dst=none, ptr=place.number(0)),
        (place.op("JNotEq", a=this, b=none), owned)] + weigh(
        place, holder, named, word, compared) + [
        (place.op("JAlways"), done),
        owned + ":", place.op("Label")] + picking + [
        done + ":", place.op("Label")], others))


def _before(word, negated):
    """May `Not` sit before this word's owner word (`BordersNotEnemy`) on this road?"""
    from framework.turned import NOT_BEFORE_BY
    return negated is not None and getattr(word, NOT_BEFORE_BY, False)


def _either(place, word, negated, asked, others):
    """`asked`; with `Not` before the owner word, `others`: each faction it leaves out."""
    from framework.turned import _sent, sits
    if not _before(word, negated):
        return asked
    left, done = (place.here("%s, %s" % (word.WORD, w)) for w in (
        "those left out", "picked or left out, asked"))
    return _sent(place, negated, sits("BEFORE_THE_OWNER"), left) + asked + [
        (place.op("JAlways"), done), left + ":", place.op("Label")] + others + [
        done + ":", place.op("Label")]


def _the_others(place, word, bit, named, ask):
    """Any living faction, the writer's too, that the owner word or the named one leaves out."""
    kept = kept_for(place, OWNER, bit)
    this, none = place.scratch_like(kept), place.scratch_like(kept)
    faction = place.scratch_of(ownermatch.ASKED_AS)
    by_name, ask_it, again, onwards, found = (place.here("%s, %s" % (word.WORD, w)) for w in (
        "left out by name", "a faction left out", "the next one left out", "on past a faction",
        "one left out passed"))
    judging, to_judging = place.narrowed(place.row[WHOSE_RULE],
                                         place.scratch_of(ownermatch.ASKED_ON))
    at, one = place.scratch_like(place.row[HOW_MANY]), place.scratch_of("Dyn")
    dead = place.scratch_return(IS_DEAD)
    kind_at, kind = place.field_of(word.FACTION, word.ITS_KIND)
    judged, asking = copy(place), copy(place)
    judged.name = "%s, %s judged to leave out" % (place.name, word.WORD)
    asking.name = "%s, %s asked of one left out" % (place.name, word.WORD)
    judged.refused, asking.refused = ask_it, onwards
    return [place.op("Int", dst=this, ptr=place.number(owner_mask(bit))),
            place.op("And", dst=this, a=kept, b=this),
            place.op("Int", dst=none, ptr=place.number(0))] + to_judging + [
        place.op("Int", dst=at, ptr=place.number(0)),
        # bare and unmarked there is nobody to leave out, and nothing is asked
        (place.op("JNotEq", a=this, b=none), again),
        (place.op("JNull", reg=named), place.refused),
        again + ":", place.op("Label"),
        (place.op("JSGte", a=at, b=place.row[HOW_MANY]), place.refused),
        place.op("GetArray", dst=one, array=place.row[EVERY_ONE], index=at),
        place.op("UnsafeCast", dst=faction, src=one),
        (place.op("JNull", reg=faction), onwards),
        place.op("Call1", dst=dead, fun=place.named_function(IS_DEAD), arg0=faction),
        (place.op("JTrue", cond=dead), onwards),
        (place.op("JEq", a=this, b=none), by_name)] + ownermatch.emit_judged(
        judged, this, judging, faction) + [
        (place.op("JAlways"), onwards),
        by_name + ":", place.op("Label"),
        place.op("Field", dst=kind, obj=faction, field=kind_at),
        (place.op("JEq", a=kind, b=named), onwards),
        ask_it + ":", place.op("Label")] + ask(asking, faction) + [
        (place.op("JAlways"), found),
        onwards + ":", place.op("Label"),
        place.op("Incr", dst=at),
        (place.op("JAlways"), again),
        found + ":", place.op("Label")]


def _judged(place, word, bit, bare):
    """The owner word judges the thing's own owner once, owned or not (`OfNeutral`); else `bare`."""
    kept = kept_for(place, OWNER, bit)
    this, none = place.scratch_like(kept), place.scratch_like(kept)
    owned = place.here("%s has an owner word" % word.WORD)
    done = place.here("%s, asked" % word.WORD)
    mine, to_mine = place.narrowed(place.row[WHOSE_RULE], place.scratch_of(ownermatch.ASKED_ON))
    unheld, owner = place.here("%s: nobody holds it" % word.WORD), place.row[PAYEE]
    theirs, to_theirs = place.narrowed(owner, place.scratch_of(ownermatch.ASKED_AS))
    to_mine += [place.op("Null", dst=theirs), (place.op("JNull", reg=owner), unheld)] + (
        to_theirs + [unheld + ":", place.op("Label")])
    return [
        place.op("Int", dst=this, ptr=place.number(owner_mask(bit))),
        place.op("And", dst=this, a=kept, b=this),
        place.op("Int", dst=none, ptr=place.number(0)),
        (place.op("JNotEq", a=this, b=none), owned)] + bare + [
        (place.op("JAlways"), done),
        owned + ":", place.op("Label")] + to_mine + ownermatch.emit_judged(
        place, this, mine, theirs) + [
        done + ":", place.op("Label")]


def _unless_spelled(place, word, asked):
    """`asked`, passed by when the row spells the word that does this one's narrowing itself."""
    from framework.narrowmatch import bits, set_bit, spelled_in
    other = getattr(word, COUNTED_IN_BY, None)
    if other is None:
        return asked
    bit = bits()[other]
    spelled, none = place.scratch_of("I32"), place.scratch_of("I32")
    past = place.here("%s, narrowed by %s" % (word.WORD, other))
    return [place.op("Int", dst=spelled, ptr=place.number(set_bit(bit))),
            place.op("And", dst=spelled, a=spelled_in(place, bit), b=spelled),
            place.op("Int", dst=none, ptr=place.number(0)),
            (place.op("JNotEq", a=spelled, b=none), past)] + asked + [
        past + ":", place.op("Label")]


def every_picked(place, kept, bit, spelling, unpicked, ask, only=None):
    """`ask` of EVERY faction the owner word at `bit` of `kept` picks; with none, to `unpicked`."""
    return _picked(place, None, spelling, bit, ask, kept=kept, unpicked=unpicked, only=only)


def _after_the_owner(place, negated, to):
    """A jump to `to` when `Not` sits between the owner word and the narrowing it picks for."""
    from framework.turned import _sent, where_they_sit
    return [] if negated is None else _sent(place, negated, where_they_sit(at="AFTER_THE_OWNER"),
                                            to)


def _picked(place, holder, spelling, bit, ask, kept=None, unpicked=None, only=None,
            negated=None):
    """`ask` once, of the holder's faction or of each faction the owner word in front picks."""
    from framework.questions.owns_development import owning_faction
    every, numbered = ownermatch.checked(), ownermatch.numbers()
    kept = kept_for(place, OWNER, bit) if kept is None else kept
    this, want = place.scratch_like(kept), place.scratch_like(kept)
    # ⛔ ONE PLACE FOR THE FACTION ASKED, so the question is written once and said once
    faction = place.scratch_of(ownermatch.ASKED_AS)
    asked = copy(place)
    asked.name = "%s, %s on the faction in hand" % (place.name, spelling)
    picking, ask_it, unanswered, onwards, again, done, turned_no = (asked.here(what) for what in (
        "an owner word picks", "ask it", "it did not answer", "on to the next faction",
        "the next faction to ask", "answered", "its answer, turned to a no"))
    asked.refused = unanswered
    # asking every faction picked, the walk's end is `done`, and no owner word is `unpicked`
    ended = place.refused if unpicked is None else done
    if unpicked is None:
        holders, to_holders = owning_faction(place, holder, place.refused)
        to_holders += [place.op("Mov", dst=faction, src=holders), (place.op("JAlways"), ask_it)]
    else:
        to_holders = [(place.op("JAlways"), unpicked)]
    out = [place.op("Int", dst=this, ptr=place.number(owner_mask(bit))),
           place.op("And", dst=this, a=kept, b=this),
           place.op("Int", dst=want, ptr=place.number(0)),
           (place.op("JNotEq", a=this, b=want), picking)] + to_holders + [
           picking + ":", place.op("Label")]
    # the writer: the faction whose rule this row is, on its own pass or a foreign one
    mine, to_mine = place.narrowed(place.row[WHOSE_RULE], place.scratch_of(ownermatch.ASKED_ON),
                                   goes_to=ended)
    at, one = place.scratch_like(place.row[HOW_MANY]), place.scratch_of("Dyn")
    dead = place.scratch_return(IS_DEAD)
    judged = copy(place)
    judged.name = "%s, %s picked by its owner word" % (place.name, spelling)
    judged.refused = onwards
    out += to_mine + [
        place.op("Int", dst=at, ptr=place.number(0)),
        again + ":", place.op("Label"),
        (place.op("JSGte", a=at, b=place.row[HOW_MANY]), ended),
        place.op("GetArray", dst=one, array=place.row[EVERY_ONE], index=at),
        place.op("UnsafeCast", dst=faction, src=one),
        (place.op("JNull", reg=faction), onwards),
        place.op("Call1", dst=dead, fun=place.named_function(IS_DEAD), arg0=faction),
        (place.op("JTrue", cond=dead), onwards)]
    if only is not None:
        out += [place.op("Int", dst=want, ptr=place.number(owner_at(bit, numbered[only]))),
                (place.op("JNotEq", a=this, b=want), onwards)]
    # a number this build does not know picks nobody; ⛔ ONE jump back, the walk's own
    return out + ownermatch.emit_judged(judged, this, mine, faction) + [
        ask_it + ":", place.op("Label")] + ask(asked, faction) + _after_the_owner(
        place, negated, turned_no) + [
        (place.op("JAlways"), done if unpicked is None else onwards),
        unanswered + ":", place.op("Label")] + _after_the_owner(place, negated, done) + [
        # refused: the end with no owner word, the next faction with one
        turned_no + ":", place.op("Label"),
        place.op("Int", dst=want, ptr=place.number(0)),
        (place.op("JEq", a=this, b=want), ended),
        onwards + ":", place.op("Label"),
        place.op("Incr", dst=at),
        (place.op("JAlways"), again),
        done + ":", place.op("Label")]


def walks():
    """Every walk an owner word picking factions adds to a road: its narrowings', its acts'."""
    from framework import forwhom, multmatch, rescount
    from framework.names import module_of, vocabulary
    from framework.narrowmatch import only_narrowings
    from framework.pipeline import a_road
    from framework.questions import narrows_too
    from framework.turned import NOT_BEFORE_BY
    acts = len([s for s in a_road().stages if set(multmatch.READS) <= set(s.reads)])
    asked = [module_of(word) for word in only_narrowings(vocabulary()).values()]
    # `BordersNotEnemy`: a walk over the factions left out, at the gate and in a count's question
    return sum(1 for m in asked if getattr(m, OWNERS_PICK_BY, False)
               and not getattr(m, JUDGES_ITS_OWNER_BY, False)) + sum(
        (1 + getattr(m, "WALKS", 0)) * (1 + bool(narrows_too(m)))
        for m in asked if getattr(m, NOT_BEFORE_BY, False)) + (
        acts * (multmatch.picked_walks() + len(forwhom.partnered_words()))) + bool(acts) * (
        rescount.walks_once())


def _op(bc, name, **args):
    from tools.hlcode import template, written
    return written(template(bc, name), **args)


def count_reads_a_name(one):
    """Does a member read a name after this mark: weighed and named, or `BordersTFaction2`?"""
    from framework.names import module_of
    from framework.narrowmatch import owners_after
    from framework.questions import weighs
    if owners_after(one.word):
        return bool(one.targeted)
    return weighs(module_of(one.word)) and one.word.target == "optional"


def count_kept(bc, r, one, hands, needing):
    """On a count, what the subject keeps too: the owner word after it, and `Not` before that."""
    from tools.hlcode import number
    from framework.names import module_of
    from framework.narrowmatch import KEPT_HAND, NEGATED, bits, chunk_name, owners_after
    from framework.parsed import OR
    from framework.pieceword import MARKED_BY, OWNER_HAND
    from framework.turned import HAND, NOT_BEFORE_BY
    if not owners_after(one.word):
        return []
    # ⛔ `BordersTFaction2` is its own spelling, no `T` taken off: nothing else says it is marked
    if one.targeted:
        tail = getattr(module_of(one.word), MARKED_BY, None)
        return [_op(bc, "Mov", dst=hands["marked"], src=hands["one"])] if tail else []
    fits, spare, needs = needing
    bit, owned = bits()[one.word.spelling], "%s: an owner word follows" % one.text
    out = r[KEPT_HAND].fold(chunk_name(OWNER, bit), OR, hands[OWNER_HAND])
    # `BordersNotEnemy` asks the factions the owner word leaves out, as on a scope
    if hands.get(HAND) is not None and getattr(module_of(one.word), NOT_BEFORE_BY, False):
        out += r[KEPT_HAND].fold(chunk_name(NEGATED, bit), OR, hands[HAND])
    # bare and unmarked (`PerUnit_Borders`) it needs a name it never has, so narrows nothing
    return out + [(_op(bc, "JNotEq", a=hands[OWNER_HAND], b=hands["zero"]), owned),
                  _op(bc, "Int", dst=spare, ptr=number(bc, needs)),
                  _op(bc, "Or", dst=fits, a=fits, b=spare), owned + ":", _op(bc, "Label")]


# what a count's shared question adds to its yes when it read the name after the mark
TOOK_THE_NAME = 2


def emit_count_peek(place, s, tag):
    """The entry after a member's mark, NOT stepped past: the question says if it was its name."""
    named, end = place.scratch_like(s.name), place.here("%s, peeked" % tag)
    return [place.op("Null", dst=named), (place.op("JSGte", a=s.j, b=s.entries), end),
            place.op("GetArray", dst=s.got, array=s.backing, index=s.j),
            place.op("UnsafeCast", dst=named, src=s.got), end + ":", place.op("Label")], named


def emit_took(place, bit, said, tag):
    """`said` with TOOK_THE_NAME added when no owner word was kept: `BordersTFaction2` read one."""
    held = kept_for(place, OWNER, bit)
    this, none = place.scratch_like(held), place.scratch_like(held)
    past = place.here("%s, an owner word" % tag)
    return [place.op("Int", dst=this, ptr=place.number(owner_mask(bit))),
            place.op("And", dst=this, a=held, b=this),
            place.op("Int", dst=none, ptr=place.number(0)),
            (place.op("JNotEq", a=this, b=none), past),
            place.op("Int", dst=none, ptr=place.number(TOOK_THE_NAME)),
            place.op("Add", dst=said, a=said, b=none), past + ":", place.op("Label")]
