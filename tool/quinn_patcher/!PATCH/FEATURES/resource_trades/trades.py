#!/usr/bin/env python3
"""Convert_TRes_To_TRes2: lines off the trait rows of the faction and its things; one trade."""
from copy import deepcopy

from tools.project import gv, guard
from tools.hlcode import (argument_kind, argument_kinds, assemble, enum_case, field_by_name,
                          function_named, kind_named, new_function, number, replace_body,
                          returns_type, slot_global, template, text_object, written)
from framework.foreignwalk import (emit_the_faction_at, emit_the_length, the_global_of,
                                   the_list_kind)
from framework.raisewalk import owned_sources
from framework.reach import EVERY_HOLDER
from framework.parsed import a_new_place
from armoury_lib import str_ref                                    # noqa: E402

ATTRIBUTE, PAID, GOT = "Convert_TRes_To_TRes2", "convertFrom", "convertTo"
# the bit a resource row's `flags` sets when it keeps no stock
NO_STOCKS = 2
# the functions of ours, made once per file and found again by name
MADE_ON = "_trades_made"
CONVERT, CAN = "ent.Faction.convertResource", "ent.Faction.canConvertResource"
COUNT, SET = "logic.TraitsManager.getTraitActiveStacksCount", "logic.TraitsManager.setTraitStacks"
APPS, ATB_ID = "logic.AttributesManager.getAppsByID", "$HAttributes.getID"
LOOK_UP, PUSH = "haxe.ds.StringMap.get", "hl.types.ArrayObj.push"
TRAITS_OF, SHOWN = "ent.Object.get_traits", "ui.GameUI.displayWindow"
# a fresh list, the way the picker window makes its own: the two calls ahead of its first walk
PICKER = "ui.hud.RecyclingPlantTradesUI.init"
# the line `best` found, kept for whoever asks next
PAY_ENTRY, GET_ENTRY = "trades: the best line's pay entry", "trades: the best line's get entry"


def made(bc):
    return bc.__dict__.setdefault(MADE_ON, {})


def fun(bc, name):
    return gv(function_named(bc, name).findex)


class Kinds:
    """Every kind the trade code holds, each read off the game by name."""

    def __init__(self, bc):
        k = kind_named
        self.faction = gv(field_by_name(bc, k(bc, "Game"), "me", "the game")[1])
        self.f64, self.text = argument_kind(bc, CONVERT, 0), argument_kind(bc, CONVERT, 2)
        self.bool = returns_type(function_named(bc, CAN), CAN)
        self.reason = returns_type(function_named(bc, CONVERT), CONVERT)
        self.dyn = returns_type(function_named(bc, LOOK_UP), LOOK_UP)
        self.int = returns_type(function_named(bc, ATB_ID), ATB_ID)
        self.list = k(bc, "hl.types.ArrayObj")
        self.app = k(bc, "logic.AttributeApplication")
        self.source = gv(field_by_name(bc, self.app, "source", "an application")[1])
        self.manager = gv(field_by_name(bc, self.faction, "attributes", "a faction")[1])
        self.object = k(bc, EVERY_HOLDER)
        self.traits = returns_type(function_named(bc, TRAITS_OF), TRAITS_OF)
        self.trait_row = argument_kind(bc, COUNT, 0)
        self.ref = argument_kind(bc, SET, 1)
        self.void = returns_type(function_named(bc, SHOWN), SHOWN)
        self.data = k(bc, "$Data")
        self.sheet = gv(field_by_name(bc, self.data, "trait", "the cdb")[1])
        self.map = gv(field_by_name(bc, self.sheet, "byId", "a sheet")[1])
        self.back = gv(field_by_name(bc, self.list, "array", "a list")[1])
        picker = function_named(bc, PICKER)
        guard([o.op for o in picker.ops[29:33]] == ["Type", "Call2", "UnsafeCast", "Call1"],
              "the picker does not open with a fresh list at op29")
        self.array, self.typetype = gv(picker.regs[12]), gv(picker.regs[13])
        self.made_by = (gv(picker.ops[29].df["ty"]), gv(picker.ops[30].df["fun"]),
                        gv(picker.ops[32].df["fun"]))


