#!/usr/bin/env python3
"""The narrowings a count asks of its member by one call: each its own function, chained."""
import importlib

from tools.project import guard
from framework.names import module_of, vocabulary

# each chained narrowing's member check, a function of its own calling the next, and the last
CHECK, LAST_CHECK = "member check, %s", "member check, nothing more"
# what the chain says of the name read: none of its narrowings, the member passes, it is refused
NOT_OURS, PASSES, REFUSED = 0, 1, 2
# the row parts handed to every check, so a word added changes no call
PARTS = ("holder",)
# what a chained word's file names the row parts it reads
READS_TOO_BY = "READS_TOO"


def chained(word):
    """Is this narrowing asked through the chain: one asking by its own `EMITS`?"""
    words = vocabulary()
    return words[word].family in ("modifiers", "narrowing") and bool(
        getattr(module_of(words[word]), "EMITS", None))


def chain():
    """Every chained narrowing, in a settled order; each reads only the parts handed to all."""
    from framework.questions import narrowers
    out = tuple(n for n in narrowers() if chained(n))
    for word in out:
        reads = getattr(module_of(vocabulary()[word]), READS_TOO_BY, ())
        guard(set(reads) <= set(PARTS), "`%s` asked where the row's own thing is not in hand: "
              "it reads %s, and every check is handed %s" % (word, reads, PARTS))
    return out


def emit_asked(place, member, name, verdict):
    """`verdict` holds what the chain says of the name just read of the member's group."""
    parts = [p for p in PARTS if place.row.get(p) is not None]
    kinds = [place.kind_of(name), place.kind_of(member)] + [
        place.kind_of(place.row[p]) for p in parts]
    return _calling(place, (kinds, parts), chain(), verdict,
                    [name, member] + [place.row[p] for p in parts])


def _calling(place, handed, every, verdict, args):
    """A call to the first chained narrowing's check, or the last one, handed name and member."""
    from tools.hlcode import assemble
    from framework.parsed import loaded
    from framework.pipeline import Place
    kinds, parts = handed
    named = CHECK % every[0] if every else LAST_CHECK

    def body(hands):
        made = Place(named, {p: 2 + i for i, p in enumerate(parts)}, {}, None, None, None,
                     "%s: refused" % named, hands)
        said = made.scratch_of("I32")
        if not every:
            return assemble(loaded(made, [made.op("Int", dst=said, ptr=made.number(NOT_OURS)),
                                          made.op("Ret", ret=said)]))
        return assemble(loaded(made, _check(made, handed, every, said)))
    shared = place._hands["shared"]((named,) + tuple(kinds), kinds, place.kind_of(verdict), body)
    return [place.op("CallN", dst=verdict, fun=shared, args=args)]


def _check(made, handed, every, said):
    """One word's check: its mark or its turned mark asks its question; any other, the next."""
    from framework.membercount import TRAIT, TURNED
    word = every[0]
    its = module_of(vocabulary()[word])
    mark, left, turned, zero = (made.scratch_like(0), made.scratch_like(0),
                                made.scratch_of("I32"), made.scratch_of("I32"))
    plain, other, ask, done = (made.here("%s, %s" % (word, w)) for w in (
        "its mark", "its turned mark", "asked", "answered"))
    return [made.op("GetGlobal", **{"dst": mark, "global": made.text_object(TRAIT % word)}),
            (made.op("JEq", a=0, b=mark), plain),
            made.op("GetGlobal", **{"dst": left, "global": made.text_object(TURNED % word)}),
            (made.op("JEq", a=0, b=left), other)] + _calling(
        made, handed, every[1:], said, list(range(2 + len(handed[1])))) + [
        made.op("Ret", ret=said),
        plain + ":", made.op("Label"), made.op("Int", dst=turned, ptr=made.number(0)),
        (made.op("JAlways"), ask),
        other + ":", made.op("Label"), made.op("Int", dst=turned, ptr=made.number(1)),
        ask + ":", made.op("Label"),
        made.op("Int", dst=zero, ptr=made.number(0))] + importlib.import_module(
        its.EMITS).emit(made, 1, CHECK % word) + [
        made.op("Int", dst=said, ptr=made.number(PASSES)),
        (made.op("JEq", a=turned, b=zero), done),
        made.op("Int", dst=said, ptr=made.number(REFUSED)),
        (made.op("JAlways"), done),
        made.refused + ":", made.op("Label"),
        made.op("Int", dst=said, ptr=made.number(REFUSED)),
        (made.op("JEq", a=turned, b=zero), done),
        made.op("Int", dst=said, ptr=made.number(PASSES)),
        done + ":", made.op("Label"),
        made.op("Ret", ret=said)]


