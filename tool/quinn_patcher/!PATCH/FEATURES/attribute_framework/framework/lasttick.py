#!/usr/bin/env python3
"""A mark nothing renewed for a whole window of the world's own tick is taken back."""
from tools.project import gv, guard
from tools.hlcode import (SLOTS_ON, argument_kind, assemble, field_by_name, function_named,
                          kind_named, number, returns_type, slot_global, template, written)
from framework import board, gone, ofthekind, rehosted, sayonce, settle, traps
from framework.acts import gain_ttrait_stacks
from framework.loadguard import READY_ENTITY, world_slot
from framework.oneshot import ASK, MAKE, MAP, TELL
from framework.parsed import READ, a_new_place
from framework.tray import ARRAY_OF_ENTRIES, BACKING_ON, COUNT_ON, PUSH, recipe

# the game's own once-a-tick place, and the thing it is about when it is the WORLD's own turn
THE_TICK = "logic.Logic.tick"
# ⛔ THE WORLD'S OWN KIND, TAKEN FROM THE LOAD GUARD, NOT SPELLED AGAIN
THE_WORLD = READY_ENTITY
# AND THE WORLD'S OWN OBJECT, not a faction reaching the same body: the EXACT class (`ofthekind`)
ASKED_WITH = ofthekind.IS_REALLY
# what the game counts down to its next fixed-rate step, found BY NAME on that same kind
THE_COUNTDOWN_ON = "regUpdateTimer"

# our own places. Two per road, each a map to ask and a list to walk, plus one count for the world
NOW = "the receivers this road has granted to since the window opened"
NOW_LIST = "which receivers those are"
BEFORE = "the receivers this road granted to in the window before it"
BEFORE_LIST = "which receivers those were"
WINDOW = "the ticks left before the world closes the window"
# A ROAD SAYS IT COMPLETED A PASS; a window without one sweeps nothing (a quiet road keeps all)
RAN = "this road completed a pass since the window opened"

# FIXED-RATE STEPS PER WINDOW, the one number CHOSEN: widened until `GRANTED_NOTHING` is quiet
EVERY = 600

# said once per world per road, carrying the road
TAKEN_BACK_ON = "SPINE the %s road took a mark back at the tick"
# early in a clean match, this means the window is too narrow: widen `EVERY`
GRANTED_NOTHING = "SPINE the %s road granted nothing for a whole window"


def _op(bc, name, **operands):
    return written(template(bc, name), **operands)


def _op_of(bc):
    return lambda name, **operands: _op(bc, name, **operands)


def named_for(which, road):
    """One place's name on one road. The only speller, exactly as the settling has one."""
    return "%s, on the `%s` road" % (which, road)


def every_road():
    """Every scope word with a road spliced -- asked of the roads, never listed here."""
    from framework import names, storewalk
    return sorted(storewalk.scopes_with_roads(names.vocabulary()))


def a_number(bc):
    """The kind a plain count is, taken OFF THE CALL that will be handed one."""
    return argument_kind(bc, gain_ttrait_stacks.GRANT, 2)


def make_slots(bc):
    """MAKE the window's count, and the four places each road keeps. Empty until a road writes."""
    made = {WINDOW: slot_global(bc, WINDOW, a_number(bc))}
    for road in every_road():
        for which in (NOW, BEFORE):
            made[named_for(which, road)] = slot_global(
                bc, named_for(which, road), kind_named(bc, MAP))
        for which in (NOW_LIST, BEFORE_LIST):
            made[named_for(which, road)] = slot_global(
                bc, named_for(which, road), kind_named(bc, ARRAY_OF_ENTRIES))
        made[named_for(RAN, road)] = slot_global(bc, named_for(RAN, road), a_number(bc))
    return made


def slot(bc, which, road=None):
    """READ a place this file made. Reading never makes."""
    name = which if road is None else named_for(which, road)
    return (getattr(bc, SLOTS_ON, None) or {}).get(name)


def a_made_slot(bc, which, road=None):
    """The same, REFUSING the build when the place was never made (the order is load-bearing)."""
    found = slot(bc, which, road)
    guard(found is not None,
          "`%s` was asked for before it was made -- the tick's places are made at its own step "
          "and this is a caller running before it" % (which if road is None
                                                      else named_for(which, road)))
    return found


def _a_fresh_list(bc, fn, op, into):
    """A new empty list of the kind every holder shares, made the way the game makes one."""
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


