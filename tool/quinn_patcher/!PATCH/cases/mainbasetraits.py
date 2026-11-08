#!/usr/bin/env python3
"""What proves `standalone/mainbasetraits.py`. It reads the patched window and changes nothing."""
from standalone import buildingtraits, kit, onoff
from standalone.kit import _gv
from standalone.mainbasetraits import HOLDS_THE_BASE, NAME, NEEDS  # noqa: F401
from tools.hlcode import field_by_name, function_named
from tools.project import gv, guard

# the game's own "does this building go in a village" -- named here ONLY to prove we never ask it
A_HOST_TEST = "ent.Structure.getOccupiedOutpostSlots"


def check(bc):
    if not onoff.on(NAME):
        return "off"
    resolved = kit.context(bc)
    fn = resolved["funcs"]["mb_panel"]
    wrapper = resolved["funcs"]["mb_wrapper"]
    ops = fn.ops

    panel_kind = gv(list(fn.regs)[0])
    dom_at, _ = field_by_name(bc, panel_kind, "dom", "a main base window")
    base_at, _ = field_by_name(bc, panel_kind, HOLDS_THE_BASE, "a main base window")
    entity_at, _ = field_by_name(bc, gv(list(wrapper.regs)[0]), "entity", "a selection panel")

    makes = _gv(function_named(bc, buildingtraits.MAKES_A_THING).findex)
    ours = [i for i, o in enumerate(ops) if o.op == "Call4" and _gv(o.df["fun"]) == makes]
    guard(ours, "the main base window makes no component at all")
    made = ours[0]
    after = ours[-1]                     # the window's own first component, now behind ours

    # (1) ours is in front of the window's own making
    asks_dom = [i for i, o in enumerate(ops)
                if o.op == "GetThis" and _gv(o.df["field"]) == dom_at]
    guard(asks_dom and asks_dom[0] < made,
          "the window takes its own root only after it makes something, so the row is not in front")
    guard(after > made, "nothing of the window's own is left behind our row")

    # (2) it asks for the main base, and never for the panel's own subject
    guard([i for i in range(made) if ops[i].op == "GetThis"
           and _gv(ops[i].df["field"]) == base_at],
          "the row never asks the window for the main base")
    if entity_at != base_at:
        guard(not [i for i in range(made) if ops[i].op == "GetThis"
                   and _gv(ops[i].df["field"]) == entity_at],
              "the copied run still reads the selection panel's own subject off this window, and "
              "on this window that place holds something else")

    # (3) what it made is hung off the window's own root
    root = [i for i in range(made) if ops[i].op == "GetThis" and _gv(ops[i].df["field"]) == dom_at]
    guard(root and _gv(ops[made].df["arg1"]) == _gv(ops[root[-1]].df["dst"]),
          "the row is hung off something other than this window's own root")

    # (4) and (5): out of the reckoning, then placed by hand
    for what, why in ((buildingtraits.OUT_OF_THE_RECKONING,
                       "the row still counts toward the window's size, so the window grows by it"),
                      (buildingtraits.PUT_IT_AT,
                       "the row is never placed, and nothing else is left to place it")):
        fun = _gv(function_named(bc, what).findex)
        guard(any(o.op.startswith("Call") and _gv(o.df.get("fun", -1)) == fun for o in ops),
              why)

    # ⛔ THE NEGATIVE ONE: no host test came along with the recipe
    try:
        host = _gv(function_named(bc, A_HOST_TEST).findex)
    except Exception:
        host = None
    if host is not None:
        guard(not [i for i in range(made) if ops[i].op.startswith("Call")
                   and _gv(ops[i].df.get("fun", -1)) == host],
              "the main base's row asks where a building goes, which no main base can answer")
    return "%d instruction(s) in front of the window's own first component" % made