def kinds(bc):
    if "_trades_kinds" not in bc.__dict__:
        bc.__dict__["_trades_kinds"] = Kinds(bc)
    return bc.__dict__["_trades_kinds"]


class W:
    """One function of ours being written: places by name, instructions with named places."""

    def __init__(self, bc, args, ret):
        self.bc, self.k = bc, kinds(bc)
        self.fn = new_function(bc, [kind for _, kind in args], ret, function_named(bc, CONVERT))
        self.r = {name: at for at, (name, _) in enumerate(args)}
        self.items = []

    def reg(self, name, kind):
        if name not in self.r:
            self.r[name] = a_new_place(self.bc, self.fn, kind)
        return self.r[name]

    def op(self, what, **operands):
        return written(template(self.bc, what), **operands)

    def add(self, *items):
        self.items.extend(items)

    def call(self, dst, name_or_findex, *args):
        f = name_or_findex if isinstance(name_or_findex, int) else fun(self.bc, name_or_findex)
        if len(args) <= 4:
            operands = {"dst": dst, "fun": f}
            operands.update({"arg%d" % i: a for i, a in enumerate(args)})
            self.add(self.op("Call%d" % len(args), **operands))
        else:
            self.add(self.op("CallN", dst=dst, fun=f, args=list(args)))

    def text(self, dst, word):
        self.add(self.op("GetGlobal", **{"dst": dst, "global": text_object(self.bc, word)}))

    def get(self, dst, obj, column):
        self.add(self.op("DynGet", dst=dst, obj=obj, field=str_ref(self.bc, column)))

    def field(self, dst, obj, kind, name):
        at = field_by_name(self.bc, kind, name, name)[0]
        self.add(self.op("Field", dst=dst, obj=obj, field=at))

    def int(self, dst, n):
        self.add(self.op("Int", dst=dst, ptr=number(self.bc, n)))

    def float(self, dst, value):
        self.add(self.op("Float", dst=dst, ptr=_float(self.bc, value)))

    def finish(self):
        replace_body(self.fn, assemble(self.items))
        return gv(self.fn.findex)


def _float(bc, value):
    """Where `value` sits in the file's own list of floats, added if it is not there."""
    for at, held in enumerate(bc.floats):
        if gv(held) == value:
            return at
    bc.floats.append(deepcopy(bc.floats[0]))
    bc.floats[-1].value = value
    if getattr(bc, "nfloats", None) is not None:
        bc.nfloats.value = len(bc.floats)
    return len(bc.floats) - 1


def row_of(w, into, sheet, id_reg, absent):
    """`into` is the raw cdb row of `sheet` called by `id_reg`; `absent` when there is none."""
    k = w.k
    data, s, m = w.reg("cdb", k.data), w.reg("sheet", k.sheet), w.reg("map", k.map)
    w.add(w.op("GetGlobal", **{"dst": data, "global": the_global_of(w.bc, "$Data")}))
    w.field(s, data, k.data, sheet)
    w.add((w.op("JNull", reg=s), absent))
    w.field(m, s, k.sheet, "byId")
    w.add((w.op("JNull", reg=m), absent))
    w.call(into, LOOK_UP, m, id_reg)
    w.add((w.op("JNull", reg=into), absent))


def each(w, listed, at, places, into):
    """The head of a walk over `listed`; `places` is (its head, where it ends)."""
    k, (loop, done) = w.k, places
    many, back = w.reg("many", k.int), w.reg("back", k.back)
    w.int(w.reg(at, k.int), 0)
    w.add(loop + ":", w.op("Label"))
    w.field(many, listed, k.list, "length")
    w.add((w.op("JSGte", a=w.r[at], b=many), done))
    w.field(back, listed, k.list, "array")
    w.add(w.op("GetArray", dst=into, array=back, index=w.r[at]), w.op("Incr", dst=w.r[at]),
          (w.op("JNull", reg=into), loop))


