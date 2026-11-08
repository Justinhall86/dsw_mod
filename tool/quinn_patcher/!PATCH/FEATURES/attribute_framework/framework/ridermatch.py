#!/usr/bin/env python3
"""Which rider an id named, kept as its CREDIT (riders may share one; `none` is reserved)."""
from tools.project import guard
from tools.hlcode import number, template, written
from framework import names as vocab
from framework.effectdata import STAMP_IS
from framework.effecttable import STAMPS
from framework.names import module_of, vocabulary
from framework.pieceword import spellings
from framework.rowreader import reader_for

# the folder of rider files; what each must declare is `framework/names.py`'s, as for a scope
FAMILY = "riders"
# what a rider's file calls its credit: the effect table's word, never a number
DECLARES = "STAMP"
# the one thing this works out: who the result counts for
NAMED = "rider"
FOUND = ((NAMED, vocab.NUMBER_KEPT_IN),)
# what the place holds when no rider was spelled: the row keeps the credit it always had
NOTHING_SPELLED = 0
# a rider that only stamps (`StampedTo…`) says so; its credit is lifted past every giver's
ONLY_STAMPS = "STAMP_ONLY"
STAMPED_FROM = len(STAMP_IS)
# `For<Owner>`: the owner word glued on picks the factions walked; its number sits above
OWNER_SHIFT, CREDIT_MASK = 4, 15
# what a rider's walk asks: does it walk at all, and does it take this faction
WALKS, TAKES = "does this rider walk the factions", "does this rider take this faction"


def stamped(credit):
    """The number a stamping rider of this credit is kept as: never one a giving rider holds."""
    return STAMP_IS[credit] + STAMPED_FROM


def registers(bc, fn, reader=None):
    """The one place this needs, on `fn`, typed from a borrowed signature."""
    reader = reader or reader_for(bc)
    return {name: reader.borrow_register(bc, fn, kind) for name, kind in FOUND}


def only_riders(words):
    """The vocabulary narrowed to the rider words. THE ONE PLACE that narrowing is written."""
    return {spelling: word for spelling, word in words.items() if word.family == FAMILY}


def checked(claims, stamping=(), owners=()):
    """Every claim against the rules a rider's credit has; one taking owner words walks them all."""
    out = {}
    for spelling in sorted(claims):
        claimed = claims[spelling]
        guard(claimed in STAMPS,
              "`%s` says its %s is %r, and a credit is one of %s"
              % (spelling, DECLARES, claimed, ", ".join(STAMPS)))
        guard(STAMP_IS[claimed] != NOTHING_SPELLED,
              "`%s` credits `%s`, which is numbered %d -- the value that means no rider was "
              "spelled at all" % (spelling, claimed, NOTHING_SPELLED))
        out[spelling] = stamped(claimed) if spelling in stamping else STAMP_IS[claimed]
        guard(spelling not in owners or claimed == "all", "`%s` takes an owner word and credits "
              "`%s`; only a walk over every faction can pick by owner" % (spelling, claimed))
    guard(out, "no rider declares a credit, so no row could ever name one")
    return out


def said_about_targets(riders):
    """⛔ A RIDER MAY NOT NAME A TARGET COLUMN: a property of the kind, refused for every rider."""
    for spelling in sorted(riders):
        said = getattr(riders[spelling], "target", None)
        guard(said == vocab.NEVER,
              "`%s` says its target is %r, and a rider names no target column -- it says who the "
              "result counts for, never what it is about" % (spelling, said))
    return riders


def credits(words=None):
    """Every rider word and the credit its own file asks for, as a number."""
    from framework.narrowmatch import owners_pick
    words = vocabulary() if words is None else words
    mine = said_about_targets(only_riders(words))
    return checked({spelling: getattr(module_of(word), DECLARES, None)
                    for spelling, word in mine.items()},
                   {spelling for spelling, word in mine.items()
                    if getattr(module_of(word), ONLY_STAMPS, False)},
                   {spelling for spelling, word in mine.items() if owners_pick(word)})


def credit_of(rider, words=None):
    """The number one rider's file asks for, asked for BY THE WORD a modder types."""
    every = credits(words)
    guard(rider in every,
          "`%s` is not a rider this build knows: %s" % (rider, ", ".join(sorted(every))))
    return every[rider]


