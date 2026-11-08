#!/usr/bin/env python3
"""Tiered resources: each tier's traits, its alert on entering, and the ladder's own answers."""
from tools.hlcode import (argument_kind, argument_kinds, field_by_name, function_named,
                          kind_named, returns_type, slot_global, text_object)
from framework.foreignwalk import the_global_of

from trades import W, each, kinds, row_of

UPDATE = "ent.Faction.updateResource"
INFO, TIER_OF = "$DataCache.getStandingInfo", "$DataCache.getStandingTierIndex"
ACTIVE_INFO = "ent.Faction.getActiveStandingInfo"
ACTIVE_INDEX = "ent.Faction.getActiveStandingIndex"
STOCK, ACCESS = "ent.Faction.getResource", "ent.Faction.hasAccessToRes"
LANDSRAAD = "ent.Faction.hasAccessToLandsraad"
ALERTS, ALERT = "ent.Faction.get_alerts", "logic.faction.AlertsManager.add"
COUNT, SET = "logic.TraitsManager.getTraitActiveStacksCount", "logic.TraitsManager.setTraitStacks"
TRAITS_OF, JOIN, PUSH = "ent.Object.get_traits", "$String.__add__", "hl.types.ArrayObj.push"
CACHE, LADDER = "$DataCache", "STANDING_STATUS_INFOS"
# what a tier's header reads after its name, as Standing's "High Standing Tier:"
TITLE = " Tier:"
# the ladder's state while one tooltip draws a resource's tiers; `end` puts the game's back
ON, INDEX, ID, COUNCIL, SAVED = ("tiers: drawing", "tiers: resource index", "tiers: resource id",
                                 "tiers: council block", "tiers: the game's own ladder")


class Kinds:
    """The kinds only the tiers hold, each read off the game by name."""

    def __init__(self, bc):
        self.res = argument_kind(bc, UPDATE, 0)
        # the faction class itself: the player's `Game.me` kind would refuse what it is handed
        self.faction = kind_named(bc, UPDATE.rsplit(".", 1)[0])
        self.tier = returns_type(function_named(bc, INFO), INFO)
        self.maybe = returns_type(function_named(bc, ACTIVE_INDEX), ACTIVE_INDEX)
        self.cache = kind_named(bc, CACHE)
        self.alerts = returns_type(function_named(bc, ALERTS), ALERTS)
        self.alert = returns_type(function_named(bc, ALERT), ALERT)


def tkinds(bc):
    if "_tiers_kinds" not in bc.__dict__:
        bc.__dict__["_tiers_kinds"] = Kinds(bc)
    return bc.__dict__["_tiers_kinds"]


def load(w, dst, name, kind):
    w.add(w.op("GetGlobal", **{"dst": dst, "global": slot_global(w.bc, name, kind)}))


def keep(w, name, kind, src):
    w.add(w.op("SetGlobal", **{"global": slot_global(w.bc, name, kind), "src": src}))


def put(w, obj, kind, name, src):
    w.add(w.op("SetField", obj=obj, field=field_by_name(w.bc, kind, name, name)[0], src=src))


def tiers_of(w, r, absent):
    """`tiers` is the drawn or ticked resource's own list, read off its raw row by id."""
    t = tkinds(w.bc)
    w.field(r["id"], w.r["res"], t.res, "id")
    w.field(r["at"], w.r["res"], t.res, "index")
    row_of(w, r["row"], "resource", r["id"], absent)
    w.get(r["props"], r["row"], "props")
    w.add((w.op("JNull", reg=r["props"]), absent))
    w.get(r["tiers"], r["props"], "tiers")
    w.add((w.op("JNull", reg=r["tiers"]), absent))


