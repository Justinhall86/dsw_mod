"""Timed shuttle drops: a raid's troops stay in their drop ship until it has landed, then march (2026-11-13).

Why: HUnit.spawnRaidComposition puts each army of a shuttle raid (flag 1) in an ent.ShuttleSpawn that descends for 3 s,
but Raid.spawn calls Raid.goToTarget straight away. The march order sets the army's movementMode, and
MobileEntity.set_movementMode aborts any transport that is still arriving (isWaitingForTransit -> abortTransports ->
Carrier.cancelTarget). So the troops pop out at once and the empty ship lands on its own. Drops with no march order
(the kit's thDrop, Iron Landfall C) never had the problem.

Four changes, all keyed to shuttle raids:
  1. Raid.goToTarget: its `hasArmy` check becomes "has an army AND none of them is still in a ship". The order waits.
  2. ShuttleSpawn.onReachedTarget: after the ship sets its army down, if that army belongs to a raid and no army of the
     raid is still in a ship, Raid.goToTarget is called. The band marches when the last ship is down.
  3. ShuttleSpawn.getStateDuration: the descent (3 s, hard-coded) is the ship unit row's raw field `thArrive` when > 0.
  4. spawnRaidComposition: with raw field `thStagger` (seconds) on the RAID row, ship n of the raid starts its descent
     n * thStagger later (its stateTime is moved forward; until then it waits at the top of the descent).
1 and 2 also fix the game's own Renegade drops. 3 and 4 do nothing unless the fields are set.
"""
from tools.project import gv, guard
from tools.hlcode import (argument_kinds, assemble, function_named, kind_named, new_function, replace_body,
                          returns_type, field_by_name, name_of_kind, class_global)
from tools.splice import insert

from thsw_util import new_reg, op, int_op, call, float_op

GOTO, HAS_ARMY = "logic.state.Raid.goToTarget", "logic.state.Raid.hasArmy"
REACHED, DROPPING = "ent.ShuttleSpawn.onReachedTarget", "ent.Carrier.onDroppingTarget"
DUR = "ent.ShuttleSpawn.getStateDuration"
COMP, SPAWN_SHIP, PUSH = "$HUnit.spawnRaidComposition", "ent.$ShuttleSpawn.create", "hl.types.ArrayObj.push"
IN_TRANSIT, SET_TIME, CHECK = "ent.Entity.inTransit", "ent.Carrier.set_stateTime", "hl.BaseType.check"
ARMY_LOOP = "logic.state.Raid.spawn"
VOID_LIKE = "ui.GameUI.displayWindow"


def _dyn_kind(bc):
    gets = [o for o in function_named(bc, ARMY_LOOP).ops if o.op == "GetArray"]
    guard(gets, "%s has no GetArray to copy the element kind from" % ARMY_LOOP)
    return gv(function_named(bc, ARMY_LOOP).regs[gv(gets[0].df["dst"])])


def _array(bc, R, obj, obj_kind, name, bail):
    """Instructions that load obj.<name> as an hl.types.ArrayObj (through an hxbit proxy's `array` if need be)."""
    arr_kind = kind_named(bc, "hl.types.ArrayObj")
    at, k = field_by_name(bc, obj_kind, name, name_of_kind(bc, obj_kind))
    p = R(k)
    out = [op(bc, "Field", dst=p, obj=obj, field=at), (op(bc, "JNull", reg=p), bail)]
    if name_of_kind(bc, k) != "hl.types.ArrayObj":
        at2, k2 = field_by_name(bc, k, "array", name_of_kind(bc, k))
        a = R(k2)
        out += [op(bc, "Field", dst=a, obj=p, field=at2), (op(bc, "JNull", reg=a), bail)]
        p = a
        if name_of_kind(bc, k2) != "hl.types.ArrayObj":
            c = R(arr_kind)
            out.append(op(bc, "UnsafeCast", dst=c, src=p))
            p = c
    return out, p