def emit_lines(w, faction, visit, pay=None, get=None):
    """Every trade line the faction holds; `visit(w)` sees pe/ge/pres/gres/pval/gval, then `D`."""
    k = w.k
    r = {n: w.reg(n, kind) for n, kind in (
        ("atbtext", k.text), ("atb", k.int), ("mgr", k.manager), ("apps", k.list),
        ("d", k.dyn), ("app", k.app), ("src", k.source), ("case", k.int), ("want", k.int),
        ("tid", k.text), ("trow", k.dyn), ("uses", k.list), ("u", k.dyn), ("ref", k.text),
        ("t1", k.dyn), ("pl", k.list), ("gl", k.list), ("pe", k.dyn),
        ("ge", k.dyn), ("pres", k.text), ("gres", k.text), ("pval", k.f64), ("gval", k.f64))}
    held, came = w.reg("held", k.object), w.reg("from", k.int)
    w.text(r["atbtext"], ATTRIBUTE)
    w.call(r["atb"], ATB_ID, r["atbtext"])
    # the faction's own store first, then each of its things' (a unit's trait files on the unit)
    w.add(w.op("UnsafeCast", dst=held, src=faction))
    w.int(came, 0)
    w.add("store:", w.op("Label"))
    w.field(r["mgr"], held, k.object, "attributes")
    w.add((w.op("JNull", reg=r["mgr"]), "store done"))
    w.call(r["apps"], APPS, r["mgr"], r["atb"])
    w.add((w.op("JNull", reg=r["apps"]), "store done"))
    each(w, r["apps"], "i", ("A", "store done"), r["d"])
    trait = enum_case(w.bc, "ESourceKind", "ETrait")
    w.add(w.op("UnsafeCast", dst=r["app"], src=r["d"]))
    w.field(r["src"], r["app"], k.app, "source")
    w.add((w.op("JNull", reg=r["src"]), "A"), w.op("EnumIndex", dst=r["case"], value=r["src"]))
    w.int(r["want"], trait)
    w.add((w.op("JNotEq", a=r["case"], b=r["want"]), "A"),
          w.op("EnumField", dst=r["tid"], value=r["src"], construct=trait, field=0),
          (w.op("JNull", reg=r["tid"]), "A"))
    row_of(w, r["trow"], "trait", r["tid"], "A")
    w.get(r["uses"], r["trow"], "attributes")
    w.add((w.op("JNull", reg=r["uses"]), "A"))
    each(w, r["uses"], "j", ("B", "A"), r["u"])
    w.get(r["ref"], r["u"], "ref")
    w.add((w.op("JNull", reg=r["ref"]), "B"))
    w.text(r["atbtext"], ATTRIBUTE)
    w.add((w.op("JNotEq", a=r["ref"], b=r["atbtext"]), "B"))
    for side, lst, listed in (("target", "pl", PAID), ("target2", "gl", GOT)):
        w.get(r["t1"], r["u"], side)
        w.add((w.op("JNull", reg=r["t1"]), "B"))
        w.get(r[lst], r["t1"], listed)
        w.add((w.op("JNull", reg=r[lst]), "B"))
    each(w, r["pl"], "p", ("C", "B"), r["pe"])
    w.get(r["pres"], r["pe"], "resource")
    w.add((w.op("JNull", reg=r["pres"]), "C"))
    if pay is not None:
        w.add((w.op("JNotEq", a=r["pres"], b=pay), "C"))
    w.get(r["pval"], r["pe"], "val")
    each(w, r["gl"], "g", ("D", "C"), r["ge"])
    w.get(r["gres"], r["ge"], "resource")
    w.add((w.op("JNull", reg=r["gres"]), "D"))
    if get is not None:
        w.add((w.op("JNotEq", a=r["gres"], b=get), "D"))
    w.get(r["gval"], r["ge"], "val")
    visit(w)
    w.add((w.op("JAlways"), "D"), "store done:", w.op("Label"))
    _holders(w, faction, held, came)
    w.add("lines done:", w.op("Label"))


