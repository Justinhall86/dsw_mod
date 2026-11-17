"""Thorvald operations kit: four things an operation can do, switched on by raw fields of its ability row in data.cdb.

Data alone cannot point a raid, a landing or a pick-up at the place the player clicks. One call at the top of
AbilityManager.doUseAbility(ability, args) reads these optional fields of the ability row (raw cdb fields survive to run time):

  thEvent : structure id   WorldEventManager.addWorldEvent(id, args.zone), then unlocked + reconned + creator + owner = the caster
                           (what the game's own GhostMarket branch does, for any ability id). It becomes the ORIGIN below.
  thRaid  : raid id        Raids.spawnRaid(id, owner, target = args.struct, origin). Owner = null (the Renegades, hostile to all)
                           unless thOwner is set, then the caster. With an origin the raid appears there and walks to the target.
  thOwner : any string     see thRaid.
  thDrop  : raid id        HUnit.spawnRaidComposition(id, caster, point): that raid row's units as the CASTER'S OWN armies (shuttle
                           drop when the raid row has flag 1). Point = safe position at the origin, else at args.struct, else the
                           centre of args.zone. No recruit checks, no cost.
  thLift  : unit id        every ground army of the caster in args.zone that is not already carried is picked up by a carrier of
                           that unit kind (ent.Shuttle.create, the Airfield transit) and flown to the caster's main base.

A fifth switch sits on the RAID row, not the ability: `thShip` : unit id. HUnit.spawnRaidComposition brings a shuttle-drop
raid (flag 1) down in one `ent.ShuttleSpawn` per army and hard-codes the carrier kind "Shuttle"; with thShip on the raid row
that carrier is the named unit instead (it needs the SpaceShuttle rig and clips: the descent is in the animation). It covers
natural Renegade drops, thRaid and thDrop alike.

Order: event, raid, drop, lift. Missing pieces end quietly (no zone, no main base). When the zone has no free spot for the
event (the game logs it), the raid and the drop still happen, without an origin.
History: v1 (Renegade Takeover only) compared the ability id against a `String` opcode, which is raw bytes, so it never ran.
"""
from tools.project import gv, guard
from tools.hlcode import (argument_kinds, assemble, function_named, kind_named, new_function, replace_body,
                          returns_type, field_by_name, name_of_kind, classes_above)
from tools.splice import insert

from thsw_util import new_reg, op, int_op, call, the_game_chain, nulls

NAME = "thorvald_operations_kit"
USE = "logic.faction.AbilityManager.doUseAbility"
SPAWN = "logic.state.Raids.spawnRaid"
ADD = "logic.state.WorldEventManager.addWorldEvent"
SETU, SETR = "ent.Structure.setUnlocked", "ent.Structure.setReconned"
SETC, SETO = "ent.comp.WorldEventComponent.set_creator", "ent.Structure.set_owner"
SAFE, CENTER = "ent.Entity.getSafePosition", "ent.Zone.getCenter"
COMP = "$HUnit.spawnRaidComposition"
MB = "ent.Faction.get_mainBase"
SHUT = "ent.$Shuttle.create"
SPAWN_SHIP = "ent.$ShuttleSpawn.create"
GET_OWNER, FLY, CARRIED = "ent.Entity.get_owner", "ent.Unit.isFlying", "ent.Entity.inTransport"
ARMY_LOOP = "logic.state.Raid.spawn"          # a vanilla loop over armies: its GetArray tells us the element kinds
VOID_LIKE = "ui.GameUI.displayWindow"