def _landed(bc):
    """fn(raid) -> bool: hasArmy(raid) and no army of the raid is in transit."""
    F = lambda n: function_named(bc, n)
    raid_kind = gv(F(GOTO).regs[0])
    boolk = returns_type(F(HAS_ARMY), HAS_ARMY)
    fn = new_function(bc, [raid_kind], boolk, F(GOTO))
    R = lambda k: new_reg(bc, fn, k)
    arr_kind = kind_named(bc, "hl.types.ArrayObj")
    len_at, len_kind = field_by_name(bc, arr_kind, "length", "ArrayObj")
    nat_at, nat_kind = field_by_name(bc, arr_kind, "array", "ArrayObj")
    has, res, t = R(boolk), R(boolk), R(returns_type(F(IN_TRANSIT), IN_TRANSIT))
    i, n, nat, el, army = R(len_kind), R(len_kind), R(nat_kind), R(_dyn_kind(bc)), R(kind_named(bc, "ent.Army"))
    walk, arr = _array(bc, R, 0, raid_kind, "armies", "yes")
    items = [call(bc, has, gv(F(HAS_ARMY).findex), 0), (op(bc, "JFalse", cond=has), "no"),
             *walk, int_op(bc, i, 0),
             "loop:", op(bc, "Field", dst=n, obj=arr, field=len_at), (op(bc, "JSGte", a=i, b=n), "yes"),
             op(bc, "Field", dst=nat, obj=arr, field=nat_at), op(bc, "GetArray", dst=el, array=nat, index=i),
             op(bc, "Incr", dst=i), op(bc, "UnsafeCast", dst=army, src=el), (op(bc, "JNull", reg=army), "loop"),
             call(bc, t, gv(F(IN_TRANSIT).findex), army), (op(bc, "JTrue", cond=t), "no"), (op(bc, "JAlways"), "loop"),
             "yes:", op(bc, "Bool", dst=res, value=1), op(bc, "Ret", ret=res),
             "no:", op(bc, "Bool", dst=res, value=0), op(bc, "Ret", ret=res)]
    replace_body(fn, assemble(items))
    return fn


def _gate_goto(bc, landed):
    g = function_named(bc, GOTO)
    sites = [k for k, o in enumerate(g.ops[:6]) if o.op == "Call1" and gv(o.df["fun"]) == gv(function_named(bc, HAS_ARMY).findex)]
    guard(len(sites) == 1, "Raid.goToTarget no longer starts with one hasArmy call")
    o = g.ops[sites[0]]
    g.ops[sites[0]] = call(bc, gv(o.df["dst"]), gv(landed.findex), gv(o.df["arg0"]))


def _first_target(bc, ship_kind):
    """fn(ship) -> Entity: the first thing it carries, or null."""
    F = lambda n: function_named(bc, n)
    ent_kind = kind_named(bc, "ent.Entity")
    fn = new_function(bc, [ship_kind], ent_kind, F(REACHED))
    R = lambda k: new_reg(bc, fn, k)
    arr_kind = kind_named(bc, "hl.types.ArrayObj")
    len_at, len_kind = field_by_name(bc, arr_kind, "length", "ArrayObj")
    nat_at, nat_kind = field_by_name(bc, arr_kind, "array", "ArrayObj")
    walk, arr = _array(bc, R, 0, ship_kind, "carryTargets", "none")
    n, zero, nat, el, out = R(len_kind), R(len_kind), R(nat_kind), R(_dyn_kind(bc)), R(ent_kind)
    items = [op(bc, "Null", dst=out), *walk, op(bc, "Field", dst=n, obj=arr, field=len_at), int_op(bc, zero, 0),
             (op(bc, "JSGte", a=zero, b=n), "none"),
             op(bc, "Field", dst=nat, obj=arr, field=nat_at), op(bc, "GetArray", dst=el, array=nat, index=zero),
             op(bc, "UnsafeCast", dst=out, src=el),
             "none:", op(bc, "Ret", ret=out)]
    replace_body(fn, assemble(items))
    return fn