def _holders(w, faction, held, came):
    """After a store: back into the list that handed it over, else on to the next owned list."""
    bc, fn, op, k = w.bc, w.fn, w.op, w.k
    sources = owned_sources(bc, k.faction)
    which, blocks = w.reg("which", k.int), []
    for s, (spelling, steps) in enumerate(sources, start=1):
        after = "owned %s" % sources[s][0] if s < len(sources) else "lines done"
        block, resume = [], None
        cur, leave = faction, after
        for depth, (how, what, kind) in enumerate(steps):
            got = a_new_place(bc, fn, kind if how != "list" else the_list_kind(bc))
            if how == "call":
                block += [op("Call1", dst=got, fun=what, arg0=cur), (op("JNull", reg=got), leave)]
                cur = got
                continue
            block += [op("Field", dst=got, obj=cur, field=what), (op("JNull", reg=got), leave)]
            if how == "field":
                cur = got
                continue
            length, index = a_new_place(bc, fn, k.int), a_new_place(bc, fn, k.int)
            member, loop = a_new_place(bc, fn, kind), "owned %s, list %d" % (spelling, depth)
            block += (emit_the_length(bc, fn, got, length, leave)
                      + [op("Int", dst=index, ptr=number(bc, 0)), loop + ":", op("Label"),
                         (op("JSGte", a=index, b=length), leave)]
                      + emit_the_faction_at(bc, fn, got, index, member, leave)
                      + [op("Incr", dst=index), (op("JNull", reg=member), loop)])
            cur, leave, resume = member, loop, loop
        blocks += (["owned %s:" % spelling, op("Label")] + block
                   + [op("UnsafeCast", dst=held, src=cur), op("Int", dst=came, ptr=number(bc, s)),
                      (op("JAlways"), "store")])
        w.add(op("Int", dst=which, ptr=number(bc, s)), (op("JEq", a=came, b=which), resume))
    w.add((op("JAlways"), "owned %s" % sources[0][0] if sources else "lines done"), *blocks)


def the_faction(w, into, absent):
    """`into` is the local player's faction, read off the game; `absent` while there is none."""
    cls_kind, game_kind = kind_named(w.bc, "$Game"), kind_named(w.bc, "Game")
    cls, game = w.reg("$game", cls_kind), w.reg("game", game_kind)
    w.add(w.op("GetGlobal", **{"dst": cls, "global": the_global_of(w.bc, "$Game")}))
    w.field(game, cls, cls_kind, "inst")
    w.add((w.op("JNull", reg=game), absent))
    w.field(into, game, game_kind, "me")
    w.add((w.op("JNull", reg=into), absent))


def make_list(bc):
    """t_list(pay?) -> every resource row on that side of any line, once each."""
    k = kinds(bc)
    w = W(bc, (("pay", k.bool),), k.list)
    out, f = w.reg("out", k.list), w.reg("f", k.faction)
    zero, tt, arr = w.reg("zero", k.int), w.reg("tt", k.typetype), w.reg("arr", k.array)
    ty, alloc, wrap = k.made_by
    w.int(zero, 0)
    w.add(w.op("Type", dst=tt, ty=ty))
    w.call(arr, alloc, tt, zero)
    w.add(w.op("UnsafeCast", dst=arr, src=arr))
    w.call(out, wrap, arr)
    the_faction(w, f, "lines done")
    res, row, seen, sid, n = (w.reg("res", k.text), w.reg("row", k.dyn), w.reg("seen", k.dyn),
                              w.reg("sid", k.text), w.reg("pushed", k.int))

    def visit(w):
        w.add(w.op("Mov", dst=res, src=w.r["gres"]), (w.op("JFalse", cond=w.r["pay"]), "side"),
              w.op("Mov", dst=res, src=w.r["pres"]), "side:", w.op("Label"))
        each(w, out, "o", ("E", "fresh"), seen)
        w.get(sid, seen, "id")
        w.add((w.op("JEq", a=sid, b=res), "D"), (w.op("JAlways"), "E"), "fresh:", w.op("Label"))
        row_of(w, row, "resource", res, "D")
        w.call(n, PUSH, out, row)
    emit_lines(w, f, visit)
    w.add(w.op("Ret", ret=out))
    return w.finish()


