#!/usr/bin/env python3
"""The trade panel: the recycling plant's picker, two rows (pay, get), opened from the top bar."""
from tools.project import gv, guard
from tools.hlcode import (argument_kind, argument_kinds, enum_case, field_by_name,
                          function_named, kind_named, returns_type, slot_global)
from framework.foreignwalk import the_global_of

import trades
from trades import W, made, the_faction

WINDOW = "ui.hud.RecyclingPlantTradesUI"
MAKE = "ui.hud.$RecyclingPlantTradesUI.__constructor__"
# the picker's four questions; each answers ours when the window has no plant behind it
ASKED = (("getPossibleResources", "list"), ("isResTradable", "enable"),
         ("getResValue", "value"), ("getTip", "tip"))
SHOW, HIDE = "ui.GameUI.displayWindow", "ui.GameUI.removeWindow"
TIP, TIP_MAKE = "ui.comp.TipDefault", "ui.comp.$TipDefault.__constructor__"
NUMBER_TEXT, JOIN = "$HText.floorValueForText", "$String.__add__"
BAR, BAR_TICK = "ui.hud.TopBarUI.init", "ui.hud.TopBarUI.regularUpdate"
CREATE, OBJECT = "domkit.$Properties.createNew", "h2d.Object"
CLICK, VISIBLE = "ui.comp.BaseButton.set_onClick", "h2d.Object.set_visible"
SET_X, SET_Y = "h2d.Object.set_x", "h2d.Object.set_y"
# the button: the game's own text button, placed under the leader's portrait
BUTTON_KIND, MAKE_BUTTON = "ui.comp.Button", "ui.comp.$Button.__constructor__"
GOLD = '<font color="#FCD28B">%s</font>'
LABEL = GOLD % "Convert"
OPEN_WIN, PAY_AT, BUTTON = "trades: the open panel", "trades: the pay resource", "trades: button"
LEADER = "trades: the leader"
# the panel's two rows, each its word and then the picker's own list
ROWS = tuple(GOLD % word for word in ("Give", "Gain"))
# where the picker turns a fresh list into the arguments a part is made with, before we touch it
ARGS_AT = 35
STACKED = "h2d.Flow.set_isVertical"
# a row: as wide as the longer list, its word first at a fixed width, its boxes centred after it
PLACED, ABSOLUTE = "h2d.Flow.getProperties", "h2d.FlowProperties.set_isAbsolute"
CENTRED, WORD, WORD_ROOM = "h2d.Flow.set_horizontalAlign", "ui.comp.FmtText.set_text", 44
MEASURED, WORD_BACK = "h2d.Text.get_textWidth", 6
# the gap the picker's list leaves between its boxes
BOX_GAP = 2
# a box's hover, taken away: the icons say enough
ELEMENT, TIPPED = "ui.comp.Element", "ui.comp.Element.set_getTipContent"
# the game's own looks, by class: Rally point's button, and the small bold title
STYLED, BUTTON_LOOK, TITLE = "domkit.Properties.addClass", "decorated-btn", "small-title"
# a Get box: the cost in the game's loss colour over the gain; every box one size
LOSS = '<font color="#ed2308">-'
BOX_SIZES = (("h2d.Flow.set_minWidth", 80), ("h2d.Flow.set_maxWidth", 80),
             ("h2d.Flow.set_minHeight", 56))


def window_kinds(w):
    bc = w.bc
    w.k.window = kind_named(bc, WINDOW)
    w.k.fun = gv(field_by_name(bc, w.k.window, "onSelect", "the picker")[1])
    w.k.game_ui = gv(field_by_name(bc, kind_named(bc, "Game"), "ui", "the game")[1])