def emit_seen(bc, fn, receiver, road, here):
    """THIS RECEIVER WAS GRANTED TO IN THIS WINDOW; unlike `settle.emit_touch`, outlives a pass."""
    from framework import reach
    knowns = a_new_place(bc, fn, kind_named(bc, MAP))
    made = a_new_place(bc, fn, returns_type(function_named(bc, MAKE), MAKE))
    there = a_new_place(bc, fn, returns_type(function_named(bc, ASK), ASK))
    told = a_new_place(bc, fn, returns_type(function_named(bc, TELL), TELL))
    listed = a_new_place(bc, fn, kind_named(bc, ARRAY_OF_ENTRIES))
    pushed = a_new_place(bc, fn, returns_type(function_named(bc, PUSH), PUSH))
    op = _op_of(bc)
    past = "%s: this receiver is already in the window" % here
    has_map = "%s: the window has a map" % here
    has_list = "%s: the window has a list" % here
    return [
        (op("JNull", reg=receiver), past),
        op("GetGlobal", **{"dst": knowns, "global": a_made_slot(bc, NOW, road)}),
        (op("JNotNull", reg=knowns), has_map),
        op("New", dst=knowns),
        op("Call1", dst=made, fun=gv(function_named(bc, MAKE).findex), arg0=knowns),
        op("SetGlobal", **{"global": a_made_slot(bc, NOW, road), "src": knowns}),
        has_map + ":", op("Label"),
        # in already? then this window has it, and one receiver reached by twenty rows is one entry
        op("Call2", dst=there, fun=gv(function_named(bc, ASK).findex),
           arg0=knowns, arg1=receiver),
        (op("JTrue", cond=there), past),
        op("Call3", dst=told, fun=gv(function_named(bc, TELL).findex),
           arg0=knowns, arg1=receiver, arg2=receiver),
        op("GetGlobal", **{"dst": listed, "global": a_made_slot(bc, NOW_LIST, road)}),
        (op("JNotNull", reg=listed), has_list),
    ] + _a_fresh_list(bc, fn, op, listed) + [
        op("SetGlobal", **{"global": a_made_slot(bc, NOW_LIST, road), "src": listed}),
        has_list + ":", op("Label"),
        op("Call2", dst=pushed, fun=gv(function_named(bc, PUSH).findex),
           arg0=listed, arg1=receiver),
        past + ":", op("Label"),
    ]


def emit_ran(bc, fn, road):
    """THIS ROAD COMPLETED A PASS; written only where its end-of-pass sweep sits."""
    op = _op_of(bc)
    did = a_new_place(bc, fn, a_number(bc))
    return [op("Int", dst=did, ptr=number(bc, 1)),
            op("SetGlobal", **{"global": a_made_slot(bc, RAN, road), "src": did})]


def _the_payee(bc, fn, op, road, receiver, here):
    """WHO OWNS THIS RECEIVER, asked as its scope's road asks; ⛔ required (zones need the payee)."""
    from framework import storewalk
    from framework.names import vocabulary
    named = storewalk._declared(road, storewalk.OWNER_BY, vocabulary())
    if named == storewalk.ITSELF:
        return [], None
    entity = storewalk._declared(road, "ENTITY", vocabulary())
    payee = a_new_place(bc, fn, returns_type(function_named(bc, named), named))
    narrowed = a_new_place(bc, fn, kind_named(bc, entity))
    cannot = "%s: this receiver cannot be asked who owns it" % here
    return [op("Null", dst=payee)] + ofthekind.emit(
        bc, fn, op, receiver, narrowed, kind_named(bc, entity), cannot) + [
        op("Call1", dst=payee, fun=gv(function_named(bc, named).findex), arg0=narrowed),
        cannot + ":", op("Label"),
    ], payee


