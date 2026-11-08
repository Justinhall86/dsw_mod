#!/usr/bin/env python3
"""What a placed action's looks last played, so a card drawn again carries them on."""
from copy import deepcopy

import park
import tiers
from trades import PUSH, W, kinds

# each placed action, the look or effect entry, and its last play, three to a turn
PLAYED = "permanent: effects played"


def make_seen(bc):
    """p_seen(act, key): where the placed action's `key` keeps its last play, or -1."""
    if "_played_seen" in bc.__dict__:
        return bc.__dict__["_played_seen"]
    k = kinds(bc)
    w = W(bc, (("act", k.dyn), ("key", k.dyn)), k.int)
    r = {n: w.reg(n, kind) for n, kind in (
        ("lst", k.list), ("many", k.int), ("back", k.back), ("i", k.int), ("d", k.dyn),
        ("one", k.int), ("three", k.int), ("none", k.int))}
    w.int(r["none"], 0)
    w.add(w.op("Decr", dst=r["none"]))
    tiers.load(w, r["lst"], PLAYED, k.list)
    w.add((w.op("JNull", reg=r["lst"]), "none"))
    w.int(r["i"], 0)
    w.int(r["one"], 1)
    w.int(r["three"], 3)
    step = w.op("Add", dst=r["i"], a=r["i"], b=r["one"])
    w.add("loop:", w.op("Label"))
    w.field(r["many"], r["lst"], k.list, "length")
    w.add((w.op("JSGte", a=r["i"], b=r["many"]), "none"))
    w.field(r["back"], r["lst"], k.list, "array")
    w.add(w.op("GetArray", dst=r["d"], array=r["back"], index=r["i"]),
          (w.op("JNotEq", a=r["d"], b=w.r["act"]), "skip"), step,
          w.op("GetArray", dst=r["d"], array=r["back"], index=r["i"]), deepcopy(step),
          (w.op("JNotEq", a=r["d"], b=w.r["key"]), "next"), w.op("Ret", ret=r["i"]),
          "skip:", w.op("Label"), w.op("Add", dst=r["i"], a=r["i"], b=r["three"]),
          (w.op("JAlways"), "loop"), "next:", w.op("Label"), deepcopy(step),
          (w.op("JAlways"), "loop"), "none:", w.op("Label"), w.op("Ret", ret=r["none"]))
    bc.__dict__["_played_seen"] = w.finish()
    return bc.__dict__["_played_seen"]


def kept(w, r, act, key, held):
    """`d` is what `key` held at `slot` before, or null; `held` is kept there from now."""
    k = w.k
    w.add(w.op("Null", dst=r["d"]), (w.op("JSGte", a=r["slot"], b=r["zero"]), "swap"))
    park.fresh(w, r["lst"], PLAYED)
    for one in (act, key, held):
        w.call(r["n"], PUSH, r["lst"], one)
    w.add((w.op("JAlways"), "stored"), "swap:", w.op("Label"))
    tiers.load(w, r["lst"], PLAYED, k.list)
    w.field(r["back"], r["lst"], k.list, "array")
    w.add(w.op("GetArray", dst=r["d"], array=r["back"], index=r["slot"]),
          w.op("SetArray", array=r["back"], index=r["slot"], src=held),
          "stored:", w.op("Label"))


def regs(w):
    """The places `kept` writes through."""
    k = w.k
    return {n: w.reg(n, kind) for n, kind in (
        ("slot", k.int), ("d", k.dyn), ("held", k.dyn), ("lst", k.list), ("back", k.back),
        ("n", k.int), ("zero", k.int))}
