#!/usr/bin/env python3
"""A `mark` look's tint kept on a place's own background, its 2D effects and its tooltip line."""
from tools.project import gv
from tools.hlcode import (argument_kind, class_global, field_by_name, function_named, kind_named,
                          returns_type)
from framework import ofthekind

import mark
import perm
import played
import tiers
from trades import PUSH, W, each, kinds

BIND, LATER = "ui.comp.BaseElement.bindUpdate", "ui.comp.BaseElement"
PLAY, ELEMENT = "ui.BaseUI.playFx2d", "ui.comp.Element"
UI_OF, EFFECT = "ui.comp.BaseElement.get_baseUI", "ui.comp.FxElement"
ANIMATION, BACK = "hrt.prefab.fx.FX2DAnimation", "shiro.ui.DynamicBackground"
CURVE, LENGTH = "hrt.prefab.Curve", "hrt.prefab.Curve.get_duration"
FLATTEN, FIND = "hrt.prefab.Prefab.flatten", "String.lastIndexOf"
# the tooltip's own line break, as the details window joins its lines
GAP = "<br/>"
QUEUED = "domkit.Properties.initStyle"
# only an effect made for the interface plays on one; a world effect is left alone
FLAT = ".fx2d"


def make_hold(bc):
    """p_hold(held, dt): the flow's background wears the kept colour, put back if it changed."""
    k, fk = kinds(bc), kind_named(bc, mark.FLOW)
    vk = kind_named(bc, mark.VECTOR)
    at, gk = field_by_name(bc, fk, "background", "a flow")
    w = W(bc, (("held", k.list), ("dt", k.f64)), k.void)
    r = {n: w.reg(n, kind) for n, kind in (
        ("back", k.back), ("d", k.dyn), ("i", k.int), ("flow", fk), ("vec", vk),
        ("bg", gv(gk)), ("was", vk), ("void", k.void))}
    color = field_by_name(bc, gv(gk), "color", "a background")[0]
    w.field(r["back"], w.r["held"], k.list, "array")
    for n, into in ((0, "flow"), (1, "vec")):
        w.int(r["i"], n)
        w.add(w.op("GetArray", dst=r["d"], array=r["back"], index=r["i"]),
              w.op("UnsafeCast", dst=r[into], src=r["d"]), (w.op("JNull", reg=r[into]), "done"))
    w.add(w.op("Field", dst=r["bg"], obj=r["flow"], field=at), (w.op("JNull", reg=r["bg"]), "done"),
          w.op("Field", dst=r["was"], obj=r["bg"], field=color),
          (w.op("JEq", a=r["was"], b=r["vec"]), "done"),
          w.op("SetField", obj=r["bg"], field=color, src=r["vec"]),
          "done:", w.op("Label"), w.op("Ret", ret=r["void"]))
    return w.finish()


def make_keep(bc, hold):
    """p_keep(element, flow, look): the look's tint on the flow's background, kept every frame."""
    k = kinds(bc)
    w = W(bc, (("element", kind_named(bc, LATER)), ("flow", kind_named(bc, mark.FLOW)),
               ("look", k.dyn)), k.void)
    r = {n: w.reg(n, kind) for n, kind in (
        ("has", k.dyn), ("tint", k.int), ("full", k.int), ("vec", kind_named(bc, mark.VECTOR)),
        ("held", k.list), ("zero", k.int), ("tt", k.typetype), ("arr", k.array), ("n", k.int),
        ("later", argument_kind(bc, BIND, 0)), ("void", k.void))}
    mark.tint_vector(w, r, w.r["look"], "done")
    _bound(w, r, hold, (w.r["flow"], r["vec"]))
    return w.finish()


def _bound(w, r, every, kept):
    """`every` runs each frame on the element, handed a fresh list of `kept`; then the end."""
    k = w.k
    ty, alloc, wrap = k.made_by
    w.int(r["zero"], 0)
    w.add(w.op("Type", dst=r["tt"], ty=ty))
    w.call(r["arr"], alloc, r["tt"], r["zero"])
    w.add(w.op("UnsafeCast", dst=r["arr"], src=r["arr"]))
    w.call(r["held"], wrap, r["arr"])
    for one in kept:
        w.call(r["n"], PUSH, r["held"], one)
    w.add(w.op("InstanceClosure", dst=r["later"], fun=every, obj=r["held"]))
    w.call(r["void"], BIND, w.r["element"], r["later"])
    w.add("done:", w.op("Label"), w.op("Ret", ret=r["void"]))


