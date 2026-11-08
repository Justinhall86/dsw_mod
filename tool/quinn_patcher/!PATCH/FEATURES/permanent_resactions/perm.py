#!/usr/bin/env python3
"""Permanent res actions: kept past their council, offered where `placeOn` says, alerted, ended."""
from tools.project import gv
from tools.hlcode import argument_kind, argument_kinds, field_by_name, kind_named
from framework.foreignwalk import (emit_the_faction_at, emit_the_length, emit_the_list,
                                   the_global_of, the_list_kind)

import tiers
from trades import W, each, kinds, row_of

RES, PROXY, DYNARR = "logic.state.CouncilResolution", "hxbit.ArrayProxyData", "hl.types.ArrayDyn"
MARK, REMOVE = "hxbit._ArrayProxy.$ArrayProxy_Impl_.mark", "hl.types.ArrayObj.remove"
LOSE = "logic.state.State.losePlayer__impl"
SET, TRAITS_OF = "logic.TraitsManager.setTraitStacks", "ent.Object.get_traits"
# every list of council resolutions the Landsraad keeps: past, proposed, last voted; then ours
HELD = ("councilResolutionsHistory", "resolutionProposals", "lastCouncilResolutions")
PARKED = "permanent: revoked resolutions"
# from the game's class to the Landsraad's own data, a field at a time
TO_DATA = (("$Game", "inst"), ("Game", "state"), ("logic.state.State", "landsraad"),
           ("logic.state.LandsraadManager", "data"))


def nulls(w, name, skip):
    """Empty places for every argument of `name` past the first `skip`."""
    out = [w.reg("%s null%d" % (name, i), kind)
           for i, kind in enumerate(argument_kinds(w.bc, name)[skip:])]
    for n in out:
        w.add(w.op("Null", dst=n))
    return out


def unwrapped(w, into, proxy, absent):
    """`into` is the plain list inside one of the game's synced lists."""
    arr = w.reg("synced %d" % into, kind_named(w.bc, DYNARR))
    w.add((w.op("JNull", reg=proxy), absent))
    w.field(arr, proxy, kind_named(w.bc, PROXY), "array")
    w.add((w.op("JNull", reg=arr), absent), w.op("SafeCast", dst=into, src=arr))


def permanent_of(w, r, id_reg, absent):
    """`perm` is the res action row's `permanent` group; `absent` when it has none."""
    row_of(w, r["row"], "resAction", id_reg, absent)
    w.get(r["props"], r["row"], "props")
    w.add((w.op("JNull", reg=r["props"]), absent))
    w.get(r["perm"], r["props"], "permanent")
    w.add((w.op("JNull", reg=r["perm"]), absent))


def each_faction(w, f, tag, done):
    """The head of a walk over every faction of the game, `f` the next; `done` after the last."""
    bc, fn = w.bc, w.fn
    holds, n, i = (w.reg("factions " + tag, the_list_kind(bc)), w.reg("factions n " + tag, w.k.int),
                   w.reg("factions i " + tag, w.k.int))
    w.add(*emit_the_list(bc, fn, holds, done))
    w.add(*emit_the_length(bc, fn, holds, n, done))
    w.int(i, 0)
    w.add(tag + ":", w.op("Label"), (w.op("JSGte", a=i, b=n), done))
    w.add(*emit_the_faction_at(bc, fn, holds, i, f, done))
    w.add(w.op("Incr", dst=i), (w.op("JNull", reg=f), tag))


def make_keep(bc):
    """p_keep(actions, n): a council's end empties its placed actions but the permanent ones."""
    k = kinds(bc)
    w = W(bc, (("list", k.list), ("n", k.int)), k.void)
    r = {n: w.reg(n, kind) for n, kind in (("e", k.dyn), ("id", k.text), ("row", k.dyn),
                                           ("props", k.dyn), ("perm", k.dyn), ("gone", k.bool),
                                           ("void", k.void))}
    each(w, w.r["list"], "i", ("next", "done"), r["e"])
    w.get(r["id"], r["e"], "kind")
    w.add((w.op("JNull", reg=r["id"]), "drop"))
    permanent_of(w, r, r["id"], "drop")
    w.add((w.op("JAlways"), "next"), "drop:", w.op("Label"))
    w.call(r["gone"], REMOVE, w.r["list"], r["e"])
    w.add(w.op("Decr", dst=w.r["i"]), (w.op("JAlways"), "next"),
          "done:", w.op("Label"), w.op("Ret", ret=r["void"]))
    return w.finish()