# ⛔ A FACTION'S QUESTION UNDER ANY OTHER COUNT asks the member's owner, by one chain of its own
OWNER_CHECK, OWNER_LAST = "owner check, %s", "owner check, nothing more"
# added to the answer when the check read the name after its mark
TOOK = 4
# why the builder offers none under a count of your own things: every owner asked is you
OWN_THINGS = "every one of your own things has you as its owner: put it on the row instead"


def owner_question(count):
    """The game's question a count's member is asked for its owning faction; none for a faction."""
    from framework.storewalk import ITSELF, OWNER_BY
    scope = module_of(vocabulary()[module_of(vocabulary()[count]).MARKED_AS])
    said = getattr(scope, OWNER_BY, None)
    return None if said in (None, ITSELF) else said


def asks_the_owner(of):
    """Is `of` a faction's weighed question, asked of a counted member through its owner?"""
    from framework.questions import OWNER_AFTER_BY, shares_its_ask
    return shares_its_ask(of) and not getattr(of, OWNER_AFTER_BY, False)


def owned(count, of):
    """Is `of` asked of this count's member through its owner?"""
    return asks_the_owner(of) and bool(owner_question(count))


def owner_chain():
    """Every narrowing asked of a member's owner, in a settled order."""
    from framework.questions import shares_its_ask
    return tuple(sorted(s for s, w in vocabulary().items()
                        if w.family == "narrowing" and shares_its_ask(module_of(w))))


def chained_on(count, word):
    """Is `word` asked through the owner chain on this count, never inline?"""
    return word in owner_chain() and bool(owner_question(count))


def owner_parts():
    """The row parts every owner check is handed: each question's `val` and what it reads."""
    from framework import columns
    out = set()
    for word in owner_chain():
        its = module_of(vocabulary()[word])
        out |= {its.AT_LEAST, columns.PART_FOR_COUNT} | set(getattr(its, READS_TOO_BY, ()))
    return tuple(sorted(out))


def owners(place, s):
    """The member's owner asked every owner check by one call; passed, on; refused, out."""
    from framework.ownerpicks import emit_count_peek
    from framework.questions import FACTION
    asked = owner_question(s.word)
    if asked is None or not owner_chain():
        return []
    tag = "%s, its owner asked" % s.word
    reading, named = emit_count_peek(place, s, tag)
    thing, to_thing = place.narrowed(s.unit, place.scratch_of(asked.rsplit(".", 1)[0]),
                                     goes_to=s.member_next)
    owner = place.scratch_return(asked)
    unowned = place.here("%s, unowned" % tag)
    faction, to_faction = place.narrowed(owner, place.scratch_of(FACTION), goes_to=unowned)
    blank = [] if faction == owner else [place.op("Null", dst=faction)]
    verdict, took = place.scratch_of("I32"), place.scratch_of("I32")
    kept = place.here("%s, no name read" % tag)
    present = [p for p in owner_parts() if place.row.get(p) is not None]
    handed = ([place.kind_of(r) for r in (s.name, named, faction)] + [
        place.kind_of(place.row[p]) for p in present], present)
    return reading + list(to_thing) + [
        place.op("Call1", dst=owner, fun=place.named_function(asked), arg0=thing)] + blank + [
        (place.op("JNull", reg=owner), unowned)] + list(to_faction) + [
        unowned + ":", place.op("Label")] + _owner_calling(
        place, handed, owner_chain(), verdict,
        [s.name, named, faction] + [place.row[p] for p in present]) + [
        place.op("Int", dst=took, ptr=place.number(TOOK)),
        place.op("And", dst=took, a=verdict, b=took),
        (place.op("JEq", a=took, b=s.zero), kept), place.op("Incr", dst=s.j),
        kept + ":", place.op("Label"),
        place.op("Int", dst=took, ptr=place.number(TOOK - 1)),
        place.op("And", dst=verdict, a=verdict, b=took),
        (place.op("JEq", a=verdict, b=s.one), s.entry_next),
        (place.op("JSGt", a=verdict, b=s.one), s.member_next)]


