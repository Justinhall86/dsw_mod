#!/usr/bin/env python3
"""Each receiver's grant of each trait, settled once per pass; a trait not totalled settles at 0."""
from tools.project import gv, guard
from tools.hlcode import (SLOTS_ON, argument_kind, field_by_name, function_named, kind_named,
                          number, returns_type, slot_global, template, written)
from framework import foreignwalk, gone, ofthekind, oneline, running, sayonce
from framework.oneshot import MAKE, MAP, TELL
from framework.parsed import READ, a_new_place
from framework.tray import ARRAY_OF_ENTRIES, BACKING_ON, COUNT_ON, PUSH, recipe

# our two places: what each receiver has ever been granted, and what is already in that list
SLOT = "the traits each receiver has ever been granted"
KNOWN = "the traits already written down for a receiver"
# AND EVERY RECEIVER THIS PASS TOUCHED, not just the road's own holder
TOUCHED = "the receivers this pass touched"
# AND THE DURABLE ONE: per road and holder, every receiver ever granted to, reached or not
MINE = "the receivers each holder has ever granted to, on this road"
MINE_LIST = "which receivers those are, per holder"
# and its own already-in-it map, as `KNOWN` for traits, so a receiver is listed once
TOUCHED_KNOWN = "the receivers already in this pass's list"
# what the road says when it writes one down, and when it takes one back
NOTED = "a granted trait is written down"
SETTLED = "a receiver's trait is settled for this pass"
# ⛔ WHY A TRAIT CANNOT BE TAKEN BACK: reached, with nothing totalled for it this pass
NOTHING_TOTALLED = "a receiver was reached with nothing totalled for it this pass"
# AND THE SAME EXIT WITH THE ROAD IN IT, said once per world per road
NOTHING_TOTALLED_ON = "a receiver on the %s was reached with nothing totalled for it"
# AND THE MOMENT A TRAIT IS ACTUALLY TAKEN BACK (what a bench run can trigger RESTORE on)
TAKEN_BACK = "a trait is taken back: the engine holds some and this pass totalled none"
# ⚠ THE WRITE REACHED ITS LIST
REACHED = "the end-of-walk write reached its list"
# AND THE WRITE'S FIRST INSTRUCTION, with the road in it: "never ran" vs "ran, found nobody"
THE_WRITE_RAN = "the end-of-walk write ran on the %s"
# AND THE TWO NUMBERS THE WRITE HOLDS, each said with the number after it and ⛔ the road in it
HOW_MANY_RECEIVERS = "the write on the %s holds this many receivers"
HOW_MANY_TRAITS = "a receiver on the %s holds this many traits"
# AND THE SAME TWO WITH THE NUMBER IN THE WORD, latched once per world per road per value
RECEIVERS_ON = tuple((n, "the write on the %%s holds %d receiver(s)" % n) for n in range(0, 9))
RECEIVERS_MORE = "the write on the %s holds more than 8 receivers"
TRAITS_ON = tuple((n, "a receiver on the %%s holds %d trait(s)" % n) for n in range(0, 9))
TRAITS_MORE = "a receiver on the %s holds more than 8 traits"
# AND THE LOOP OVER A RECEIVER'S TRAITS reading one back as nothing
A_TRAIT_READS_AS_NOTHING = "the settling read a written-down trait back as nothing"


def _saying_a_number(bc, fn, word, reg):
    """Say a word then a number; neither goes in when the word's own door is shut."""
    from framework.acts.gain_res import AS_TEXT
    spoken = sayonce.emit_word_now(bc, fn, "SPINE " + word)
    complain = function_named(bc, sayonce.COMPLAIN)
    aloud = a_new_place(bc, fn, argument_kind(bc, sayonce.COMPLAIN))
    dropped = a_new_place(bc, fn, returns_type(complain, sayonce.COMPLAIN))
    boxed = a_new_place(bc, fn, argument_kind(bc, AS_TEXT, 0))
    return spoken + [
        _op(bc, "ToDyn", dst=boxed, src=reg),
        _op(bc, "Call1", dst=aloud, fun=gv(function_named(bc, AS_TEXT).findex), arg0=boxed),
        _op(bc, "Call1", dst=dropped, fun=gv(complain.findex), arg0=aloud)] if spoken else []
# AND FOUR QUIET EXITS OF THE SETTLING, each naming the thing it did not find
NO_TRAIT_STORE = "the settling found no trait store on a receiver"
NO_LIST_AT_ALL = "the settling found no list of granted traits for this road"
NOTHING_WRITTEN = "the settling found no trait written down for this receiver"
NO_TOTALS_AT_ALL = "the settling found no running totals at all"


