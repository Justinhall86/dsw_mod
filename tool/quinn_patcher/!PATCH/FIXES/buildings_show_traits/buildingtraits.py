"""Show a village building's own traits in a row above its window, placed by hand, uncounted."""
from copy import deepcopy

from tools.hlcode import (argument_kind, assemble, field_by_name, function_named, kind_named,
                          number, register_like, returns_type, template, written)
from tools.project import gv, guard
from tools.splice import insert
from standalone import kit, onoff
from standalone.kit import _guard, _gv  # noqa: F401
from framework import oneline, sayonce, traps

NAME = "buildingtraits"
# the other changes, by NAME, this one cannot work without; "attributes" is the framework
RELIES_ON = ()

# the control for the main base row: the SAME two lines, in the block known to draw
SAYING = "buildingtraitssaying"
RUNS, DRAWN = "BTRAITS: the block runs", "BTRAITS: the row is made and placed"

NEEDS = {
    # the window every building panel is built on -- its title bar is the first thing it makes
    "panel": "ui.hud.BaseBuildingUI.init (",
    # the game's own "does this building go in a village", for the group and the number
    "counting": "ent.Structure.getOccupiedOutpostSlots (",
    # the panel that already draws a trait strip above a unit, an army or a village
    "wrapper": "ui.comp.EntitySelection.init (",
}

MAKES_A_THING = "static domkit.$Properties.createNew"
ASKS_FOR_TRAITS = "ent.Object.get_traits"
A_PANEL = "h2d.Flow"
MADE_OF = "domkit.Properties"
HOW_IT_SITS = "h2d.Flow.getProperties"
OUT_OF_THE_RECKONING = "h2d.FlowProperties.set_isAbsolute"
PUT_IT_AT = "h2d.Object.set_y"

# ⚠ the row's own height above the window (the stylesheet's 32 + 2 * 2), NOT the -64 margin
TRAIT_ICON = 32
ROW_PADDING = 2
LIFT_ABOVE = TRAIT_ICON + 2 * ROW_PADDING

# the operands that name a place, so a jump's distance is never mistaken for one
PLACES_IN = ("dst", "src", "obj", "array", "index", "reg", "a", "b",
             "arg0", "arg1", "arg2", "arg3")
# what a run that makes one component is made of. A jump among them would mean this is not one run
MAKING = ("GetGlobal", "Int", "Type", "Call2", "UnsafeCast", "Call1", "Bool", "Ref", "New",
          "DynSet", "SetField", "SetThis", "SetArray", "NullCheck", "Field", "SafeCast", "GetThis",
          "Call4")

def install(bc):
    if not onoff.on(NAME):
        return "buildingtraits: OFF"
    return "buildingtraits: " + str(apply_it(bc, kit.context(bc)))


def the_outpost_number(counting, where):
    """The number a building's group holds when it goes in a village; ⛔ it names the HOST."""
    code = counting.ops
    asks = [i for i, o in enumerate(code)
            if o.op == "JNotEq" and code[i - 1].op == "Int" and code[i - 2].op == "Field"
            and gv(code[i - 2].df["field"]) == where]
    guard(len(asks) == 1,
          "the count compares a building's group against a number %d time(s), so which one asks "
          "where a building goes is not obvious" % len(asks))
    return gv(code[asks[0] - 1].df["ptr"]), asks[0] - 1


def one_run_back_from(code, end):
    """Where the run making one component begins: the last write to the place it names from."""
    names_it = gv(code[end].df["arg0"])
    wrote = [i for i in range(end) if gv(code[i].df.get("dst", -1)) == names_it]
    guard(wrote, "the line that makes it takes its name from a place nothing ever writes")
    start = wrote[-1]
    guard(code[start].op == "GetGlobal",
          "that run begins with a %s, not with the name of a thing to make" % code[start].op)
    crossed = [i for i in range(start, end) if code[i].op.startswith("J")]
    guard(not crossed, "that run is cut by a %s, so it is not one run" % code[crossed[0]].op
          if crossed else "")
    return start


def the_strip(game, wrapper):
    """The selection panel's own trait strip: where its run starts and where it ends."""
    makes = gv(function_named(game, MAKES_A_THING).findex)
    asking = gv(function_named(game, ASKS_FOR_TRAITS).findex)
    code = wrapper.ops
    hands = [i for i, o in enumerate(code) if o.op == "Call1" and gv(o.df["fun"]) == asking]
    guard(hands, "the selection panel never asks an entity for its traits")
    ends = [i for i in range(hands[0], len(code))
            if code[i].op == "Call4" and gv(code[i].df["fun"]) == makes]
    guard(ends, "the selection panel asks for a trait list and then makes nothing")
    end = ends[0]
    start = one_run_back_from(code, end)
    guard(start <= hands[0] <= end,
          "the selection panel asks for the traits outside the run that makes the strip")
    return start, end


def in_front_of_the_title(game, fn):
    """Where the window makes its first component -- our strip has to go in front of that one."""
    makes = gv(function_named(game, MAKES_A_THING).findex)
    code = fn.ops
    mine = [i for i, o in enumerate(code) if o.op == "Call4" and gv(o.df["fun"]) == makes]
    guard(mine, "the window makes nothing at all")
    return one_run_back_from(code, mine[0]), gv(code[mine[0]].df["arg1"])