def _owner_calling(place, handed, every, verdict, args):
    """A call to the first owner check, or the last one, handed name, next name and owner."""
    from tools.hlcode import assemble
    from framework.parsed import loaded
    from framework.pipeline import Place
    kinds, present = handed
    named = OWNER_CHECK % every[0] if every else OWNER_LAST

    def body(hands):
        made = Place(named, {p: 3 + i for i, p in enumerate(present)}, {}, None, None, None,
                     "%s: refused" % named, hands)
        said = made.scratch_of("I32")
        if not every:
            return assemble(loaded(made, [made.op("Int", dst=said, ptr=made.number(NOT_OURS)),
                                          made.op("Ret", ret=said)]))
        return assemble(loaded(made, _owner_check(made, handed, every, said)))
    shared = place._hands["shared"]((named,) + tuple(kinds), kinds, place.kind_of(verdict), body)
    return [place.op("CallN", dst=verdict, fun=shared, args=args)]


def _owner_check(made, handed, every, said):
    """One word's owner check: its mark or turned mark weighs the owner; any other, the next."""
    from framework.compmatch import NONE_GIVEN
    from framework.membercount import TRAIT, TURNED
    from framework.questions import emit_asked_of
    word = every[0]
    its, target = module_of(vocabulary()[word]), vocabulary()[word].target
    mark, left = made.scratch_like(0), made.scratch_like(0)
    turned, zero, took, which = (made.scratch_of("I32") for _ in range(4))
    plain, other, ask, yes, done = (made.here("%s, %s" % (word, w)) for w in (
        "its mark", "its turned mark", "asked", "yes", "answered"))
    named, blank = 1, [(made.op("JNull", reg=1), yes)]
    # a word naming nothing reads no name; one naming nothing passes, as a yes would
    if target == "never":
        named = made.scratch_like(1)
        blank = [made.op("Null", dst=named)]
    return [made.op("GetGlobal", **{"dst": mark, "global": made.text_object(TRAIT % word)}),
            (made.op("JEq", a=0, b=mark), plain),
            made.op("GetGlobal", **{"dst": left, "global": made.text_object(TURNED % word)}),
            (made.op("JEq", a=0, b=left), other)] + _owner_calling(
        made, handed, every[1:], said, list(range(3 + len(handed[1])))) + [
        made.op("Ret", ret=said),
        plain + ":", made.op("Label"), made.op("Int", dst=turned, ptr=made.number(0)),
        (made.op("JAlways"), ask),
        other + ":", made.op("Label"), made.op("Int", dst=turned, ptr=made.number(1)),
        ask + ":", made.op("Label"), made.op("Int", dst=zero, ptr=made.number(0)),
        made.op("Int", dst=took, ptr=made.number(0 if target == "never" else TOOK))] + blank + [
        (made.op("JNull", reg=2), made.refused),
        made.op("Int", dst=which, ptr=made.number(NONE_GIVEN))] + emit_asked_of(
        made, its, 2, named, which) + [
        yes + ":", made.op("Label"),
        made.op("Int", dst=said, ptr=made.number(PASSES)),
        (made.op("JEq", a=turned, b=zero), done),
        made.op("Int", dst=said, ptr=made.number(REFUSED)),
        (made.op("JAlways"), done),
        made.refused + ":", made.op("Label"),
        made.op("Int", dst=said, ptr=made.number(REFUSED)),
        (made.op("JEq", a=turned, b=zero), done),
        made.op("Int", dst=said, ptr=made.number(PASSES)),
        done + ":", made.op("Label"),
        made.op("Add", dst=said, a=said, b=took),
        made.op("Ret", ret=said)]