def _leaving_here(bc, fn, reg, word, here, done):
    """Leave when this place holds nothing -- one shape for all four of the settle's quiet exits."""
    return [(_op(bc, "JNull", reg=reg), done)]
# the text a trait id is, TAKEN OFF THE GRANT's first argument, never by name
from framework.acts.gain_ttrait_stacks import GRANT as THE_GRANT


def as_text(bc):
    """The kind a trait id is, off the call that takes one."""
    from tools.hlcode import argument_kind
    return argument_kind(bc, THE_GRANT, 0)


def named_for(which, road):
    """One place's name on one road. Every road keeps its own set, and this is the only speller."""
    return which if not road else "%s, on the `%s` road" % (which, road)


def every_road():
    """Every scope word that has a road of its own, asked of the vocabulary rather than listed."""
    from framework import storewalk
    return sorted(storewalk.scopes_with_roads())


def make_slots(bc):
    """MAKE all four places, ONCE PER ROAD: each road reconciles only what its own rows granted."""
    made = {}
    for road in every_road():
        made[named_for(SLOT, road)] = slot_global(
            bc, named_for(SLOT, road), kind_named(bc, MAP))
        made[named_for(KNOWN, road)] = slot_global(
            bc, named_for(KNOWN, road), kind_named(bc, MAP))
        # the list is of the kind every holder shares, as the road's note is: nothing is cast
        made[named_for(TOUCHED, road)] = slot_global(
            bc, named_for(TOUCHED, road), kind_named(bc, ARRAY_OF_ENTRIES))
        made[named_for(TOUCHED_KNOWN, road)] = slot_global(
            bc, named_for(TOUCHED_KNOWN, road), kind_named(bc, MAP))
        # the durable pair, keyed by HOLDER: one map to ask, one map of lists to walk
        made[named_for(MINE, road)] = slot_global(
            bc, named_for(MINE, road), kind_named(bc, MAP))
        made[named_for(MINE_LIST, road)] = slot_global(
            bc, named_for(MINE_LIST, road), kind_named(bc, MAP))
    return made


def _road_of(here):
    """The road's own word, out of whatever the caller calls this place (bare, or with its walk)."""
    return (here or "").split()[0] if here else None


def slot(bc, which=SLOT, road=None):
    """READ a place this file made, on one road. Reading never makes."""
    return (getattr(bc, SLOTS_ON, None) or {}).get(named_for(which, road))


def _op(bc, name, **operands):
    return written(template(bc, name), **operands)


def _op_of(bc):
    """The same writer, as something a helper can be handed."""
    return lambda name, **operands: _op(bc, name, **operands)