def _march_when_down(bc, landed):
    """fn(Entity) -> void: if it is an Army of a raid whose armies are all down, Raid.goToTarget(raid)."""
    F = lambda n: function_named(bc, n)
    ent_kind, army_kind = kind_named(bc, "ent.Entity"), kind_named(bc, "ent.Army")
    void = returns_type(F(VOID_LIKE), VOID_LIKE)
    fn = new_function(bc, [ent_kind], void, F(REACHED))
    R = lambda k: new_reg(bc, fn, k)
    g_army = class_global(bc, army_kind)
    cls = R(gv(bc.global_types[g_army]))
    is_army, army = R(returns_type(F(CHECK), CHECK)), R(army_kind)
    raid_at, raid_kind = field_by_name(bc, army_kind, "raid", "ent.Army")
    raid, ok, v = R(raid_kind), R(returns_type(landed, "landed")), R(void)
    items = [(op(bc, "JNull", reg=0), "end"),
             op(bc, "GetGlobal", **{"dst": cls, "global": g_army}),
             call(bc, is_army, gv(F(CHECK).findex), cls, 0), (op(bc, "JFalse", cond=is_army), "end"),
             op(bc, "UnsafeCast", dst=army, src=0),
             op(bc, "Field", dst=raid, obj=army, field=raid_at), (op(bc, "JNull", reg=raid), "end"),
             call(bc, ok, gv(landed.findex), raid), (op(bc, "JFalse", cond=ok), "end"),
             call(bc, R(returns_type(F(GOTO), GOTO)), gv(F(GOTO).findex), raid),
             "end:", op(bc, "Ret", ret=v)]
    replace_body(fn, assemble(items))
    return fn


def _hook_drop(bc, landed):
    r = function_named(bc, REACHED)
    guard(r.ops[0].op.startswith("Call") and gv(r.ops[0].df["fun"]) == gv(function_named(bc, DROPPING).findex),
          "ShuttleSpawn.onReachedTarget no longer starts with onDroppingTarget")
    ship_kind = gv(r.regs[0])
    first, march = _first_target(bc, ship_kind), _march_when_down(bc, landed)
    held = new_reg(bc, r, kind_named(bc, "ent.Entity"))
    v = new_reg(bc, r, returns_type(march, "march"))
    a = insert(bc, r, 0, [call(bc, held, gv(first.findex), 0)], "thorvald drop: who is aboard",
               "a splice at something the game does in play")
    b = insert(bc, r, 2, [call(bc, v, gv(march.findex), held)], "thorvald drop: march when down",
               "a splice at something the game does in play")
    return a + b


def _arrive_time(bc):
    d = function_named(bc, DUR)
    ship_kind = gv(d.regs[0])
    sw = [k for k, o in enumerate(d.ops) if o.op == "Switch"]
    guard(len(sw) == 1, "ShuttleSpawn.getStateDuration has %d switches" % len(sw))
    floats = [k for k, o in enumerate(d.ops) if o.op == "Float"]
    # case 0 (arriving) is the first case; its target is the first Float after the switch that loads 3.0
    first = [k for k in floats if k > sw[0] and gv(bc.floats[gv(d.ops[k].df["ptr"])]) == 3.0]
    guard(first, "no 3.0 descent time in ShuttleSpawn.getStateDuration")
    at = first[0]
    fk = gv(d.regs[gv(d.ops[at].df["dst"])])
    fn = new_function(bc, [ship_kind], fk, d)
    R = lambda k: new_reg(bc, fn, k)
    from armoury_lib import str_ref
    inf_at, inf_kind = field_by_name(bc, ship_kind, "inf", "ent.ShuttleSpawn")
    inf, t, zero, dflt = R(inf_kind), R(fk), R(fk), R(fk)
    items = [float_op(bc, dflt, 3.0), op(bc, "Field", dst=inf, obj=0, field=inf_at), (op(bc, "JNull", reg=inf), "plain"),
             op(bc, "DynGet", dst=t, obj=inf, field=str_ref(bc, "thArrive")), float_op(bc, zero, 0.0),
             (op(bc, "JSLte", a=t, b=zero), "plain"), op(bc, "Ret", ret=t),
             "plain:", op(bc, "Ret", ret=dflt)]
    replace_body(fn, assemble(items))
    d.ops[at] = call(bc, gv(d.ops[at].df["dst"]), gv(fn.findex), 0)