def the_ui(w, into, absent):
    cls_kind, game_kind = kind_named(w.bc, "$Game"), kind_named(w.bc, "Game")
    cls, game = w.reg("$game", cls_kind), w.reg("game", game_kind)
    w.add(w.op("GetGlobal", **{"dst": cls, "global": the_global_of(w.bc, "$Game")}))
    w.field(game, cls, cls_kind, "inst")
    w.add((w.op("JNull", reg=game), absent))
    w.field(into, game, game_kind, "ui")
    w.add((w.op("JNull", reg=into), absent))


def open_shell(bc):
    """u_open, made empty first: the picks call it and it hands its window the pay pick."""
    w = W(bc, (), trades.kinds(bc).void)
    made(bc)["open"] = gv(w.fn.findex)
    return w


def make_open(bc, w):
    """u_open(): the old panel taken down, a fresh one shown; a pick calls `u_pay`."""
    window_kinds(w)
    k = w.k
    ui, old, win = w.reg("ui", k.game_ui), w.reg("old", k.window), w.reg("win", k.window)
    nul = [w.reg("n%d" % i, kind) for i, kind in enumerate(argument_kinds(bc, MAKE)[1:])]
    yes, cl, void = w.reg("yes", k.bool), w.reg("cl", k.fun), w.reg("void", k.void)
    slot = slot_global(bc, OPEN_WIN, k.window)
    the_ui(w, ui, "done")
    w.add(w.op("GetGlobal", **{"dst": old, "global": slot}), (w.op("JNull", reg=old), "fresh"))
    w.call(void, HIDE, ui, old)
    w.add("fresh:", w.op("Label"), w.op("New", dst=win), w.op("Bool", dst=yes, value=True),
          w.op("Null", dst=nul[0]), w.op("Null", dst=nul[2]))
    w.call(void, MAKE, win, nul[0], yes, nul[2])
    w.add(w.op("InstanceClosure", dst=cl, fun=made(bc)["pay"], obj=win))
    w.field_set(win, k.window, "onSelect", cl)
    w.add(w.op("SetGlobal", **{"global": slot, "src": win}))
    w.call(void, SHOW, ui, win)
    under_the_button(w, win)
    w.add("done:", w.op("Label"), w.op("Ret", ret=void))
    return w.finish()


def under_the_button(w, win):
    """The panel's top-left corner at the button's bottom-left, in the panel's parent's space."""
    bc, k = w.bc, w.k
    obj, btnk = kind_named(bc, OBJECT), kind_named(bc, BUTTON_KIND)
    btn, up = w.reg("btn", btnk), w.reg("up", obj)
    x, y, h, s, at = (w.reg(n, k.f64) for n in ("x", "y", "h", "s", "at"))
    w.add(w.op("GetGlobal", **{"dst": btn, "global": slot_global(bc, BUTTON, btnk)}),
          (w.op("JNull", reg=btn), "done"))
    w.field(up, win, k.window, "parent")
    w.add((w.op("JNull", reg=up), "done"))
    w.field(x, btn, btnk, "absX")
    w.field(y, btn, btnk, "absY")
    w.field(h, btn, btnk, "calculatedHeight")
    w.field(s, btn, btnk, "matD")
    w.add(w.op("Mul", dst=h, a=h, b=s), w.op("Add", dst=y, a=y, b=h))
    for into, abs_at, mat in ((x, "absX", "matA"), (y, "absY", "matD")):
        w.field(at, up, obj, abs_at)
        w.field(s, up, obj, mat)
        w.add(w.op("Sub", dst=into, a=into, b=at), w.op("SDiv", dst=into, a=into, b=s))
    w.call(x, SET_X, win, x)
    w.call(y, SET_Y, win, y)


