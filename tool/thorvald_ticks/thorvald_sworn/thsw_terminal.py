"""Consignment Terminal: a real trade window, the Fremen Recycling Plant's, with Thorvald's own rates.

The game gives a building a window only for three hard-coded ids (NuclearSilo, RecyclingPlant, SpacingGuildBranch); every other
building gets the text-only BuildingUI. Four hooks make Th_ConsignmentTerminal a Recycling-type building under its own id:

  1. Structure.createBuilding   before the generic `Building.create(struct, kind, uid, x, y)`: for our id, build an
                                ent.RecyclingPlant object but run Building's constructor with OUR kind (RecyclingPlant's own
                                constructor hard-codes "RecyclingPlant"), then Logic.onCreate, as RecyclingPlant.create does.
                                The object keeps our id, so name, model, costs and traits are the terminal's row.
  2. GameUI.displayBuilding     our id goes down the RecyclingPlant branch (owner == me, not under construction ->
                                RecyclingPlantUI, else BuildingUI).
  3. RecyclingPlant.getTradingRate   for our id: our table instead of the cdb columns shared with the Fremen.
  4. RecyclingPlantTradesUI.getPossibleResources   for our id: lists cloned from HRes.getRecyclingPlant{Sell,Buy}ableResources,
                                filtered by our table instead of recyclingPlantSellVal / recyclingPlantBuyVal.

The middle currency stays Scraps (hard-coded in the window), so the Thorvald trait must not block Scraps (cdb). Rates: SELL = how
much is paid per Scrap; BUY = how much one Scrap brings. One Scrap per day (constant RecyclingPlant_Exchange_ScrapsPerDay).
"""
from copy import deepcopy

from tools.project import gv, guard
from tools.hlcode import (argument_kinds, assemble, function_named, kind_named, new_function, replace_body,
                          returns_type, field_by_name, lands_at)
from tools.splice import insert

from thsw_util import new_reg, op, int_op, float_op, call

NAME = "thorvald_consignment_terminal"
TERMINAL = "Th_ConsignmentTerminal"
# 100 Plascrete buys 150 Solari / 8 Manpower / 24 Intel / 6 Influence / 4 Authority (57_consignment_terminal.py), at 30 per Scrap
SELL = (("Plascrete", 30.0),)
BUY = (("Solari", 45.0), ("Manpower", 2.4), ("Intel", 7.2), ("Influence", 1.8), ("Authority", 1.2))

CREATE = "ent.Structure.createBuilding"
B_CREATE = "ent.$Building.create"
B_CTOR = "ent.$Building.__constructor__"
RP_CTOR = "ent.$RecyclingPlant.__constructor__"
ON_CREATE = "logic.Logic.onCreate"
DISPLAY = "ui.GameUI.displayBuilding"
RATE = "ent.RecyclingPlant.getTradingRate"
POSSIBLE = "ui.hud.RecyclingPlantTradesUI.getPossibleResources"
SELLABLE = "$HRes.getRecyclingPlantSellableResources"
BUYABLE = "$HRes.getRecyclingPlantBuyableResources"
INDEX_OF = "String.indexOf"
SPLICE = "a splice at something the game does in play"


def _str(bc, fn, s):
    from thsw_util import text          # a real String object (the String opcode gives raw bytes: never equal)
    return text(bc, fn, s)


def _same(bc):
    """same(a, b) -> int 1 when the two strings are equal (indexOf == 0 and equal lengths), else 0."""
    string = kind_named(bc, "String")
    i32 = returns_type(function_named(bc, INDEX_OF), INDEX_OF)
    fn = new_function(bc, [string, string], i32, function_named(bc, INDEX_OF))
    ik = argument_kinds(bc, INDEX_OF)
    length_at, length_kind = field_by_name(bc, string, "length", "String.length")
    nothing, found, zero, one = new_reg(bc, fn, ik[1]), new_reg(bc, fn, i32), new_reg(bc, fn, i32), new_reg(bc, fn, i32)
    l1, l2 = new_reg(bc, fn, length_kind), new_reg(bc, fn, length_kind)
    replace_body(fn, assemble([
        int_op(bc, zero, 0), int_op(bc, one, 1),
        (op(bc, "JNull", reg=0), "no"), (op(bc, "JNull", reg=1), "no"),
        op(bc, "Field", dst=l1, obj=0, field=length_at), op(bc, "Field", dst=l2, obj=1, field=length_at),
        (op(bc, "JNotEq", a=l1, b=l2), "no"),
        op(bc, "Null", dst=nothing), call(bc, found, gv(function_named(bc, INDEX_OF).findex), 0, 1, nothing),
        (op(bc, "JNotEq", a=found, b=zero), "no"),
        op(bc, "Ret", ret=one),
        "no:", op(bc, "Ret", ret=zero)]))
    return fn