def make_best(bc):
    """t_best(pay, get) -> found; the line with the most `get` per `pay` kept in two places."""
    k = kinds(bc)
    w = W(bc, (("pay", k.text), ("get", k.text)), k.bool)
    f, best, rate, zero = (w.reg("f", k.faction), w.reg("best", k.f64), w.reg("rate", k.f64),
                           w.reg("fzero", k.f64))
    found = w.reg("found", k.bool)
    pe_at, ge_at = slot_global(bc, PAY_ENTRY, k.dyn), slot_global(bc, GET_ENTRY, k.dyn)
    w.add(w.op("Bool", dst=found, value=False))
    w.float(best, -1.0)
    w.float(zero, 0.0)
    the_faction(w, f, "lines done")

    def visit(w):
        w.add((w.op("JSLte", a=w.r["pval"], b=zero), "D"),
              w.op("SDiv", dst=rate, a=w.r["gval"], b=w.r["pval"]),
              (w.op("JSLte", a=rate, b=best), "D"),
              w.op("Mov", dst=best, src=rate), w.op("Bool", dst=found, value=True),
              w.op("SetGlobal", **{"global": pe_at, "src": w.r["pe"]}),
              w.op("SetGlobal", **{"global": ge_at, "src": w.r["ge"]}))
    emit_lines(w, f, visit, pay=w.r["pay"], get=w.r["get"])
    w.add(w.op("Ret", ret=found))
    return w.finish()


def make_payable(bc):
    """t_payable(pay) -> whether any line paying with it can be made right now."""
    k = kinds(bc)
    w = W(bc, (("pay", k.text),), k.bool)
    f, ok = w.reg("f", k.faction), w.reg("ok", k.bool)
    w.add(w.op("Bool", dst=ok, value=False))
    the_faction(w, f, "lines done")

    def visit(w):
        w.call(ok, CAN, f, w.r["pval"], w.r["gval"], w.r["pres"], w.r["gres"])
        w.add((w.op("JTrue", cond=ok), "lines done"))
    emit_lines(w, f, visit, pay=w.r["pay"])
    w.add(w.op("Ret", ret=ok))
    return w.finish()


def make_least(bc):
    """t_least(pay) -> the smallest amount any line asks of it, 0 when none does."""
    k = kinds(bc)
    w = W(bc, (("pay", k.text),), k.f64)
    f, least, zero = w.reg("f", k.faction), w.reg("least", k.f64), w.reg("fzero", k.f64)
    w.float(least, 0.0)
    w.float(zero, 0.0)
    the_faction(w, f, "lines done")

    def visit(w):
        w.add((w.op("JEq", a=least, b=zero), "take"),
              (w.op("JSGte", a=w.r["pval"], b=least), "D"),
              "take:", w.op("Label"), w.op("Mov", dst=least, src=w.r["pval"]))
    emit_lines(w, f, visit, pay=w.r["pay"])
    w.add(w.op("Ret", ret=least))
    return w.finish()


def make_shift(bc):
    """t_shift(f, res, amount, gain): an unstocked side moves production by trade-trait stacks."""
    k = kinds(bc)
    w = W(bc, (("f", k.faction), ("res", k.text), ("amount", k.f64), ("gain", k.bool)), k.void)
    r = {n: w.reg(n, kind) for n, kind in (
        ("row", k.dyn), ("flags", k.int), ("bit", k.int), ("props", k.dyn), ("tt", k.dyn),
        ("mine", k.text), ("other", k.text), ("mgr", k.traits), ("trow", k.dyn),
        ("tv", k.trait_row), ("n", k.int), ("oc", k.int), ("mc", k.int), ("left", k.int),
        ("ref", k.ref), ("zero", k.int), ("void", k.void))}
    nulls = [w.reg("null%d" % i, kind) for i, kind in enumerate(argument_kinds(bc, SET)[2:])]
    cnulls = [w.reg("cnull%d" % i, kind) for i, kind in enumerate(argument_kinds(bc, COUNT)[1:])]
    row_of(w, r["row"], "resource", w.r["res"], "done")
    w.get(r["flags"], r["row"], "flags")
    w.int(r["bit"], NO_STOCKS)
    w.add(w.op("And", dst=r["flags"], a=r["flags"], b=r["bit"]))
    w.int(r["zero"], 0)
    w.add((w.op("JEq", a=r["flags"], b=r["zero"]), "done"))
    w.get(r["props"], r["row"], "props")
    w.add((w.op("JNull", reg=r["props"]), "done"))
    w.get(r["tt"], r["props"], "conversionTraits")
    w.add((w.op("JNull", reg=r["tt"]), "done"))
    w.get(r["mine"], r["tt"], "gain")
    w.get(r["other"], r["tt"], "loss")
    w.add((w.op("JTrue", cond=w.r["gain"]), "sides"),
          w.op("Mov", dst=r["mine"], src=r["other"]))
    w.get(r["other"], r["tt"], "gain")
    w.add("sides:", w.op("Label"), (w.op("JNull", reg=r["mine"]), "done"),
          (w.op("JNull", reg=r["other"]), "done"), w.op("ToInt", dst=r["n"], src=w.r["amount"]))
    w.call(r["mgr"], TRAITS_OF, w.r["f"])
    w.add((w.op("JNull", reg=r["mgr"]), "done"))
    for nul in nulls + cnulls:
        w.add(w.op("Null", dst=nul))

    def count(into, tid):
        row_of(w, r["trow"], "trait", tid, "done")
        w.add(w.op("ToVirtual", dst=r["tv"], src=r["trow"]))
        w.call(into, COUNT, r["mgr"], r["tv"], *cnulls)

    def set_to(tid, value):
        w.add(w.op("Ref", dst=r["ref"], src=value))
        w.call(r["void"], SET, r["mgr"], tid, r["ref"], *nulls)

    # the opposite trait is taken down first; whatever it could not cover goes onto ours
    count(r["oc"], r["other"])
    w.add((w.op("JSLt", a=r["oc"], b=r["n"]), "over"),
          w.op("Sub", dst=r["left"], a=r["oc"], b=r["n"]))
    set_to(r["other"], r["left"])
    w.add((w.op("JAlways"), "done"), "over:", w.op("Label"),
          w.op("Sub", dst=r["left"], a=r["n"], b=r["oc"]))
    set_to(r["other"], r["zero"])
    count(r["mc"], r["mine"])
    w.add(w.op("Add", dst=r["left"], a=r["left"], b=r["mc"]))
    set_to(r["mine"], r["left"])
    w.add("done:", w.op("Label"), w.op("Ret", ret=r["void"]))
    return w.finish()


