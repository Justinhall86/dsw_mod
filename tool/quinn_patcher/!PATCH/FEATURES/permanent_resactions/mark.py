#!/usr/bin/env python3
"""A res action's looks: image and tint on the card's art and the details; a permanent's charter."""
from tools.project import gv
from tools.hlcode import (argument_kind, field_by_name, function_named, kind_named, method_slot,
                          returns_type)

from framework import ofthekind

import perm
import played
import tiers
from trades import W, each, kinds, row_of

TO_TILE, BITMAP = "lib.$ExtensionsUI.toTile", "h2d.Bitmap"
MAKE_BITMAP, FLOW = "h2d.$Bitmap.__constructor__", "h2d.Flow"
PROPS_OF, ABSOLUTE = "h2d.Flow.getProperties", "h2d.FlowProperties.set_isAbsolute"
TINT, HISTORY = "h3d.Vector4Impl.setColor", "logic.state.LandsraadManager.getHistoryRes"
VECTOR, MAKE_VECTOR = "h3d.Vector4Impl", "h3d.$Vector4Impl.__constructor__"
OBJECT, DRAWABLE = "h2d.Object", "h2d.Drawable"
ANIM, MAKE_ANIM, SPLIT = "h2d.Anim", "h2d.$Anim.__constructor__", "h2d.Tile.split"
MATRIX, MAKE_MATRIX = "h3d.MatrixImpl", "h3d.$MatrixImpl.__constructor__"
IDENTITY, FILTER = "h3d.MatrixImpl.identity", "h2d.filter.ColorMatrix"
MAKE_FILTER, SET_FILTER = "h2d.filter.$ColorMatrix.__constructor__", "h2d.Object.set_filter"
SET_Y, CHILD_AT = "h2d.Object.set_y", "h2d.Object.getChildIndex"
# the council card inside the outer card, which cuts what reaches past its own bottom edge
INNER = "ui.win.ResolutionCard"
# a cdb colour is red, green and blue only; the game's colour reads its opacity from the top too
OPAQUE = 0xFF000000
# what a flow counts among its children and skips by itself when one is added at a place
AHEAD, TRIM = ("background", "interactive"), "h2d.Tile.sub"
# the name an image of ours wears on a council card, which outlives the details drawn in it
TAG = "permanent: details image"


def tint_vector(w, r, look, absent):
    """`vec` is the look's tint as the game's colour; `absent` when the look has none."""
    rest = perm.nulls(w, MAKE_VECTOR, 1)
    w.get(r["has"], look, "tint")
    w.add((w.op("JNull", reg=r["has"]), absent))
    w.get(r["tint"], look, "tint")
    w.int(r["full"], OPAQUE)
    w.add(w.op("Or", dst=r["tint"], a=r["tint"], b=r["full"]), w.op("New", dst=r["vec"]))
    w.call(r["void"], MAKE_VECTOR, r["vec"], *rest)
    w.call(r["void"], TINT, r["vec"], r["tint"])


def tint_matrix(w, r):
    """`m` multiplies red, green and blue by the tint in `vec`, and leaves opacity alone."""
    bc, vk, mk = w.bc, kind_named(w.bc, VECTOR), kind_named(w.bc, MATRIX)
    w.add(w.op("New", dst=r["m"]))
    w.call(r["void"], MAKE_MATRIX, r["m"])
    w.call(r["void"], IDENTITY, r["m"])
    for c, cell in (("x", "_11"), ("y", "_22"), ("z", "_33")):
        w.field(r["f"], r["vec"], vk, c)
        w.add(w.op("SetField", obj=r["m"], field=field_by_name(bc, mk, cell, "a matrix")[0],
                   src=r["f"]))


def tint_filter(w, r):
    """`filt` draws what it is put on, children too, through the colour matrix `m`."""
    w.add(w.op("New", dst=r["filt"]))
    w.call(r["void"], MAKE_FILTER, r["filt"], r["m"])


def tint_regs(w, *more):
    k = w.k
    return {n: w.reg(n, kind) for n, kind in (
        ("has", k.dyn), ("tint", k.int), ("full", k.int), ("vec", kind_named(w.bc, VECTOR)),
        ("m", kind_named(w.bc, MATRIX)), ("f", k.f64), ("filt", kind_named(w.bc, FILTER)),
        ("void", k.void)) + more}


def make_tint(bc):
    """p_tint(shown, look): the look's tint multiplies what is shown, whatever draws it."""
    k = kinds(bc)
    w = W(bc, (("shown", kind_named(bc, OBJECT)), ("look", k.dyn)), k.void)
    r = tint_regs(w, ("was", returns_type(function_named(bc, SET_FILTER), SET_FILTER)))
    w.add((w.op("JNull", reg=w.r["shown"]), "done"))
    tint_vector(w, r, w.r["look"], "done")
    tint_matrix(w, r)
    tint_filter(w, r)
    w.call(r["was"], SET_FILTER, w.r["shown"], r["filt"])
    w.add("done:", w.op("Label"), w.op("Ret", ret=r["void"]))
    return w.finish()