def make_pick(bc, paying):
    """u_pay / u_get (win, res): a pay pick is kept; a get pick trades. Either redraws."""
    k0 = trades.kinds(bc)
    w = W(bc, (("win", kind_named(bc, WINDOW)), ("res", k0.text)), k0.void)
    k, void, pay = w.k, w.reg("void", k0.void), w.reg("pay", k0.text)
    slot = slot_global(bc, PAY_AT, k.text)
    if paying:
        w.add(w.op("SetGlobal", **{"global": slot, "src": w.r["res"]}))
    else:
        w.add(w.op("GetGlobal", **{"dst": pay, "global": slot}), (w.op("JNull", reg=pay), "redraw"))
        w.call(void, made(bc)["trade"], pay, w.r["res"])
    w.add("redraw:", w.op("Label"))
    w.call(void, made(bc)["open"])
    w.add(w.op("Ret", ret=void))
    return w.finish()


def make_second_row(bc):
    """u_row(win) -> a plantless picker standing for the get row: its picks call `u_get`."""
    k0 = trades.kinds(bc)
    window = kind_named(bc, WINDOW)
    w = W(bc, (("win", window),), window)
    window_kinds(w)
    d, no, cl = w.reg("d", window), w.reg("no", k0.bool), w.reg("cl", w.k.fun)
    w.add(w.op("New", dst=d), w.op("Bool", dst=no, value=False))
    w.field_set(d, window, "gift", no)
    w.add(w.op("InstanceClosure", dst=cl, fun=made(bc)["get"], obj=w.r["win"]))
    w.field_set(d, window, "onSelect", cl)
    w.add(w.op("Ret", ret=d))
    return w.finish()


def asked_kind(bc, name):
    fn = function_named(bc, "%s.%s" % (WINDOW, name))
    return [gv(a) for a in fn.type.resolve(bc).definition.args], returns_type(fn, name)


def make_answer(bc, name):
    """u_list / u_enable / u_value / u_tip: the picker's question, answered for a trade row."""
    k0 = trades.kinds(bc)
    args, ret = asked_kind(bc, name)
    w = W(bc, tuple(zip(("win", "res"), args)), ret)
    k, out, gift = w.k, w.reg("out", ret), w.reg("gift", k0.bool)
    pay, pe, ge = w.reg("pay", k.text), w.reg("pe", k.dyn), w.reg("ge", k.dyn)
    pv, gvl, found, f = (w.reg("pv", k.f64), w.reg("gvl", k.f64), w.reg("found", k.bool),
                         w.reg("f", k.faction))
    w.field(gift, w.r["win"], kind_named(bc, WINDOW), "gift")
    if name == "getPossibleResources":
        w.call(out, made(bc)["list"], gift)
        w.add(w.op("Ret", ret=out))
        return w.finish()
    if name == "isResTradable":
        w.add(w.op("Bool", dst=out, value=False), (w.op("JFalse", cond=gift), "get row"))
        w.call(out, made(bc)["payable"], w.r["res"])
        w.add(w.op("Ret", ret=out), "get row:", w.op("Label"))
    elif name == "getResValue":
        w.float(out, 0.0)
        w.add((w.op("JFalse", cond=gift), "get row"))
        w.call(out, made(bc)["least"], w.r["res"])
        w.add(w.op("Ret", ret=out), "get row:", w.op("Label"))
    else:
        return make_tip(w, gift, out)
    w.add(w.op("GetGlobal", **{"dst": pay, "global": slot_global(bc, PAY_AT, k.text)}),
          (w.op("JNull", reg=pay), "out"))
    w.call(found, made(bc)["best"], pay, w.r["res"])
    w.add((w.op("JFalse", cond=found), "out"),
          w.op("GetGlobal", **{"dst": pe, "global": slot_global(bc, trades.PAY_ENTRY, k.dyn)}),
          w.op("GetGlobal", **{"dst": ge, "global": slot_global(bc, trades.GET_ENTRY, k.dyn)}))
    w.get(pv, pe, "val")
    w.get(gvl, ge, "val")
    if name == "isResTradable":
        the_faction(w, f, "out")
        w.call(out, trades.CAN, f, pv, gvl, pay, w.r["res"])
    else:
        w.add(w.op("Mov", dst=out, src=gvl))
    w.add("out:", w.op("Label"), w.op("Ret", ret=out))
    return w.finish()


