#!/usr/bin/env python3
"""One narrowing's question asked at the gate, and its yes and no swapped when `Not` is glued in."""
import importlib
from copy import copy

from tools.project import gv
from tools.hlcode import function_named, number, template, text_object, written
from framework.names import module_of, own_file, vocabulary

# the folder whose files declare a negation word
FAMILY = "negations"
# the game's own joining of two texts, so a piece read with its negation taken out is one text
JOINED_BY = "$String.__add__"
# what the classifier hands a narrowing's branch: where the piece's negation sat, 0 for none
HAND = "negated"
# what a word's file says when `Not` may turn what it counts: the text `Not` sits right after
TURNED_AFTER_BY = "TURNED_AFTER"
# said once a game where a row is turned away for a `Not` its word cannot take there
UNTURNABLE = "SPINE `%s` refused: a turned name joins only a turned group"
# the negation words' table: each one's number in front of it all, and after an owner word
NEGATIONS = ("the negation table", "the negation table's numbers", "the negation table, built")
FIRST_AT, SECOND_AT = 0, 1
# declared by a question whose owner word `Not` may sit before: `BordersNotEnemy`
NOT_BEFORE_BY = "NOT_BEFORE_THE_OWNER"


def turned_after(word):
    """The text `Not` sits after in this word's marked spelling, or None when it takes none."""
    return getattr(module_of(word), TURNED_AFTER_BY, None)


# what a word's file says when it takes no `Not`, and why; or why it should and is not built yet
NOT_NONE_BY, NOT_OWED_BY = "NOT_NONE", "NOT_OWED"
# a narrowing's verb and its turned form, which the word builder says for `Not` in front
NOT_VERB_BY = "NOT_VERB"
# WHY A WORD TAKES NO `Not`, one sentence per role, named by every file it is true of
NOT_IS_ITSELF = "it is `Not` itself"
OWNER_TURNS_ITS_WORD = "an owner word is glued to a word; `Not` turns that word, never the owner"
RIDER_HAS_NO_OTHER_SIDE = "a rider names who is credited; `Not` has no other side of it to give"
PLACE_HAS_NO_TARGET = "it names one place and no target, so nothing is left over to keep"
SHAPES_THE_EFFECT = "it shapes the effect's amount or pick; there is no set of things to turn"
COMPARISON_IS_A_SIDE = "a comparison already says which side of `val` is kept"
NAMES_NOTHING_TO_LEAVE_OUT = "it names no target, so there is nothing to leave out"
NO_OTHER_ONE_IS_MEANT = "it pays one named amount; a random other one is no rule a modder means"
ONE_AMOUNT_COUNTED = "it counts one named amount; the rest of them is no count at all"
OR_ADDS_TO_A_COUNT = "it adds a kind to a count; leaving one out is that count's own `Not`"
SWITCHES_A_CHECK_OFF = "it switches one of the game's checks off; there is nothing to turn"
WEIGHED_BY_ITS_COMPARISON = "its comparison word already says which side of `val` is kept"
DATE_HAS_NO_OTHER_SIDE = "it names one date; every other day is no rule a modder means"


def takes_not(word):
    """How `Not` reaches a word: before a narrowing, as a flag's turn, after its marked text."""
    from framework.narrowmatch import flag_of
    if word.family == "narrowing":
        return "in front"
    if flag_of(word) is not None:
        return "as its flag's turn"
    after = turned_after(word)
    return None if after is None else "after %r" % after


def unsaid(words=None):
    """(silent, owed): each word saying nothing true of `Not`, and each owing it, a line each."""
    from framework.names import DUMMY_SOURCE
    words = vocabulary() if words is None else words
    silent, owed = [], []
    for spelling, word in sorted(words.items()):
        if word.source == DUMMY_SOURCE:
            continue
        module = module_of(word)
        none, due = getattr(module, NOT_NONE_BY, None), getattr(module, NOT_OWED_BY, None)
        if takes_not(word) is not None:
            silent += ["`%s` (%s) takes `Not` %s and says it does not"
                       % (spelling, word.source, takes_not(word))] * bool(none or due)
            silent += ["`%s` (%s) takes `Not` in front and names no `%s`"
                       % (spelling, word.source, NOT_VERB_BY)] * (
                word.family == "narrowing" and not getattr(own_file(word), NOT_VERB_BY, None))
        elif due:
            owed.append("`%s` owes `Not`: %s" % (spelling, due))
        elif not none:
            silent.append("`%s` (%s) never says whether it takes `Not`, or why not"
                          % (spelling, word.source))
    return silent, owed