def first_of(w, listed, into, absent):
    """`into` is the first entry of `listed`; `absent` when it has none."""
    k = w.k
    n, zero = w.reg("first n", k.int), w.reg("first zero", k.int)
    w.field(n, listed, k.list, "length")
    w.int(zero, 0)
    w.add((w.op("JSLte", a=n, b=zero), absent))
    w.field(w.reg("back", k.back), listed, k.list, "array")
    w.add(w.op("GetArray", dst=into, array=w.r["back"], index=zero),
          (w.op("JNull", reg=into), absent))


def make_tick(bc):
    """t_tick(f, res): each tier's traits held only while in it; its alert on entering it."""
    k, t = kinds(bc), tkinds(bc)
    w = W(bc, (("f", t.faction), ("res", t.res)), k.void)
    r = {n: w.reg(n, kind) for n, kind in (
        ("id", k.text), ("at", k.int), ("row", k.dyn), ("props", k.dyn), ("tiers", k.list),
        ("mgr", k.traits), ("ok", k.bool), ("stock", k.f64), ("from", k.f64), ("cur", k.int),
        ("tier", k.dyn), ("jj", k.int), ("trs", k.list), ("te", k.dyn), ("tid", k.text),
        ("trow", k.dyn), ("tv", k.trait_row), ("n", k.int), ("want", k.int), ("zero", k.int),
        ("ref", k.ref), ("other", k.bool), ("in", k.bool), ("alert", k.text),
        ("am", t.alerts), ("made", t.alert), ("void", k.void))}
    nulls = {name: [w.reg("%s null%d" % (name, i), kind)
                    for i, kind in enumerate(argument_kinds(bc, name)[skip:])]
             for name, skip in ((SET, 2), (COUNT, 1), (ALERT, 1))}
    for nul in sum(nulls.values(), []):
        w.add(w.op("Null", dst=nul))
    tiers_of(w, r, "done")
    w.call(r["mgr"], TRAITS_OF, w.r["f"])
    w.add((w.op("JNull", reg=r["mgr"]), "done"))
    _pick(w, r)
    _apply(w, r, nulls)
    # entering, from above or below: another tier was held and this one was not
    w.add((w.op("JFalse", cond=r["other"]), "done"), (w.op("JTrue", cond=r["in"]), "done"))
    w.field(w.r["back"], r["tiers"], k.list, "array")
    w.add(w.op("GetArray", dst=r["tier"], array=w.r["back"], index=r["cur"]))
    w.get(r["alert"], r["tier"], "alert")
    w.add((w.op("JNull", reg=r["alert"]), "done"))
    w.call(r["am"], ALERTS, w.r["f"])
    w.add((w.op("JNull", reg=r["am"]), "done"))
    w.call(r["made"], ALERT, r["am"], r["alert"], *nulls[ALERT])
    w.add("done:", w.op("Label"), w.op("Ret", ret=r["void"]))
    return w.finish()


def _pick(w, r):
    """`cur` is the tier the stock is in: the last whose `from` it reaches; -1 without access."""
    # -1 as 0 less one: the number list keeps -1 as an unsigned value and writes it badly
    w.int(r["cur"], 0)
    w.add(w.op("Decr", dst=r["cur"]))
    w.call(r["ok"], ACCESS, w.r["f"], r["at"])
    w.add((w.op("JFalse", cond=r["ok"]), "picked"))
    w.call(r["stock"], STOCK, w.r["f"], r["at"])
    each(w, r["tiers"], "i", ("pick", "picked"), r["tier"])
    w.get(r["from"], r["tier"], "from")
    w.add((w.op("JSLt", a=r["stock"], b=r["from"]), "pick"),
          w.op("Mov", dst=r["cur"], src=w.r["i"]), w.op("Decr", dst=r["cur"]),
          (w.op("JAlways"), "pick"), "picked:", w.op("Label"))


