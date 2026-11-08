#!/usr/bin/env python3
"""`Not` on a marked scope (`NotTUnit`): every thing of its kind but the one its column names."""
from copy import copy

from tools.hlcode import number, template, written
from framework import names as vocab

# whether `Not` was glued in, kept beside the scope's own two things
TURNED = "scope turned"
FOUND = ((TURNED, vocab.NUMBER_KEPT_IN),)
# what the place holds for a scope `Not` was not glued into
UNTURNED = 0


def emit_forget(bc, r):
    """Empty the place, before an id is read."""
    return [written(template(bc, "Int"), dst=r[TURNED], ptr=number(bc, UNTURNED))]


def branches(bc, r, known, negated):
    """Each marked scope's branch also keeps whether its piece had `Not` taken off."""
    from framework.turned import turnable
    if negated is None:
        return known
    return [(one, block + ([written(template(bc, "Mov"), dst=r[TURNED], src=negated)]
                           if turnable(one) else [])) for one, block in known]


def emit_gate(place, at_column, named, turned, matching):
    """`matching(place)` asked; turned, its yes refuses and its no passes. A typo never passes."""
    if turned is None:
        return matching(place)
    asking = copy(place)
    asking.refused = place.here("the named one is not this")
    zero = place.scratch_like(turned)
    plain, passed = place.here("this scope is not turned"), place.here("a turned scope passed")
    return [place.op("Int", dst=zero, ptr=place.number(UNTURNED)),
            (place.op("JEq", a=turned, b=zero), plain),
            (place.op("JEq", a=at_column, b=zero), plain),
            (place.op("JNull", reg=named), place.refused),
            plain + ":", place.op("Label")] + matching(asking) + [
        (place.op("JNotEq", a=turned, b=zero), place.refused),
        (place.op("JAlways"), passed),
        asking.refused + ":", place.op("Label"),
        (place.op("JEq", a=turned, b=zero), place.refused),
        passed + ":", place.op("Label")]