def _one_road(bc, fn, op, road, bucket, traits_at):
    """Walk what this road granted to in the window BEFORE last, and take back what NOW lacks."""
    from framework import reach
    here = "%s tick" % road
    listed = a_new_place(bc, fn, kind_named(bc, ARRAY_OF_ENTRIES))
    fresh = a_new_place(bc, fn, kind_named(bc, ARRAY_OF_ENTRIES))
    knowns = a_new_place(bc, fn, kind_named(bc, MAP))
    made = a_new_place(bc, fn, returns_type(function_named(bc, MAKE), MAKE))
    there = a_new_place(bc, fn, returns_type(function_named(bc, ASK), ASK))
    _backing_at, backing_kind = field_by_name(bc, kind_named(bc, ARRAY_OF_ENTRIES), BACKING_ON,
                                              "a list")
    backing = a_new_place(bc, fn, backing_kind)
    got = a_new_place(bc, fn, returns_type(function_named(bc, READ), READ))
    each = a_new_place(bc, fn, kind_named(bc, reach.EVERY_HOLDER))
    over = a_new_place(bc, fn, a_number(bc))
    upto = a_new_place(bc, fn, a_number(bc))
    counted_at, _c = field_by_name(bc, kind_named(bc, ARRAY_OF_ENTRIES), COUNT_ON, "a list")
    backing_at, _b = field_by_name(bc, kind_named(bc, ARRAY_OF_ENTRIES), BACKING_ON, "a list")
    turn = "%s: the window turns over" % here
    loop = "%s: the next receiver of the window" % here
    step = "%s: on to the next receiver" % here
    gone = "%s: nothing granted to this receiver in the window" % here
    idle = "%s: this road did not run in the window at all" % here
    ran = a_new_place(bc, fn, a_number(bc))
    none = a_new_place(bc, fn, a_number(bc))
    return [
        # ⛔ FIRST: did this road finish a pass in the window? If not, no sweep and no turn-over
        op("GetGlobal", **{"dst": ran, "global": a_made_slot(bc, RAN, road)}),
        op("Int", dst=none, ptr=number(bc, 0)),
        (op("JEq", a=ran, b=none), idle),
        # it ran, so it is armed again for the window opening now
        op("SetGlobal", **{"global": a_made_slot(bc, RAN, road), "src": none}),
        op("GetGlobal", **{"dst": listed, "global": a_made_slot(bc, BEFORE_LIST, road)}),
        (op("JNull", reg=listed), turn),
        op("Field", dst=upto, obj=listed, field=counted_at),
        op("Field", dst=backing, obj=listed, field=backing_at),
        (op("JNull", reg=backing), turn),
        op("Int", dst=over, ptr=number(bc, 0)),
        loop + ":", op("Label"),
        (op("JSGte", a=over, b=upto), turn),
        op("GetArray", dst=got, array=backing, index=over),
        op("UnsafeCast", dst=each, src=got),
        (op("JNull", reg=each), step),
        # granted to during the window that just closed? then it is still being granted
        op("GetGlobal", **{"dst": knowns, "global": a_made_slot(bc, NOW, road)}),
        (op("JNull", reg=knowns), gone),
        op("Call2", dst=there, fun=gv(function_named(bc, ASK).findex),
           arg0=knowns, arg1=each),
        (op("JTrue", cond=there), step),
        gone + ":", op("Label"),
    ] + sayonce.emit(bc, fn, TAKEN_BACK_ON % road, even_when_quiet=True) + [
    ] + settle.emit_settle(bc, fn, op, each, here, gain_ttrait_stacks.GRANT,
                           gain_ttrait_stacks.MANAGER, bucket, traits_at,
                           to_nothing=True, quiet=True) + [
        step + ":", op("Label"),
        op("Incr", dst=over),
        (op("JAlways"), loop),
        # THE TURN-OVER, taken back or not: this window becomes the last, and a fresh one opens
        turn + ":", op("Label"),
    ] + _saying_a_quiet_window(bc, fn, op, road, here) + [
        op("GetGlobal", **{"dst": knowns, "global": a_made_slot(bc, NOW, road)}),
        op("SetGlobal", **{"global": a_made_slot(bc, BEFORE, road), "src": knowns}),
        op("GetGlobal", **{"dst": listed, "global": a_made_slot(bc, NOW_LIST, road)}),
        op("SetGlobal", **{"global": a_made_slot(bc, BEFORE_LIST, road), "src": listed}),
        op("New", dst=knowns),
        op("Call1", dst=made, fun=gv(function_named(bc, MAKE).findex), arg0=knowns),
        op("SetGlobal", **{"global": a_made_slot(bc, NOW, road), "src": knowns}),
    ] + _a_fresh_list(bc, fn, op, fresh) + [
        op("SetGlobal", **{"global": a_made_slot(bc, NOW_LIST, road), "src": fresh}),
        idle + ":", op("Label"),
    ]


def _saying_a_quiet_window(bc, fn, op, road, here):
    """Say it once per world when a road granted nobody a whole window: is `EVERY` wide enough?"""
    counted = a_new_place(bc, fn, a_number(bc))
    listed = a_new_place(bc, fn, kind_named(bc, ARRAY_OF_ENTRIES))
    none = a_new_place(bc, fn, a_number(bc))
    counted_at, _c = field_by_name(bc, kind_named(bc, ARRAY_OF_ENTRIES), COUNT_ON, "a list")
    said = "%s: the quiet window is said" % here
    return [
        op("GetGlobal", **{"dst": listed, "global": a_made_slot(bc, NOW_LIST, road)}),
        (op("JNull", reg=listed), said),
        op("Field", dst=counted, obj=listed, field=counted_at),
        op("Int", dst=none, ptr=number(bc, 0)),
        (op("JNotEq", a=counted, b=none), said),
    ] + sayonce.emit(bc, fn, GRANTED_NOTHING % road, even_when_quiet=True) + [
        said + ":", op("Label"),
    ]