def turnable(one):
    """Does this spelling take `Not`: a narrowing, a modifier or a marked one saying so."""
    from framework.narrowmatch import flag_of
    return (one.word.family == "narrowing" or flag_of(one.word) is not None
            or ((one.targeted or one.word.family == "modifiers")
                and turned_after(one.word) is not None))


def emit_left_out(bc, hands, typed, spare, pushed, tag):
    """Turned (`PerNotTUnit2`): its type marked as left out, and no widener may add to it."""
    if hands.get(HAND) is None:
        return []
    plain = "%s: not turned" % tag
    return [_op(bc, "Int", dst=spare, ptr=number(bc, 0)),
            (_op(bc, "JEq", a=hands[HAND], b=spare), plain),
            _op(bc, "Int", dst=typed, ptr=number(bc, 0))] + list(pushed) + [
        plain + ":", _op(bc, "Label")]


def emit_kept(bc, hands, spare, kept, tag):
    """Whether the group just opened was turned, into `kept`: 1 turned, 0 not."""
    if hands.get(HAND) is None:
        return []
    plain = "%s: kept unturned" % tag
    return [_op(bc, "Int", dst=kept, ptr=number(bc, 0)),
            _op(bc, "Int", dst=spare, ptr=number(bc, 0)),
            (_op(bc, "JEq", a=hands[HAND], b=spare), plain),
            _op(bc, "Int", dst=kept, ptr=number(bc, 1)),
            plain + ":", _op(bc, "Label")]


def emit_unturnable(bc, hands, spare, word, tag, group=None):
    """A turned name joining an unturned group (`…_OfTDomain2_NotOfTDomain3`): refused."""
    if hands.get(HAND) is None:
        return []
    plain = "%s: not turned" % tag
    joins = [] if group is None else [(_op(bc, "JNotEq", a=group, b=spare), plain)]
    return [_op(bc, "Int", dst=spare, ptr=number(bc, 0)),
            (_op(bc, "JEq", a=hands[HAND], b=spare), plain)] + joins + hands["say"](
        UNTURNABLE % word) + hands["refuse"]() + [plain + ":", _op(bc, "Label")]


def emit_group_left_out(place, s):
    """`s.turned` set, and the mark stepped past, when the group's next name is `s.left_out`."""
    plain = place.here("%s, its names counted" % s.word)
    return [place.op("Int", dst=s.turned, ptr=place.number(0)),
            (place.op("JSGte", a=s.at, b=s.how_many), plain),
            place.op("GetArray", dst=s.got, array=s.backing, index=s.at),
            (place.op("JNull", reg=s.got), plain),
            place.op("UnsafeCast", dst=s.name, src=s.got),
            (place.op("JNotEq", a=s.name, b=s.left_out), plain),
            place.op("Int", dst=s.turned, ptr=place.number(1)),
            place.op("Incr", dst=s.at),
            plain + ":", place.op("Label")]


def emit_from_all(place, s, everything):
    """Turned, the count starts from everything its multiplier counts: `everything(place)`."""
    plain = place.here("%s, counted from none" % s.word)
    return [(place.op("JEq", a=s.turned, b=s.zero), plain)] + everything(place) + [
        plain + ":", place.op("Label")]


def emit_added_or_taken(place, s, many):
    """One name's `many` added to `s.count`, or taken from it when the group is turned."""
    added, done = (place.here("%s, %s" % (s.word, what)) for what in ("added", "taken"))
    return [(place.op("JEq", a=s.turned, b=s.zero), added),
            place.op("Sub", dst=s.count, a=s.count, b=many),
            (place.op("JAlways"), done),
            added + ":", place.op("Label"),
            place.op("Add", dst=s.count, a=s.count, b=many),
            done + ":", place.op("Label")]