def _apply(w, r, nulls):
    """Each tier's traits to one stack in `cur`, none elsewhere; `other`/`in` say what was held."""
    w.add(w.op("Bool", dst=r["other"], value=False), w.op("Bool", dst=r["in"], value=False))
    w.int(r["zero"], 0)
    each(w, r["tiers"], "j", ("tier", "applied"), r["tier"])
    w.add(w.op("Mov", dst=r["jj"], src=w.r["j"]), w.op("Decr", dst=r["jj"]))
    w.get(r["trs"], r["tier"], "traits")
    w.add((w.op("JNull", reg=r["trs"]), "tier"))
    each(w, r["trs"], "q", ("trait", "tier"), r["te"])
    w.get(r["tid"], r["te"], "trait")
    w.add((w.op("JNull", reg=r["tid"]), "trait"))
    row_of(w, r["trow"], "trait", r["tid"], "trait")
    w.add(w.op("ToVirtual", dst=r["tv"], src=r["trow"]))
    w.call(r["n"], COUNT, r["mgr"], r["tv"], *nulls[COUNT])
    w.int(r["want"], 0)
    w.add((w.op("JNotEq", a=r["jj"], b=r["cur"]), "wanted"))
    w.int(r["want"], 1)
    w.add("wanted:", w.op("Label"), (w.op("JSLte", a=r["n"], b=r["zero"]), "heard"),
          (w.op("JEq", a=r["jj"], b=r["cur"]), "mine"),
          w.op("Bool", dst=r["other"], value=True), (w.op("JAlways"), "heard"),
          "mine:", w.op("Label"), w.op("Bool", dst=r["in"], value=True),
          "heard:", w.op("Label"),
          (w.op("JEq", a=r["n"], b=r["want"]), "trait"),
          w.op("Ref", dst=r["ref"], src=r["want"]))
    w.call(r["void"], SET, r["mgr"], r["tid"], r["ref"], *nulls[SET])
    w.add((w.op("JAlways"), "trait"), "applied:", w.op("Label"))


def make_begin(bc):
    """t_begin(res, f): a resource with tiers hands the ladder its own; false for any other."""
    k, t = kinds(bc), tkinds(bc)
    w = W(bc, (("res", t.res), ("f", t.faction)), k.bool)
    r = {n: w.reg(n, kind) for n, kind in (
        ("no", k.bool), ("yes", k.bool), ("id", k.text), ("at", k.int), ("row", k.dyn),
        ("props", k.dyn), ("tiers", k.list), ("n", k.int), ("zero", k.int), ("cap", k.int),
        ("stats", k.list), ("first", k.dyn), ("out", k.list), ("tt", k.typetype),
        ("arr", k.array), ("v", t.tier), ("name", k.text), ("suffix", k.text),
        ("title", k.text), ("alert", k.text), ("trs", k.list), ("te", k.dyn), ("tid", k.text),
        ("next", k.dyn), ("top", k.int), ("pushed", k.int), ("c", k.dyn),
        ("council", k.bool), ("cache", t.cache), ("saved", k.list))}
    w.add(w.op("Bool", dst=r["no"], value=False))
    w.int(r["zero"], 0)
    tiers_of(w, r, "no")
    w.field(r["n"], r["tiers"], k.list, "length")
    w.add((w.op("JSLte", a=r["n"], b=r["zero"]), "no"))
    # the ladder's top: the resource's own stock cap
    w.int(r["cap"], 0)
    w.get(r["stats"], r["row"], "stats")
    w.add((w.op("JNull", reg=r["stats"]), "capped"))
    first_of(w, r["stats"], r["first"], "capped")
    w.get(r["cap"], r["first"], "baseStock")
    w.add("capped:", w.op("Label"))
    ty, alloc, wrap = k.made_by
    w.add(w.op("Type", dst=r["tt"], ty=ty))
    w.call(r["arr"], alloc, r["tt"], r["zero"])
    w.add(w.op("UnsafeCast", dst=r["arr"], src=r["arr"]))
    w.call(r["out"], wrap, r["arr"])
    _ladder(w, r)
    # the game's own ladder is kept, ours drawn in its place until `end`
    w.add(w.op("GetGlobal", **{"dst": r["cache"], "global": the_global_of(bc, CACHE)}))
    w.field(r["saved"], r["cache"], t.cache, LADDER)
    keep(w, SAVED, k.list, r["saved"])
    put(w, r["cache"], t.cache, LADDER, r["out"])
    w.add(w.op("Bool", dst=r["council"], value=False))
    w.get(r["c"], r["props"], "showCouncil")
    w.add((w.op("JNull", reg=r["c"]), "plain"))
    w.get(r["council"], r["props"], "showCouncil")
    w.add("plain:", w.op("Label"))
    keep(w, COUNCIL, k.bool, r["council"])
    keep(w, INDEX, k.int, r["at"])
    keep(w, ID, k.text, r["id"])
    w.add(w.op("Bool", dst=r["yes"], value=True))
    keep(w, ON, k.bool, r["yes"])
    w.add(w.op("Ret", ret=r["yes"]), "no:", w.op("Label"), w.op("Ret", ret=r["no"]))
    return w.finish()


