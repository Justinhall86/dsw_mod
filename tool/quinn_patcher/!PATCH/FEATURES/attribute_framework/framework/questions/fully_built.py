"""Structure fully built: every slot a structure could ever have holds a finished building."""
from framework.trailing import ASKS_ITS_OWN, NO_FAMILY_TRAILER
QUESTION = "structure fully built"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), NO_FAMILY_TRAILER
NEEDS, NEEDS_NONE = (), ASKS_ITS_OWN
# the slots it could ever have, then those filled; asked on its slot, so the main base has its own
ASKS = "ent.Structure.getMaxOutpostSlots"
FILLED = "ent.Structure.getOccupiedOutpostSlots"
# the kind both take; anything not a structure narrows to nothing rather than being asked
ASKED_OF = "ent.Structure"
# asked by this file's own `emit`, as no other question is asked twice on its slot
EMITS = "framework.questions.fully_built"


def emit(place, holder, tag):
    """Past this, the structure has a slot and a finished building in each; else refused."""
    from tools.hlcode import kind_named, method_slot
    bc = place._hands["bc"]()
    kind = kind_named(bc, ASKED_OF)
    thing, narrowing = place.narrowed(holder, place.scratch_of(ASKED_OF))
    total, filled = place.scratch_return(ASKS), place.scratch_return(FILLED)
    zero, finished = place.scratch_like(total), place.scratch_of("Bool")
    # the game's own flag, boxed as it boxes it: a building still going up fills no slot
    only, owners = place.scratch_arg(FILLED, 0), place.scratch_arg(ASKS, 0)
    slot = lambda named: method_slot(bc, kind, named.rsplit(".", 1)[1], tag)  # noqa: E731
    return narrowing + [
        # left out, as the game leaves it out: the owner's own extra slots are counted too
        place.op("Null", dst=owners),
        place.op("CallMethod", dst=total, field=slot(ASKS), args=[thing, owners]),
        place.op("Int", dst=zero, ptr=place.number(0)),
        (place.op("JSLte", a=total, b=zero), place.refused),
        place.op("Bool", dst=finished, value=True),
        place.op("ToDyn", dst=only, src=finished),
        place.op("CallMethod", dst=filled, field=slot(FILLED), args=[thing, only]),
        (place.op("JSLt", a=filled, b=total), place.refused)]
