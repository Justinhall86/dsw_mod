#!/usr/bin/env python3
"""Placed actions waiting on their confirm, and a revoked charter's taint parked for its return."""
from tools.hlcode import fields_of, kind_named
from tools.project import guard

import perm
import tiers
from trades import PUSH, W, each, kinds

# the actions placed for real and not yet confirmed, one per placer; the revoked charters
PENDING, PARKED = "permanent: placed, not confirmed", perm.PARKED


def fresh(w, into, name):
    """`into` is that list of ours, made the first time it is asked for."""
    k = w.k
    tiers.load(w, into, name, k.list)
    w.add((w.op("JNotNull", reg=into), name + " made"))
    zero, tt, arr = w.reg("zero", k.int), w.reg("tt", k.typetype), w.reg("arr", k.array)
    ty, alloc, wrap = k.made_by
    w.int(zero, 0)
    w.add(w.op("Type", dst=tt, ty=ty))
    w.call(arr, alloc, tt, zero)
    w.add(w.op("UnsafeCast", dst=arr, src=arr))
    w.call(into, wrap, arr)
    tiers.keep(w, name, k.list, into)
    w.add(name + " made:", w.op("Label"))


def make_pend(bc, act):
    """p_pend(action): an action placed for real waits for its placer's confirm, the last only."""
    k, t = kinds(bc), tiers.tkinds(bc)
    w = W(bc, (("a", act),), k.void)
    r = {n: w.reg(n, kind) for n, kind in (("lst", k.list), ("e", k.dyn), ("who", t.faction),
                                           ("was", t.faction), ("n", k.int), ("gone", k.bool),
                                           ("void", k.void))}
    fresh(w, r["lst"], PENDING)
    w.get(r["who"], w.r["a"], "issuer")
    each(w, r["lst"], "i", ("next", "done"), r["e"])
    w.get(r["was"], r["e"], "issuer")
    w.add((w.op("JNotEq", a=r["was"], b=r["who"]), "next"))
    w.call(r["gone"], perm.REMOVE, r["lst"], r["e"])
    w.add(w.op("Decr", dst=w.r["i"]), (w.op("JAlways"), "next"), "done:", w.op("Label"))
    w.call(r["n"], PUSH, r["lst"], w.r["a"])
    w.add(w.op("Ret", ret=r["void"]))
    return w.finish()


def make_commit(bc, alert):
    """p_commit(faction): a confirm raises the alert of what that faction placed, once."""
    k, t = kinds(bc), tiers.tkinds(bc)
    w = W(bc, (("f", t.faction),), k.void)
    r = {n: w.reg(n, kind) for n, kind in (("lst", k.list), ("e", k.dyn), ("was", t.faction),
                                           ("kind", k.text), ("gone", k.bool), ("void", k.void))}
    tiers.load(w, r["lst"], PENDING, k.list)
    w.add((w.op("JNull", reg=r["lst"]), "done"))
    each(w, r["lst"], "i", ("next", "done"), r["e"])
    w.get(r["was"], r["e"], "issuer")
    w.add((w.op("JNotEq", a=r["was"], b=w.r["f"]), "next"))
    w.call(r["gone"], perm.REMOVE, r["lst"], r["e"])
    w.add(w.op("Decr", dst=w.r["i"]))
    w.get(r["kind"], r["e"], "kind")
    w.call(r["void"], alert, r["kind"])
    w.add((w.op("JAlways"), "next"), "done:", w.op("Label"), w.op("Ret", ret=r["void"]))
    return w.finish()


def make_park(bc):
    """p_park(res): a resolution the game drops with its revoked charter is kept by us."""
    k, rk = kinds(bc), kind_named(bc, perm.RES)
    w = W(bc, (("res", rk),), k.void)
    r = {n: w.reg(n, kind) for n, kind in (("lst", k.list), ("n", k.int), ("void", k.void))}
    w.add((w.op("JNull", reg=w.r["res"]), "done"))
    fresh(w, r["lst"], PARKED)
    w.call(r["n"], PUSH, r["lst"], w.r["res"])
    w.add("done:", w.op("Label"), w.op("Ret", ret=r["void"]))
    return w.finish()


def the_resolution_of(bc, act):
    """The placed action's own field naming the resolution it sits on."""
    names, fields = fields_of(bc, act, "a placed res action")
    rk = kind_named(bc, perm.RES)
    held = [n for n, f in zip(names, fields) if getattr(f.type, "value", f.type) == rk]
    guard(len(held) == 1, "a placed res action names its resolution %d times" % len(held))
    return held[0]


def make_unpark(bc, act):
    """p_unpark(res): a resolution proposed again takes back its parked permanent actions."""
    from armoury_lib import str_ref
    k, rk, pk = kinds(bc), kind_named(bc, perm.RES), kind_named(bc, perm.PROXY)
    w = W(bc, (("res", rk),), k.void)
    r = {n: w.reg(n, kind) for n, kind in (
        ("lst", k.list), ("d", k.dyn), ("p", rk), ("kind", k.text), ("pk", k.text),
        ("proxy", pk), ("acts", k.list), ("into", pk), ("dest", k.list), ("e", k.dyn),
        ("id", k.text), ("row", k.dyn), ("props", k.dyn), ("perm", k.dyn), ("n", k.int),
        ("gone", k.bool), ("void", k.void))}
    tiers.load(w, r["lst"], PARKED, k.list)
    w.add((w.op("JNull", reg=r["lst"]), "done"))
    w.field(r["kind"], w.r["res"], rk, "kind")
    w.field(r["into"], w.r["res"], rk, "actions")
    perm.unwrapped(w, r["dest"], r["into"], "done")
    each(w, r["lst"], "i", ("next", "done"), r["d"])
    w.add(w.op("UnsafeCast", dst=r["p"], src=r["d"]),
          (w.op("JEq", a=r["p"], b=w.r["res"]), "next"))
    w.field(r["pk"], r["p"], rk, "kind")
    w.add((w.op("JNotEq", a=r["pk"], b=r["kind"]), "next"))
    w.call(r["gone"], perm.REMOVE, r["lst"], r["d"])
    w.add(w.op("Decr", dst=w.r["i"]))
    w.field(r["proxy"], r["p"], rk, "actions")
    perm.unwrapped(w, r["acts"], r["proxy"], "next")
    each(w, r["acts"], "j", ("act", "moved"), r["e"])
    w.get(r["id"], r["e"], "kind")
    w.add((w.op("JNull", reg=r["id"]), "act"))
    perm.permanent_of(w, r, r["id"], "act")
    w.add(w.op("DynSet", obj=r["e"], field=str_ref(bc, the_resolution_of(bc, act)),
               src=w.r["res"]))
    w.call(r["n"], PUSH, r["dest"], r["e"])
    w.add((w.op("JAlways"), "act"), "moved:", w.op("Label"))
    w.call(r["void"], perm.MARK, r["into"])
    w.add((w.op("JAlways"), "next"), "done:", w.op("Label"), w.op("Ret", ret=r["void"]))
    return w.finish()


def install(bc, act, alert):
    """Our four, by the name the splices ask for."""
    return {"pend": make_pend(bc, act), "commit": make_commit(bc, alert), "park": make_park(bc),
            "unpark": make_unpark(bc, act)}