def _ladder(w, r):
    """`out` holds one Standing-shaped tier per entry of `tiers`, its top the next one's `from`."""
    k, t = w.k, tkinds(w.bc)
    w.text(r["suffix"], TITLE)
    each(w, r["tiers"], "i", ("tier", "built"), r["next"])
    w.add(w.op("New", dst=r["v"]), w.op("Null", dst=r["alert"]))
    put(w, r["v"], t.tier, "alert", r["alert"])
    w.get(r["name"], r["next"], "name")
    w.add((w.op("JNotNull", reg=r["name"]), "named"))
    w.text(r["name"], "")
    w.add("named:", w.op("Label"))
    put(w, r["v"], t.tier, "name", r["name"])
    w.call(r["title"], JOIN, r["name"], r["suffix"])
    put(w, r["v"], t.tier, "title", r["title"])
    # the header's bonuses: the tier's first trait, none when it has none
    w.text(r["tid"], "")
    w.get(r["trs"], r["next"], "traits")
    w.add((w.op("JNull", reg=r["trs"]), "traited"))
    first_of(w, r["trs"], r["te"], "traited")
    w.get(r["c"], r["te"], "trait")
    w.add((w.op("JNull", reg=r["c"]), "traited"))
    w.get(r["tid"], r["te"], "trait")
    w.add("traited:", w.op("Label"))
    put(w, r["v"], t.tier, "trait", r["tid"])
    w.add(w.op("Mov", dst=r["top"], src=r["cap"]),
          (w.op("JSGte", a=w.r["i"], b=r["n"]), "topped"))
    w.field(w.r["back"], r["tiers"], k.list, "array")
    w.add(w.op("GetArray", dst=r["c"], array=w.r["back"], index=w.r["i"]),
          (w.op("JNull", reg=r["c"]), "topped"))
    w.get(r["top"], r["c"], "from")
    w.add("topped:", w.op("Label"))
    put(w, r["v"], t.tier, "nextThreshold", r["top"])
    w.call(r["pushed"], PUSH, r["out"], r["v"])
    w.add((w.op("JAlways"), "tier"), "built:", w.op("Label"))


def make_end(bc):
    """t_end(): the game's own ladder back, once a tooltip has drawn ours."""
    k, t = kinds(bc), tkinds(bc)
    w = W(bc, (), k.void)
    on, saved, cache, no = (w.reg("on", k.bool), w.reg("saved", k.list),
                            w.reg("cache", t.cache), w.reg("no", k.bool))
    void = w.reg("void", k.void)
    load(w, on, ON, k.bool)
    w.add((w.op("JFalse", cond=on), "done"))
    load(w, saved, SAVED, k.list)
    w.add(w.op("GetGlobal", **{"dst": cache, "global": the_global_of(bc, CACHE)}))
    put(w, cache, t.cache, LADDER, saved)
    w.add(w.op("Bool", dst=no, value=False))
    keep(w, ON, k.bool, no)
    w.add("done:", w.op("Label"), w.op("Ret", ret=void))
    return w.finish()