def _rate(bc, same, table):
    """rate(resource id) -> the table's number, 0 when the resource is not in it."""
    string, f64 = kind_named(bc, "String"), returns_type(function_named(bc, RATE), RATE)
    fn = new_function(bc, [string], f64, function_named(bc, RATE))
    i32 = returns_type(same, "same")
    hit, zero, out = new_reg(bc, fn, i32), new_reg(bc, fn, i32), new_reg(bc, fn, f64)
    items = [int_op(bc, zero, 0)]
    for k, (res, value) in enumerate(table):
        word, load = _str(bc, fn, res)
        items += [load, call(bc, hit, gv(same.findex), 0, word), (op(bc, "JEq", a=hit, b=zero), "n%d" % k),
                  float_op(bc, out, value), op(bc, "Ret", ret=out), "n%d:" % k]
    items += [float_op(bc, out, 0.0), op(bc, "Ret", ret=out)]
    replace_body(fn, assemble(items))
    return fn


def _is_ours(bc, same):
    """ours(kind string) -> 1 for the terminal's id."""
    string = kind_named(bc, "String")
    i32 = returns_type(same, "same")
    fn = new_function(bc, [string], i32, same)
    word, load = _str(bc, fn, TERMINAL)
    got = new_reg(bc, fn, i32)
    replace_body(fn, [load, call(bc, got, gv(same.findex), 0, word), op(bc, "Ret", ret=got)])
    return fn


def _builder(bc, ours, kinds, ret_kind):
    """make(struct, kind, uid, x, y) -> a RecyclingPlant object with our kind, or null for every other id."""
    fn = new_function(bc, kinds, ret_kind, function_named(bc, B_CREATE))
    rp_kind = argument_kinds(bc, RP_CTOR) and gv(function_named(bc, RP_CTOR).type.resolve(bc).definition.args[0])
    i32 = returns_type(ours, "ours")
    hit, zero = new_reg(bc, fn, i32), new_reg(bc, fn, i32)
    obj, as_building = new_reg(bc, fn, rp_kind), new_reg(bc, fn, ret_kind)
    void = new_reg(bc, fn, returns_type(function_named(bc, B_CTOR), B_CTOR))
    void2 = new_reg(bc, fn, returns_type(function_named(bc, ON_CREATE), ON_CREATE))
    replace_body(fn, assemble([
        int_op(bc, zero, 0), call(bc, hit, gv(ours.findex), 1), (op(bc, "JEq", a=hit, b=zero), "no"),
        op(bc, "New", dst=obj),
        op(bc, "CallN", dst=void, fun=gv(function_named(bc, B_CTOR).findex), args=[obj, 0, 1, 2, 3, 4]),
        call(bc, void2, gv(function_named(bc, ON_CREATE).findex), obj),
        op(bc, "Mov", dst=as_building, src=obj), op(bc, "Ret", ret=as_building),
        "no:", op(bc, "Null", dst=as_building), op(bc, "Ret", ret=as_building)]))
    return fn


def _hook_create(bc, ours):
    host = function_named(bc, CREATE)
    target = gv(function_named(bc, B_CREATE).findex)
    sites = [i for i, o in enumerate(host.ops) if o.op == "CallN" and gv(o.df["fun"]) == target]
    guard(len(sites) == 1, "%s calls Building.create %d times, expected 1" % (CREATE, len(sites)))
    at = sites[0]
    site = host.ops[at]
    guard(host.ops[at + 1].op == "Mov" and gv(host.ops[at + 1].df["src"]) == gv(site.df["dst"]),
          "%s: no Mov of the new building after Building.create" % CREATE)
    args = [gv(a) for a in site.df["args"].value] if hasattr(site.df["args"], "value") else [gv(a) for a in site.df["args"]]
    kinds = [gv(host.regs[a]) for a in args]
    dst = gv(site.df["dst"])
    make = _builder(bc, ours, kinds, gv(host.regs[dst]))
    # [made = make(...); JNotNull made -> the Mov after the original call]; null falls through to the vanilla call
    block = [op(bc, "CallN", dst=dst, fun=gv(make.findex), args=args), op(bc, "JNotNull", reg=dst, offset=1)]
    insert(bc, host, at, block, "consignment terminal: built as a Recycling-type building", SPLICE)