def emit_owned(place, word, faction, total, kinds=None):
    """One picked faction's count into `total`; turned (`PerAllNotTTreaty2`), all less the named."""
    from framework.foreignwalk import counter_for
    from framework.questpick import _here
    emit_counted_on = counter_for(word)
    named, turned, every = kinds or (None, None, None)
    if turned is None:
        return emit_counted_on(place, word, faction, total, named)
    taken, zero = place.scratch_like(total), place.scratch_like(turned)
    plain, done = _here(place, "%s, not turned" % word), _here(place, "%s, left out" % word)
    return [place.op("Int", dst=zero, ptr=place.number(0)),
            (place.op("JEq", a=turned, b=zero), plain),
            place.op("Int", dst=taken, ptr=place.number(0))] + emit_counted_on(
        place, word, faction, taken, named) + [
        place.op("Sub", dst=total, a=total, b=taken)] + emit_counted_on(
        place, word, faction, total, every) + [
        (place.op("JAlways"), done), plain + ":", place.op("Label")] + emit_counted_on(
        place, word, faction, total, named) + [done + ":", place.op("Label")]


def emit_never_below(place, s):
    """A count is never under none: what the game lists may hold more than it counts."""
    fine = place.here("%s, not below none" % s.word)
    return [(place.op("JSGte", a=s.count, b=s.zero), fine),
            place.op("Int", dst=s.count, ptr=place.number(0)),
            fine + ":", place.op("Label")]


def where_they_sit(words=None, at="IN_FRONT"):
    """The numbers negation words take for one place in a narrowing's piece, each once."""
    words = vocabulary() if words is None else words
    return sorted({getattr(module_of(words[s]), at) for s in _negations(words)})


def _negations(words):
    return [s for s in sorted(words) if words[s].family == FAMILY]


def negation_text(words):
    """The negation table: each text `Not` may follow, its number for a first `Not`, a second."""
    from framework.wordtable import SEP
    said = [(s, module_of(words[s])) for s in _negations(words)]
    first = said[0][1]
    owners = sorted(s for s in words if words[s].family == "owners")
    # ⛔ A SECOND `Not` ADDS ITS NUMBER to the first's, in front: 0 where none may follow
    rows = [(s, m.IN_FRONT, 0) for s, m in said] + [
        (o, first.AFTER_THE_OWNER, 0) for o in owners] + [
        (h, first.IN_FRONT, 0) for h in _heads(words)] + [
        (s, first.BEFORE_THE_OWNER, first.BOTH_SIDES - first.IN_FRONT)
        for s in before_the_owner(words)]
    return SEP.join(SEP.join([s, str(one), str(two)]) for s, one, two in rows)


def before_the_owner(words):
    """`Borders`: each text an owner word follows that `Not` may sit straight after."""
    from framework.narrowmatch import only_narrowings, owner_stem, owners_after
    return sorted({owner_stem(w) or w.spelling for w in only_narrowings(words).values()
                   if getattr(module_of(w), NOT_BEFORE_BY, False)
                   and (owners_after(w) or owner_stem(w))})


def sits(at, words=None):
    """The numbers `Not` takes where `at` says, both sides counted with each."""
    return sorted(set(where_they_sit(words, at) + where_they_sit(words, "BOTH_SIDES")))


def _heads(words):
    """`Per`, `EnemyPer`, `Complete`: each text `Not` may sit after, an owner word in front too."""
    heads = sorted({turned_after(w) for w in words.values() if turned_after(w)})
    owners = sorted(s for s in words if words[s].family == "owners")
    return [o + h for h in heads for o in [""] + owners if o + h not in words]


def place_for(bc, fn, reader, words):
    """Where the classifier keeps a piece's negation, or None when no negation word ships."""
    from framework.parsed import a_new_place
    if not [s for s in words if words[s].family == FAMILY]:
        return None
    return a_new_place(bc, fn, reader.count_kind)


def _op(bc, name, **operands):
    return written(template(bc, name), **operands)


def emit_none_yet(bc, negated):
    """Each piece starts with no negation read off it."""
    return [_op(bc, "Int", dst=negated, ptr=number(bc, 0))]


def emit_again_here(bc, places):
    """Where a piece with its negation taken off is asked again: the first narrowing."""
    return ["%s TURNED AGAIN" % places + ":", _op(bc, "Label")]