def _ours(bc, mgr_kind, ability_kind, args_kind):
    from armoury_lib import str_ref
    F = lambda n: function_named(bc, n)
    fx = lambda n: gv(F(n).findex)
    void_kind = returns_type(F(VOID_LIKE), VOID_LIKE)
    fn = new_function(bc, [mgr_kind, ability_kind, args_kind], void_kind, F(USE))
    R = lambda k: new_reg(bc, fn, k)
    M, AB, ARGS = 0, 1, 2
    string = kind_named(bc, "String")
    sk, ak = argument_kinds(bc, SPAWN), argument_kinds(bc, ADD)      # String, Faction, Entity, Entity | String, Zone, ZoneCell, ref
    struct_kind = returns_type(F(ADD), ADD)
    point_kind = returns_type(F(SAFE), SAFE)
    owner_at, owner_kind = field_by_name(bc, mgr_kind, "owner", "AbilityManager")
    zone_kind = ak[1]

    def dyn(dst, obj, name):
        return op(bc, "DynGet", dst=dst, obj=obj, field=str_ref(bc, name))

    ev, raid, drop, lift, flag = R(string), R(string), R(string), R(string), R(string)
    owner, struct, zone = R(owner_kind), R(sk[2]), R(zone_kind)
    origin, made, void = R(sk[3]), R(struct_kind), R(void_kind)
    items = [dyn(ev, AB, "thEvent"), dyn(raid, AB, "thRaid"), dyn(drop, AB, "thDrop"), dyn(lift, AB, "thLift"),
             (op(bc, "JNotNull", reg=ev), "go"), (op(bc, "JNotNull", reg=raid), "go"), (op(bc, "JNotNull", reg=drop), "go"),
             (op(bc, "JNotNull", reg=lift), "go"), (op(bc, "JAlways"), "end"),
             "go:", op(bc, "Field", dst=owner, obj=M, field=owner_at), (op(bc, "JNull", reg=owner), "end"),
             dyn(struct, ARGS, "struct"), dyn(zone, ARGS, "zone"), op(bc, "Null", dst=origin)]
    chain, regs = the_game_chain(bc, fn, "state")                    # Game.inst.state, each step may be null
    for o in chain:
        items.append(o)
        if o.op == "Field":
            items.append((op(bc, "JNull", reg=gv(o.df["dst"])), "end"))
    state = regs[-1]
    state_kind = gv(fn.regs[state])

    # ---- thEvent: a world-event structure in the target zone, owned by the caster
    wem_at, wem_kind = field_by_name(bc, state_kind, "worldEventManager", "State")
    we_at, we_kind = field_by_name(bc, struct_kind, "worldEvent", "ent.Structure")
    wem, wec = R(wem_kind), R(we_kind)
    n_add, l_add = nulls(bc, fn, ak[2:])
    n_u, l_u = nulls(bc, fn, argument_kinds(bc, SETU)[1:])
    n_r, l_r = nulls(bc, fn, argument_kinds(bc, SETR)[1:])
    items += [(op(bc, "JNull", reg=ev), "noev"), (op(bc, "JNull", reg=zone), "end"),
              op(bc, "Field", dst=wem, obj=state, field=wem_at), (op(bc, "JNull", reg=wem), "end"), *l_add,
              op(bc, "CallN", dst=made, fun=fx(ADD), args=[wem, ev, zone] + n_add), (op(bc, "JNull", reg=made), "noev"),
              *l_u, call(bc, R(returns_type(F(SETU), SETU)), fx(SETU), made, owner, *n_u),
              *l_r, call(bc, R(returns_type(F(SETR), SETR)), fx(SETR), made, owner, *n_r),
              op(bc, "Field", dst=wec, obj=made, field=we_at), (op(bc, "JNull", reg=wec), "nowec"),
              call(bc, R(returns_type(F(SETC), SETC)), fx(SETC), wec, owner),
              "nowec:", call(bc, R(returns_type(F(SETO), SETO)), fx(SETO), made, owner),
              op(bc, "Mov", dst=origin, src=made),
              "noev:", op(bc, "Label")]

    # ---- thRaid: a raid on the clicked structure
    raids_at, raids_kind = field_by_name(bc, state_kind, "raids", "State")
    raids, r_owner = R(raids_kind), R(sk[1])
    items += [(op(bc, "JNull", reg=raid), "noraid"), (op(bc, "JNull", reg=struct), "noraid"),
              op(bc, "Field", dst=raids, obj=state, field=raids_at), (op(bc, "JNull", reg=raids), "noraid"),
              op(bc, "Null", dst=r_owner), dyn(flag, AB, "thOwner"), (op(bc, "JNull", reg=flag), "neutral"),
              op(bc, "Mov", dst=r_owner, src=owner),
              "neutral:", op(bc, "CallN", dst=R(returns_type(F(SPAWN), SPAWN)), fun=fx(SPAWN),
                             args=[raids, raid, r_owner, struct, origin]),
              "noraid:", op(bc, "Label")]

    # ---- thDrop: the caster's own armies at a point
    ck = argument_kinds(bc, COMP)                                    # String, Faction, PointImpl, null
    safe_k = argument_kinds(bc, SAFE)
    point, centre = R(point_kind), R(returns_type(F(CENTER), CENTER))
    n_s1, l_s1 = nulls(bc, fn, safe_k)
    n_s2, l_s2 = nulls(bc, fn, safe_k)
    n_c, l_c = nulls(bc, fn, ck[3:])
    items += [(op(bc, "JNull", reg=drop), "nodrop"), op(bc, "Null", dst=point),
              (op(bc, "JNull", reg=origin), "d1"), *l_s1, call(bc, point, fx(SAFE), origin, *n_s1), (op(bc, "JAlways"), "dgo"),
              "d1:", (op(bc, "JNull", reg=struct), "d2"), *l_s2, call(bc, point, fx(SAFE), struct, *n_s2),
              (op(bc, "JAlways"), "dgo"),
              "d2:", (op(bc, "JNull", reg=zone), "nodrop"), call(bc, centre, fx(CENTER), zone),
              op(bc, "Mov", dst=point, src=centre),
              "dgo:", (op(bc, "JNull", reg=point), "nodrop"), *l_c,
              call(bc, R(returns_type(F(COMP), COMP)), fx(COMP), drop, owner, point, *n_c),
              "nodrop:", op(bc, "Label")]

    # ---- thLift: carriers take the caster's ground armies in the zone to the main base
    army_kind = kind_named(bc, "ent.Army")
    guard("ent.Unit" in classes_above(bc, "ent.Army"), "ent.Army no longer derives from ent.Unit (isFlying)")
    arr_at, arr_kind = field_by_name(bc, zone_kind, "armies", "ent.Zone")
    guard(name_of_kind(bc, arr_kind) == "hl.types.ArrayObj", "Zone.armies is a %s, expected ArrayObj" % name_of_kind(bc, arr_kind))
    len_at, len_kind = field_by_name(bc, arr_kind, "length", "ArrayObj")
    nat_at, nat_kind = field_by_name(bc, arr_kind, "array", "ArrayObj")
    loop_fn = F(ARMY_LOOP)
    gets = [o for o in loop_fn.ops if o.op == "GetArray"]
    guard(gets, "%s has no GetArray to copy the element kind from" % ARMY_LOOP)
    dyn_kind = gv(loop_fn.regs[gv(gets[0].df["dst"])])
    mb, arr, i, n = R(returns_type(F(MB), MB)), R(arr_kind), R(len_kind), R(len_kind)
    nat, el, army = R(nat_kind), R(dyn_kind), R(army_kind)
    a_owner = R(returns_type(F(GET_OWNER), GET_OWNER))
    fly, carried = R(returns_type(F(FLY), FLY)), R(returns_type(F(CARRIED), CARRIED))
    home = R(point_kind)
    n_s3, l_s3 = nulls(bc, fn, safe_k)
    items += [(op(bc, "JNull", reg=lift), "end"), (op(bc, "JNull", reg=zone), "end"),
              call(bc, mb, fx(MB), owner), (op(bc, "JNull", reg=mb), "end"),
              op(bc, "Field", dst=arr, obj=zone, field=arr_at), (op(bc, "JNull", reg=arr), "end"),
              int_op(bc, i, 0),
              "loop:", op(bc, "Label"),
              op(bc, "Field", dst=n, obj=arr, field=len_at), (op(bc, "JSGte", a=i, b=n), "end"),
              op(bc, "Field", dst=nat, obj=arr, field=nat_at), op(bc, "GetArray", dst=el, array=nat, index=i),
              op(bc, "UnsafeCast", dst=army, src=el), op(bc, "Incr", dst=i),
              (op(bc, "JNull", reg=army), "loop"),
              call(bc, a_owner, fx(GET_OWNER), army), (op(bc, "JNotEq", a=a_owner, b=owner), "loop"),
              call(bc, fly, fx(FLY), army), (op(bc, "JTrue", cond=fly), "loop"),
              call(bc, carried, fx(CARRIED), army), (op(bc, "JTrue", cond=carried), "loop"),
              *l_s3, call(bc, home, fx(SAFE), mb, *n_s3), (op(bc, "JNull", reg=home), "loop"),
              call(bc, R(returns_type(F(SHUT), SHUT)), fx(SHUT), lift, army, home),
              (op(bc, "JAlways"), "loop"),
              "end:", op(bc, "Label"), op(bc, "Ret", ret=void)]
    replace_body(fn, assemble(items))
    return fn