def make_again(bc):
    """p_again(anim): an effect at its end starts over instead of being taken away."""
    k, ak = kinds(bc), kind_named(bc, ANIMATION)
    w = W(bc, (("anim", ak),), k.void)
    r = {n: w.reg(n, kind) for n, kind in (("zero", k.f64), ("void", k.void))}
    w.float(r["zero"], 0.0)
    at = field_by_name(bc, ak, "localTime", "an effect")[0]
    w.add(w.op("SetField", obj=w.r["anim"], field=at, src=r["zero"]), w.op("Ret", ret=r["void"]))
    return w.finish()


def make_length(bc):
    """p_length(anim): an effect whose file sets no length takes its longest curve's."""
    k, ak, ck = kinds(bc), kind_named(bc, ANIMATION), kind_named(bc, CURVE)
    at, pk = field_by_name(bc, ak, "duration", "an effect")[0], field_by_name(bc, ak, "prefab",
                                                                             "an effect")
    w = W(bc, (("anim", ak),), k.void)
    r = {n: w.reg(n, kind) for n, kind in (
        ("d", k.f64), ("zero", k.f64), ("pre", gv(pk[1])), ("none", k.list), ("all", k.list),
        ("e", k.dyn), ("c", ck), ("t", k.f64), ("void", k.void),
        ("cls", gv(w.bc.global_types[class_global(bc, ck)])))}
    w.float(r["zero"], 0.0)
    w.add(w.op("Field", dst=r["d"], obj=w.r["anim"], field=at),
          (w.op("JSLt", a=r["zero"], b=r["d"]), "done"),
          w.op("Field", dst=r["pre"], obj=w.r["anim"], field=pk[0]),
          (w.op("JNull", reg=r["pre"]), "done"),
          w.op("GetGlobal", **{"dst": r["cls"], "global": class_global(bc, ck)}),
          w.op("Null", dst=r["none"]))
    w.call(r["all"], FLATTEN, r["pre"], r["cls"], r["none"])
    w.add((w.op("JNull", reg=r["all"]), "done"))
    each(w, r["all"], "i", ("next", "set"), r["e"])
    w.add(w.op("UnsafeCast", dst=r["c"], src=r["e"]))
    w.call(r["t"], LENGTH, r["c"])
    w.add((w.op("JSGte", a=r["d"], b=r["t"]), "next"), w.op("Mov", dst=r["d"], src=r["t"]),
          (w.op("JAlways"), "next"),
          "set:", w.op("Label"), w.op("SetField", obj=w.r["anim"], field=at, src=r["d"]),
          "done:", w.op("Label"), w.op("Ret", ret=r["void"]))
    return w.finish()


