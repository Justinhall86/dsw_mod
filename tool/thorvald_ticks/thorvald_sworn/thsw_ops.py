"""Renegade Takeover: the operation drops a real Renegade raid on the village you click.

Data alone cannot point the game's Renegade drop at a chosen village (the natural loop picks a random one; the only effects that
spawn raids fire from buildings, developments and world events). This change adds one call at the top of
AbilityManager.doUseAbility(ability, args): when ability.id is "Th_RenegadeTakeover" and args.struct is set, it runs
    Game.inst.state.raids.spawnRaid("Renegade_Drop", owner null, target = that village, origin null)
which is what the game's own drop and the /rgddrop console command do. The vanilla Renegade_Drop raid then lands by shuttle, takes
the village with InstallHub (a real RenegadeBase with RenegadeControl, militia and pillager raids, dismantled by the Dismantle siege
action the AI knows). Owner null = the Renegades, hostile to everyone, as in vanilla.
"""
from tools.project import gv, guard
from tools.hlcode import (argument_kinds, assemble, function_named, kind_named, new_function, replace_body,
                          returns_type, field_by_name)
from tools.splice import insert

from thsw_util import new_reg, op, int_op, call, the_game_chain

NAME = "thorvald_renegade_takeover"
ABILITY_ID = "Th_RenegadeTakeover"
RAID_ID = "Renegade_Drop"
USE = "logic.faction.AbilityManager.doUseAbility"
SPAWN = "logic.state.Raids.spawnRaid"
INDEX_OF = "String.indexOf"
VOID_LIKE = "ui.GameUI.displayWindow"


def _text(bc, fn, s):
    from armoury_lib import str_ref
    reg = new_reg(bc, fn, kind_named(bc, "String"))
    return reg, op(bc, "String", dst=reg, ptr=str_ref(bc, s))


def _ours(bc, ability_kind, args_kind):
    void_kind = returns_type(function_named(bc, VOID_LIKE), VOID_LIKE)
    fn = new_function(bc, [ability_kind, args_kind], void_kind, function_named(bc, USE))
    ab, args = 0, 1
    string = kind_named(bc, "String")
    sk = argument_kinds(bc, SPAWN)                          # (this = Raids) String, Faction, Entity, Entity
    ik = argument_kinds(bc, INDEX_OF)                       # (this = String) String, Null<Int>
    idx_ret = returns_type(function_named(bc, INDEX_OF), INDEX_OF)
    length_at, length_kind = field_by_name(bc, string, "length", "String.length")

    aid = new_reg(bc, fn, string)
    want, load_want = _text(bc, fn, ABILITY_ID)
    raid_id, load_raid = _text(bc, fn, RAID_ID)
    nothing = new_reg(bc, fn, ik[1])
    found, zero = new_reg(bc, fn, idx_ret), new_reg(bc, fn, idx_ret)
    l1, l2 = new_reg(bc, fn, length_kind), new_reg(bc, fn, length_kind)
    target = new_reg(bc, fn, sk[2])
    owner, origin = new_reg(bc, fn, sk[1]), new_reg(bc, fn, sk[3])
    made = new_reg(bc, fn, returns_type(function_named(bc, SPAWN), SPAWN))
    void = new_reg(bc, fn, void_kind)
    from armoury_lib import str_ref
    chain, regs = the_game_chain(bc, fn, "state", "raids")   # Game.inst, .state, .raids

    items = [op(bc, "DynGet", dst=aid, obj=ab, field=str_ref(bc, "id")), (op(bc, "JNull", reg=aid), "end"),
             load_want, op(bc, "Null", dst=nothing),
             call(bc, found, gv(function_named(bc, INDEX_OF).findex), aid, want, nothing),
             int_op(bc, zero, 0), (op(bc, "JNotEq", a=found, b=zero), "end"),
             op(bc, "Field", dst=l1, obj=aid, field=length_at), op(bc, "Field", dst=l2, obj=want, field=length_at),
             (op(bc, "JNotEq", a=l1, b=l2), "end"),
             op(bc, "DynGet", dst=target, obj=args, field=str_ref(bc, "struct")), (op(bc, "JNull", reg=target), "end")]
    for k, o in enumerate(chain):                           # each step of Game.inst.state.raids may be null
        items.append(o)
        if o.op == "Field":
            items.append((op(bc, "JNull", reg=gv(o.df["dst"])), "end"))
    items += [load_raid, op(bc, "Null", dst=owner), op(bc, "Null", dst=origin),
              op(bc, "CallN", dst=made, fun=gv(function_named(bc, SPAWN).findex),
                 args=[regs[-1], raid_id, owner, target, origin]),
              "end:", op(bc, "Label"), op(bc, "Ret", ret=void)]
    replace_body(fn, assemble(items))
    return fn


def install(bc):
    use = function_named(bc, USE)
    kinds = argument_kinds(bc, USE)                         # (this excluded) ability (virtual), args (virtual): r1, r2
    guard(len(kinds) == 2, "%s takes %d arguments besides this, expected 2" % (USE, len(kinds)))
    ours = _ours(bc, kinds[0], kinds[1])
    void = new_reg(bc, use, returns_type(function_named(bc, VOID_LIKE), VOID_LIKE))
    n = insert(bc, use, 0, [call(bc, void, gv(ours.findex), 1, 2)], "renegade takeover drop",
               "a splice at something the game does in play")
    return "%s: 1 function of ours, %d instruction(s) at the top of doUseAbility; ability %s drops %s on the clicked village" % (
        NAME, n, ABILITY_ID, RAID_ID)
