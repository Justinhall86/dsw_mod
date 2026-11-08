#!/usr/bin/env python3
"""A thing carries at least the row's `val` stacks of the trait a column names."""
from tools.project import guard
from framework.compmatch import emit_compared
from framework.reach import EVERY_HOLDER

# said while `respath` is on, one per way out of the question
HELD = "SPINE `%s` passed: the thing has enough stacks of the trait named"
SHORT = "SPINE `%s` refused: the thing has the wrong number of stacks of the trait named"


def _saying(place, text):
    """One line while `respath` is on; nothing otherwise."""
    return place.said("respath", lambda: place.said_now(text))


def emit(place, holder, named, word, compared):
    """Past this, the thing has `val` stacks of the trait `named` as compared, or it is refused."""
    least = place.row.get(word.AT_LEAST)
    # a gate handed no `val` cannot weigh what is carried, so the row narrows to nobody
    if least is None:
        return [(place.op("JAlways"), place.refused)]
    manager = place.scratch_return(word.THROUGH)
    held = place.scratch_return(word.ASKS)
    # a count of stacks is whole and `val` is not: the count is turned into `val`'s kind
    weighed = place.scratch_like(least)
    guard(place.kind_of(weighed) == place.kind_of(least), "no place of `val`'s kind was made")
    # ⛔ the accessor has no null check: its own field is read first, and none carries nothing
    at, carried = place.field_of(EVERY_HOLDER, "_traits")
    # the four filters past the trait, all empty: every stack of it, from anywhere
    anyhow = [place.scratch_arg(word.ASKS, which) for which in (1, 2, 3, 4)]
    short, passed = (place.here("%s, %s" % (word.WORD, what))
                     for what in ("too few stacks", "enough stacks"))
    return [
        (place.op("JNull", reg=named), place.refused),
        place.op("Field", dst=carried, obj=holder, field=at),
        (place.op("JNull", reg=carried), place.refused),
        place.op("Call1", dst=manager, fun=place.named_function(word.THROUGH), arg0=holder),
        (place.op("JNull", reg=manager), place.refused),
    ] + [place.op("Null", dst=empty) for empty in anyhow] + [
        place.op("CallN", dst=held, fun=place.named_function(word.ASKS),
                 args=[manager, named] + anyhow),
        place.op("ToSFloat", dst=weighed, src=held),
    ] + emit_compared(place, weighed, least, short, compared, word.WORD) + _saying(
        place, HELD % word.WORD) + [
        (place.op("JAlways"), passed),
        short + ":", place.op("Label")] + _saying(place, SHORT % word.WORD) + [
        (place.op("JAlways"), place.refused),
        passed + ":", place.op("Label")]


def emit_held(place, word, named, holder, unknown):
    """`PerTTrait`'s (held, steps): the stacks of the trait `named` on `holder`; else `unknown`."""
    manager = place.scratch_return(word.THROUGH)
    held = place.scratch_return(word.ASKS)
    thing, cast = place.narrowed(holder, place.scratch_of(EVERY_HOLDER), goes_to=unknown)
    at, carried = place.field_of(EVERY_HOLDER, "_traits")
    anyhow = [place.scratch_arg(word.ASKS, which) for which in (1, 2, 3, 4)]
    return held, [(place.op("JNull", reg=named), unknown)] + list(cast) + [
        place.op("Field", dst=carried, obj=thing, field=at),
        (place.op("JNull", reg=carried), unknown),
        place.op("Call1", dst=manager, fun=place.named_function(word.THROUGH), arg0=thing),
        (place.op("JNull", reg=manager), unknown),
    ] + [place.op("Null", dst=empty) for empty in anyhow] + [
        place.op("CallN", dst=held, fun=place.named_function(word.ASKS),
                 args=[manager, named] + anyhow)]


def one_branch(bc, t, one, hands, owned):
    """`PerTrait`'s one branch, its marked spelling's too: bare, refused; marked, listed."""
    from tools.hlcode import template, text_object, written
    op = lambda name, **operands: written(template(bc, name), **operands)  # noqa: E731
    tail, given = ("|counted: %s, %s" % (one.text, w) for w in ("marked", "its column"))
    return [op("GetGlobal", **{"dst": t.which, "global": text_object(bc, one.word.spelling)}),
            (op("JNotEq", a=hands["marked"], b=hands["zero"]), tail)] + hands["refuse"]() + [
        tail + ":", op("Label"), (op("JNotEq", a=t.column, b=hands["zero"]), given),
        op("Mov", dst=t.column, src=hands["one"]), given + ":", op("Label")] + owned + [
        op("Mov", dst=t.pending, src=hands["one"])]


def emit_per_one(place, factor, s):
    """`factor` times the stacks in `s.total`; untouched when the row grants the trait it counts."""
    from framework import columns
    from framework.memberwalk import _same_text
    by, made, other = s.total, [], s.unpicked + ", another trait"
    if place.kind_of(factor) != place.kind_of(s.total):
        by = place.scratch_like(factor)
        made = [place.op("ToSFloat", dst=by, src=s.total)]
    # ⛔ ITS OWN TRAIT COUNTED WOULD FEED ITSELF: the Per is ignored and the act pays `val` once
    granted = place.row.get(columns.PART)
    same = [] if granted is None else [(place.op("JNull", reg=granted), other)] + _same_text(
        place, s.name, granted, other) + [(place.op("JAlways"), s.scaled),
                                          other + ":", place.op("Label")]
    return same + made + [place.op("Mul", dst=factor, a=factor, b=by),
                          s.scaled + ":", place.op("Label")]
