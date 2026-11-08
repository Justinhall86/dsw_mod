#!/usr/bin/env python3
"""The authored row, kept under the application the game just made from it (keyed by the object)."""
from copy import deepcopy

from tools.project import gv, guard
from tools.hlcode import (assemble, call_sites, field_by_name, function_named, kind_named,
                          number, register_like, template, written)
from tools.splice import insert
from framework import board, columns, saveplace, traps, tray
from framework.loadguard import clear_site, emit_empty
from framework.oneshot import MAP
from framework.parsed import READ, a_new_place, hands_back
from framework.rowreader import reader_for

# every place the game turns an authored row into an application, a reloaddb's re-filing too
SITES = ("logic.TraitsManager.apply", "logic.faction.Developments.addDevelopment",
         "logic.Upgrades.addAttributes", "logic.TraitsManager.reload")
MAKES_ONE = "ent.Object.addAttribute"
from framework.parsed import HELD_BY as APPLICATION  # noqa: E402
# which of that call's arguments is read off the use row; whatever wrote it names the row
FROM_THE_ROW = 4
# how far back a use row may be narrowed before we stop believing we are reading it
DEPTH = 8
# where the block leaves, and what this splice answers to
LEAVE = "there is nothing to carry across"
SPLICE = "the authored row"


def sites(bc):
    """Every one of the game's own places that files an authored row, found by name."""
    return [function_named(bc, name) for name in SITES]


def slot(bc):
    """READ the place a row's columns wait in. The column names own it; nothing here makes one."""
    return columns.slot(bc, columns.FOR_THE_NEXT_REGISTRATION)


def _writer(fn, reg, before):
    """The last instruction before `before` that leaves something in that place."""
    wrote = [i for i in range(before)
             if fn.ops[i].df.get("dst") is not None and gv(fn.ops[i].df["dst"]) == reg]
    return wrote[-1] if wrote else None


def what_is_in_hand(bc, fn, name):
    """Where to splice, the list walked, its place, and what was filed, all found from the CALL."""
    made = call_sites(fn, function_named(bc, MAKES_ONE))
    guard(len(made) == 1,
          "%s makes an application %d time(s), and this reads the one" % (name, len(made)))
    at = made[0]
    call = fn.ops[at]
    application = gv(call.df["dst"])
    after = fn.ops[at + 1]
    guard(after.op == "JNull" and gv(after.df["reg"]) == application,
          "the instruction past the call is a %s, and this expects its own test" % after.op)
    args = [gv(a) for a in call.df["args"].value]
    guard(len(args) > FROM_THE_ROW, "%s was given %d argument(s)" % (MAKES_ONE, len(args)))
    reg = gv(fn.ops[_writer(fn, args[FROM_THE_ROW], at)].df["obj"])
    # back through every narrowing to the element as it came out of the list
    for _ in range(DEPTH):
        wrote = _writer(fn, reg, at)
        guard(wrote is not None, "nothing leaves anything in the place the row is read off")
        if fn.ops[wrote].op == "GetArray":
            break
        guard(fn.ops[wrote].op == "ToVirtual",
              "the element reaches the call through a %s, and this follows only a narrowing"
              % fn.ops[wrote].op)
        reg = gv(fn.ops[wrote].df["src"])
    else:
        guard(False, "the element is narrowed more than %d times before the call" % DEPTH)
    index = gv(fn.ops[wrote].df["index"])
    holds = gv(fn.ops[wrote].df["array"])
    # the list itself, which is what the things in it are held on
    made_it = _writer(fn, holds, wrote)
    guard(made_it is not None and fn.ops[made_it].op == "Field",
          "the things being walked are not read off a list here")
    return at + 2, gv(fn.ops[made_it].df["obj"]), index, application


def _saying():
    """Is the filing saying how far it gets? `standalone/onoff.py` holds the switch."""
    from standalone import onoff
    return onoff.on("userowsays")


