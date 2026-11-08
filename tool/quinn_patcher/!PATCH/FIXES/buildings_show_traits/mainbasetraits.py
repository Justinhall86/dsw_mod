"""Show a main base's own traits in a row above its window, the way a village building does."""
from copy import deepcopy

from tools.hlcode import (argument_kind, assemble, field_by_name, function_named, kind_named,
                          number, register_like, returns_type, template, written)
from tools.project import gv, guard
from tools.splice import insert
from standalone import buildingtraits, kit, onoff
from standalone.kit import _guard, _gv  # noqa: F401
from framework import oneline, sayonce, traps

NAME = "mainbasetraits"
# the other changes, by NAME, this one cannot work without; "attributes" is the framework
RELIES_ON = ("buildingtraits",)

# ⛔ EVERY KEY IS MERGED INTO ONE SHEET WITH EVERY OTHER FEATURE'S, so each is prefixed
NEEDS = {
    # the window a main base opens, from `ui/hud/StructureUI.hx`; ⛔ not MainBaseHeadquarterUI
    "mb_panel": "ui.hud.StructureCity.init (",
    # the panel that already draws a trait strip above a unit, an army or a village
    "mb_wrapper": "ui.comp.EntitySelection.init (",
}

# what the city panel calls the thing it is about, an `ent.Structure`, which a main base is
HOLDS_THE_BASE = "structure"

# the diagnosis, on its own switch, so the sheet stays the only door to a word of ours
SAYING = "mainbasetraitssaying"


def where_the_dom_paths_meet(code, dom_at):
    """The one instruction both halves of a generated window's opening reach, ahead of its jump."""
    sets = [i for i, o in enumerate(code) if o.op == "SetThis" and gv(o.df["field"]) == dom_at]
    jumps = [i for i in range(sets[0], len(code)) if code[i].op == "JAlways"] if sets else []
    # a window written by hand has neither half, and its first component is the right place
    if not sets or not jumps:
        return None
    meet = jumps[0] + 1 + gv(code[jumps[0]].df["offset"])
    guard(sets[0] < meet < len(code),
          "the halves meet at %d, outside the window's own instructions" % meet)
    return meet


def install(bc):
    if not onoff.on(NAME):
        return "mainbasetraits: OFF"
    return "mainbasetraits: " + str(apply_it(bc, kit.context(bc)))


def apply_it(game, resolved):
    """The main base's own case of the general row below."""
    return draw_own_traits(game, resolved, "mb_panel", "mb_wrapper", HOLDS_THE_BASE,
                           "a main base window", "a main base shows its own traits",
                           SAYING, "MBTRAITS", "the city panel")