def emit_note(bc, fn, receiver, trait, here):
    """WRITE THIS TRAIT DOWN for this receiver, once, as the road reaches a row granting it."""
    made_like = recipe(bc)
    lists = a_new_place(bc, fn, kind_named(bc, MAP))
    knowns = a_new_place(bc, fn, kind_named(bc, MAP))
    known = a_new_place(bc, fn, kind_named(bc, running.INNER))
    listed = a_new_place(bc, fn, kind_named(bc, ARRAY_OF_ENTRIES))
    made = a_new_place(bc, fn, returns_type(function_named(bc, MAKE), MAKE))
    built = a_new_place(bc, fn, returns_type(function_named(bc, running.PER_RECEIVER),
                                             running.PER_RECEIVER))
    got = a_new_place(bc, fn, returns_type(function_named(bc, READ), READ))
    had = a_new_place(bc, fn, returns_type(function_named(bc, running.GET), running.GET))
    told = a_new_place(bc, fn, returns_type(function_named(bc, TELL), TELL))
    put = a_new_place(bc, fn, returns_type(function_named(bc, running.SET), running.SET))
    pushed = a_new_place(bc, fn, returns_type(function_named(bc, PUSH), PUSH))
    counted = a_new_place(bc, fn, made_like["of"]["counted"])
    typed = a_new_place(bc, fn, made_like["of"]["typed"])
    raw = a_new_place(bc, fn, made_like["of"]["raw"])
    backing = a_new_place(bc, fn, made_like["of"]["backing"])
    past = "%s: this trait is written down already" % here
    has_lists = "%s: there are lists" % here
    has_names = "%s: there are names" % here
    has_map = "%s: this receiver has names of its own" % here
    has_list = "%s: this receiver has a list" % here
    return [
        (_op(bc, "JNull", reg=receiver), past),
        (_op(bc, "JNull", reg=trait), past),
        # the two outer maps, each made the first time anything grants
        _op(bc, "GetGlobal", **{"dst": lists, "global": slot(bc, SLOT, _road_of(here))}),
        (_op(bc, "JNotNull", reg=lists), has_lists),
        _op(bc, "New", dst=lists),
        _op(bc, "Call1", dst=made, fun=gv(function_named(bc, MAKE).findex), arg0=lists),
        _op(bc, "SetGlobal", **{"global": slot(bc, SLOT, _road_of(here)), "src": lists}),
        has_lists + ":", _op(bc, "Label"),
        _op(bc, "GetGlobal", **{"dst": knowns, "global": slot(bc, KNOWN, _road_of(here))}),
        (_op(bc, "JNotNull", reg=knowns), has_names),
        _op(bc, "New", dst=knowns),
        _op(bc, "Call1", dst=made, fun=gv(function_named(bc, MAKE).findex), arg0=knowns),
        _op(bc, "SetGlobal", **{"global": slot(bc, KNOWN, _road_of(here)), "src": knowns}),
        has_names + ":", _op(bc, "Label"),
        # what this receiver already has written down
        _op(bc, "Call2", dst=got, fun=gv(function_named(bc, READ).findex),
            arg0=knowns, arg1=receiver),
        _op(bc, "SafeCast", dst=known, src=got),
        (_op(bc, "JNotNull", reg=known), has_map),
        _op(bc, "New", dst=known),
        _op(bc, "Call1", dst=built,
            fun=gv(function_named(bc, running.PER_RECEIVER).findex), arg0=known),
        _op(bc, "Call3", dst=told, fun=gv(function_named(bc, TELL).findex),
            arg0=knowns, arg1=receiver, arg2=known),
        has_map + ":", _op(bc, "Label"),
        _op(bc, "Call2", dst=had, fun=gv(function_named(bc, running.GET).findex),
            arg0=known, arg1=trait),
        (_op(bc, "JNotNull", reg=had), past),
        _op(bc, "Call3", dst=put, fun=gv(function_named(bc, running.SET).findex),
            arg0=known, arg1=trait, arg2=trait),
        # and the list itself, allocated the way the game allocates one
        _op(bc, "Call2", dst=got, fun=gv(function_named(bc, READ).findex),
            arg0=lists, arg1=receiver),
        _op(bc, "SafeCast", dst=listed, src=got),
        (_op(bc, "JNotNull", reg=listed), has_list),
        _op(bc, "Int", dst=counted, ptr=number(bc, 0)),
        _op(bc, "Type", dst=typed, ty=as_text(bc)),
        _op(bc, "Call2", dst=raw, fun=made_like["alloc"], arg0=typed, arg1=counted),
        _op(bc, "UnsafeCast", dst=backing, src=raw),
        _op(bc, "Call1", dst=listed, fun=made_like["wrap"], arg0=backing),
        _op(bc, "Call3", dst=told, fun=gv(function_named(bc, TELL).findex),
            arg0=lists, arg1=receiver, arg2=listed),
        has_list + ":", _op(bc, "Label"),
        _op(bc, "Call2", dst=pushed, fun=gv(function_named(bc, PUSH).findex),
            arg0=listed, arg1=trait),
    ] + sayonce.emit(bc, fn, NOTED, even_when_quiet=True) + [
        past + ":", _op(bc, "Label"),
    ]


# WHAT A SETTLE SAYS lives with the reading itself, `THE_READING` below


def emit_forget_touched(bc, fn, here, held=None):
    """START THE PASS WITH NOBODY TOUCHED, once per pass before any row is read."""
    made_like = recipe(bc)
    from framework import reach
    fresh = held[0] if held else a_new_place(bc, fn, kind_named(bc, MAP))
    made = a_new_place(bc, fn, returns_type(function_named(bc, MAKE), MAKE))
    counted = a_new_place(bc, fn, made_like["of"]["counted"])
    typed = a_new_place(bc, fn, made_like["of"]["typed"])
    raw = a_new_place(bc, fn, made_like["of"]["raw"])
    backing = a_new_place(bc, fn, made_like["of"]["backing"])
    listed = held[1] if held else a_new_place(bc, fn, kind_named(bc, ARRAY_OF_ENTRIES))
    keep = (lambda place, which: [] if held else
            [_op(bc, "SetGlobal", **{"global": slot(bc, which, _road_of(here)), "src": place})])
    return [
        _op(bc, "New", dst=fresh),
        _op(bc, "Call1", dst=made, fun=gv(function_named(bc, MAKE).findex), arg0=fresh),
    ] + keep(fresh, TOUCHED_KNOWN) + [
        _op(bc, "Int", dst=counted, ptr=number(bc, 0)),
        _op(bc, "Type", dst=typed, ty=kind_named(bc, reach.EVERY_HOLDER)),
        _op(bc, "Call2", dst=raw, fun=made_like["alloc"], arg0=typed, arg1=counted),
        _op(bc, "UnsafeCast", dst=backing, src=raw),
        _op(bc, "Call1", dst=listed, fun=made_like["wrap"], arg0=backing),
    ] + keep(listed, TOUCHED)