def apply_it(game, resolved):
    fn = resolved["funcs"]["panel"]
    code = fn.ops
    counting = resolved["funcs"]["counting"]
    wrapper = resolved["funcs"]["wrapper"]

    panel_kind = gv(list(fn.regs)[0])
    row_at, row_kind = field_by_name(game, panel_kind, "inf", "a building window")
    where, _ = field_by_name(game, row_kind, "group", "a building's row")
    outpost, numbered = the_outpost_number(counting, where)
    dom_at, _ = field_by_name(game, panel_kind, "dom", "a building window")
    b_at, b_kind = field_by_name(game, panel_kind, "b", "a building window")

    entity_at, _ = field_by_name(game, gv(list(wrapper.regs)[0]), "entity", "a selection panel")
    start, end = the_strip(game, wrapper)
    at, dom_reg = in_front_of_the_title(game, fn)

    def place(of, like):
        fn.regs.append(deepcopy(list(of.regs)[like]))
        fn.nregs.value = len(fn.regs)
        return len(fn.regs) - 1

    def op(name, **operands):
        return written(template(game, name), **operands)

    rows = [i for i, o in enumerate(code) if o.op == "GetThis" and gv(o.df["field"]) == row_at]
    guard(rows, "the window never takes the building's row off itself")
    row = place(fn, gv(code[rows[0]].df["dst"]))
    group = place(counting, gv(counting.ops[numbered].df["dst"]))
    wanted = place(counting, gv(counting.ops[numbered].df["dst"]))
    root = place(fn, dom_reg)

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
        # ⛔ the selection panel files what it made on ITSELF; on a building window that corrupts
        if wrapper.ops[i].op == "SetThis":
            continue
        one = deepcopy(wrapper.ops[i])
        for slot in PLACES_IN:
            if slot in one.df:
                one.df[slot].value = here(gv(one.df[slot]))
        if one.op == "GetThis" and gv(wrapper.ops[i].df["field"]) == entity_at:
            one.df["field"].value = b_at      # the building, not whatever that panel was about
            asked = gv(one.df["dst"])
        if i == end:
            one.df["arg1"].value = root       # our window's root, not that panel's container
            made = gv(one.df["dst"])
        copied.append(one)
    guard(asked is not None, "the copied strip never takes the thing it is about off the panel")
    guard(made is not None, "the copied strip never hands back the thing it made")
    # the place it reads into holds a building here, and a register states what it holds
    fn.regs[asked] = deepcopy(register_like(game, b_kind))

    # ---- and the row is taken out of the window's own reckoning ----
    def spare(kind):
        fn.regs.append(deepcopy(register_like(game, kind)))
        fn.nregs.value = len(fn.regs)
        return len(fn.regs) - 1

    obj_at, obj_kind = field_by_name(game, kind_named(game, MADE_OF), "obj", "a made thing")
    asking = function_named(game, HOW_IT_SITS)
    floating = function_named(game, OUT_OF_THE_RECKONING)
    moving = function_named(game, PUT_IT_AT)
    strip_obj, root_obj = spare(obj_kind), spare(obj_kind)
    root_flow = spare(kind_named(game, A_PANEL))
    sits = spare(returns_type(asking, HOW_IT_SITS))
    yes = spare(argument_kind(game, OUT_OF_THE_RECKONING))
    lifted = spare(argument_kind(game, PUT_IT_AT))
    # told not to count toward the window's size, so it is placed by hand where the margin had it
    taken_out = [
        op("Field", dst=strip_obj, obj=made, field=obj_at),
        op("Field", dst=root_obj, obj=root, field=obj_at),
        op("SafeCast", dst=root_flow, src=root_obj),
        op("Call2", dst=sits, fun=gv(asking.findex), arg0=root_flow, arg1=strip_obj),
        op("Bool", dst=yes, value=True),
        op("Call2", dst=yes, fun=gv(floating.findex), arg0=sits, arg1=yes),
        op("Int", dst=wanted, ptr=number(game, LIFT_ABOVE)),
        op("ToSFloat", dst=lifted, src=wanted),
        op("Neg", dst=lifted, src=lifted),
        op("Call2", dst=lifted, fun=gv(moving.findex), arg0=strip_obj, arg1=lifted),
    ]

    # every refusal lands on the Label at the end, and the window carries on making itself
    said = oneline.places(game, fn) if onoff.on(SAYING) else None
    reached = oneline.emit(game, fn, op, said, [RUNS], sayonce.BYPASS) if said else []
    drawn = oneline.emit(game, fn, op, said, [DRAWN], sayonce.BYPASS) if said else []

    block = assemble(
        reached
        + [op("GetThis", **{"dst": row, "field": row_at}),
         (op("JNull", reg=row), "LEAVE"),
         op("Field", dst=group, obj=row, field=where),
         op("Int", dst=wanted, ptr=outpost),
         (op("JNotEq", a=group, b=wanted), "LEAVE"),
         op("GetThis", **{"dst": root, "field": dom_at}),
         (op("JNull", reg=root), "LEAVE")]
        + copied
        + taken_out
        + drawn
        + ["LEAVE:", op("Label")])

    went_in = insert(game, fn, at, block, "a village building shows its own traits", traps.IN_PLAY)
    return ("%d instruction(s) in front of the window's first component, %d of them the selection "
            "panel's own strip" % (went_in, len(copied)))