def _place(w, r, shown, flow, tag):
    """`shown` goes in under its parent's own children, and out of the parent's layout."""
    bc = w.bc
    if r.get("tag") is not None:
        w.add(w.op("SetField", obj=shown, field=field_by_name(bc, kind_named(bc, OBJECT), "name",
                                                              "an object")[0], src=r["tag"]))
    w.add(w.op("CallMethod", dst=r["void"], field=method_slot(bc, kind_named(bc, OBJECT),
                                                               "addChildAt", OBJECT),
               args=[w.r["parent"], shown, r["at"]]))
    if flow:
        w.call(r["props"], PROPS_OF, w.r["parent"], shown)
        w.add((w.op("JNull", reg=r["props"]), tag), w.op("Bool", dst=r["yes"], value=True))
        w.call(r["yes"], ABSOLUTE, r["props"], r["yes"])
    if r.get("y") is not None:
        w.call(r["y"], SET_Y, shown, r["y"])
    w.add((w.op("JAlways"), "done"))


def _at(w, r, pk, flow, under):
    """`at`: first among the parent's children, or `under`'s place, there wearing `TAG`."""
    if not under:
        w.int(r["at"], 0)
        return
    r["tag"] = w.reg("tag", w.k.text)
    w.text(r["tag"], TAG)
    w.call(r["at"], CHILD_AT, w.r["parent"], w.r["under"])
    for n, name in enumerate(AHEAD if flow else ()):
        at, kind = field_by_name(w.bc, pk, name, "a flow")
        ahead = w.reg("ahead " + name, gv(kind))
        w.add(w.op("Field", dst=ahead, obj=w.r["parent"], field=at),
              (w.op("JNull", reg=ahead), "ahead %d" % n), w.op("Decr", dst=r["at"]),
              "ahead %d:" % n, w.op("Label"))


def _trim(w, r, cut):
    """`tile` no taller than `cut`: its top part, as wide as it was."""
    tk = returns_type(function_named(w.bc, TO_TILE), TO_TILE)
    rest = perm.nulls(w, TRIM, 4)
    w.field(r["high"], r["tile"], tk, "height")
    w.float(r["cut"], float(cut))
    w.add((w.op("JSLte", a=r["high"], b=r["cut"]), "whole"))
    w.field(r["wide"], r["tile"], tk, "width")
    w.float(r["high"], 0.0)
    w.call(r["tile"], TRIM, r["tile"], r["high"], r["high"], r["wide"], r["cut"], *rest)
    w.add("whole:", w.op("Label"))


def make_draw(bc, flow, y=0, under=False, cut=0):
    """p_draw(parent, look[, under], act): the image under the parent's children or `under`."""
    k, pk = kinds(bc), kind_named(bc, FLOW if flow else OBJECT)
    last = (("under", kind_named(bc, OBJECT)),) if under else ()
    w = W(bc, (("parent", pk), ("look", k.dyn)) + last + (("act", k.dyn),), k.void)
    r = {"y": w.reg("y", k.f64) if y else None}
    r.update({n: w.reg(n, kind) for n, kind in (
        ("img", k.dyn), ("v", argument_kind(bc, TO_TILE, 0)), ("none", kind_named(bc, OBJECT)),
        ("tile", returns_type(function_named(bc, TO_TILE), TO_TILE)),
        ("bmp", kind_named(bc, BITMAP)), ("anim", kind_named(bc, ANIM)), ("tiles", k.list),
        ("frames", k.int), ("two", k.int), ("count", argument_kind(bc, SPLIT, 0)),
        ("has", k.dyn), ("speed", k.f64), ("rate", argument_kind(bc, MAKE_ANIM, 2)),
        ("props", returns_type(function_named(bc, PROPS_OF), PROPS_OF)), ("yes", k.bool),
        ("at", k.int), ("void", k.void))})
    r.update({n: w.reg(n, k.f64) for n in (("high", "cut", "wide") if cut else ())})
    rest = perm.nulls(w, SPLIT, 1)
    if y:
        w.float(r["y"], float(y))
    w.get(r["img"], w.r["look"], "image")
    w.add((w.op("JNull", reg=r["img"]), "done"), w.op("ToVirtual", dst=r["v"], src=r["img"]))
    w.call(r["tile"], TO_TILE, r["v"])
    w.add((w.op("JNull", reg=r["tile"]), "done"), w.op("Null", dst=r["none"]))
    if cut:
        _trim(w, r, cut)
    _at(w, r, pk, flow, under)
    w.get(r["frames"], w.r["look"], "frames")
    w.int(r["two"], 2)
    w.add((w.op("JSLt", a=r["frames"], b=r["two"]), "still"),
          w.op("Ref", dst=r["count"], src=r["frames"]))
    w.call(r["tiles"], SPLIT, r["tile"], r["count"], *rest)
    w.add(w.op("Null", dst=r["rate"]))
    w.get(r["has"], w.r["look"], "speed")
    w.add((w.op("JNull", reg=r["has"]), "timed"))
    w.get(r["speed"], w.r["look"], "speed")
    w.add(w.op("Ref", dst=r["rate"], src=r["speed"]), "timed:", w.op("Label"),
          w.op("New", dst=r["anim"]))
    w.call(r["void"], MAKE_ANIM, r["anim"], r["tiles"], r["rate"], r["none"])
    _carry(w, r)
    _place(w, r, r["anim"], flow, "done")
    w.add("still:", w.op("Label"), w.op("New", dst=r["bmp"]))
    w.call(r["void"], MAKE_BITMAP, r["bmp"], r["tile"], r["none"])
    _place(w, r, r["bmp"], flow, "done")
    w.add("done:", w.op("Label"), w.op("Ret", ret=r["void"]))
    return w.finish()