def _outer(bc, fn, op, which, road, holder, into, make_it, absent):
    """The inner thing this HOLDER keeps under `which`, made on first use. Two levels, one shape."""
    outer = a_new_place(bc, fn, kind_named(bc, MAP))
    made = a_new_place(bc, fn, returns_type(function_named(bc, MAKE), MAKE))
    got = a_new_place(bc, fn, returns_type(function_named(bc, READ), READ))
    told = a_new_place(bc, fn, returns_type(function_named(bc, TELL), TELL))
    has_outer = "%s: there is an outer map" % absent
    has_inner = "%s: this holder has one" % absent
    if make_it is None:
        return [
            op("GetGlobal", **{"dst": outer, "global": slot(bc, which, road)}),
            (op("JNull", reg=outer), absent),
            op("Call2", dst=got, fun=gv(function_named(bc, READ).findex),
               arg0=outer, arg1=holder),
            op("SafeCast", dst=into, src=got),
            (op("JNull", reg=into), absent),
        ]
    return [
        op("GetGlobal", **{"dst": outer, "global": slot(bc, which, road)}),
        (op("JNotNull", reg=outer), has_outer),
        op("New", dst=outer),
        op("Call1", dst=made, fun=gv(function_named(bc, MAKE).findex), arg0=outer),
        op("SetGlobal", **{"global": slot(bc, which, road), "src": outer}),
        has_outer + ":", op("Label"),
        op("Call2", dst=got, fun=gv(function_named(bc, READ).findex), arg0=outer, arg1=holder),
        op("SafeCast", dst=into, src=got),
        (op("JNotNull", reg=into), has_inner),
    ] + make_it + [
        op("Call3", dst=told, fun=gv(function_named(bc, TELL).findex),
           arg0=outer, arg1=holder, arg2=into),
        has_inner + ":", op("Label"),
    ]


def emit_mine(bc, fn, holder, receiver, road, here):
    """THIS HOLDER HAS GRANTED TO THIS RECEIVER, written down for good -- it outlives the pass."""
    from framework import reach
    op = _op_of(bc)
    knowns = a_new_place(bc, fn, kind_named(bc, MAP))
    listed = a_new_place(bc, fn, kind_named(bc, ARRAY_OF_ENTRIES))
    made = a_new_place(bc, fn, returns_type(function_named(bc, MAKE), MAKE))
    got = a_new_place(bc, fn, returns_type(function_named(bc, READ), READ))
    seen = a_new_place(bc, fn, kind_named(bc, reach.EVERY_HOLDER))
    told = a_new_place(bc, fn, returns_type(function_named(bc, TELL), TELL))
    pushed = a_new_place(bc, fn, returns_type(function_named(bc, PUSH), PUSH))
    past = "%s: this holder already owes this receiver" % here
    fresh_map = [op("New", dst=knowns),
                 op("Call1", dst=made, fun=gv(function_named(bc, MAKE).findex), arg0=knowns)]
    return [
        (op("JNull", reg=receiver), past),
        (op("JNull", reg=holder), past),
    ] + _outer(bc, fn, op, MINE, road, holder, knowns, fresh_map, past + " map") + [
        op("Call2", dst=got, fun=gv(function_named(bc, READ).findex), arg0=knowns, arg1=receiver),
        op("SafeCast", dst=seen, src=got),
        (op("JNotNull", reg=seen), past),
        op("Call3", dst=told, fun=gv(function_named(bc, TELL).findex),
           arg0=knowns, arg1=receiver, arg2=receiver),
    ] + _outer(bc, fn, op, MINE_LIST, road, holder, listed,
               _a_new_list(bc, fn, op, listed), past + " list") + [
        op("Call2", dst=pushed, fun=gv(function_named(bc, PUSH).findex),
           arg0=listed, arg1=receiver),
        past + ":", op("Label"),
    ]