def make_tip(w, gift, out):
    """The hover: `N pay -> M get` on the get row, the resource's own id on the pay row."""
    bc, k = w.bc, w.k
    title, part, gap, arrow = (w.reg("title", k.text), w.reg("part", k.text),
                               w.reg("gap", k.text), w.reg("arrow", k.text))
    pay, pe, ge, num = w.r["pay"], w.r["pe"], w.r["ge"], w.reg("num", k.f64)
    found, parent = w.r["found"], w.reg("parent", argument_kinds(bc, TIP_MAKE)[3])
    numnul = [w.reg("nn%d" % i, kind) for i, kind in enumerate(argument_kinds(bc, NUMBER_TEXT)[1:])]
    w.add(w.op("Mov", dst=title, src=w.r["res"]), (w.op("JTrue", cond=gift), "made"),
          w.op("GetGlobal", **{"dst": pay, "global": slot_global(bc, PAY_AT, k.text)}),
          (w.op("JNull", reg=pay), "made"))
    w.call(found, made(bc)["best"], pay, w.r["res"])
    w.add((w.op("JFalse", cond=found), "made"),
          w.op("GetGlobal", **{"dst": pe, "global": slot_global(bc, trades.PAY_ENTRY, k.dyn)}),
          w.op("GetGlobal", **{"dst": ge, "global": slot_global(bc, trades.GET_ENTRY, k.dyn)}))
    w.add(*[w.op("Null", dst=n) for n in numnul])
    w.text(gap, " ")
    w.text(arrow, "  ->  ")
    w.get(num, pe, "val")
    w.call(title, NUMBER_TEXT, num, *numnul)
    for piece in (gap, pay, arrow):
        w.call(title, JOIN, title, piece)
    w.get(num, ge, "val")
    w.call(part, NUMBER_TEXT, num, *numnul)
    w.call(title, JOIN, title, part)
    for piece in (gap, w.r["res"]):
        w.call(title, JOIN, title, piece)
    w.add("made:", w.op("Label"), w.op("New", dst=out), w.op("Null", dst=parent))
    w.call(w.reg("void", k.void), TIP_MAKE, out, title, w.r["res"], parent)
    w.add(w.op("Ret", ret=out))
    return w.finish()


def make_fill(bc):
    """u_fill(win, box, res): a Give box shows its icon; a Get box its cost over its gain."""
    k0, picker = trades.kinds(bc), function_named(bc, trades.PICKER)
    props = gv(picker.regs[3])
    w = W(bc, (("win", kind_named(bc, WINDOW)), ("box", props), ("res", k0.text)), k0.void)
    k, r = w.k, w.r
    void, gift, pay, found = (w.reg("void", k.void), w.reg("gift", k.bool),
                              w.reg("pay", k.text), w.reg("found", k.bool))
    pe, ge, num, cost, gain, blank = (w.reg("pe", k.dyn), w.reg("ge", k.dyn),
                                      w.reg("num", k.f64), w.reg("cost", k.text),
                                      w.reg("gain", k.text), w.reg("blank", k.text))
    w.text(blank, "")
    w.add(w.op("Null", dst=w.reg("sflow", kind_named(bc, "h2d.Flow"))))
    flow = sized(w, picker)
    w.field(gift, r["win"], kind_named(bc, WINDOW), "gift")
    w.add((w.op("JTrue", cond=gift), "plain"),
          w.op("GetGlobal", **{"dst": pay, "global": slot_global(bc, PAY_AT, k.text)}),
          (w.op("JNull", reg=pay), "plain"))
    w.call(found, made(bc)["best"], pay, r["res"])
    w.add((w.op("JFalse", cond=found), "plain"),
          w.op("GetGlobal", **{"dst": pe, "global": slot_global(bc, trades.PAY_ENTRY, k.dyn)}),
          w.op("GetGlobal", **{"dst": ge, "global": slot_global(bc, trades.GET_ENTRY, k.dyn)}))
    for into, entry, before, after in ((cost, pe, LOSS, "</font>"), (gain, ge, "+", "")):
        w.get(num, entry, "val")
        amount(w, into, num, before, after)
    counter(w, picker, pay, cost)
    counter(w, picker, r["res"], gain)
    stacked(w, flow)
    w.add(w.op("Ret", ret=void), "plain:", w.op("Label"))
    counter(w, picker, r["res"], blank)
    w.add(w.op("Ret", ret=void))
    return w.finish()