def _carry(w, r):
    """A flipbook drawn again for the same placed action goes on from the frame it was at."""
    ak = kind_named(w.bc, ANIM)
    frame = field_by_name(w.bc, ak, "curFrame", "a flipbook")[0]
    r.update(played.regs(w))
    old, at = w.reg("old", ak), w.reg("frame", w.k.f64)
    w.int(r["zero"], 0)
    w.call(r["slot"], played.make_seen(w.bc), w.r["act"], w.r["look"])
    w.add(w.op("UnsafeCast", dst=r["held"], src=r["anim"]))
    played.kept(w, r, w.r["act"], w.r["look"], r["held"])
    w.add((w.op("JNull", reg=r["d"]), "fresh"), w.op("UnsafeCast", dst=old, src=r["d"]),
          w.op("Field", dst=at, obj=old, field=frame),
          w.op("SetField", obj=r["anim"], field=frame, src=at), "fresh:", w.op("Label"))


def _outer(w, r, plain):
    """`flow` is the council card around `details`, `inner` the card inside; `plain` if none."""
    bc, ok, fk = w.bc, kind_named(w.bc, OBJECT), kind_named(w.bc, FLOW)
    w.add(w.op("UnsafeCast", dst=r["up"], src=w.r["details"]), "up:", w.op("Label"))
    w.field(r["up"], r["up"], ok, "parent")
    w.add(*ofthekind.emit_or_below(bc, w.fn, w.op, r["up"], r["inner"], kind_named(bc, INNER),
                                   "next"))
    w.add((w.op("JAlways"), "found"), "next:", w.op("Label"), (w.op("JNull", reg=r["up"]), plain),
          (w.op("JAlways"), "up"), "found:", w.op("Label"))
    w.field(r["outer"], r["inner"], ok, "parent")
    w.add(*ofthekind.emit_or_below(bc, w.fn, w.op, r["outer"], r["flow"], fk, plain))


def make_clear(bc):
    """p_clear(details): the images an earlier `out` left on the council card are taken off."""
    k, ok, fk = kinds(bc), kind_named(bc, OBJECT), kind_named(bc, FLOW)
    w = W(bc, (("details", fk),), k.void)
    r = {n: w.reg(n, kind) for n, kind in (
        ("up", ok), ("inner", ok), ("outer", ok), ("flow", fk), ("kids", k.list), ("back", k.back),
        ("at", k.int), ("zero", k.int), ("d", k.dyn), ("kid", ok), ("name", k.text),
        ("tag", k.text), ("void", k.void))}
    _outer(w, r, "done")
    w.text(r["tag"], TAG)
    w.int(r["zero"], 0)
    w.field(r["kids"], r["flow"], fk, "children")
    w.add((w.op("JNull", reg=r["kids"]), "done"))
    w.field(r["at"], r["kids"], k.list, "length")
    w.add("walk:", w.op("Label"), w.op("Decr", dst=r["at"]),
          (w.op("JSLt", a=r["at"], b=r["zero"]), "done"))
    w.field(r["back"], r["kids"], k.list, "array")
    w.add(w.op("GetArray", dst=r["d"], array=r["back"], index=r["at"]),
          w.op("UnsafeCast", dst=r["kid"], src=r["d"]), (w.op("JNull", reg=r["kid"]), "walk"))
    w.field(r["name"], r["kid"], ok, "name")
    w.add((w.op("JNotEq", a=r["name"], b=r["tag"]), "walk"),
          w.op("CallMethod", dst=r["void"], field=method_slot(bc, ok, "removeChild", OBJECT),
               args=[r["flow"], r["kid"]]),
          (w.op("JAlways"), "walk"), "done:", w.op("Label"), w.op("Ret", ret=r["void"]))
    return w.finish()


