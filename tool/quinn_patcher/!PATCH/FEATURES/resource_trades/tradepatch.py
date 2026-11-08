#!/usr/bin/env python3
"""Where the trade panel enters the game: the picker's questions, its second row, the top bar."""
from tools.project import gv, guard
from tools.hlcode import (argument_kind, assemble, call_sites, field_by_name, function_named,
                          kind_named, returns_type, slot_global, template, text_object, written)
from tools.splice import insert
from framework import traps
from framework.parsed import a_new_place

import tradeui
from trades import made
from tradeui import ABSOLUTE, ASKED, BAR, BAR_TICK, BUTTON, BUTTON_KIND, BUTTON_LOOK, CLICK, \
    CREATE, LABEL, LEADER, MAKE_BUTTON, PLACED, SET_X, SET_Y, STYLED, VISIBLE, WINDOW

LEADER_KIND = "ui.comp.IconButton"
# the last thing the picker does to a box before it makes the box's counter
TIPPED = "ui.comp.Element.set_getTipContent"

NAME = "trades"
# the picker's build: its list asked at op41, each icon's number at op100, its end at op114
LIST_AT, VALUE_AT, FLOW_AT = 41, 100, 27
# the top bar's leader button is made and kept by op303; ours is made right after
LEADER_KEPT = 303


def op(bc, what, **operands):
    return written(template(bc, what), **operands)


def redirect(bc, name, answer, called):
    """A picker with no plant behind it hands its question to ours, before anything of its own."""
    fn = function_named(bc, "%s.%s" % (WINDOW, name))
    window = kind_named(bc, WINDOW)
    at_b, b_kind = field_by_name(bc, window, "b", "the picker")
    nargs = len(fn.type.resolve(bc).definition.args)
    b = a_new_place(bc, fn, gv(b_kind))
    out = a_new_place(bc, fn, gv(fn.type.resolve(bc).definition.ret))
    call = {"dst": out, "fun": answer}
    call.update({"arg%d" % i: i for i in range(nargs)})
    block = assemble([op(bc, "GetThis", dst=b, field=at_b), (op(bc, "JNotNull", reg=b), "theirs"),
                      op(bc, "Call%d" % nargs, **call), op(bc, "Ret", ret=out),
                      "theirs:", op(bc, "Label")])
    return insert(bc, fn, 0, block, "trades: %s" % called, traps.IN_PLAY)


def second_row(bc):
    """The picker's build walks its list twice when it has no plant: pay, then get."""
    fn = function_named(bc, "%s.init" % WINDOW)
    for at, asked in ((LIST_AT, "getPossibleResources"), (VALUE_AT, "getResValue")):
        guard(call_sites(fn, function_named(bc, "%s.%s" % (WINDOW, asked))) == [at]
              and gv(fn.ops[at].df["arg0"]) == 0,
              "the picker's build asks `%s` somewhere other than op%d of itself" % (asked, at))
        fn.ops[at].df["arg0"].value = 1
    end = len(fn.ops) - 1
    guard(fn.ops[end].op == "Ret" and fn.ops[FLOW_AT].op == "GetGlobal",
          "the picker's build does not end at op%d or open its list at op%d" % (end, FLOW_AT))
    guard(gv(fn.ops[0].df["src"]) == 0 and gv(fn.ops[0].df["dst"]) == 1,
          "the picker's build does not copy itself into r1 first")
    window = kind_named(bc, WINDOW)
    at_b, b_kind = field_by_name(bc, window, "b", "the picker")
    b = a_new_place(bc, fn, gv(b_kind))
    block = assemble([op(bc, "GetThis", dst=b, field=at_b), (op(bc, "JNotNull", reg=b), "own"),
                      (op(bc, "JNotEq", a=1, b=0), "own"),
                      op(bc, "Call1", dst=1, fun=made(bc)["row"], arg0=0),
                      op(bc, "JAlways", offset=0), "own:", op(bc, "Label")])
    back = block[4]
    back.df["offset"].value = FLOW_AT - (end + 4 + 1)
    return insert(bc, fn, end, block, "trades: second row", traps.IN_PLAY)