def make_trade(bc, best, shift):
    """t_trade(pay, get): the best line traded through the game's own converter, then shifted."""
    k = kinds(bc)
    w = W(bc, (("pay", k.text), ("get", k.text)), k.void)
    r = {n: w.reg(n, kind) for n, kind in (
        ("found", k.bool), ("f", k.faction), ("pe", k.dyn), ("ge", k.dyn), ("pv", k.f64),
        ("gv", k.f64), ("why", k.reason), ("case", k.int), ("ok", k.int), ("no", k.bool),
        ("yes", k.bool), ("void", k.void))}
    the_faction(w, r["f"], "done")
    w.call(r["found"], best, w.r["pay"], w.r["get"])
    w.add((w.op("JFalse", cond=r["found"]), "done"),
          w.op("GetGlobal", **{"dst": r["pe"], "global": slot_global(bc, PAY_ENTRY, k.dyn)}),
          w.op("GetGlobal", **{"dst": r["ge"], "global": slot_global(bc, GET_ENTRY, k.dyn)}))
    w.get(r["pv"], r["pe"], "val")
    w.get(r["gv"], r["ge"], "val")
    w.call(r["why"], CONVERT, r["f"], r["pv"], r["gv"], w.r["pay"], w.r["get"])
    w.add((w.op("JNull", reg=r["why"]), "done"), w.op("EnumIndex", dst=r["case"], value=r["why"]))
    w.int(r["ok"], enum_case(bc, "EReason", "Success"))
    w.add((w.op("JNotEq", a=r["case"], b=r["ok"]), "done"),
          w.op("Bool", dst=r["no"], value=False), w.op("Bool", dst=r["yes"], value=True))
    w.call(r["void"], shift, r["f"], w.r["pay"], r["pv"], r["no"])
    w.call(r["void"], shift, r["f"], w.r["get"], r["gv"], r["yes"])
    w.add("done:", w.op("Label"), w.op("Ret", ret=r["void"]))
    return w.finish()


def install(bc):
    """Write the six functions once; the panel calls them by the names kept on the file."""
    have = made(bc)
    guard(not have, "the trade functions were written twice into one file")
    for name, make in (("list", make_list), ("best", make_best), ("payable", make_payable),
                       ("least", make_least), ("shift", make_shift)):
        have[name] = make(bc)
    have["trade"] = make_trade(bc, have["best"], have["shift"])
    return "trades: %d function(s) of ours read the lines and make a trade" % len(have)