def amount(w, into, num, before, after):
    """`into` is `before`, the whole number in `num`, then `after`."""
    piece = w.reg("piece", w.k.text)
    nul = [w.reg("an%d" % i, kind) for i, kind in enumerate(argument_kinds(w.bc, NUMBER_TEXT)[1:])]
    w.add(*[w.op("Null", dst=n) for n in nul])
    w.call(piece, NUMBER_TEXT, num, *nul)
    w.text(into, before)
    w.call(into, JOIN, into, piece)
    w.text(piece, after)
    w.call(into, JOIN, into, piece)


def counter(w, picker, res, text):
    """One of the game's resource counters in the box: `res`'s icon, then `text`."""
    k, (ty, alloc, wrap) = w.k, w.k.made_by
    n, tt, arr, lst = (w.reg("cn", k.int), w.reg("ctt", k.typetype), w.reg("carr", k.array),
                       w.reg("clst", k.list))
    yes, ref = w.reg("cyes", k.bool), w.reg("cref", gv(picker.regs[8]))
    dargs, name = w.reg("cargs", gv(picker.regs[10])), w.reg("cname", k.text)
    made_it, none = w.reg("cmade", gv(picker.regs[3])), w.reg("cnone", argument_kinds(
        w.bc, CREATE)[3])
    w.int(n, 2)
    w.add(w.op("Type", dst=tt, ty=ty))
    w.call(arr, alloc, tt, n)
    w.add(w.op("UnsafeCast", dst=arr, src=arr))
    for at, src in ((0, res), (1, text)):
        w.int(n, at)
        w.add(w.op("SetArray", array=arr, index=n, src=src))
    w.call(lst, wrap, arr)
    w.add(w.op("Bool", dst=yes, value=True), w.op("Ref", dst=ref, src=yes), w.op("Null", dst=none))
    guard(picker.ops[ARGS_AT].op == "Call2", "the picker's list is not made into arguments at op%d"
          % ARGS_AT)
    w.call(dargs, gv(picker.ops[ARGS_AT].df["fun"]), lst, ref)
    w.text(name, "resource-counter")
    w.call(made_it, CREATE, name, w.r["box"], dargs, none)


def sized(w, picker):
    """Every box one size, whatever its counters hold; hands back the box's flow."""
    flow, n = w.reg("sflow", kind_named(w.bc, "h2d.Flow")), w.reg("sn", w.k.int)
    obj = w.reg("sobj", gv(field_by_name(w.bc, gv(picker.regs[3]), "obj", "domkit")[1]))
    boxed = w.reg("sboxed", argument_kind(w.bc, BOX_SIZES[0][0], 0))
    el, no_tip = w.reg("sel", kind_named(w.bc, ELEMENT)), w.reg("snotip", argument_kind(
        w.bc, TIPPED, 0))
    w.field(obj, w.r["box"], gv(picker.regs[3]), "obj")
    w.add((w.op("JNull", reg=obj), "sized"), w.op("SafeCast", dst=flow, src=obj),
          w.op("SafeCast", dst=el, src=obj), w.op("Null", dst=no_tip))
    w.call(no_tip, TIPPED, el, no_tip)
    for setter, size in BOX_SIZES:
        w.int(n, size)
        w.add(w.op("ToDyn", dst=boxed, src=n))
        w.call(boxed, setter, flow, boxed)
    w.add("sized:", w.op("Label"))
    return flow