def rows(bc):
    """With no plant, the panel stacks its passes: each list in a row behind its word."""
    fn = function_named(bc, "%s.init" % WINDOW)
    at = [i for i, o in enumerate(fn.ops) if o.op == "Call4" and gv(o.df["arg1"]) == 3
          and gv(o.df["fun"]) == fid(bc, CREATE)]
    guard(len(at) == 1 and gv(fn.ops[at[0] - 4].df["dst"]) == gv(fn.ops[at[0]].df["arg2"]),
          "the picker's build makes its list under its root %d time(s), not once" % len(at))
    at, call = at[0], fn.ops[at[0]]
    props = gv(fn.regs[3])
    at_b, b_kind = field_by_name(bc, kind_named(bc, WINDOW), "b", "the picker")
    b, under, row = (a_new_place(bc, fn, gv(b_kind)), a_new_place(bc, fn, props),
                     a_new_place(bc, fn, props))
    block = assemble([
        op(bc, "Mov", dst=under, src=3),
        op(bc, "GetThis", dst=b, field=at_b), (op(bc, "JNotNull", reg=b), "as before"),
        op(bc, "Call4", dst=row, fun=made(bc)["rows"], arg0=0, arg1=1, arg2=3,
           arg3=gv(call.df["arg2"])),
        (op(bc, "JNull", reg=row), "as before"),
        op(bc, "Mov", dst=under, src=row),
        "as before:", op(bc, "Label")])
    call.df["arg1"].value = under
    return insert(bc, fn, at, block, "trades: rows", traps.IN_PLAY)


def counters(bc):
    """With no plant, ours fills each box and the walk moves on; the picker's counter is skipped."""
    fn = function_named(bc, "%s.init" % WINDOW)
    tipped = call_sites(fn, function_named(bc, TIPPED))
    guard(len(tipped) == 1 and fn.ops[tipped[0] + 1].op == "GetGlobal",
          "the picker does not name its counter right after its box's tip, once")
    at = tipped[0] + 1
    back = next(i for i in range(at, len(fn.ops)) if fn.ops[i].op == "JAlways")
    head = back + 1 + gv(fn.ops[back].df["offset"])
    boxes = [i for i in range(at) if fn.ops[i].op == "Call4"
             and gv(fn.ops[i].df["fun"]) == fid(bc, CREATE)]
    named_by = next(o for o in fn.ops[at:back] if o.op == "Field")
    guard(fn.ops[head].op == "Label" and boxes,
          "the picker's walk does not loop back to a label, or makes no box before its counter")
    box, res = gv(fn.ops[boxes[-1]].df["dst"]), gv(named_by.df["obj"])
    window = kind_named(bc, WINDOW)
    at_b, b_kind = field_by_name(bc, window, "b", "the picker")
    b, rid = a_new_place(bc, fn, gv(b_kind)), a_new_place(bc, fn, gv(fn.regs[17]))
    void = a_new_place(bc, fn, gv(fn.regs[2]))
    block = assemble([op(bc, "GetThis", dst=b, field=at_b), (op(bc, "JNotNull", reg=b), "theirs"),
                      op(bc, "Field", dst=rid, obj=res, field=gv(named_by.df["field"])),
                      op(bc, "Call3", dst=void, fun=made(bc)["fill"], arg0=1, arg1=box, arg2=rid),
                      op(bc, "JAlways", offset=0), "theirs:", op(bc, "Label")])
    loop = next(i for i, o in enumerate(block) if o.op == "JAlways")
    block[loop].df["offset"].value = head - (at + loop + 1)
    return insert(bc, fn, at, block, "trades: boxes", traps.IN_PLAY)


def fid(bc, name):
    return gv(function_named(bc, name).findex)