def _hook_display(bc, ours):
    host = function_named(bc, DISPLAY)
    from armoury_lib import str_ref
    # the branch the id "RecyclingPlant" takes: the jump right after its string compare
    texts = [i for i, o in enumerate(host.ops) if o.op == "String" and gv(o.df["ptr"]) == str_ref(bc, "RecyclingPlant")]
    guard(len(texts) == 1, "%s compares \"RecyclingPlant\" %d times, expected 1" % (DISPLAY, len(texts)))
    j = next(i for i in range(texts[0], texts[0] + 6) if host.ops[i].op == "JEq")
    branch = lands_at(host.ops[j], j)
    texts = [i for i, o in enumerate(host.ops) if o.op == "String" and gv(o.df["ptr"]) == str_ref(bc, "SpacingGuildBranch")]
    guard(len(texts) == 1, "%s compares \"SpacingGuildBranch\" %d times" % (DISPLAY, len(texts)))
    last = next(i for i in range(texts[0], texts[0] + 6) if host.ops[i].op == "JEq")
    at = last + 1                                                  # the generic BuildingUI branch, reached by falling through
    guard(branch > at, "the RecyclingPlant branch (%d) is not after the generic one (%d)" % (branch, at))
    b_kind = gv(host.regs[1])
    kind_at, kind_kind = field_by_name(bc, b_kind, "kind", "ent.Building")
    i32 = returns_type(ours, "ours")
    k, hit, zero = new_reg(bc, host, kind_kind), new_reg(bc, host, i32), new_reg(bc, host, i32)
    n = 5
    block = [op(bc, "Field", dst=k, obj=1, field=kind_at), call(bc, hit, gv(ours.findex), k), int_op(bc, zero, 0),
             op(bc, "JEq", a=hit, b=zero, offset=1),
             op(bc, "JAlways", offset=(branch + n) - (at + 4) - 1)]
    insert(bc, host, at, block, "consignment terminal: opens the Recycling window", SPLICE)


def _hook_rate(bc, ours, sell, buy):
    host = function_named(bc, RATE)
    me = gv(host.regs[0])
    kind_at, kind_kind = field_by_name(bc, me, "kind", "ent.RecyclingPlant")
    i32, f64 = returns_type(ours, "ours"), returns_type(host, RATE)
    k, hit, zero, out = new_reg(bc, host, kind_kind), new_reg(bc, host, i32), new_reg(bc, host, i32), new_reg(bc, host, f64)
    items = [op(bc, "Field", dst=k, obj=0, field=kind_at), call(bc, hit, gv(ours.findex), k), int_op(bc, zero, 0),
             (op(bc, "JEq", a=hit, b=zero), "vanilla"),
             (op(bc, "JFalse", cond=2), "buy"),
             call(bc, out, gv(sell.findex), 1), op(bc, "Ret", ret=out),
             "buy:", call(bc, out, gv(buy.findex), 1), op(bc, "Ret", ret=out),
             "vanilla:", op(bc, "Label")]
    insert(bc, host, 0, assemble(items), "consignment terminal: own trade rates", SPLICE)