def _stagger(bc):
    comp = function_named(bc, COMP)
    spawn = gv(function_named(bc, SPAWN_SHIP).findex)
    sites = [k for k, o in enumerate(comp.ops) if o.op.startswith("Call") and gv(o.df["fun"]) == spawn]
    guard(len(sites) == 1, "spawnRaidComposition calls ShuttleSpawn.create %d time(s)" % len(sites))
    at = sites[0]
    ship = gv(comp.ops[at].df["dst"])
    push = gv(function_named(bc, PUSH).findex)
    pushes = [k for k, o in enumerate(comp.ops[:at]) if o.op.startswith("Call") and gv(o.df["fun"]) == push]
    guard(pushes, "spawnRaidComposition no longer pushes its armies into a list")
    arr = gv(comp.ops[pushes[-1]].df["arg0"])
    virt = [o for o in comp.ops[:12] if o.op == "ToVirtual"]
    guard(len(virt) == 1, "spawnRaidComposition no longer starts with one raid-row ToVirtual")
    raid = gv(virt[0].df["dst"])
    ship_kind, raid_kind, arr_kind = gv(comp.regs[ship]), gv(comp.regs[raid]), gv(comp.regs[arr])
    guard(name_of_kind(bc, arr_kind) == "hl.types.ArrayObj", "the army list is a %s" % name_of_kind(bc, arr_kind))
    F = lambda n: function_named(bc, n)
    void = returns_type(F(VOID_LIKE), VOID_LIKE)
    fn = new_function(bc, [ship_kind, raid_kind, arr_kind], void, comp)
    R = lambda k: new_reg(bc, fn, k)
    from armoury_lib import str_ref
    st_at, fk = field_by_name(bc, ship_kind, "stateTime", "ent.ShuttleSpawn")
    len_at, len_kind = field_by_name(bc, arr_kind, "length", "ArrayObj")
    s, zero, t, d, nf = R(fk), R(fk), R(fk), R(fk), R(fk)
    n, one = R(len_kind), R(len_kind)
    v = R(void)
    items = [op(bc, "DynGet", dst=s, obj=1, field=str_ref(bc, "thStagger")), float_op(bc, zero, 0.0),
             (op(bc, "JSLte", a=s, b=zero), "end"),
             op(bc, "Field", dst=n, obj=2, field=len_at), int_op(bc, one, 1), op(bc, "Sub", dst=n, a=n, b=one),
             op(bc, "ToSFloat", dst=nf, src=n), op(bc, "Mul", dst=d, a=nf, b=s),
             op(bc, "Field", dst=t, obj=0, field=st_at), op(bc, "Add", dst=t, a=t, b=d),
             call(bc, R(returns_type(F(SET_TIME), SET_TIME)), gv(F(SET_TIME).findex), 0, t),
             "end:", op(bc, "Ret", ret=v)]
    replace_body(fn, assemble(items))
    vv = new_reg(bc, comp, void)
    return insert(bc, comp, at + 1, [call(bc, vv, gv(fn.findex), ship, raid, arr)], "thorvald drop: stagger",
                  "a splice at something the game does in play")


def install(bc):
    landed = _landed(bc)
    _gate_goto(bc, landed)
    n = _hook_drop(bc, landed)
    _arrive_time(bc)
    m = _stagger(bc)
    return ("thorvald timed drops: goToTarget waits for every drop ship; march after the last touchdown (%d op(s)); "
            "unit field thArrive = descent seconds; raid field thStagger = seconds between ships (%d op(s))" % (n, m))