def stacked(w, flow):
    """The box lays its two counters one above the other."""
    yes = w.reg("syes", w.k.bool)
    w.add((w.op("JNull", reg=flow), "stacked"), w.op("Bool", dst=yes, value=True))
    w.call(yes, STACKED, flow, yes)
    w.add("stacked:", w.op("Label"))


def make_rows(bc):
    """u_rows(win, pass, root, args) -> the row a pass's list goes in, behind its word."""
    picker = function_named(bc, trades.PICKER)
    window, props = kind_named(bc, WINDOW), gv(picker.regs[3])
    w = W(bc, (("win", window), ("pass", window), ("root", props),
               ("args", gv(picker.regs[10]))), props)
    k, r = w.k, w.r
    flowk, placing = kind_named(bc, "h2d.Flow"), kind_named(bc, "h2d.FlowProperties")
    row, label, text = w.reg("row", props), w.reg("label", props), w.reg("text", k.text)
    none, yes = w.reg("none", argument_kinds(bc, CREATE)[3]), w.reg("yes", k.bool)
    flow, rowflow, fp = w.reg("flow", flowk), w.reg("rowflow", flowk), w.reg("fp", placing)
    obj = w.reg("obj", gv(field_by_name(bc, props, "obj", "domkit")[1]))
    align, void = w.reg("align", kind_named(bc, "h2d.FlowAlign")), w.reg("void", k.void)
    tf = w.reg("tf", kind_named(bc, "ui.comp.FmtText"))
    w.add(w.op("Null", dst=none), (w.op("JNotEq", a=r["pass"], b=r["win"]), "a row"),
          w.op("SafeCast", dst=flow, src=r["win"]), w.op("Bool", dst=yes, value=True))
    w.call(yes, STACKED, flow, yes)
    w.add("a row:", w.op("Label"))
    for into, name, parent in ((row, "flow", r["root"]), (label, "fmt-text", row)):
        w.text(text, name)
        w.call(into, CREATE, text, parent, r["args"], none)
        w.add((w.op("JNull", reg=into), "out"))
    w.field(obj, row, props, "obj")
    w.add(w.op("SafeCast", dst=rowflow, src=obj),
          w.op("MakeEnum", dst=align, construct=enum_case(bc, "h2d.FlowAlign", "Middle"),
               args=[]))
    w.call(align, CENTRED, rowflow, align)
    as_wide_as_the_longer(w, rowflow)
    w.text(text, TITLE)
    w.call(void, STYLED, label, text)
    w.field(obj, label, props, "obj")
    w.add(w.op("SafeCast", dst=tf, src=obj))
    w.text(text, ROWS[0])
    w.add((w.op("JEq", a=r["pass"], b=r["win"]), "worded"))
    w.text(text, ROWS[1])
    w.add("worded:", w.op("Label"))
    w.call(text, WORD, tf, text)
    w.call(fp, PLACED, rowflow, obj)
    w.add((w.op("JNull", reg=fp), "out"))
    for side, case in (("horizontalAlign", "Left"), ("verticalAlign", "Middle")):
        w.add(w.op("MakeEnum", dst=align, construct=enum_case(bc, "h2d.FlowAlign", case),
                   args=[]))
        w.field_set(fp, placing, side, align)
    room, boxed = w.reg("room", k.int), w.reg("roomboxed", field_by_name(
        bc, placing, "minWidth", "a placing")[1])
    w.int(room, WORD_ROOM)
    w.add(w.op("ToDyn", dst=boxed, src=room))
    w.field_set(fp, placing, "minWidth", boxed)
    centred_in_its_room(w, tf, fp, placing)
    w.add("out:", w.op("Label"), w.op("Ret", ret=row))
    return w.finish()