def emit_walks(place, rider, into):
    """`into` is `rider` when it walks every faction (`ForAll`, `For<Owner>`), else one past it."""
    from tools.hlcode import assemble
    from framework.pipeline import Place

    def body(hands):
        at = Place(WALKS, {}, {}, None, None, None, "%s: done" % WALKS, hands)
        low, want, no = at.scratch_like(0), at.scratch_like(0), at.here("it does not walk")
        return assemble([
            at.op("Int", dst=low, ptr=at.number(CREDIT_MASK)),
            at.op("And", dst=low, a=0, b=low),
            at.op("Int", dst=want, ptr=at.number(STAMP_IS["all"])),
            (at.op("JNotEq", a=low, b=want), no),
            at.op("Ret", ret=0),
            no + ":", at.op("Label"),
            # ⛔ THE POOL HOLDS NO NEGATIVE NUMBER: one past the rider is never the rider
            at.op("Int", dst=want, ptr=at.number(1)),
            at.op("Add", dst=want, a=0, b=want),
            at.op("Ret", ret=want)])
    kinds = [place.kind_of(rider)]
    if 0 in kinds:
        return [place.op("Int", dst=into, ptr=place.number(STAMP_IS["all"]))]
    made = place._hands["shared"]((WALKS,) + tuple(kinds), kinds, place.kind_of(into), body)
    return [place.op("CallN", dst=into, fun=made, args=[rider])]


def emit_taken(place, handed, into):
    """`into` is the faction `item` holds when the rider takes it against the rule's holder."""
    from tools.hlcode import assemble
    from framework.ownermatch import ASKED_AS, emit_judged
    from framework.pipeline import Place
    rider, whose, item = handed

    def body(hands):
        at = Place(TAKES, {}, {}, None, None, None, "%s: none" % TAKES, hands)
        faction, owner, spare = at.scratch_of(ASKED_AS), at.scratch_like(0), at.scratch_like(0)
        # ⛔ THE HOLDER IS CAST INTO ITS OWN PLACE: cast into `faction`, each one is the holder
        mine, narrowing = at.narrowed(1, at.scratch_of(ASKED_AS), goes_to=at.refused)
        taken = at.here("taken")
        return assemble([
            at.op("UnsafeCast", dst=faction, src=2),
            (at.op("JNull", reg=faction), at.refused),
            at.op("Int", dst=spare, ptr=at.number(OWNER_SHIFT)),
            at.op("SShr", dst=owner, a=0, b=spare),
            at.op("Int", dst=spare, ptr=at.number(0)),
            (at.op("JEq", a=owner, b=spare), taken)] + narrowing + emit_judged(
            at, owner, mine, faction) + [
            taken + ":", at.op("Label"),
            at.op("Ret", ret=faction),
            at.refused + ":", at.op("Label"),
            at.op("Null", dst=faction),
            at.op("Ret", ret=faction)])
    kinds = [place.kind_of(r) for r in handed]
    if 0 in kinds + [place.kind_of(into)]:
        return [place.op("UnsafeCast", dst=into, src=item)]
    made = place._hands["shared"]((TAKES,) + tuple(kinds), kinds, place.kind_of(into), body)
    return [place.op("CallN", dst=into, fun=made, args=list(handed))]


def emit_forget(bc, r):
    """Empty the place, before an id is read. The other end of the latch the branches are."""
    return [written(template(bc, "Int"), dst=r[NAMED], ptr=number(bc, NOTHING_SPELLED))]


def branches(bc, r, words=None, hands=None):
    """One branch per rider spelling: its credit written; a glued owner word's number above it."""
    words = vocabulary() if words is None else words
    every = credits(words)
    written_as = [one for one in spellings(only_riders(words)) if one.with_owner is None]
    guard(written_as, "no rider has a spelling, so no piece could ever match one")
    return [(one, [written(template(bc, "Int"), dst=r[NAMED],
                           ptr=number(bc, every[one.word.spelling]))]
             + _owner_above(bc, r, one, hands)) for one in written_as]


def _owner_above(bc, r, one, hands):
    """`For<Owner>`: the owner word cut off the piece, its number put above the credit."""
    from framework.narrowmatch import owners_pick
    from framework.pieceword import OWNER_HAND
    if hands is None or not owners_pick(one.word):
        return []
    spare = hands["place"](reader_for(bc).count_kind)
    return [written(template(bc, "Int"), dst=spare, ptr=number(bc, OWNER_SHIFT)),
            written(template(bc, "Shl"), dst=spare, a=hands[OWNER_HAND], b=spare),
            written(template(bc, "Add"), dst=r[NAMED], a=r[NAMED], b=spare)]


def install(bc):
    """Read every rider's credit out of its own file, and put those numbers in the pool."""
    every = credits()
    for claimed in sorted(set(every.values())) + [NOTHING_SPELLED]:
        number(bc, claimed)
    return ("RIDER MATCH: %d rider(s), each asking for the credit its own file names -- %s -- "
            "kept under the application, so the settling a tick later credits the grant to the "
            "faction the rider named instead of the receiver's owner"
            % (len(every), ", ".join("`%s` is %d" % pair for pair in sorted(every.items()))))