def emit_only_narrowings(bc, r, negated, places):
    """Past the last narrowing, a piece a negation was taken off is no other kind of word."""
    return [(_op(bc, "JNotEq", a=negated, b=r["zero"]), "%s TURNED OFF" % places)]


def emit_taken_off(bc, fn, r, reader, negated, places):
    """Read no word: take a negation off once, in front of it all or after an owner word."""
    from framework import tray
    from framework.parsed import a_new_place
    from framework.wordtable import SEP, emit_read, emit_ready
    words = vocabulary()
    joined = function_named(bc, JOINED_BY)
    unread, again = "%s TURNED UNREAD" % places, "%s TURNED AGAIN" % places
    second, cutting = "%s TURNED TWICE" % places, "%s TURNED, CUT" % places
    table, the_map, backing, got = emit_ready(bc, fn, reader, negation_text(words), NEGATIONS,
                                              places + " TURNED", r["zero"])
    every, sep, spelling = (a_new_place(bc, fn, reader.text_kind) for _ in range(3))
    start, size, length, cursor, spare, at, entry, its = (
        a_new_place(bc, fn, reader.count_kind) for _ in range(8))

    def number_of(which, into=negated, of=cursor):
        return emit_read(bc, backing, got, of, which, into, (spare, at))

    def entry_of(missing):
        return [_op(bc, "Call2", dst=got, fun=gv(function_named(bc, tray.LOOK_UP).findex),
                    arg0=the_map, arg1=r["word"]),
                (_op(bc, "JNull", reg=got), missing), _op(bc, "SafeCast", dst=entry, src=got)]
    # what is in front of it, and what is after it, joined into the stem asked again
    cut = [_op(bc, "Field", dst=r["at"], obj=spelling, field=reader.text_length_field),
           _op(bc, "Add", dst=r["at"], a=r["at"], b=r["found"]),
           _op(bc, "Call3", dst=r["tail"], fun=gv(reader.tailing.findex),
               arg0=r["stem"], arg1=r["at"], arg2=r["nothing"]),
           _op(bc, "Call2", dst=r["stem"], fun=gv(joined.findex), arg0=r["word"], arg1=r["tail"]),
           _op(bc, "Field", dst=r["slen"], obj=r["stem"], field=reader.text_length_field)]
    following, its_end = "%s NEXT NEGATION" % places, "%s NEGATION SPELT" % places
    # each negation word in turn, its spelling read off one text: none is written here
    out = ["%s TURNED OFF" % places + ":", _op(bc, "Label")] + table + [
        _op(bc, "GetGlobal", **{"dst": every, "global": text_object(
            bc, SEP.join(_negations(words)))}),
        _op(bc, "GetGlobal", **{"dst": sep, "global": text_object(bc, SEP)}),
        _op(bc, "Field", dst=size, obj=every, field=reader.text_length_field),
        _op(bc, "Mov", dst=start, src=r["zero"]),
        following + ":", _op(bc, "Label"),
        (_op(bc, "JSGte", a=start, b=size), unread),
        _op(bc, "ToDyn", dst=r["boxed"], src=start),
        _op(bc, "Call3", dst=r["found"], fun=gv(reader.finding.findex), arg0=every, arg1=sep,
            arg2=r["boxed"]),
        (_op(bc, "JSGte", a=r["found"], b=r["zero"]), its_end),
        _op(bc, "Mov", dst=r["found"], src=size),
        its_end + ":", _op(bc, "Label"),
        _op(bc, "Sub", dst=length, a=r["found"], b=start),
        _op(bc, "ToDyn", dst=r["boxed"], src=length),
        _op(bc, "Call3", dst=spelling, fun=gv(reader.tailing.findex), arg0=every, arg1=start,
            arg2=r["boxed"]),
        _op(bc, "Add", dst=start, a=r["found"], b=r["one"]),
        _op(bc, "Call2", dst=got, fun=gv(function_named(bc, tray.LOOK_UP).findex), arg0=the_map,
            arg1=spelling),
        _op(bc, "SafeCast", dst=cursor, src=got),
        _op(bc, "Call3", dst=r["found"], fun=gv(reader.finding.findex),
            arg0=r["stem"], arg1=spelling, arg2=r["nothing"]),
        (_op(bc, "JSLt", a=r["found"], b=r["zero"]), following),
        _op(bc, "ToDyn", dst=r["boxed"], src=r["found"]),
        _op(bc, "Call3", dst=r["word"], fun=gv(reader.tailing.findex),
            arg0=r["stem"], arg1=r["zero"], arg2=r["boxed"]),
        (_op(bc, "JNotEq", a=negated, b=r["zero"]), second)] + number_of(FIRST_AT) + [
        (_op(bc, "JEq", a=r["found"], b=r["zero"]), cutting)]
    # ⛔ `EnemyNotHasTDev`, `PerNotTUnit`, `BordersNotEnemy`: only after a text on the table, whole
    out += entry_of(unread) + number_of(FIRST_AT, of=entry) + [
        (_op(bc, "JAlways"), cutting), second + ":", _op(bc, "Label")]
    # `NotBordersNotEnemy`: a second `Not`, after a text that takes one, adds its number
    out += entry_of(unread) + number_of(SECOND_AT, its, entry) + [
        (_op(bc, "JEq", a=its, b=r["zero"]), unread),
        _op(bc, "Add", dst=negated, a=negated, b=its),
        cutting + ":", _op(bc, "Label")] + cut + [(_op(bc, "JAlways"), again)]
    return out + [unread + ":", _op(bc, "Label")]