def make_asked(bc, game, ours, kind, boxed):
    """t_info / t_index(f): the game's answer, or the drawn resource's tier from its own stock."""
    k = kinds(bc)
    w = W(bc, (("f", tkinds(bc).faction),), kind)
    on, at, ok, stock = (w.reg("on", k.bool), w.reg("at", k.int), w.reg("ok", k.bool),
                         w.reg("stock", k.f64))
    out, got = w.reg("out", kind), w.reg("got", returns_type(function_named(bc, ours), ours))
    load(w, on, ON, k.bool)
    w.add((w.op("JTrue", cond=on), "ours"))
    w.call(out, game, w.r["f"])
    w.add(w.op("Ret", ret=out), "ours:", w.op("Label"))
    load(w, at, INDEX, k.int)
    w.call(ok, ACCESS, w.r["f"], at)
    w.add((w.op("JTrue", cond=ok), "held"), w.op("Null", dst=out), w.op("Ret", ret=out),
          "held:", w.op("Label"))
    w.call(stock, STOCK, w.r["f"], at)
    w.call(got, ours, stock)
    w.add(w.op("ToDyn" if boxed else "Mov", dst=out, src=got), w.op("Ret", ret=out))
    return w.finish()


def make_or(bc, name, kind):
    """t_or(x): the drawn resource's index or id while a ladder of ours is drawn, else `x`."""
    k = kinds(bc)
    w = W(bc, (("x", kind),), kind)
    on, out = w.reg("on", k.bool), w.reg("out", kind)
    load(w, on, ON, k.bool)
    w.add((w.op("JTrue", cond=on), "ours"), w.op("Ret", ret=w.r["x"]), "ours:", w.op("Label"))
    load(w, out, name, kind)
    w.add(w.op("Ret", ret=out))
    return w.finish()


def make_shows(bc):
    """t_shows(f): a faction's row on the drawn ladder: Landsraad access, else the resource's."""
    k = kinds(bc)
    w = W(bc, (("f", tkinds(bc).faction),), k.bool)
    on, at, out = w.reg("on", k.bool), w.reg("at", k.int), w.reg("out", k.bool)
    load(w, on, ON, k.bool)
    w.add((w.op("JTrue", cond=on), "ours"))
    w.call(out, LANDSRAAD, w.r["f"])
    w.add(w.op("Ret", ret=out), "ours:", w.op("Label"))
    load(w, at, INDEX, k.int)
    w.call(out, ACCESS, w.r["f"], at)
    w.add(w.op("Ret", ret=out))
    return w.finish()


def make_hidden(bc):
    """t_hidden(): true while a ladder of ours is drawn for a resource without `showCouncil`."""
    k = kinds(bc)
    w = W(bc, (), k.bool)
    on, council, out = w.reg("on", k.bool), w.reg("council", k.bool), w.reg("out", k.bool)
    w.add(w.op("Bool", dst=out, value=False))
    load(w, on, ON, k.bool)
    w.add((w.op("JFalse", cond=on), "done"))
    load(w, council, COUNCIL, k.bool)
    w.add((w.op("JTrue", cond=council), "done"), w.op("Bool", dst=out, value=True),
          "done:", w.op("Label"), w.op("Ret", ret=out))
    return w.finish()


def install(bc):
    """Every function of ours, written once, by the name the splices ask for."""
    t, k = tkinds(bc), kinds(bc)
    text_object(bc, TITLE)
    return {"tick": make_tick(bc), "begin": make_begin(bc), "end": make_end(bc),
            "info": make_asked(bc, ACTIVE_INFO, INFO, t.tier, False),
            "index": make_asked(bc, ACTIVE_INDEX, TIER_OF, t.maybe, True),
            "index_or": make_or(bc, INDEX, k.int), "id_or": make_or(bc, ID, k.text),
            "shows": make_shows(bc), "hidden": make_hidden(bc)}
