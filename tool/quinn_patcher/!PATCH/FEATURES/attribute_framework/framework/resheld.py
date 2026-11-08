#!/usr/bin/env python3
"""A faction holds at least the row's `val` of the resource a column names, found by id."""
from tools.project import guard
from framework.boundary import BY_VALUE as LOOK_UP
from framework.compmatch import emit_compared

# the class whose one global holds the sheets, each looked up by id through `LOOK_UP`
DATA = "$Data"
# what a sheet is to the game: the class its `byId` is read off (the field's own kind lists none)
SHEET_KIND = "cdb.IndexId"
# said while `respath` is on, one per way out of the question
HELD = "SPINE `%s` passed: the faction holds enough of the resource named"
SHORT = "SPINE `%s` refused: the faction holds the wrong amount of the resource named"
UNKNOWN = "SPINE `%s` refused: the column names no resource the sheet has"


def _saying(place, text):
    """One line while `respath` is on; nothing otherwise."""
    return place.said("respath", lambda: place.said_now(text))


def _asking(place, word, held, faction, position):
    """The word's question of the faction; a production one as the game's conditions ask it."""
    if not getattr(word, "FALSE_AT", None):
        return [place.op("Call2", dst=held, fun=place.named_function(word.ASKS), arg0=faction,
                         arg1=position)]
    # ⛔ COUNTED PAST THE FACTION: the call's third argument is the place numbered 1
    args = [place.scratch_arg(word.ASKS, which) for which in range(1, 5)]
    told = place.scratch_return(word.ANSWERS_A_TRUTH)
    out = [place.op("Null", dst=arg) for arg in args] + [
        place.op("Bool", dst=told, value=False),
        place.op("Ref", dst=args[word.FALSE_AT - 2], src=told)]
    return out + [place.op("CallN", dst=held, fun=place.named_function(word.ASKS),
                           args=[faction, position] + args)]


def emit_held(place, word, named, faction, unknown):
    """What `faction` holds of the resource `named`, by its sheet position; else `unknown`."""
    data = place.scratch_of(DATA)
    sheet_at, sheet = place.field_of(DATA, word.SHEET)
    by_id_at, by_id = place.field_of(SHEET_KIND, word.BY_ID)
    found = place.scratch_return(LOOK_UP)
    row = place.scratch_arg(*word.ROW_OF)
    position_at, position = place.field_of(row, word.POSITION)
    held = place.scratch_return(word.ASKS)
    return held, [
        (place.op("JNull", reg=named), unknown),
        place.op("GetGlobal", **{"dst": data, "global": place.the_one_global(DATA)}),
        place.op("Field", dst=sheet, obj=data, field=sheet_at),
        (place.op("JNull", reg=sheet), unknown),
        place.op("Field", dst=by_id, obj=sheet, field=by_id_at),
        (place.op("JNull", reg=by_id), unknown),
        place.op("Call2", dst=found, fun=place.named_function(LOOK_UP), arg0=by_id, arg1=named),
        (place.op("JNull", reg=found), unknown),
        place.op("ToVirtual", dst=row, src=found),
        place.op("Field", dst=position, obj=row, field=position_at),
    ] + _asking(place, word, held, faction, position)


def emit(place, holder, named, word, compared, picked=None):
    """Past this, the faction (or `picked`) holds `val` of the resource `named`, else refused."""
    from framework.questions.owns_development import owning_faction
    least = place.row.get(word.AT_LEAST)
    # a gate handed no `val` cannot weigh what is held, so the row narrows to nobody
    if least is None:
        return [(place.op("JAlways"), place.refused)]
    unknown, short, passed = (place.here("%s, %s" % (word.WORD, what)) for what in (
        "no such resource", "too little held", "enough held"))
    # the faction holding the row's thing: itself on a faction row, else the thing's owner
    faction, narrowing = (picked, []) if picked is not None else owning_faction(place, holder,
                                                                                short)
    held, asking = emit_held(place, word, named, faction, unknown)
    guard(place.kind_of(least) == place.kind_of(held),
          "the row's `%s` is a t@%s and `%s` answers a t@%s"
          % (word.AT_LEAST, place.kind_of(least), word.ASKS, place.kind_of(held)))
    return narrowing + asking + emit_compared(
        place, held, least, short, compared, word.WORD) + _saying(
        place, HELD % word.WORD) + [
        (place.op("JAlways"), passed),
        unknown + ":", place.op("Label")] + _saying(place, UNKNOWN % word.WORD) + [
        (place.op("JAlways"), place.refused),
        short + ":", place.op("Label")] + _saying(place, SHORT % word.WORD) + [
        (place.op("JAlways"), place.refused),
        passed + ":", place.op("Label")]