def _a_new_list(bc, fn, op, into):
    """An empty list of the kind every holder shares, made the way the game makes one."""
    from framework import reach
    made_like = recipe(bc)
    counted = a_new_place(bc, fn, made_like["of"]["counted"])
    typed = a_new_place(bc, fn, made_like["of"]["typed"])
    raw = a_new_place(bc, fn, made_like["of"]["raw"])
    backing = a_new_place(bc, fn, made_like["of"]["backing"])
    return [
        op("Int", dst=counted, ptr=number(bc, 0)),
        op("Type", dst=typed, ty=kind_named(bc, reach.EVERY_HOLDER)),
        op("Call2", dst=raw, fun=made_like["alloc"], arg0=typed, arg1=counted),
        op("UnsafeCast", dst=backing, src=raw),
        op("Call1", dst=into, fun=made_like["wrap"], arg0=backing),
    ]


def emit_seed(bc, fn, holder, road, here, held):
    """SEED THE PASS LIST WITH EVERY RECEIVER THIS HOLDER OWES; no second settle."""
    from framework import reach
    op = _op_of(bc)
    listed = a_new_place(bc, fn, kind_named(bc, ARRAY_OF_ENTRIES))
    b_at, backing_kind = field_by_name(bc, kind_named(bc, ARRAY_OF_ENTRIES), BACKING_ON, "a list")
    backing = a_new_place(bc, fn, backing_kind)
    got = a_new_place(bc, fn, returns_type(function_named(bc, READ), READ))
    each = a_new_place(bc, fn, kind_named(bc, reach.EVERY_HOLDER))
    over, upto = (a_new_place(bc, fn, argument_kind(bc, THE_GRANT, 2)) for _ in range(2))
    counted_at, _c = field_by_name(bc, kind_named(bc, ARRAY_OF_ENTRIES), COUNT_ON, "a list")
    done = "%s: nothing is owed by this holder" % here
    loop = "%s: the next receiver this holder owes" % here
    step = "%s: on to the next owed receiver" % here
    return [
        (op("JNull", reg=holder), done),
    ] + _outer(bc, fn, op, MINE_LIST, road, holder, listed, None, done) + gone.emit_compact(
        bc, fn, op, listed, "%s: the dead" % here) + [
        op("Field", dst=upto, obj=listed, field=counted_at),
        op("Field", dst=backing, obj=listed, field=b_at),
        (op("JNull", reg=backing), done),
        op("Int", dst=over, ptr=number(bc, 0)),
        loop + ":", op("Label"),
        (op("JSGte", a=over, b=upto), done),
        op("GetArray", dst=got, array=backing, index=over),
        op("UnsafeCast", dst=each, src=got),
        (op("JNull", reg=each), step),
    ] + emit_touch(bc, fn, each, "%s owed" % here, held=held) + [
        step + ":", op("Label"),
        op("Incr", dst=over),
        (op("JAlways"), loop),
        done + ":", op("Label"),
    ]