def button(bc):
    """A "Convert" button in the leader's own flow, left where we put it, opening the panel."""
    fn = function_named(bc, BAR)
    guard(fn.ops[LEADER_KEPT].op == "SetThis",
          "the top bar does not keep its leader button at op%d" % LEADER_KEPT)
    leader = gv(fn.ops[LEADER_KEPT].df["src"])
    lead_kind = gv(fn.regs[leader])
    guard(lead_kind == kind_named(bc, LEADER_KIND), "the leader button is not a %s" % LEADER_KIND)
    from trades import kinds
    btnk, flowk = kind_named(bc, BUTTON_KIND), kind_named(bc, "h2d.Flow")
    up_at, up_kind = field_by_name(bc, lead_kind, "parent", "the leader button")
    r = {"btn": a_new_place(bc, fn, btnk), "up": a_new_place(bc, fn, gv(up_kind)),
         "flow": a_new_place(bc, fn, flowk),
         "text": a_new_place(bc, fn, argument_kind(bc, MAKE_BUTTON, 1)),
         "tile": a_new_place(bc, fn, argument_kind(bc, MAKE_BUTTON, 2)),
         "props": a_new_place(bc, fn, returns_type(function_named(bc, PLACED), PLACED)),
         "yes": a_new_place(bc, fn, kinds(bc).bool),
         "fun": a_new_place(bc, fn, argument_kind(bc, CLICK, 0)),
         "void": a_new_place(bc, fn, kinds(bc).void)}
    dom_at, dom_kind = field_by_name(bc, btnk, "dom", "a button")
    r["dom"] = a_new_place(bc, fn, gv(dom_kind))
    o = lambda what, **x: op(bc, what, **x)                          # noqa: E731
    block = assemble([
        o("Field", dst=r["up"], obj=leader, field=up_at),
        (o("JNull", reg=r["up"]), "no button"),
        o("New", dst=r["btn"]),
        o("GetGlobal", **{"dst": r["text"], "global": text_object(bc, LABEL)}),
        o("Null", dst=r["tile"]),
        o("Call4", dst=r["void"], fun=fid(bc, MAKE_BUTTON), arg0=r["btn"], arg1=r["text"],
          arg2=r["tile"], arg3=r["up"]),
        o("Field", dst=r["dom"], obj=r["btn"], field=dom_at),
        (o("JNull", reg=r["dom"]), "kept"),
        o("GetGlobal", **{"dst": r["text"], "global": text_object(bc, BUTTON_LOOK)}),
        o("Call2", dst=r["void"], fun=fid(bc, STYLED), arg0=r["dom"], arg1=r["text"]),
        "kept:", o("Label"),
        o("SetGlobal", **{"global": slot_global(bc, BUTTON, btnk), "src": r["btn"]}),
        o("SetGlobal", **{"global": slot_global(bc, LEADER, lead_kind), "src": leader}),
        # out of the flow's layout: the bar's refresh puts it under the portrait
        o("SafeCast", dst=r["flow"], src=r["up"]),
        (o("JNull", reg=r["flow"]), "clickable"),
        o("Call2", dst=r["props"], fun=fid(bc, PLACED), arg0=r["flow"], arg1=r["btn"]),
        (o("JNull", reg=r["props"]), "clickable"),
        o("Bool", dst=r["yes"], value=True),
        o("Call2", dst=r["yes"], fun=fid(bc, ABSOLUTE), arg0=r["props"], arg1=r["yes"]),
        "clickable:", o("Label"),
        o("InstanceClosure", dst=r["fun"], fun=made(bc)["click"], obj=0),
        o("Call2", dst=r["fun"], fun=fid(bc, CLICK), arg0=r["btn"], arg1=r["fun"]),
        "no button:", o("Label")])
    return insert(bc, fn, LEADER_KEPT + 1, block, "trades: button", traps.IN_PLAY)