def emit_asked(place, holder, spelling, words, bit, named, at_column, which):
    """Past this the narrowing `spelling` let the thing through, turned or not; else refused."""
    from framework import narrowmatch, ownerpicks
    from framework.scopematch import (emit_it_is_at_its_own_maximum,
                                      emit_the_named_trait_is_carried)
    word = module_of(words[spelling])
    at_least = getattr(word, "AT_LEAST", None)
    turning, negated = narrowmatch.emit_its_negation(place, bit)
    # ⛔ A ROAD WITH NO `val` NEVER OPENS A WEIGHED WORD: turned, it would pass every thing
    turnable = not (at_least and place.row.get(at_least) is None)
    asking, out = copy(place), list(turning)
    if turnable:
        asking.refused = place.here("%s said no" % spelling)
        out += _a_typo_is_never_turned(place, named, negated, words[spelling])
    if at_least:
        out += ownerpicks.weighed(asking, holder, named, word, which, bit, negated=negated)
    elif getattr(word, "AGAINST", None):
        out += emit_it_is_at_its_own_maximum(asking, holder, word.ASKS, word.AGAINST,
                                             getattr(word, "ASKED_OF"), tag=spelling,
                                             requires=getattr(word, "REQUIRES", None))
    elif getattr(word, "EMITS", None):
        out += importlib.import_module(word.EMITS).emit(asking, holder, spelling)
    else:
        out += emit_the_named_trait_is_carried(asking, holder, named, at_column, word.ASKS,
                                               word.THROUGH, spelling,
                                               words[spelling].target == "required")
    return out + (_turned(place, negated, asking.refused, spelling, words) if turnable else [])


def _a_typo_is_never_turned(place, named, negated, word):
    """A negated word whose column names nothing refuses, as it does unturned: never a pass."""
    if word.target != "required":
        return []
    none = place.scratch_like(negated)
    plain = place.here("%s is not turned" % word.spelling)
    return [place.op("Int", dst=none, ptr=place.number(0)),
            (place.op("JEq", a=negated, b=none), plain),
            (place.op("JNull", reg=named), place.refused),
            plain + ":", place.op("Label")]


def _sent(place, negated, numbers, to):
    """A jump to `to` when the negation's number is any of `numbers`."""
    spare = place.scratch_like(negated)
    out = []
    for n in numbers:
        out += [place.op("Int", dst=spare, ptr=place.number(n)),
                (place.op("JEq", a=negated, b=spare), to)]
    return out


def _turned(place, negated, said_no, spelling, words):
    """The yes refuses and the no passes when `Not` stands in front of it all; else as asked."""
    front = (sits("IN_FRONT", words) if getattr(module_of(words[spelling]), NOT_BEFORE_BY, False)
             else where_they_sit(words))
    passed = place.here("%s let it through" % spelling)
    return _sent(place, negated, front, place.refused) + [
        (place.op("JAlways"), passed), said_no + ":", place.op("Label")] + _sent(
        place, negated, front, passed) + [
        (place.op("JAlways"), place.refused), passed + ":", place.op("Label")]