def make_allowed(bc, act):
    """p_allowed(res, act, f): false when `placeOn` leaves this resolution out, or it holds it."""
    k, rk, fk = kinds(bc), kind_named(bc, RES), tiers.tkinds(bc).faction
    w = W(bc, (("res", rk), ("act", act), ("f", fk)), k.bool)
    r = {n: w.reg(n, kind) for n, kind in (
        ("yes", k.bool), ("no", k.bool), ("kind", k.text), ("id", k.text), ("row", k.dyn),
        ("props", k.dyn), ("on", k.dyn), ("lst", k.list), ("e", k.dyn), ("name", k.text),
        ("n", k.int), ("zero", k.int), ("perm", k.dyn), ("proxy", kind_named(bc, PROXY)),
        ("acts", k.list), ("who", fk))}
    w.add(w.op("Bool", dst=r["yes"], value=True), w.op("Bool", dst=r["no"], value=False))
    w.field(r["kind"], w.r["res"], rk, "kind")
    w.add((w.op("JNull", reg=r["kind"]), "yes"))
    w.field(r["id"], w.r["act"], act, "id")
    w.add((w.op("JNull", reg=r["id"]), "yes"))
    row_of(w, r["row"], "resAction", r["id"], "yes")
    w.get(r["props"], r["row"], "props")
    w.add((w.op("JNull", reg=r["props"]), "yes"))
    _held(w, r, rk)
    w.get(r["on"], r["props"], "placeOn")
    w.add((w.op("JNull", reg=r["on"]), "yes"))
    w.get(r["lst"], r["on"], "notResolutions")
    w.add((w.op("JNull", reg=r["lst"]), "only"))
    each(w, r["lst"], "i", ("not", "only"), r["e"])
    w.get(r["name"], r["e"], "resolution")
    w.add((w.op("JNull", reg=r["name"]), "not"), (w.op("JNotEq", a=r["name"], b=r["kind"]), "not"),
          (w.op("JAlways"), "no"), "only:", w.op("Label"))
    w.get(r["lst"], r["on"], "resolutions")
    w.add((w.op("JNull", reg=r["lst"]), "yes"))
    w.field(r["n"], r["lst"], k.list, "length")
    w.int(r["zero"], 0)
    w.add((w.op("JSLte", a=r["n"], b=r["zero"]), "yes"))
    each(w, r["lst"], "j", ("listed", "no"), r["e"])
    w.get(r["name"], r["e"], "resolution")
    w.add((w.op("JNull", reg=r["name"]), "listed"),
          (w.op("JNotEq", a=r["name"], b=r["kind"]), "listed"),
          "yes:", w.op("Label"), w.op("Ret", ret=r["yes"]),
          "no:", w.op("Label"), w.op("Ret", ret=r["no"]))
    return w.finish()


def _held(w, r, rk):
    """A permanent one is refused where it sits already, or another faction asked for it."""
    w.get(r["perm"], r["props"], "permanent")
    w.add((w.op("JNull", reg=r["perm"]), "places"))
    w.field(r["proxy"], w.r["res"], rk, "actions")
    unwrapped(w, r["acts"], r["proxy"], "asked")
    each(w, r["acts"], "h", ("held", "asked"), r["e"])
    w.get(r["name"], r["e"], "kind")
    w.add((w.op("JNull", reg=r["name"]), "held"),
          (w.op("JNotEq", a=r["name"], b=r["id"]), "held"),
          (w.op("JAlways"), "no"), "asked:", w.op("Label"))
    w.field(r["proxy"], w.r["res"], rk, "requestedActions")
    unwrapped(w, r["acts"], r["proxy"], "places")
    each(w, r["acts"], "g", ("request", "places"), r["e"])
    w.get(r["who"], r["e"], "issuer")
    w.get(r["name"], r["e"], "kind")
    w.add((w.op("JEq", a=r["who"], b=w.r["f"]), "request"),
          (w.op("JNull", reg=r["name"]), "request"),
          (w.op("JNotEq", a=r["name"], b=r["id"]), "request"),
          (w.op("JAlways"), "no"), "places:", w.op("Label"))


def make_alert(bc):
    """p_alert(kind): a res action with `placeAlert` raises that alert for every faction."""
    k, t = kinds(bc), tiers.tkinds(bc)
    w = W(bc, (("kind", k.text),), k.void)
    r = {n: w.reg(n, kind) for n, kind in (
        ("row", k.dyn), ("props", k.dyn), ("alert", k.text), ("f", t.faction), ("am", t.alerts),
        ("made", t.alert), ("void", k.void))}
    rest = nulls(w, tiers.ALERT, 1)
    w.add((w.op("JNull", reg=w.r["kind"]), "done"))
    row_of(w, r["row"], "resAction", w.r["kind"], "done")
    w.get(r["props"], r["row"], "props")
    w.add((w.op("JNull", reg=r["props"]), "done"))
    w.get(r["alert"], r["props"], "placeAlert")
    w.add((w.op("JNull", reg=r["alert"]), "done"))
    each_faction(w, r["f"], "faction", "done")
    w.call(r["am"], tiers.ALERTS, r["f"])
    w.add((w.op("JNull", reg=r["am"]), "faction"))
    w.call(r["made"], tiers.ALERT, r["am"], r["alert"], *rest)
    w.add((w.op("JAlways"), "faction"), "done:", w.op("Label"), w.op("Ret", ret=r["void"]))
    return w.finish()


