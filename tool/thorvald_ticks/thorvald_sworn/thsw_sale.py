"""Spawn units when a trade line is traded (needs the resource_trades tick, which is applied first).

resource_trades writes t_trade(pay, get): the best Convert_TRes_To_TRes2 line goes through the game's own converter and, on Success,
two shifts follow. This change appends, on the Success path, a call to our own sold(faction, payEntry): if the line's PAY entry (the
`{val, resource}` item of `convertFrom`) carries a raw field `spawn` (a unit id), that unit is recruited at the faction's main base,
once per trade, exactly as the Council spawn recruits (Structure.recruit with the same flags), so a unit row's `props.maxCount` caps it.
The line lives on the Terminal's building trait, so the spawn exists only while a Terminal stands.
"""
from tools.project import gv, guard
from tools.hlcode import (argument_kinds, assemble, function_named, kind_named, new_function, replace_body,
                          returns_type, calls)
from tools.splice import insert

from thsw_util import new_reg, op, call

NAME = "thorvald_sale_spawn"
RECRUIT = "ent.Structure.recruit"
MAINBASE = "ent.Faction.get_mainBase"
CONVERT = "ent.Faction.convertResource"
PAY_ENTRY = "trades: the best line's pay entry"
FIELD = "spawn"


def _recruit_type_global(bc):
    """The RecruitType value the game's own Council spawn passes: read off closeVotes, just before its recruit call."""
    close = function_named(bc, "logic.state.LandsraadManager.closeVotes")
    rec = function_named(bc, RECRUIT)
    rt = kind_named(bc, "ent.RecruitType")
    for i, o in enumerate(close.ops):
        if calls(o, rec):
            for j in range(i - 1, max(i - 14, 0), -1):
                p = close.ops[j]
                if p.op == "GetGlobal" and gv(close.regs[gv(p.df["dst"])]) == rt:
                    return gv(p.df["global"])
    guard(False, "closeVotes has no RecruitType global before its recruit call")


def _sold(bc):
    from armoury_lib import str_ref
    kinds = argument_kinds(bc, RECRUIT)          # String, count, RecruitType, Faction, 3 flags, ArrayObj, Virtual, Null
    faction = kinds[3]
    dyn = returns_type(function_named(bc, "haxe.ds.StringMap.get"), "StringMap.get")
    fn = new_function(bc, [faction, dyn], returns_type(function_named(bc, "ui.GameUI.displayWindow"), "displayWindow"),
                      function_named(bc, CONVERT))
    f, pe = 0, 1
    text = kinds[0]
    unit, mb = new_reg(bc, fn, text), new_reg(bc, fn, returns_type(function_named(bc, MAINBASE), MAINBASE))
    rt = new_reg(bc, fn, kinds[2])
    flag = new_reg(bc, fn, returns_type(function_named(bc, "ent.Faction.canConvertResource"), "canConvertResource"))
    flags = [new_reg(bc, fn, kinds[4]) for _ in range(3)]
    nulls = [new_reg(bc, fn, kinds[i]) for i in (1, 7, 8, 9)]
    done = new_reg(bc, fn, returns_type(function_named(bc, RECRUIT), RECRUIT))
    void = new_reg(bc, fn, returns_type(function_named(bc, "ui.GameUI.displayWindow"), "displayWindow"))
    items = [op(bc, "DynGet", dst=unit, obj=pe, field=str_ref(bc, FIELD)), (op(bc, "JNull", reg=unit), "end"),
             call(bc, mb, gv(function_named(bc, MAINBASE).findex), f), (op(bc, "JNull", reg=mb), "end"),
             op(bc, "GetGlobal", **{"dst": rt, "global": _recruit_type_global(bc)})]
    for x in flags:                                   # the three `true` flags the Council spawn passes
        items += [op(bc, "Bool", dst=flag, value=True), op(bc, "ToDyn", dst=x, src=flag)]
    items += [op(bc, "Null", dst=n) for n in nulls]
    items += [op(bc, "CallN", dst=done, fun=gv(function_named(bc, RECRUIT).findex),
                 args=[mb, unit, nulls[0], rt, f] + flags + [nulls[1], nulls[2], nulls[3]]),
              "end:", op(bc, "Label"), op(bc, "Ret", ret=void)]
    replace_body(fn, assemble(items))
    return gv(fn.findex)


def install(bc):
    made = bc.__dict__.get("_trades_made")
    guard(made and "trade" in made, "the resource_trades tick has not run: build with --ticks resource_trades,thorvald_sworn")
    trade = next(f for f in bc.functions if gv(f.findex) == made["trade"])
    ops = trade.ops
    guard(ops[-1].op == "Ret" and ops[-2].op == "Label", "t_trade does not end in `done: Label; Ret`")
    conv = function_named(bc, CONVERT)
    sites = [o for o in ops if calls(o, conv)]
    guard(len(sites) == 1, "t_trade calls convertResource %d time(s)" % len(sites))
    args = sites[0].df["args"].value
    faction = gv(args[0])
    slot = bc.__dict__.get("_spine_slots", {}).get(PAY_ENTRY)
    guard(slot is not None, "the pay-entry slot of resource_trades was not made")
    pe = next(gv(o.df["dst"]) for o in ops if o.op == "GetGlobal" and gv(o.df["global"]) == slot)
    sold = _sold(bc)
    void = gv(ops[-1].df["ret"])
    block = [call(bc, void, sold, faction, pe)]
    n = insert(bc, trade, len(ops) - 2, block, "spawn on a successful trade", "a splice at something the game does in play")
    return "%s: %d instruction(s) spawn the line's `%s` unit after each successful trade" % (NAME, n, FIELD)
