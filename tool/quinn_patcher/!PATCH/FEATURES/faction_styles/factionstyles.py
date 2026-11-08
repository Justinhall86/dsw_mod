#!/usr/bin/env python3
"""Each faction row's own style file, `UI/Styles/factions/<id>.css`, read after the game's sheet."""
from tools.project import gv, guard
from tools.hlcode import (argument_kind, class_global, field_by_name, function_named, kind_named,
                          returns_type, template, written)
from tools.splice import insert
from framework import traps
from framework.foreignwalk import the_global_of
from framework.parsed import a_new_place

from trades import W, each, kinds

NAME = "factionstyles"
# where the game sets its language, and with it loads its one style sheet
SET_LANG, STYLE, STYLE_LOAD = "$Main.setLang", "h2d.domkit.Style", "h2d.domkit.Style.load"
LOADER, EXISTS, LOAD = "hxd.$Res.get_loader", "hxd.res.Loader.exists", "hxd.res.Loader.loadCache"
RESOURCE, JOIN = "hxd.res.Resource", "$String.__add__"
# a faction's file: this, its row's id, then the ending
FOLDER, ENDING = "UI/Styles/factions/", ".css"


def make_styles(bc):
    """p_styles(style): every faction row whose style file exists adds it to the sheet."""
    k = kinds(bc)
    sk = gv(field_by_name(bc, k.data, "faction", "the cdb")[1])
    rows_at, rows_kind = field_by_name(bc, sk, "all", "the faction sheet")
    cls = class_global(bc, kind_named(bc, RESOURCE))
    w = W(bc, (("style", kind_named(bc, STYLE)),), k.void)
    r = {n: w.reg(n, kind) for n, kind in (
        ("loader", returns_type(function_named(bc, LOADER), LOADER)), ("cdb", k.data),
        ("sheet", sk), ("all", gv(rows_kind)), ("rows", k.list), ("row", k.dyn),
        ("id", k.text), ("path", k.text), ("end", k.text),
        ("ok", returns_type(function_named(bc, EXISTS), EXISTS)),
        ("cls", gv(bc.global_types[cls])), ("res", argument_kind(bc, STYLE_LOAD, 0)),
        ("ref", argument_kind(bc, STYLE_LOAD, 1)), ("void", k.void))}
    w.add((w.op("JNull", reg=w.r["style"]), "done"))
    w.call(r["loader"], LOADER)
    w.add((w.op("JNull", reg=r["loader"]), "done"),
          w.op("GetGlobal", **{"dst": r["cdb"], "global": the_global_of(bc, "$Data")}))
    w.field(r["sheet"], r["cdb"], k.data, "faction")
    w.add((w.op("JNull", reg=r["sheet"]), "done"),
          w.op("Field", dst=r["all"], obj=r["sheet"], field=rows_at),
          (w.op("JNull", reg=r["all"]), "done"),
          # the rows' wrapper cast to a list, as the game's own key bindings walk theirs
          w.op("SafeCast", dst=r["rows"], src=r["all"]), (w.op("JNull", reg=r["rows"]), "done"))
    each(w, r["rows"], "i", ("next", "done"), r["row"])
    w.get(r["id"], r["row"], "id")
    w.add((w.op("JNull", reg=r["id"]), "next"))
    w.text(r["path"], FOLDER)
    w.call(r["path"], JOIN, r["path"], r["id"])
    w.text(r["end"], ENDING)
    w.call(r["path"], JOIN, r["path"], r["end"])
    w.call(r["ok"], EXISTS, r["loader"], r["path"])
    w.add((w.op("JFalse", cond=r["ok"]), "next"),
          w.op("GetGlobal", **{"dst": r["cls"], "global": cls}))
    w.call(r["res"], LOAD, r["loader"], r["path"], r["cls"])
    w.add((w.op("JNull", reg=r["res"]), "next"), w.op("Null", dst=r["ref"]))
    w.call(r["void"], STYLE_LOAD, w.r["style"], r["res"], r["ref"])
    w.add((w.op("JAlways"), "next"), "done:", w.op("Label"), w.op("Ret", ret=r["void"]))
    return w.finish()


def install(bc):
    from standalone import onoff
    if not onoff.on(NAME):
        return "factionstyles: OFF"
    fn, load = function_named(bc, SET_LANG), gv(function_named(bc, STYLE_LOAD).findex)
    sites = [i for i, o in enumerate(fn.ops) if o.op == "Call3" and gv(o.df["fun"]) == load]
    guard(len(sites) == 1, "%s loads its sheet %d times, expected once" % (SET_LANG, len(sites)))
    style, void = gv(fn.ops[sites[0]].df["arg0"]), a_new_place(bc, fn, kinds(bc).void)
    call = written(template(bc, "Call1"), dst=void, fun=make_styles(bc), arg0=style)
    went = insert(bc, fn, sites[0] + 1, [call], "factionstyles: after the sheet", traps.IN_PLAY)
    return "factionstyles: 1 function of ours, %d instruction(s) in the game's" % went