def emit(bc, fn, *, the_list, index, application, at_site=""):
    """Put our entry at the same place in the same list onto what was filed; `at_site` names it."""
    from framework import alongside, sayonce, widen
    from framework.sayonce import COMPLAIN

    def naming(what):
        # WHICH ROW EACH PLACE FILES, by name, said at the filing (a few hundred a run)
        if not _saying():
            return []
        return board.said(bc, fn, "userowsays", lambda: sayonce.emit_always(bc, fn, what))

    def said(how_far):
        # once a launch each, latched on a place of its own -- twelve lines in a whole run
        if not _saying() or not at_site:
            return []
        return board.said(bc, fn, "userowsays", lambda: sayonce.emit(
            bc, fn, "SPINE filing at %s: %s" % (at_site, how_far), even_when_quiet=True))

    def op(name, **operands):
        return written(template(bc, name), **operands)

    there, holds = widen.on_the_filed_thing(bc)
    # what an application calls the row it came from, resolved on the application's own kind
    from framework.storewalk import NAMED_BY
    named_at, named_kind = field_by_name(bc, kind_named(bc, APPLICATION), NAMED_BY,
                                         "one application")
    named = a_new_place(bc, fn, named_kind)
    themap = a_new_place(bc, fn, kind_named(bc, MAP))
    ours = a_new_place(bc, fn, kind_named(bc, tray.ARRAY_OF_ENTRIES))
    asked = a_new_place(bc, fn, hands_back(bc, READ))
    got = a_new_place(bc, fn, hands_back(bc, READ))
    mine = a_new_place(bc, fn, holds)
    place = a_new_place(bc, fn, reader_for(bc).count_kind)
    zero = a_new_place(bc, fn, reader_for(bc).count_kind)
    howlong = a_new_place(bc, fn, reader_for(bc).count_kind)
    back = a_new_place(bc, fn, hands_back(bc, READ))
    return assemble(
        [(op("JNull", reg=application), LEAVE),
        (op("JNull", reg=the_list), LEAVE)]
        + said("a filing was reached")
        + [op("GetGlobal", **{"dst": themap,
                              "global": alongside.slot(bc, alongside.PER_FILTERED)}),
        (op("JNull", reg=themap), LEAVE)]
        + said("there is a map of filtered line-ups")
        + [op("Call2", dst=asked, fun=gv(function_named(bc, READ).findex),
           arg0=themap, arg1=the_list),
        (op("JNull", reg=asked), LEAVE)]
        + said("this list has a line-up of ours")
        + [op("UnsafeCast", dst=ours, src=asked),
        # ⛔ THE PLACE IS THE COUNT LESS ONE: the game steps past an element before it uses it
        op("Mov", dst=place, src=index),
        op("Decr", dst=place),
        op("Int", dst=zero, ptr=number(bc, 0)),
        (op("JSLt", a=place, b=zero), LEAVE),
        op("Field", dst=howlong, obj=ours, field=alongside.counted(bc)),
        (op("JSGte", a=place, b=howlong), LEAVE),
        op("Field", dst=back, obj=ours, field=alongside.backing(bc)),
        op("GetArray", dst=got, array=back, index=place),
        (op("JNull", reg=got), LEAVE),
        op("UnsafeCast", dst=mine, src=got)]
        + said("a row was filed onto an application")
        + [op("Field", dst=named, obj=application, field=named_at)]
        + naming(named)
        + [op("SetField", obj=application, field=there, src=mine)]
        + saveplace.emit_stamp(bc, fn, application, place)
        + [LEAVE + ":",
        op("Label"),
    ])


def emit_at_a_new_world(bc, fn, into):
    """NOT A STAGE. The waiting place goes at a new state, so nothing crosses a game."""
    return emit_empty(bc, fn, slot(bc), into)


def install(bc):
    """Make the place for the map, then write the block into the game's own trait-apply."""
    went_in, done = 0, []
    for name in SITES:
        fn = function_named(bc, name)
        hook, the_list, index, application = what_is_in_hand(bc, fn, name)
        went_in += insert(bc, fn, hook,
                          emit(bc, fn, the_list=the_list, index=index, application=application,
                               at_site=name),
                          "%s at %s" % (SPLICE, name), traps.AT_AUTHORED_DATA)
        done.append(name)
    # the emptying goes onto a COPY, as the parse's does, which checks it
    beginning = deepcopy(clear_site(bc))
    beginning.regs.append(deepcopy(register_like(bc, gv(bc.global_types[slot(bc)]))))
    beginning.nregs.value = len(beginning.regs)
    emptying = emit_at_a_new_world(bc, beginning, len(beginning.regs) - 1)
    return ("USE ROW: %d instruction(s) spliced into %s, each past the call that makes an "
            "application and past its own test -- the row a modder wrote is put on that "
            "application, and %d instruction(s) empty the waiting place when a new world begins"
            % (went_in, ", ".join(done), len(emptying)))