def centred_in_its_room(w, tf, fp, placing):
    """The word moved right by half of what its room is wider than it, less `WORD_BACK`."""
    k = w.k
    wide, two, half = w.reg("cwide", k.f64), w.reg("ctwo", k.f64), w.reg("chalf", k.int)
    w.call(wide, MEASURED, tf)
    w.float(two, float(WORD_ROOM))
    w.add(w.op("Sub", dst=wide, a=two, b=wide))
    w.float(two, 2.0)
    w.add(w.op("SDiv", dst=wide, a=wide, b=two), w.op("ToInt", dst=half, src=wide))
    w.int(w.reg("czero", k.int), 0)
    w.add((w.op("JSGte", a=half, b=w.r["czero"]), "a fair shift"),
          w.op("Mov", dst=half, src=w.r["czero"]), "a fair shift:", w.op("Label"))
    w.int(w.r["czero"], WORD_BACK)
    w.add(w.op("Sub", dst=half, a=half, b=w.r["czero"]))
    w.field_set(fp, placing, "offsetX", half)


def as_wide_as_the_longer(w, rowflow):
    """The row's width: its word's room, then a box and a gap for each in the longer list."""
    k = w.k
    lst, gift, n, most, each = (w.reg("wl", k.list), w.reg("wg", k.bool), w.reg("wn", k.int),
                                w.reg("wmost", k.int), w.reg("weach", k.int))
    boxed = w.reg("wboxed", argument_kind(w.bc, BOX_SIZES[0][0], 0))
    w.int(most, 0)
    for side in (True, False):
        w.add(w.op("Bool", dst=gift, value=side))
        w.call(lst, made(w.bc)["list"], gift)
        w.add((w.op("JNull", reg=lst), "counted %s" % side))
        w.field(n, lst, k.list, "length")
        w.add((w.op("JSLte", a=n, b=most), "counted %s" % side), w.op("Mov", dst=most, src=n),
              "counted %s:" % side, w.op("Label"))
    w.int(each, BOX_SIZES[0][1] + BOX_GAP)
    w.add(w.op("Mul", dst=most, a=most, b=each))
    w.int(each, WORD_ROOM)
    w.add(w.op("Add", dst=most, a=most, b=each), w.op("ToDyn", dst=boxed, src=most))
    w.call(boxed, BOX_SIZES[0][0], rowflow, boxed)


def make_click(bc):
    """u_click(bar): the button opens the panel with nothing picked, or closes it when it is up."""
    k0 = trades.kinds(bc)
    w = W(bc, (("bar", kind_named(bc, "ui.hud.TopBarUI")),), k0.void)
    window_kinds(w)
    k, slot = w.k, slot_global(bc, OPEN_WIN, w.k.window)
    pay, void, old = w.reg("pay", k0.text), w.reg("void", k0.void), w.reg("old", k.window)
    up, ui = w.reg("up", kind_named(bc, OBJECT)), w.reg("ui", k.game_ui)
    w.add(w.op("Null", dst=pay),
          w.op("SetGlobal", **{"global": slot_global(bc, PAY_AT, k0.text), "src": pay}),
          w.op("GetGlobal", **{"dst": old, "global": slot}), (w.op("JNull", reg=old), "open"))
    w.field(up, old, k.window, "parent")
    w.add((w.op("JNull", reg=up), "open"))
    the_ui(w, ui, "open")
    w.call(void, HIDE, ui, old)
    w.add(w.op("Null", dst=old), w.op("SetGlobal", **{"global": slot, "src": old}),
          w.op("Ret", ret=void), "open:", w.op("Label"))
    w.call(void, made(bc)["open"])
    w.add(w.op("Ret", ret=void))
    return w.finish()


def _field_set(self, obj, kind, name, src):
    at = field_by_name(self.bc, kind, name, name)[0]
    self.add(self.op("SetField", obj=obj, field=at, src=src))


W.field_set = _field_set