def _list(bc, vanilla_name, column, rate):
    """A copy of HRes.getRecyclingPlant*Resources whose filter is rate(row.id) > 0 instead of the cdb column.

    The vanilla loop reads `stats[0].<column>` and skips the row when that is null (Field, JNull); the pair becomes
    [DynGet row.id; rate(id); 0.0; JSLte rate, 0 -> the same place]. Every jump is re-measured on the new layout."""
    from armoury_lib import str_ref
    van = function_named(bc, vanilla_name)
    fn = new_function(bc, [], returns_type(van, vanilla_name), van)
    fn.regs[:] = deepcopy(list(van.regs))
    fn.nregs.value = len(fn.regs)
    ops = deepcopy(list(van.ops))
    push_fn = gv(function_named(bc, "hl.types.ArrayObj.push").findex)
    pushes = [k for k, o in enumerate(ops) if o.op == "Call2" and gv(o.df["fun"]) == push_fn]
    guard(len(pushes) == 1, "%s pushes %d times, expected 1" % (vanilla_name, len(pushes)))
    row = gv(ops[pushes[0]].df["arg1"])
    # the column test: the last Field-then-JNull (on the field just read) before the push
    pairs = [k for k in range(1, pushes[0]) if ops[k].op == "JNull" and ops[k - 1].op == "Field"
             and gv(ops[k - 1].df["dst"]) == gv(ops[k].df["reg"])]
    guard(pairs, "%s: no read of %s followed by JNull" % (vanilla_name, column))
    j = pairs[-1]
    i = j - 1
    f64, string = returns_type(rate, "rate"), kind_named(bc, "String")
    rid, r, z = new_reg(bc, fn, string), new_reg(bc, fn, f64), new_reg(bc, fn, f64)
    new = [op(bc, "DynGet", dst=rid, obj=row, field=str_ref(bc, "id")), call(bc, r, gv(rate.findex), rid),
           float_op(bc, z, 0.0), op(bc, "JSLte", a=r, b=z, offset=0)]
    grow = len(new) - 2

    def moved(k):                                  # old index -> new index (the pair i, j is replaced)
        return k if k < i else k + grow

    targets = {k: lands_at(o, k) for k, o in enumerate(ops) if "offset" in o.df and k != j}
    skip = lands_at(ops[j], j)
    for k, t in targets.items():
        guard(t not in (i, j), "%s: a jump lands inside the replaced pair" % vanilla_name)
        ops[k].df["offset"].value = moved(t) - moved(k) - 1
    new[-1].df["offset"].value = moved(skip) - (i + len(new) - 1) - 1
    replace_body(fn, ops[:i] + new + ops[j + 1:])
    return fn



def _hook_possible(bc, ours, sell_list, buy_list):
    host = function_named(bc, POSSIBLE)
    me = gv(host.regs[0])
    b_at, b_kind = field_by_name(bc, me, "b", "RecyclingPlantTradesUI")
    g_at, g_kind = field_by_name(bc, me, "gift", "RecyclingPlantTradesUI")
    kind_at, kind_kind = field_by_name(bc, b_kind, "kind", "the window's building")
    i32 = returns_type(ours, "ours")
    arr_kind = returns_type(host, POSSIBLE)
    b, k, hit, zero, g = (new_reg(bc, host, b_kind), new_reg(bc, host, kind_kind), new_reg(bc, host, i32),
                          new_reg(bc, host, i32), new_reg(bc, host, g_kind))
    arr = new_reg(bc, host, arr_kind)
    items = [op(bc, "Field", dst=b, obj=0, field=b_at), (op(bc, "JNull", reg=b), "vanilla"),
             op(bc, "Field", dst=k, obj=b, field=kind_at), call(bc, hit, gv(ours.findex), k), int_op(bc, zero, 0),
             (op(bc, "JEq", a=hit, b=zero), "vanilla"),
             op(bc, "Field", dst=g, obj=0, field=g_at), (op(bc, "JFalse", cond=g), "buy"),
             call(bc, arr, gv(sell_list.findex)), op(bc, "Ret", ret=arr),
             "buy:", call(bc, arr, gv(buy_list.findex)), op(bc, "Ret", ret=arr),
             "vanilla:", op(bc, "Label")]
    insert(bc, host, 0, assemble(items), "consignment terminal: its own resource lists", SPLICE)


def install(bc):
    same = _same(bc)
    ours = _is_ours(bc, same)
    sell, buy = _rate(bc, same, SELL), _rate(bc, same, BUY)
    sell_list = _list(bc, SELLABLE, "recyclingPlantSellVal", sell)
    buy_list = _list(bc, BUYABLE, "recyclingPlantBuyVal", buy)
    _hook_create(bc, ours)
    _hook_display(bc, ours)
    _hook_rate(bc, ours, sell, buy)
    _hook_possible(bc, ours, sell_list, buy_list)
    return "%s: %s is a Recycling-type building with its own window, rates (sell %s; buy %s) and lists" % (
        NAME, TERMINAL, ", ".join(r for r, _ in SELL), ", ".join(r for r, _ in BUY))