def the_tick(bc):
    """The game's own once-a-tick function, and the countdown whose end opens its body."""
    return function_named(bc, THE_TICK)


def where_the_body_starts(bc, fn):
    """FOUND BY SHAPE: the instruction past the jump after the `regUpdateTimer` read (by name)."""
    at, _kind = field_by_name(bc, kind_named(bc, "logic.Logic"), THE_COUNTDOWN_ON,
                              "the game's own clock")
    read_it = False
    for where, one in enumerate(fn.ops or []):
        if one.op in ("GetThis", "Field") and gv(one.df.get("field")) == at:
            read_it = True
        elif read_it and one.op in ("JNotLt", "JSGte", "JULt", "JNotGte"):
            return where + 1
    guard(False, "%s reads no `%s` with a test under it" % (THE_TICK, THE_COUNTDOWN_ON))


def emit_sweep(bc, fn):
    """The whole block: wait for the world, be the world, close the window, sweep every road."""
    op = _op_of(bc)
    from framework import reach
    done = "the world's own sweep is done"
    world = a_new_place(bc, fn, gv(bc.global_types[world_slot(bc)]))
    # ⛔ ONLY THE WORLD'S OWN OBJECT: `logic.Logic` is a BASE class a faction also runs
    state = a_new_place(bc, fn, kind_named(bc, THE_WORLD))
    left = a_new_place(bc, fn, a_number(bc))
    one = a_new_place(bc, fn, a_number(bc))
    bucket = a_new_place(bc, fn, a_number(bc))
    traits_at, _kind = field_by_name(bc, kind_named(bc, reach.EVERY_HOLDER), "_traits",
                                     "a thing that can carry traits")
    out = traps.wear(bc, traps.PER_TICK, fn, done, world=world)
    out += ofthekind.emit(bc, fn, op, 0, state, kind_named(bc, THE_WORLD), done)
    # WHICH TICK THE WORLD IS ON, counted past the question that tells the world from a faction
    out += board.emit_bump(bc, fn, board.TICK_NOW)
    # ⛔ ONCE A TICK, BEFORE ANY ROAD WALKS: a dead carrier leaves the list every road walks
    carriers = a_new_place(bc, fn, kind_named(bc, ARRAY_OF_ENTRIES))
    known, stands = (a_new_place(bc, fn, kind_named(bc, MAP)) for _ in range(2))
    out += [op("GetGlobal", **{"dst": carriers, "global": rehosted.slot(bc, rehosted.CARRIERS)}),
            op("GetGlobal", **{"dst": known, "global": rehosted.slot(bc, rehosted.ALREADY)}),
            op("GetGlobal", **{"dst": stands, "global": rehosted.slot(bc, rehosted.STANDS)})]
    out += gone.emit_compact(bc, fn, op, carriers, "the dead carriers", forget_in=(known, stands))
    out += [
        # one off the window, and leave while any is left (a fresh world's first tick sweeps none)
        op("GetGlobal", **{"dst": left, "global": a_made_slot(bc, WINDOW)}),
        op("Int", dst=one, ptr=number(bc, 1)),
        op("Sub", dst=left, a=left, b=one),
        op("SetGlobal", **{"global": a_made_slot(bc, WINDOW), "src": left}),
        (op("JSGte", a=left, b=one), done),
        op("Int", dst=left, ptr=number(bc, EVERY)),
        op("SetGlobal", **{"global": a_made_slot(bc, WINDOW), "src": left}),
    ]
    for road in every_road():
        # each road takes back only what it settled, in its own bucket
        out += [op("Int", dst=bucket, ptr=number(bc, gain_ttrait_stacks.bucket_for(road)))]
        out += _one_road(bc, fn, op, road, bucket, traits_at)
    # the labels every block above jumps to are words until here, where they become distances
    return assemble(out + [done + ":", op("Label")])


def install(bc):
    """Make the places and splice the sweep into the game's own fixed-rate step."""
    from tools.splice import insert, where
    make_slots(bc)
    fn = the_tick(bc)
    block = emit_sweep(bc, fn)
    insert(bc, fn, where_the_body_starts(bc, fn), block, "the world's own sweep", traps.PER_TICK)
    at, many = where(bc, "the world's own sweep")
    return ("THE TICK: %d instruction(s) at %d in `%s` -- %d road(s), each taking back every mark "
            "nothing granted to for a window of %d of the game's own fixed-rate steps"
            % (many, at, THE_TICK, len(every_road()), EVERY))