def draw_own_traits(game, resolved, panel, wrapper_key, holds, what, label, saying, tag, site):
    """One window's own traits, drawn above it. Every name a window differs by is an argument."""
    fn = resolved["funcs"][panel]
    code = fn.ops
    wrapper = resolved["funcs"][wrapper_key]

    panel_kind = gv(list(fn.regs)[0])
    dom_at, _ = field_by_name(game, panel_kind, "dom", what)
    base_at, base_kind = field_by_name(game, panel_kind, holds, what)

    entity_at, _ = field_by_name(game, gv(list(wrapper.regs)[0]), "entity", "a selection panel")
    start, end = buildingtraits.the_strip(game, wrapper)
    # the building's helper says which place holds a root; WHERE the row goes is what differs
    title_at, dom_reg = buildingtraits.in_front_of_the_title(game, fn)
    meet = where_the_dom_paths_meet(code, dom_at)
    at = title_at if meet is None else meet

    def place(of, like):
        fn.regs.append(deepcopy(list(of.regs)[like]))
        fn.nregs.value = len(fn.regs)
        return len(fn.regs) - 1

    def op(name, **operands):
        return written(template(game, name), **operands)

    root = place(fn, dom_reg)
    # a whole number to lift the row by, in a place this window already writes one into
    ints = [gv(o.df["dst"]) for o in code if o.op == "Int"]
    guard(ints, "%s never makes a whole number, so there is no place to copy" % what)
    wanted = place(fn, ints[0])

    # ---- the selection panel's strip, copied, every place of its own made fresh here ----
    mapping = {}

    def here(there):
        if there not in mapping:
            fn.regs.append(deepcopy(list(wrapper.regs)[there]))
            fn.nregs.value = len(fn.regs)
            mapping[there] = len(fn.regs) - 1
        return mapping[there]

    copied, asked, made = [], None, None
    for i in range(start, end + 1):
        # ⛔ the selection panel files what it made on ITSELF; on a main base window that corrupts
        if wrapper.ops[i].op == "SetThis":
            continue
        one = deepcopy(wrapper.ops[i])
        for slot in buildingtraits.PLACES_IN:
            if slot in one.df:
                one.df[slot].value = here(gv(one.df[slot]))
        if one.op == "GetThis" and gv(wrapper.ops[i].df["field"]) == entity_at:
            one.df["field"].value = base_at   # the main base, not whatever that panel was about
            asked = gv(one.df["dst"])
        if i == end:
            one.df["arg1"].value = root       # our window's root, not that panel's container
            made = gv(one.df["dst"])
        copied.append(one)
    guard(asked is not None, "the copied strip never takes the thing it is about off the panel")
    guard(made is not None, "the copied strip never hands back the thing it made")
    # the place it reads into holds a main base here, and a register states what it holds
    fn.regs[asked] = deepcopy(register_like(game, base_kind))

    # ---- and the row is taken out of the window's own reckoning ----
    def spare(kind):
        fn.regs.append(deepcopy(register_like(game, kind)))
        fn.nregs.value = len(fn.regs)
        return len(fn.regs) - 1

    obj_at, obj_kind = field_by_name(game, kind_named(game, buildingtraits.MADE_OF), "obj",
                                     "a made thing")
    asking = function_named(game, buildingtraits.HOW_IT_SITS)
    floating = function_named(game, buildingtraits.OUT_OF_THE_RECKONING)
    moving = function_named(game, buildingtraits.PUT_IT_AT)
    strip_obj, root_obj = spare(obj_kind), spare(obj_kind)
    root_flow = spare(kind_named(game, buildingtraits.A_PANEL))
    sits = spare(returns_type(asking, buildingtraits.HOW_IT_SITS))
    yes = spare(argument_kind(game, buildingtraits.OUT_OF_THE_RECKONING))
    lifted = spare(argument_kind(game, buildingtraits.PUT_IT_AT))
    # told not to count toward the window's size, so it is placed by hand where the margin had it
    taken_out = [
        op("Field", dst=strip_obj, obj=made, field=obj_at),
        op("Field", dst=root_obj, obj=root, field=obj_at),
        op("SafeCast", dst=root_flow, src=root_obj),
        op("Call2", dst=sits, fun=gv(asking.findex), arg0=root_flow, arg1=strip_obj),
        op("Bool", dst=yes, value=True),
        op("Call2", dst=yes, fun=gv(floating.findex), arg0=sits, arg1=yes),
        op("Int", dst=wanted, ptr=number(game, buildingtraits.LIFT_ABOVE)),
        op("ToSFloat", dst=lifted, src=wanted),
        op("Neg", dst=lifted, src=lifted),
        op("Call2", dst=lifted, fun=gv(moving.findex), arg0=strip_obj, arg1=lifted),
    ]

    # every refusal lands on the closing Label; ⛔ NO HOST TEST, as a main base has no host
    said = oneline.places(game, fn) if onoff.on(saying) else None
    runs, made = "%s: the block runs" % tag, "%s: the row is made and placed" % tag
    reached = oneline.emit(game, fn, op, said, [runs], sayonce.BYPASS) if said else []
    drawn = oneline.emit(game, fn, op, said, [made], sayonce.BYPASS) if said else []

    block = assemble(
        reached
        + [op("GetThis", **{"dst": root, "field": dom_at}),
           (op("JNull", reg=root), "LEAVE")]
        + copied
        + taken_out
        + drawn
        + ["LEAVE:", op("Label")])

    went_in = insert(game, fn, at, block, label, traps.IN_PLAY)
    return ("%d instruction(s) at %s of %s, %d of them the selection panel's own strip"
            % (went_in, "the meeting point" if meet is not None else "the first component",
               site, len(copied)))