def _ship_kind(bc, raid_kind, like):
    """fn(raid row, default kind) -> the row's thShip, or the default."""
    from armoury_lib import str_ref
    string = kind_named(bc, "String")
    fn = new_function(bc, [raid_kind, string], string, like)
    own = new_reg(bc, fn, string)
    replace_body(fn, assemble([op(bc, "DynGet", dst=own, obj=0, field=str_ref(bc, "thShip")),
                               (op(bc, "JNull", reg=own), "plain"), op(bc, "Ret", ret=own),
                               "plain:", op(bc, "Label"), op(bc, "Ret", ret=1)]))
    return fn


def _drop_ship(bc):
    comp, spawn = function_named(bc, COMP), function_named(bc, SPAWN_SHIP)
    sites = [i for i, o in enumerate(comp.ops) if o.op.startswith("Call") and gv(o.df["fun"]) == gv(spawn.findex)]
    guard(len(sites) == 1, "spawnRaidComposition calls ShuttleSpawn.create %d time(s)" % len(sites))
    at = sites[0]
    kind = gv(comp.ops[at].df["arg0"])
    virt = [o for o in comp.ops[:12] if o.op == "ToVirtual"]
    guard(len(virt) == 1, "spawnRaidComposition no longer starts with one raid-row ToVirtual")
    raid = gv(virt[0].df["dst"])
    helper = _ship_kind(bc, gv(comp.regs[raid]), comp)
    return insert(bc, comp, at, [call(bc, kind, gv(helper.findex), raid, kind)], "thorvald drop ship kind",
                  "a splice at something the game does in play")


def install(bc):
    ships = _drop_ship(bc)
    use = function_named(bc, USE)
    kinds = argument_kinds(bc, USE)                         # ability (virtual), args (virtual): r1, r2; r0 = the manager
    guard(len(kinds) == 2, "%s takes %d arguments besides this, expected 2" % (USE, len(kinds)))
    ours = _ours(bc, gv(use.regs[0]), kinds[0], kinds[1])
    void = new_reg(bc, use, returns_type(function_named(bc, VOID_LIKE), VOID_LIKE))
    n = insert(bc, use, 0, [call(bc, void, gv(ours.findex), 0, 1, 2)], "thorvald operations kit",
               "a splice at something the game does in play")
    return "%s: 1 function of ours, %d instruction(s) at the top of doUseAbility; ability fields thEvent/thRaid/thOwner/thDrop/thLift; %d instruction(s) in spawnRaidComposition, raid field thShip" % (
        NAME, n, ships)