def _to_data(w, into, absent, steps=TO_DATA):
    """`into` is the Landsraad's data, read down from the game's class; `absent` before a game."""
    bc = w.bc
    cur = w.reg("to data $Game", kind_named(bc, "$Game"))
    w.add(w.op("GetGlobal", **{"dst": cur, "global": the_global_of(bc, "$Game")}))
    for kind_name, field in steps:
        kind = kind_named(bc, kind_name)
        got = into if field == steps[-1][1] else w.reg(
            "to data " + field, gv(field_by_name(bc, kind, field, kind_name)[1]))
        w.field(got, cur, kind, field)
        w.add((w.op("JNull", reg=got), absent))
        cur = got


def make_end(bc):
    """p_end(player): a lost faction's taints with `removeOnDeath` end, their traits off all."""
    k, t = kinds(bc), tiers.tkinds(bc)
    pk, rk = argument_kind(bc, LOSE, 0), kind_named(bc, RES)
    w = W(bc, (("p", pk),), k.void)
    data_kind = kind_named(bc, "logic.state.LandsraadData")
    r = {n: w.reg(n, kind) for n, kind in (
        ("f", t.faction), ("data", data_kind), ("proxy", kind_named(bc, PROXY)), ("lst", k.list),
        ("d", k.dyn), ("res", rk), ("aproxy", kind_named(bc, PROXY)), ("acts", k.list),
        ("e", k.dyn), ("issuer", t.faction), ("id", k.text), ("row", k.dyn), ("props", k.dyn),
        ("perm", k.dyn), ("rod", k.dyn), ("on", k.bool), ("gone", k.bool), ("effs", k.list),
        ("ef", k.dyn), ("tg", k.dyn), ("tid", k.text), ("g", t.faction), ("mgr", k.traits),
        ("zero", k.int), ("ref", k.ref), ("void", k.void))}
    rest = nulls(w, SET, 2)
    w.add(w.op("UnsafeCast", dst=r["f"], src=w.r["p"]), (w.op("JNull", reg=r["f"]), "done"))
    _to_data(w, r["data"], "done")
    for n, held in enumerate(HELD + (None,)):
        after = "held %d" % (n + 1) if n < len(HELD) else "done"
        w.add("held %d:" % n, w.op("Label"))
        if held is None:
            tiers.load(w, r["lst"], PARKED, k.list)
            w.add((w.op("JNull", reg=r["lst"]), after))
        else:
            w.field(r["proxy"], r["data"], data_kind, held)
            unwrapped(w, r["lst"], r["proxy"], after)
        each(w, r["lst"], "i%d" % n, ("res %d" % n, after), r["d"])
        w.add(w.op("UnsafeCast", dst=r["res"], src=r["d"]))
        w.field(r["aproxy"], r["res"], rk, "actions")
        unwrapped(w, r["acts"], r["aproxy"], "res %d" % n)
        each(w, r["acts"], "j%d" % n, ("act %d" % n, "res %d" % n), r["e"])
        _ended(w, r, n, rest)
    w.add("done:", w.op("Label"), w.op("Ret", ret=r["void"]))
    return w.finish()


def _ended(w, r, n, rest):
    """One placed action: off its resolution when its placer fell and it ends then, traits too."""
    act, eff = "act %d" % n, "eff %d" % n
    w.get(r["issuer"], r["e"], "issuer")
    w.add((w.op("JNotEq", a=r["issuer"], b=r["f"]), act))
    w.get(r["id"], r["e"], "kind")
    w.add((w.op("JNull", reg=r["id"]), act))
    permanent_of(w, r, r["id"], act)
    w.get(r["rod"], r["perm"], "removeOnDeath")
    w.add((w.op("JNull", reg=r["rod"]), act))
    w.get(r["on"], r["perm"], "removeOnDeath")
    w.add((w.op("JFalse", cond=r["on"]), act))
    w.call(r["gone"], REMOVE, r["acts"], r["e"])
    w.add(w.op("Decr", dst=w.r["j%d" % n]))
    w.call(r["void"], MARK, r["aproxy"])
    w.get(r["effs"], r["row"], "effects")
    w.add((w.op("JNull", reg=r["effs"]), act))
    each(w, r["effs"], "q%d" % n, (eff, act), r["ef"])
    w.get(r["tg"], r["ef"], "target")
    w.add((w.op("JNull", reg=r["tg"]), eff))
    w.get(r["tid"], r["tg"], "trait")
    w.add((w.op("JNull", reg=r["tid"]), eff))
    each_faction(w, r["g"], "lose %d" % n, eff)
    w.call(r["mgr"], TRAITS_OF, r["g"])
    w.add((w.op("JNull", reg=r["mgr"]), "lose %d" % n))
    w.int(r["zero"], 0)
    w.add(w.op("Ref", dst=r["ref"], src=r["zero"]))
    w.call(r["void"], SET, r["mgr"], r["tid"], r["ref"], *rest)
    w.add((w.op("JAlways"), "lose %d" % n))


def install(bc, act):
    """Every function of ours, written once, by the name the splices ask for."""
    return {"keep": make_keep(bc), "allowed": make_allowed(bc, act), "alert": make_alert(bc),
            "end": make_end(bc)}
