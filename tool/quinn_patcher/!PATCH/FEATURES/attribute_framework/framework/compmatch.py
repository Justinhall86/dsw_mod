#!/usr/bin/env python3
"""Which comparison word follows each weighing narrowing, in its slot; that narrowing asks it."""
from tools.project import guard
from tools.hlcode import number, template, written
from framework import names as vocab
from framework import narrowmatch
from framework.names import module_of, vocabulary
from framework.pieceword import spellings

# the folder whose files declare a comparison word
FAMILY = "comparisons"
# what such a file calls the sides of `val` that keep the thing
KEEPS_BY = "KEEPS"
# each side of `val`, and the game's own test that the amount weighed lies on that side of it
SIDES = (("below", "JSLt"), ("above", "JSGt"))
# with no comparison spelled, at or above `val` keeps the thing
UNSPELLED_KEEPS = ("above",)
# what a slot holds when its narrowing was given no comparison
NONE_GIVEN = 0


def only_comparisons(words):
    """The vocabulary narrowed to the comparison words."""
    return {spelling: word for spelling, word in words.items() if word.family == FAMILY}


def keeps_of(word):
    """The sides of `val` one comparison word keeps."""
    kept = getattr(module_of(word), KEEPS_BY, None)
    sides = {side for side, _jump in SIDES}
    guard(isinstance(kept, tuple) and set(kept) <= sides,
          "%s keeps %r, and a comparison keeps a tuple of %s" % (word.source, kept, sorted(sides)))
    return kept


def numbers(words=None):
    """Every comparison word and its own number, each fitting one narrowing's slot."""
    words = vocabulary() if words is None else words
    widest = narrowmatch.NAMES_NOTHING
    out = {}
    for spelling in sorted(only_comparisons(words)):
        claimed = getattr(module_of(words[spelling]), vocab.DECLARES, None)
        guard(isinstance(claimed, int) and not isinstance(claimed, bool)
              and NONE_GIVEN < claimed <= widest,
              "`%s` says its %s is %r, and a comparison's is a whole one from 1 to %d"
              % (spelling, vocab.DECLARES, claimed, widest))
        taken = [s for s, n in out.items() if n == claimed]
        guard(not taken, "`%s` and `%s` both claim the number %d"
              % (taken[0] if taken else "?", spelling, claimed))
        out[spelling] = claimed
    return out


def code_of(word):
    """What the slot holds for a comparison: a bit per side it keeps unlike none given."""
    kept = keeps_of(word)
    return sum(1 << k for k, (side, _jump) in enumerate(SIDES)
               if (side in kept) != (side in UNSPELLED_KEEPS))


def branches(bc, r, words=None, spare=None, listed=None, hands=None):
    """One branch per comparison spelling: its code in the slot of the narrowing it follows."""
    words = vocabulary() if words is None else words
    from framework.parsed import OR, RECORDED
    from framework.acts.start_quest import emit_filed_comparison
    numbers(words)
    kept, last = r[narrowmatch.KEPT_HAND], r[narrowmatch.LAST]
    slots = narrowmatch.chunk_names(narrowmatch.COMPARED, narrowmatch.SPELLED)
    guard([RECORDED.index(s) - RECORDED.index(slots[0]) for s in slots] == list(range(len(slots))),
          "the comparisons' numbers do not sit one after another on the row's list")
    out = []
    for one in spellings(only_comparisons(words)):
        follows = "%s follows no narrowing" % one.text
        filed = "%s follows an Of modifier" % one.text
        # ⛔ INTO THE SLOT OF THE NARROWING IT FOLLOWS: `last` is one past that slot, 0 for none
        out.append((one, [
            written(template(bc, "Int"), dst=spare, ptr=number(bc, 0)),
            (written(template(bc, "JEq"), a=last, b=spare), follows),
            written(template(bc, "Int"), dst=spare, ptr=number(bc, narrowmatch.MODIFIED)),
            (written(template(bc, "JEq"), a=last, b=spare), filed),
            written(template(bc, "Int"), dst=spare, ptr=number(bc, 1)),
            written(template(bc, "Sub"), dst=spare, a=last, b=spare)]
            + kept.fold(slots[0], OR, at=spare, const=code_of(one.word)) + [
            filed + ":", written(template(bc, "Label"))]
            + emit_filed_comparison(bc, code_of(one.word), listed, hands) + [
            follows + ":", written(template(bc, "Label"))]))
    return out


def emit_compared(place, held, least, short, which, tag, words=None):
    """Past this, `held` lies on a side of `least` the code `which` keeps; else `short`."""
    spare, nil = place.scratch_like(which), place.scratch_like(which)
    out = [place.op("Int", dst=nil, ptr=place.number(NONE_GIVEN))]
    for k, (side, jump) in enumerate(SIDES):
        asked, kept = (place.here("%s, %s %s" % (tag, side, what)) for what in ("asked", "kept"))
        flipped = "JEq" if side in UNSPELLED_KEEPS else "JNotEq"
        out += [place.op("Int", dst=spare, ptr=place.number(1 << k)),
                place.op("And", dst=spare, a=which, b=spare),
                (place.op(flipped, a=spare, b=nil), kept),
                asked + ":", place.op("Label"),
                (place.op(jump, a=held, b=least), short),
                kept + ":", place.op("Label")]
    return out


def install(bc):
    """Read every comparison's number and sides, and pool the numbers its test writes."""
    words = vocabulary()
    every = numbers(words)
    for value in sorted({NONE_GIVEN} | {1 << k for k in range(len(SIDES))}
                        | {code_of(words[s]) for s in every}):
        number(bc, value)
    return ("COMPARISONS: %d word(s), each in the slot of the weighing narrowing it follows -- "
            "%s; with none given, at or above `val` keeps the thing, and `val` itself always does"
            % (len(every), "; ".join("`%s` is %d and keeps %s" % (
                s, n, " and ".join(keeps_of(words[s])) or "neither side")
                for s, n in sorted(every.items()))))