def emit_touch(bc, fn, receiver, here, held=None):
    """PUT THIS RECEIVER IN THE PASS'S LIST, once, however many rows reach it (`W74`)."""
    made_like = recipe(bc)
    from framework import reach
    knowns = held[0] if held else a_new_place(bc, fn, kind_named(bc, MAP))
    made = a_new_place(bc, fn, returns_type(function_named(bc, MAKE), MAKE))
    got = a_new_place(bc, fn, returns_type(function_named(bc, READ), READ))
    seen = a_new_place(bc, fn, kind_named(bc, reach.EVERY_HOLDER))
    told = a_new_place(bc, fn, returns_type(function_named(bc, TELL), TELL))
    listed = held[1] if held else a_new_place(bc, fn, kind_named(bc, ARRAY_OF_ENTRIES))
    counted = a_new_place(bc, fn, made_like["of"]["counted"])
    typed = a_new_place(bc, fn, made_like["of"]["typed"])
    raw = a_new_place(bc, fn, made_like["of"]["raw"])
    backing = a_new_place(bc, fn, made_like["of"]["backing"])
    pushed = a_new_place(bc, fn, returns_type(function_named(bc, PUSH), PUSH))
    past = "%s: this receiver is already in the pass" % here
    has_map = "%s: the pass has a map" % here
    has_list = "%s: the pass has a list" % here
    # with the pass's own places in hand there is nothing to fetch and nothing to publish
    fetch = (lambda place, which: [] if held else
             [_op(bc, "GetGlobal", **{"dst": place, "global": slot(bc, which, _road_of(here))})])
    publish = (lambda place, which: [] if held else
               [_op(bc, "SetGlobal", **{"global": slot(bc, which, _road_of(here)), "src": place})])
    return [
        (_op(bc, "JNull", reg=receiver), past),
    ] + fetch(knowns, TOUCHED_KNOWN) + [
        (_op(bc, "JNotNull", reg=knowns), has_map),
        _op(bc, "New", dst=knowns),
        _op(bc, "Call1", dst=made, fun=gv(function_named(bc, MAKE).findex), arg0=knowns),
    ] + publish(knowns, TOUCHED_KNOWN) + [
        has_map + ":", _op(bc, "Label"),
        # in already? then this pass has it and nothing more is owed
        _op(bc, "Call2", dst=got, fun=gv(function_named(bc, READ).findex),
            arg0=knowns, arg1=receiver),
        _op(bc, "SafeCast", dst=seen, src=got),
        (_op(bc, "JNotNull", reg=seen), past),
        _op(bc, "Call3", dst=told, fun=gv(function_named(bc, TELL).findex),
            arg0=knowns, arg1=receiver, arg2=receiver),
    ] + fetch(listed, TOUCHED) + [
        (_op(bc, "JNotNull", reg=listed), has_list),
        _op(bc, "Int", dst=counted, ptr=number(bc, 0)),
        _op(bc, "Type", dst=typed, ty=kind_named(bc, reach.EVERY_HOLDER)),
        _op(bc, "Call2", dst=raw, fun=made_like["alloc"], arg0=typed, arg1=counted),
        _op(bc, "UnsafeCast", dst=backing, src=raw),
        _op(bc, "Call1", dst=listed, fun=made_like["wrap"], arg0=backing),
    ] + publish(listed, TOUCHED) + [
        has_list + ":", _op(bc, "Label"),
        _op(bc, "Call2", dst=pushed, fun=gv(function_named(bc, PUSH).findex),
            arg0=listed, arg1=receiver),
        past + ":", _op(bc, "Label"),
    ]


def saying_the_settled_number():
    """Is the settled number in this build? `standalone/onoff.py` holds the switch."""
    from standalone import onoff
    return onoff.on("settlednumber")


def saying_nothing_totalled():
    """Is the one unlit exit speaking? `standalone/onoff.py` holds the switch and says why."""
    from standalone import onoff
    return onoff.on("nothingtotalled")


def _saying_how_many(bc, fn, spare, reg, road, words, over, here, tag):
    """One word per value, latched: how many of something this road has in hand right now."""
    if not saying_nothing_totalled():
        return []
    # ⛔ THE TAG KEEPS THE TWO READINGS' LABELS APART on one road
    out, done = [], "%s: how many %s is said" % (here, tag)
    for value, word in words:
        past = "%s: the %s is not %d" % (here, tag, value)
        out += [_op(bc, "Int", dst=spare, ptr=number(bc, value)),
                (_op(bc, "JNotEq", a=reg, b=spare), past)]
        out += sayonce.emit(bc, fn, (word % road), True, "nothingtotalled")
        out += [(_op(bc, "JAlways"), done), past + ":", _op(bc, "Label")]
    return out + sayonce.emit(bc, fn, (over % road), True, "nothingtotalled") + [
        done + ":", _op(bc, "Label")]


def saying_it_every_pass():
    """Is it said every pass, not only where it moves? Whether retraction reads depends on it."""
    from standalone import onoff
    return onoff.on("settlednumberalways")


from framework.acts.gain_res import AS_TEXT  # noqa: E402
# and where every holder keeps its own id, on the kind they all share
THE_ID_ON = "__uid"


# said beside the receiver: WHICH ROAD's walk is doing the writing
FROM_ROAD = "SPINE settled from the %s"
# what the line opens with; ⛔ the bench's watch greps for `SPINE settled to`: never reword it
THE_READING = "SPINE settled to "
# AND WHAT THE RIDER READING OPENS WITH, apart so the watch above never counts it
THE_COUNT_PER_FACTION = "SPINE counts as "
# the game's own name for a region, which answers `unnamed` by itself when there is none
THE_REGION = "ent.Zone"
ZONE_NAME = "ent.Zone.getExposedName"
# AND A UNIT'S OWN cdb ID, the text `ent.Unit` carries (from `framework/scopematch.py`)
from framework.scopematch import ASKED_ON as THE_UNIT  # noqa: E402
UNIT_KIND = "kind"