def make_fx(bc, again, length):
    """p_fx(element, look, act): each 2D effect plays once per placed action; `loop` carries on."""
    k, ak, fk = kinds(bc), kind_named(bc, ANIMATION), kind_named(bc, EFFECT)
    end, ends = field_by_name(bc, ak, "onEnd", "an effect")
    clock, seen = field_by_name(bc, ak, "localTime", "an effect")[0], played.make_seen(bc)
    w = W(bc, (("element", kind_named(bc, ELEMENT)), ("look", k.dyn), ("act", k.dyn)), k.void)
    r = {n: w.reg(n, kind) for n, kind in (
        ("fxs", k.list), ("e", k.dyn), ("path", k.text), ("flat", k.text), ("at", k.int),
        ("zero", k.int), ("ui", returns_type(function_named(bc, UI_OF), UI_OF)), ("fx", fk),
        ("from", argument_kind(bc, PLAY, 0)), ("loop", k.bool), ("anim", ak), ("again", gv(ends)),
        ("old", ak), ("t", k.f64), ("replay", k.bool), ("void", k.void))}
    r.update(played.regs(w))
    rest, after = perm.nulls(w, FIND, 1), perm.nulls(w, PLAY, 3)
    w.add(w.op("Null", dst=r["from"]))
    w.get(r["fxs"], w.r["look"], "fx2d")
    w.add((w.op("JNull", reg=r["fxs"]), "done"))
    w.text(r["flat"], FLAT)
    w.int(r["zero"], 0)
    each(w, r["fxs"], "i", ("next", "done"), r["e"])
    w.get(r["path"], r["e"], "fx2dPath")
    w.add((w.op("JNull", reg=r["path"]), "next"))
    w.call(r["at"], FIND, r["path"], r["flat"], *rest)
    w.add((w.op("JSLt", a=r["at"], b=r["zero"]), "next"))
    w.call(r["ui"], UI_OF, w.r["element"])
    w.add((w.op("JNull", reg=r["ui"]), "next"))
    # a rebuilt card plays no one-off effect again, and a looping one goes on from where it was
    w.call(r["slot"], seen, w.r["act"], r["e"])
    w.get(r["loop"], r["e"], "loop")
    w.get(r["replay"], r["e"], "replay")
    w.add((w.op("JTrue", cond=r["replay"]), "play"),
          (w.op("JSLt", a=r["slot"], b=r["zero"]), "play"),
          (w.op("JFalse", cond=r["loop"]), "next"), "play:", w.op("Label"),
          w.op("Null", dst=r["anim"]))
    w.call(r["fx"], PLAY, r["ui"], r["from"], r["path"], w.r["element"], *after)
    w.add((w.op("JNull", reg=r["fx"]), "kept"))
    w.field(r["anim"], r["fx"], fk, "fx2dAnimation")
    w.add("kept:", w.op("Label"), w.op("UnsafeCast", dst=r["held"], src=r["anim"]),
          (w.op("JTrue", cond=r["replay"]), "loops"))
    played.kept(w, r, w.r["act"], r["e"], r["held"])
    w.add((w.op("JNull", reg=r["anim"]), "next"), (w.op("JNull", reg=r["d"]), "loops"),
          w.op("UnsafeCast", dst=r["old"], src=r["d"]),
          w.op("Field", dst=r["t"], obj=r["old"], field=clock),
          w.op("SetField", obj=r["anim"], field=clock, src=r["t"]),
          "loops:", w.op("Label"), (w.op("JFalse", cond=r["loop"]), "next"),
          (w.op("JNull", reg=r["anim"]), "next"))
    w.call(r["void"], length, r["anim"])
    w.add(w.op("InstanceClosure", dst=r["again"], fun=again, obj=r["anim"]),
          w.op("SetField", obj=r["anim"], field=end, src=r["again"]), (w.op("JAlways"), "next"),
          "done:", w.op("Label"), w.op("Ret", ret=r["void"]))
    return w.finish()