def make_out(bc, draw, out):
    """p_out(details, look, act): on a council card, `out` under the inner card; else `draw`."""
    k, ok, fk = kinds(bc), kind_named(bc, OBJECT), kind_named(bc, FLOW)
    w = W(bc, (("details", fk), ("look", k.dyn), ("act", k.dyn)), k.void)
    r = {n: w.reg(n, kind) for n, kind in (("up", ok), ("inner", ok), ("outer", ok),
                                           ("flow", fk), ("void", k.void))}
    _outer(w, r, "plain")
    w.call(r["void"], out, r["flow"], w.r["look"], r["inner"], w.r["act"])
    w.add((w.op("JAlways"), "done"), "plain:", w.op("Label"))
    w.call(r["void"], draw, w.r["details"], w.r["look"], w.r["act"])
    w.add("done:", w.op("Label"), w.op("Ret", ret=r["void"]))
    return w.finish()


def _regs(w, k, *more):
    return {n: w.reg(n, kind) for n, kind in (
        ("id", k.text), ("row", k.dyn), ("props", k.dyn), ("perm", k.dyn), ("mark", k.dyn),
        ("look", k.dyn), ("void", k.void)) + more}


def _look(w, r, place, absent):
    """`look` is res action `id`'s `place`: `charter` in `permanent`, the rest in `mark`."""
    w.add((w.op("JNull", reg=r["id"]), absent))
    if place == "charter":
        perm.permanent_of(w, r, r["id"], absent)
        w.add(w.op("Mov", dst=r["mark"], src=r["perm"]))
    else:
        row_of(w, r["row"], "resAction", r["id"], absent)
        w.get(r["props"], r["row"], "props")
        w.add((w.op("JNull", reg=r["props"]), absent))
        w.get(r["mark"], r["props"], "mark")
        w.add((w.op("JNull", reg=r["mark"]), absent))
    w.get(r["look"], r["mark"], place)
    w.add((w.op("JNull", reg=r["look"]), absent))


def make_on(bc, place, args, steps):
    """p_on(args..., res): each placed action's `place` look to `steps`, (function, names)."""
    k, rk = kinds(bc), kind_named(bc, perm.RES)
    w = W(bc, tuple(args) + (("res", rk),), k.void)
    r = _regs(w, k, ("proxy", kind_named(bc, perm.PROXY)), ("acts", k.list), ("e", k.dyn))
    w.add((w.op("JNull", reg=w.r["res"]), "done"))
    w.field(r["proxy"], w.r["res"], rk, "actions")
    perm.unwrapped(w, r["acts"], r["proxy"], "done")
    each(w, r["acts"], "i", ("next", "done"), r["e"])
    w.get(r["id"], r["e"], "kind")
    _look(w, r, place, "next")
    for fn, names in steps:
        w.call(r["void"], fn, *[{"look": r["look"], "act": r["e"]}.get(n, w.r.get(n))
                                for n in names])
    w.add((w.op("JAlways"), "next"), "done:", w.op("Label"), w.op("Ret", ret=r["void"]))
    return w.finish()


def make_lookup(bc, on, args, row):
    """p_lookup(args..., row): the charter's resolution, from the past or parked, to `on`."""
    k, rk = kinds(bc), kind_named(bc, perm.RES)
    w = W(bc, tuple(args) + (("res row", row),), k.void)
    r = {n: w.reg(n, kind) for n, kind in (("kind", k.text), ("res", rk), ("void", k.void),
                                           ("lm", kind_named(bc, perm.TO_DATA[-1][0])),
                                           ("lst", k.list), ("d", k.dyn), ("pk", k.text))}
    w.get(r["kind"], w.r["res row"], "id")
    w.add((w.op("JNull", reg=r["kind"]), "done"))
    perm._to_data(w, r["lm"], "done", perm.TO_DATA[:-1])
    w.call(r["res"], HISTORY, r["lm"], r["kind"])
    w.add((w.op("JNotNull", reg=r["res"]), "found"))
    tiers.load(w, r["lst"], perm.PARKED, k.list)
    w.add((w.op("JNull", reg=r["lst"]), "done"))
    each(w, r["lst"], "i", ("parked", "done"), r["d"])
    w.add(w.op("UnsafeCast", dst=r["res"], src=r["d"]))
    w.field(r["pk"], r["res"], rk, "kind")
    w.add((w.op("JNotEq", a=r["pk"], b=r["kind"]), "parked"), "found:", w.op("Label"))
    w.call(r["void"], on, *([w.r[n] for n, _ in args] + [r["res"]]))
    w.add("done:", w.op("Label"), w.op("Ret", ret=r["void"]))
    return w.finish()