def _say_the_reading(bc, fn, op, receiver, trait, number, here, word="settlednumber"):
    """ONE line: what this receiver's trait settled to, on which road, and on WHICH receiver."""
    from framework import reach
    at, kind = field_by_name(bc, kind_named(bc, reach.EVERY_HOLDER), THE_ID_ON, "a receiver")
    # ⛔ THE RECEIVER, NOT THE PLACE THE GRANT WRITES ITS ANSWER INTO
    who = a_new_place(bc, fn, kind_named(bc, reach.EVERY_HOLDER))
    # ⛔ THE FIELD'S OWN KIND FIRST, THEN BOXED: the text call takes a Dyn
    uid = a_new_place(bc, fn, kind)
    boxed = a_new_place(bc, fn, argument_kind(bc, AS_TEXT, 0))
    named = a_new_place(bc, fn, argument_kind(bc, sayonce.COMPLAIN, 0))
    as_region = a_new_place(bc, fn, kind_named(bc, THE_REGION))
    as_unit = a_new_place(bc, fn, kind_named(bc, THE_UNIT))
    kind_at, _kind_holds = field_by_name(bc, kind_named(bc, THE_UNIT), UNIT_KIND, "a unit")
    joined = oneline.places(bc, fn)
    nameless = "%s %s: this receiver has no name of its own" % (here, word)
    not_a_region = "%s %s: this receiver is not a region" % (here, word)
    ready = "%s %s: this receiver is named" % (here, word)
    return [op("UnsafeCast", dst=who, src=receiver)] + ofthekind.emit(
        bc, fn, op, receiver, as_region, kind_named(bc, THE_REGION), not_a_region) + [
        op("Call1", dst=named, fun=gv(function_named(bc, ZONE_NAME).findex), arg0=as_region),
        (op("JAlways"), ready),
        not_a_region + ":", op("Label"),
        # A UNIT SAYS ITS cdb ID; asked, never cast (`framework/ofthekind.py`)
    ] + ofthekind.emit(bc, fn, op, receiver, as_unit, kind_named(bc, THE_UNIT), nameless) + [
        op("Field", dst=named, obj=as_unit, field=kind_at),
        (op("JAlways"), ready),
        nameless + ":", op("Label"),
        op("Field", dst=uid, obj=who, field=at),
        op("ToDyn", dst=boxed, src=uid),
        op("Call1", dst=named, fun=gv(function_named(bc, AS_TEXT).findex), arg0=boxed),
        ready + ":", op("Label"),
    ] + oneline.emit(bc, fn, op, joined,
                     [THE_READING, (number, oneline.COUNT), " | %s | " % here,
                      (named, oneline.TEXT), " | ", (trait, oneline.TEXT)], word)


def saying_the_count_per_faction():
    """Is the per-faction count in this build? `standalone/onoff.py` holds the switch."""
    from standalone import onoff
    return onoff.on("riderperfaction")


def _say_the_count_per_faction(bc, fn, op, receiver, trait, manager, source, nostyle, handed,
                               counting, here):
    """THE ENGINE'S COUNT OF THIS TRAIT, ASKED AS EACH FACTION, tells the riders apart."""
    from framework import reach
    from tools.hlcode import argument_kind as _arg
    joined = oneline.places(bc, fn)
    flist = a_new_place(bc, fn, foreignwalk.the_list_kind(bc))
    upto = a_new_place(bc, fn, returns_type(function_named(bc, counting), counting))
    at = a_new_place(bc, fn, returns_type(function_named(bc, counting), counting))
    saw = a_new_place(bc, fn, returns_type(function_named(bc, counting), counting))
    # ⛔ THE FACTION SLOT IS THE COUNT'S THIRD ARGUMENT here, not its fourth (the THING's)
    aface = a_new_place(bc, fn, _arg(bc, counting, 3))
    id_at, id_kind = field_by_name(bc, kind_named(bc, reach.EVERY_HOLDER), THE_ID_ON,
                                   "a receiver")
    who = a_new_place(bc, fn, kind_named(bc, reach.EVERY_HOLDER))
    uid = a_new_place(bc, fn, id_kind)
    loop = "%s: the next faction to ask as" % here
    step = "%s: on to the next faction" % here
    done = "%s: every faction has been asked" % here
    return foreignwalk.emit_the_list(bc, fn, flist, done) + foreignwalk.emit_the_length(
        bc, fn, flist, upto, done) + [
        op("Int", dst=at, ptr=number(bc, 0)),
        op("UnsafeCast", dst=who, src=receiver),
        op("Field", dst=uid, obj=who, field=id_at),
        loop + ":", op("Label"),
        (op("JSGte", a=at, b=upto), done),
    ] + foreignwalk.emit_the_faction_at(bc, fn, flist, at, aface, step) + [
        op("CallN", dst=saw, fun=gv(function_named(bc, counting).findex),
           args=[manager, trait, source, nostyle, aface, handed]),
    ] + oneline.emit(bc, fn, op, joined,
                     [THE_COUNT_PER_FACTION, (saw, oneline.COUNT), " | faction ",
                      (at, oneline.COUNT), " | ", (uid, oneline.COUNT), " | ",
                      (trait, oneline.TEXT)], "riderperfaction") + [
        step + ":", op("Label"),
        op("Incr", dst=at),
        (op("JAlways"), loop),
        done + ":", op("Label"),
    ]