def shown_when_held(bc):
    """Shown only while the faction holds a trade line, and kept under the leader's portrait."""
    fn = function_named(bc, BAR_TICK)
    from trades import kinds
    k = kinds(bc)
    btnk, leadk = kind_named(bc, BUTTON_KIND), kind_named(bc, LEADER_KIND)
    btn, lead = a_new_place(bc, fn, btnk), a_new_place(bc, fn, leadk)
    lst, n, zero = a_new_place(bc, fn, k.list), a_new_place(bc, fn, k.int), \
        a_new_place(bc, fn, k.int)
    yes, shown = a_new_place(bc, fn, k.bool), a_new_place(bc, fn, k.bool)
    x, y, h, s, wide, half = (a_new_place(bc, fn, k.f64) for _ in range(6))
    o = lambda what, **x: op(bc, what, **x)                          # noqa: E731
    at = {name: field_by_name(bc, leadk, name, "the leader button")[0]
          for name in ("x", "y", "calculatedHeight", "calculatedWidth", "scaleX", "scaleY")}
    own_width = field_by_name(bc, btnk, "calculatedWidth", "a button")[0]
    from trades import _float
    many = field_by_name(bc, k.list, "length", "a list")[0]
    block = assemble([
        o("GetGlobal", **{"dst": btn, "global": slot_global(bc, BUTTON, btnk)}),
        (o("JNull", reg=btn), "skip"),
        o("GetGlobal", **{"dst": lead, "global": slot_global(bc, LEADER, leadk)}),
        (o("JNull", reg=lead), "placed"),
        o("Field", dst=x, obj=lead, field=at["x"]),
        o("Field", dst=y, obj=lead, field=at["y"]),
        o("Field", dst=h, obj=lead, field=at["calculatedHeight"]),
        o("Field", dst=s, obj=lead, field=at["scaleY"]),
        o("Mul", dst=h, a=h, b=s), o("Add", dst=y, a=y, b=h),
        # centred: half of what the portrait is wider than the button
        o("Field", dst=wide, obj=lead, field=at["calculatedWidth"]),
        o("Field", dst=s, obj=lead, field=at["scaleX"]),
        o("Mul", dst=wide, a=wide, b=s),
        o("Field", dst=h, obj=btn, field=own_width),
        o("Sub", dst=wide, a=wide, b=h),
        o("Float", dst=half, ptr=_float(bc, 2.0)),
        o("SDiv", dst=wide, a=wide, b=half), o("Add", dst=x, a=x, b=wide),
        o("Call2", dst=x, fun=fid(bc, SET_X), arg0=btn, arg1=x),
        o("Call2", dst=y, fun=fid(bc, SET_Y), arg0=btn, arg1=y),
        "placed:", o("Label"),
        o("Bool", dst=yes, value=True),
        o("Call1", dst=lst, fun=made(bc)["list"], arg0=yes),
        o("Bool", dst=shown, value=False),
        (o("JNull", reg=lst), "set"),
        o("Field", dst=n, obj=lst, field=many),
        o("Int", dst=zero, ptr=gv(fn.ops[5].df["ptr"])),
        (o("JSLte", a=n, b=zero), "set"),
        o("Bool", dst=shown, value=True),
        "set:", o("Label"),
        o("Call2", dst=shown, fun=gv(function_named(bc, VISIBLE).findex), arg0=btn, arg1=shown),
        "skip:", o("Label")])
    guard(fn.ops[5].op == "Int", "the bar's refresh does not open with a zero at op5")
    return insert(bc, fn, 0, block, "trades: shown", traps.IN_PLAY)


def install(bc):
    from standalone import onoff
    if not onoff.on(NAME):
        return "trades: OFF"
    import trades
    trades.install(bc)
    have = made(bc)
    shell = tradeui.open_shell(bc)
    have["fill"] = tradeui.make_fill(bc)
    have["rows"] = tradeui.make_rows(bc)
    have["pay"] = tradeui.make_pick(bc, True)
    have["get"] = tradeui.make_pick(bc, False)
    tradeui.make_open(bc, shell)
    have["row"] = tradeui.make_second_row(bc)
    have["click"] = tradeui.make_click(bc)
    went = sum(redirect(bc, name, tradeui.make_answer(bc, name), called)
               for name, called in ASKED)
    went += second_row(bc) + rows(bc) + counters(bc) + button(bc) + shown_when_held(bc)
    return ("trades: %d function(s) of ours, %d instruction(s) in the picker and the top bar"
            % (len(have), went))
