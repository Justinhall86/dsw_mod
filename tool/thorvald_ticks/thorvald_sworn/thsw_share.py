"""Council spawn gated by CHOAM shares.

The game's own attribute OnCouncilVoteEnd_SpawnMB_TUnit_Flat ("Receive N [unit] near your Main Base after every Council") is read in
LandsraadManager.closeVotes, once per faction: `for i < int(val): Structure.recruit(mainBase, unit, ...)`.
This change reads the FRACTION of `val` as a share threshold: val = count + threshold (2.10 = two units if the faction holds at least
10% of the CHOAM shares; 2.20 = two units at 20%). A whole-number val has no fraction, so every vanilla use behaves as before.
The share ratio is ChoamMarket.getFactionSharesRatio(Game.inst.state.choamMarket, faction), the same call the Me_HasCHOAMSharesRatio condition makes.
"""
from tools.project import gv, guard
from tools.hlcode import assemble, function_named, kind_named, field_by_name, calls
from tools.splice import insert

from thsw_util import attribute_index, new_reg, op, int_op, float_op, call, int_value, the_game_chain

NAME = "thorvald_share_rung"
CLOSE = "logic.state.LandsraadManager.closeVotes"
ATTR = "OnCouncilVoteEnd_SpawnMB_TUnit_Flat"
APPS = "ent.Object.getAtbApps"
RATIO = "logic.state.ChoamMarket.getFactionSharesRatio"
SLACK = 0.0001      # float noise: 2.10 - 2.0 is 0.0999999999999996


def install(bc):
    idx = attribute_index(ATTR)
    guard(idx is not None, "the cdb has no attribute %s" % ATTR)
    fn = function_named(bc, CLOSE)
    apps = function_named(bc, APPS)
    loads = [i for i, o in enumerate(fn.ops) if o.op == "Int" and int_value(bc, o) == idx]
    # the one load of this attribute's row number that is followed by the getAtbApps call
    sites = []
    for i in loads:
        for j in range(i + 1, min(i + 8, len(fn.ops))):
            if calls(fn.ops[j], apps):
                sites.append((i, j))
                break
    guard(len(sites) == 1, "closeVotes loads attribute row %d for getAtbApps %d time(s), expected 1" % (idx, len(sites)))
    load_at, call_at = sites[0]
    faction = gv(fn.ops[call_at].df["args"].value[0]) if hasattr(fn.ops[call_at].df["args"], "value") else None
    guard(faction is not None, "getAtbApps call has no argument list")
    app_kind = kind_named(bc, "logic.AttributeApplication")
    val_at = field_by_name(bc, app_kind, "val", "an attribute application")[0]
    # the app's `val` is read, then turned into the loop count
    for j in range(call_at + 1, min(call_at + 40, len(fn.ops) - 1)):
        a, b = fn.ops[j], fn.ops[j + 1]
        if a.op == "Field" and gv(a.df["field"]) == val_at and b.op == "ToInt" and gv(b.df["src"]) == gv(a.df["dst"]):
            val, count, after = gv(a.df["dst"]), gv(b.df["dst"]), j + 2
            break
    else:
        guard(False, "closeVotes: no `val` read followed by ToInt after the getAtbApps call")

    ratio = function_named(bc, RATIO)
    f64 = gv(fn.regs[val])
    r = {n: new_reg(bc, fn, f64) for n in ("countf", "thr", "zero", "eps", "share")}
    chain, regs = the_game_chain(bc, fn, "state", "choamMarket")
    market = regs[-1]
    block = assemble(
        [op(bc, "ToSFloat", dst=r["countf"], src=count),
         op(bc, "Sub", dst=r["thr"], a=val, b=r["countf"]),
         float_op(bc, r["zero"], 0.0),
         (op(bc, "JSLte", a=r["thr"], b=r["zero"]), "ok")]            # a whole number: no gate, as vanilla
        + chain[:2] + [(op(bc, "JNull", reg=regs[0]), "below")]            # Game.inst
        + [chain[2]] + [(op(bc, "JNull", reg=regs[1]), "below")]           # .state
        + [chain[3]]                                                       # .choamMarket
        + [(op(bc, "JNull", reg=market), "below"),
           call(bc, r["share"], gv(ratio.findex), market, faction),
           float_op(bc, r["eps"], SLACK),
           op(bc, "Add", dst=r["share"], a=r["share"], b=r["eps"]),
           (op(bc, "JSGte", a=r["share"], b=r["thr"]), "ok"),
           "below:", op(bc, "Label"),
           int_op(bc, count, 0),                                          # below the rung: no units
           "ok:", op(bc, "Label")])
    n = insert(bc, fn, after, block, "share rung on the Council spawn", "a splice at something the game does in play")
    return "%s: %d instruction(s) gate %s by the faction's CHOAM share ratio (val fraction = threshold)" % (NAME, n, ATTR)