def emit_settle_all(bc, fn, op, here, grant, manager_of, bucket, traits_at,
                    say_the_number=False, held=None, totals_held=None):
    """PAST EVERY ROW: settle every receiver this pass touched, not just the road's holder."""
    from framework import reach
    lists = a_new_place(bc, fn, kind_named(bc, ARRAY_OF_ENTRIES))
    made_like = recipe(bc)
    backing = a_new_place(bc, fn, made_like["of"]["backing"])
    got = a_new_place(bc, fn, returns_type(function_named(bc, READ), READ))
    each = a_new_place(bc, fn, kind_named(bc, reach.EVERY_HOLDER))
    # the walk's own counter and bound, kept apart from the ones the body uses for its traits
    over = a_new_place(bc, fn, argument_kind(bc, grant, 2))
    upto = a_new_place(bc, fn, argument_kind(bc, grant, 2))
    counted_at, _c = field_by_name(bc, kind_named(bc, ARRAY_OF_ENTRIES), COUNT_ON, "a list")
    backing_at, _b = field_by_name(bc, kind_named(bc, ARRAY_OF_ENTRIES), BACKING_ON, "a list")
    nobody = "%s: nobody left to settle this pass" % here
    each_one = "%s: the next receiver" % here
    # ⛔ THE WRITE'S OWN WORD IS OUT: the region runs this often, the agent and the building never.
    return [
    ] + ([_op(bc, "Mov", dst=lists, src=held[1])] if held else
         [_op(bc, "GetGlobal", **{"dst": lists, "global": slot(bc, TOUCHED, _road_of(here))})]) + [
        (_op(bc, "JNull", reg=lists), nobody),
        _op(bc, "Field", dst=upto, obj=lists, field=counted_at),
    ] + _saying_how_many(bc, fn, a_new_place(bc, fn, argument_kind(bc, grant, 2)), upto,
                         _road_of(here) or here, RECEIVERS_ON, RECEIVERS_MORE, here,
                         "receivers") + [
        _op(bc, "Field", dst=backing, obj=lists, field=backing_at),
        (_op(bc, "JNull", reg=backing), nobody),
        _op(bc, "Int", dst=over, ptr=number(bc, 0)),
        each_one + ":",
        _op(bc, "Label"),
        (_op(bc, "JSGte", a=over, b=upto), nobody),
        _op(bc, "GetArray", dst=got, array=backing, index=over),
        _op(bc, "UnsafeCast", dst=each, src=got),
    ] + emit_settle(bc, fn, op, each, here, grant, manager_of, bucket, traits_at,
                    say_the_number=say_the_number,
                    totals_held=totals_held) + [
        _op(bc, "Incr", dst=over),
        (_op(bc, "JAlways"), each_one),
        nobody + ":",
        _op(bc, "Label"),
    ]


def install(bc):
    """Make both places. The road writes them as it grants and settles them past the last row."""
    make_slots(bc)
    first = every_road()[0]
    guard(slot(bc, SLOT, first) is not None and slot(bc, KNOWN, first) is not None,
          "one of the settling's two places was not made")
    return ("SWEEP: `%s` is a %s per receiver of every trait it has been granted, with `%s` "
            "saying what is already in one -- and a trait missing from a pass's totals is "
            "written back to nothing" % (SLOT, ARRAY_OF_ENTRIES, KNOWN))


from framework.settleone import emit_settle  # noqa: E402,F401  -- one receiver's settling, apart
