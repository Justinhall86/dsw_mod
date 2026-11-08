#!/usr/bin/env python3
"""What an event pays: this row's number on top of everything our own bucket already holds."""
from framework import answer
from framework.tray import ARRAY_OF_ENTRIES, BACKING_ON, COUNT_ON


def _ours(place, manager, into):
    """How many stacks of this trait our own bucket holds, off the applications themselves."""
    from framework.acts.gain_ttrait_stacks import (AN_APPLICATION, COUNT,
                                               EVENTS_AS_THE_FILE_HOLDS_IT, EVERY,
                                               SOURCE_IS_AN_ATTRIBUTE, SOURCE_ON, STACKS_ON)
    answering, got = place.scratch_of(ARRAY_OF_ENTRIES), place.scratch_of(ARRAY_OF_ENTRIES)
    nosource, nostyle = place.scratch_arg(EVERY, 1), place.scratch_arg(EVERY, 2)
    nofaction, nothere = place.scratch_arg(EVERY, 3), place.scratch_arg(EVERY, 4)
    noref, nothing = place.scratch_arg(EVERY, 5), place.scratch_arg(EVERY, 6)
    at, many, one = (place.scratch_return(COUNT), place.scratch_return(COUNT),
                     place.scratch_return(COUNT))
    which, named = place.scratch_return(COUNT), place.scratch_return(COUNT)
    item, app = place.scratch_return(EVERY), place.scratch_of(AN_APPLICATION)
    counted_at, _c = place.field_of(ARRAY_OF_ENTRIES, COUNT_ON)
    backing_at, backing = place.field_of(ARRAY_OF_ENTRIES, BACKING_ON)
    stacks_at, stacks = place.field_of(AN_APPLICATION, STACKS_ON)
    src_at, src = place.field_of(AN_APPLICATION, SOURCE_ON)
    loop, step = place.here("the next application of our own"), place.here("on to the next of ours")
    done = place.here("our own bucket is counted")
    return [
        # THE SLOT AND THE FILTERS EXACTLY AS THE INSTRUMENT'S WALK ASKS THEM -- no source
        place.op("GetGlobal", **{"dst": answering, "global": place.slot(answer.SLOT)}),
        place.op("Int", dst=into, ptr=place.number(0)),
        (place.op("JNull", reg=answering), done),
        place.op("Null", dst=nosource), place.op("Null", dst=nostyle),
        place.op("Null", dst=nofaction), place.op("Null", dst=nothere),
        place.op("Null", dst=noref), place.op("Null", dst=nothing),
        place.op("CallN", dst=got, fun=place.named_function(EVERY),
                 args=[manager, place.row["columns.named"], nosource, nostyle, nofaction,
                       nothere, noref, nothing, answering]),
        (place.op("JNull", reg=got), done),
        place.op("Int", dst=at, ptr=place.number(0)),
        place.op("Int", dst=one, ptr=place.number(1)),
        loop + ":", place.op("Label"),
        # the length EVERY time round, never once before the loop
        place.op("Field", dst=many, obj=got, field=counted_at),
        (place.op("JSGte", a=at, b=many), done),
        place.op("Field", dst=backing, obj=got, field=backing_at),
        place.op("GetArray", dst=item, array=backing, index=at),
        (place.op("JNull", reg=item), step),
        place.op("UnsafeCast", dst=app, src=item),
        # ITS OWN SOURCE, READ OFF IT: a restored application answers this and not a filter
        place.op("Field", dst=src, obj=app, field=src_at),
        (place.op("JNull", reg=src), step),
        place.op("EnumIndex", dst=which, value=src),
        place.op("Int", dst=named, ptr=place.number(SOURCE_IS_AN_ATTRIBUTE)),
        (place.op("JNotEq", a=which, b=named), step),
        place.op("EnumField", dst=which, value=src, construct=SOURCE_IS_AN_ATTRIBUTE, field=0),
        place.op("Int", dst=named, ptr=place.number(EVENTS_AS_THE_FILE_HOLDS_IT)),
        (place.op("JNotEq", a=which, b=named), step),
        place.op("Field", dst=stacks, obj=app, field=stacks_at),
        place.op("Add", dst=into, a=into, b=stacks),
        step + ":", place.op("Label"),
        place.op("Add", dst=at, a=at, b=one),
        (place.op("JAlways"), loop),
        done + ":", place.op("Label"),
    ]


def emit(place, manager, counted, wanted, bucket):
    """The engine's own count of our bucket, floored by our own walk, plus this row's number."""
    from framework.acts.gain_ttrait_stacks import (COUNT, EVENTS_AS_THE_FILE_HOLDS_IT, GRANT,
                                               SOURCE_IS_AN_ATTRIBUTE)
    source, nostyle = place.scratch_arg(COUNT, 1), place.scratch_arg(COUNT, 2)
    nofaction, noreceiver = place.scratch_arg(COUNT, 3), place.scratch_arg(COUNT, 4)
    already, paid = place.scratch_return(COUNT), place.scratch_return(COUNT)
    howmany, nobody = place.scratch_arg(GRANT, 1), place.scratch_arg(GRANT, 3)
    style, handed = place.scratch_arg(GRANT, 4), place.scratch_arg(GRANT, 5)
    holds, done = place.scratch_arg(GRANT, 6), place.scratch_return(GRANT)
    floored = place.here("the engine's own count is not short of ours")
    return [
        place.op("Int", dst=bucket, ptr=place.number(EVENTS_AS_THE_FILE_HOLDS_IT)),
        place.op("MakeEnum", dst=source, construct=SOURCE_IS_AN_ATTRIBUTE, args=[bucket]),
        # EVERY SLOT THE GRANT LEAVES EMPTY IS EMPTY HERE -- style, faction and the receiver
        place.op("Null", dst=nostyle), place.op("Null", dst=nofaction),
        place.op("Null", dst=noreceiver),
        place.op("CallN", dst=already, fun=place.named_function(COUNT),
                 args=[manager, place.row["columns.named"], source, nostyle, nofaction,
                       noreceiver]),
    ] + _ours(place, manager, paid) + [
        # WHICHEVER READING IS HIGHER. The engine's own answers 0 for a restored application, and
        (place.op("JSGte", a=already, b=paid), floored),
        # a payment on top of 0 RECONCILES the bucket down to this row's number alone
        place.op("Mov", dst=already, src=paid),
        floored + ":", place.op("Label"),
        place.op("Add", dst=wanted, a=already, b=counted),
        # and PAID, here: the settling grants held rows only (step 13, 0 on `751`)
        place.op("Ref", dst=howmany, src=wanted),
        place.op("Null", dst=nobody), place.op("Null", dst=style),
        place.op("Null", dst=handed), place.op("Null", dst=holds),
        place.op("CallN", dst=done, fun=place.named_function(GRANT),
                 args=[manager, place.row["columns.named"], howmany, bucket, nobody, style,
                       handed, holds]),
    ]