def make_behind(bc):
    """p_behind(held, dt): the nearest background behind the held element wears the tint."""
    k, ok, vk = kinds(bc), kind_named(bc, mark.OBJECT), kind_named(bc, mark.VECTOR)
    fk, xk = kind_named(bc, mark.FLOW), kind_named(bc, mark.FILTER)
    at, gk = field_by_name(bc, fk, "background", "a flow")
    sk = field_by_name(bc, ok, "filter", "a shown thing")
    w = W(bc, (("held", k.list), ("dt", k.f64)), k.void)
    r = {n: w.reg(n, kind) for n, kind in (
        ("back", k.back), ("d", k.dyn), ("i", k.int), ("up", ok), ("vec", vk), ("filt", xk),
        ("flow", fk), ("bg", gv(gk)), ("was", vk), ("kids", k.list), ("drawn", ok),
        ("had", gv(sk[1])), ("mine", gv(sk[1])), ("void", k.void))}
    color = field_by_name(bc, gv(gk), "color", "a background")[0]
    w.field(r["back"], w.r["held"], k.list, "array")
    for n, into in ((0, "up"), (1, "vec"), (2, "filt")):
        w.int(r["i"], n)
        w.add(w.op("GetArray", dst=r["d"], array=r["back"], index=r["i"]),
              w.op("UnsafeCast", dst=r[into], src=r["d"]), (w.op("JNull", reg=r[into]), "done"))
    w.add("up:", w.op("Label"))
    w.field(r["up"], r["up"], ok, "parent")
    w.add((w.op("JNull", reg=r["up"]), "done"),
          *ofthekind.emit_or_below(bc, w.fn, w.op, r["up"], r["flow"], fk, "kids"))
    # a `background-type: dynamic` element keeps its dynamic background in the same place
    w.add(w.op("Field", dst=r["bg"], obj=r["flow"], field=at),
          (w.op("JNull", reg=r["bg"]), "kids"),
          *ofthekind.emit_or_below(bc, w.fn, w.op, r["bg"], r["drawn"], kind_named(bc, BACK),
                                   "plain"))
    w.add((w.op("JAlways"), "apply"), "plain:", w.op("Label"),
          w.op("Field", dst=r["was"], obj=r["bg"], field=color),
          (w.op("JEq", a=r["was"], b=r["vec"]), "done"),
          w.op("SetField", obj=r["bg"], field=color, src=r["vec"]), (w.op("JAlways"), "done"),
          "kids:", w.op("Label"))
    w.field(r["kids"], r["up"], ok, "children")
    w.add((w.op("JNull", reg=r["kids"]), "up"))
    each(w, r["kids"], "i", ("kid", "up"), r["d"])
    w.add(*ofthekind.emit_or_below(bc, w.fn, w.op, r["d"], r["drawn"], kind_named(bc, BACK),
                                   "kid"))
    w.add("apply:", w.op("Label"), w.op("Field", dst=r["had"], obj=r["drawn"], field=sk[0]),
          w.op("UnsafeCast", dst=r["mine"], src=r["filt"]),
          (w.op("JEq", a=r["had"], b=r["mine"]), "done"))
    w.call(r["had"], mark.SET_FILTER, r["drawn"], r["filt"])
    w.add("done:", w.op("Label"), w.op("Ret", ret=r["void"]))
    return w.finish()


def make_body(bc):
    """p_body(element, look): the look's tint kept on the background behind the element."""
    k, behind = kinds(bc), make_behind(bc)
    w = W(bc, (("element", kind_named(bc, LATER)), ("look", k.dyn)), k.void)
    r = mark.tint_regs(w, ("held", k.list), ("zero", k.int), ("tt", k.typetype),
                       ("arr", k.array), ("n", k.int), ("later", argument_kind(bc, BIND, 0)))
    mark.tint_vector(w, r, w.r["look"], "done")
    mark.tint_matrix(w, r)
    mark.tint_filter(w, r)
    _bound(w, r, behind, (w.r["element"], r["vec"], r["filt"]))
    return w.finish()


def make_line(bc, pk, tk, shows, name):
    """p_line(style, look): the `tip` under the effects, its tags coloured by the box itself."""
    k, (nk, at) = kinds(bc), name
    ok = field_by_name(bc, pk, "obj", "a style")[1]
    w = W(bc, (("style", pk), ("look", k.dyn)), k.void)
    r = {n: w.reg(n, kind) for n, kind in (
        ("text", k.text), ("was", k.text), ("gap", k.text), ("obj", gv(ok)), ("effects", tk),
        ("name", nk), ("void", k.void))}
    w.get(r["text"], w.r["look"], "tip")
    w.add((w.op("JNull", reg=r["text"]), "done"), (w.op("JNull", reg=w.r["style"]), "done"))
    w.field(r["obj"], w.r["style"], pk, "obj")
    w.add(w.op("UnsafeCast", dst=r["effects"], src=r["obj"]),
          (w.op("JNull", reg=r["effects"]), "done"))
    w.field(r["was"], r["effects"], tk, "text")
    w.text(r["gap"], GAP)
    w.call(r["gap"], tiers.JOIN, r["was"], r["gap"])
    w.call(r["text"], tiers.JOIN, r["gap"], r["text"])
    w.add(w.op("CallMethod", dst=r["gap"], field=shows, args=[r["effects"], r["text"]]),
          w.op("GetGlobal", **{"dst": r["name"], "global": at}))
    w.call(r["void"], QUEUED, w.r["style"], r["name"], r["text"])
    w.add("done:", w.op("Label"), w.op("Ret", ret=r["void"]))
    return w.finish()
