#!/usr/bin/env python3
"""Where tiers enter the game: each resource's update, and Standing's tooltip block for any."""
from tools.project import gv, guard
from tools.hlcode import call_sites, function_named, lands_at, template, text_object, written
from tools.splice import insert
from framework import traps
from framework.parsed import a_new_place

import tiers
from trades import kinds

NAME = "tiers"
TIP = "ui.comp.$TipContent.fromRes"
TIERS_UI = "ui.win.$StandingTiers.__constructor__"
ROW_UI = "ui.win.$FactionStanding.__constructor__"
AMOUNT = "$HTools.getResAmount"
# Standing's block opens 6 before its active tier is asked; its test starts 20 before that
OPENS, TESTED = 6, 20


def op(bc, what, **operands):
    return written(template(bc, what), **operands)


def call_to(at_op, findex):
    """The same call with the same places, to one of ours instead."""
    at_op.df["fun"].value = findex


def one_site(fn, name, bc):
    sites = call_sites(fn, function_named(bc, name))
    guard(len(sites) == 1, "%s calls %s %d times, expected once" % (fn.findex, name, len(sites)))
    return sites[0]


def updates(bc, have):
    """Each resource's own update ends by setting its tiers' traits."""
    fn = function_named(bc, tiers.UPDATE)
    end = len(fn.ops) - 1
    guard(fn.ops[end].op == "Ret", "%s does not end on its return" % tiers.UPDATE)
    void = a_new_place(bc, fn, kinds(bc).void)
    block = [op(bc, "Call2", dst=void, fun=have["tick"], arg0=0, arg1=1)]
    return insert(bc, fn, end, block, "tiers: each tier's traits", traps.PER_TICK)


def _opening(bc, fn):
    """Where Standing's tooltip block is asked its active tier, opens, and is tested for."""
    info = one_site(fn, tiers.ACTIVE_INFO, bc)
    start, test = info - OPENS, info - OPENS - TESTED
    entered = [i for i, o in enumerate(fn.ops) if o.op == "JEq" and lands_at(o, i) == start]
    guard(fn.ops[start].op == "NullCheck" and entered,
          "Standing's tooltip block does not open %d before its active tier" % OPENS)
    guard(fn.ops[test].op == "Field" and gv(fn.ops[test].df["obj"]) == 0
          and fn.ops[test + 6].op == "String", "Standing's test does not start where read")
    return {"info": info, "start": start, "test": test}


def _closing(bc, fn, info):
    """Where Standing's block shows its bonuses, lists the factions, and ends."""
    guard(fn.ops[info + 1].op == "JNull" and fn.ops[info + 11].op == "ToVirtual",
          "the active tier is not checked for nothing, or its trait row not made")
    end = lands_at(fn.ops[info + 1], info + 1)
    guard(fn.ops[end].op == "JAlways", "Standing's tooltip block does not end where read")
    trait = gv(fn.ops[info + 11].df["dst"])
    checks = [i for i in range(info + 12, end) if fn.ops[i].op == "NullCheck"
              and gv(fn.ops[i].df["reg"]) == trait]
    ladder, rows = one_site(fn, TIERS_UI, bc), call_sites(fn, function_named(bc, ROW_UI))
    guard(checks and len(rows) == 2 and fn.ops[ladder + 3].op == "New"
          and fn.ops[rows[-1] + 1].op == "JAlways", "the faction rows do not follow the ladder")
    return {"end": end, "trait": trait, "bonus": checks[0], "council": ladder + 3,
            "after": rows[-1] + 2}


def tooltip(bc, have):
    """Standing's block runs for any resource with tiers, the ladder handed that one's own."""
    k = kinds(bc)
    fn = function_named(bc, TIP)
    p = _opening(bc, fn)
    p.update(_closing(bc, fn, p["info"]))
    call_to(fn.ops[p["info"]], have["info"])
    for at in call_sites(fn, function_named(bc, tiers.LANDSRAAD)):
        call_to(fn.ops[at], have["shows"])
    void, b, hid = (a_new_place(bc, fn, k.void), a_new_place(bc, fn, k.bool),
                    a_new_place(bc, fn, k.bool))
    end, bonus, council, test = p["end"], p["bonus"], p["council"], p["test"]
    went = insert(bc, fn, end, [op(bc, "Call0", dst=void, fun=have["end"])],
                  "tiers: the game's ladder back", traps.IN_PLAY)
    went += insert(bc, fn, bonus, [op(bc, "JNull", reg=p["trait"], offset=end - bonus)],
                   "tiers: a tier with no trait shows no bonuses", traps.IN_PLAY)
    went += insert(bc, fn, council, [op(bc, "Call0", dst=hid, fun=have["hidden"]),
                                     op(bc, "JTrue", cond=hid, offset=p["after"] - council)],
                   "tiers: the faction rows only with showCouncil", traps.IN_PLAY)
    went += insert(bc, fn, test, [op(bc, "Call2", dst=b, fun=have["begin"], arg0=0, arg1=1),
                                  op(bc, "JTrue", cond=b, offset=p["start"] - test)],
                   "tiers: a resource with tiers draws Standing's block", traps.IN_PLAY)
    return went


def ladder_parts(bc, have):
    """The ladder's tier marker and each faction's row read the drawn resource, not Standing."""
    fn = function_named(bc, TIERS_UI)
    call_to(fn.ops[one_site(fn, tiers.ACTIVE_INDEX, bc)], have["index"])
    row = function_named(bc, ROW_UI)
    amount, stock = one_site(row, AMOUNT, bc), one_site(row, tiers.STOCK, bc)
    named = gv(row.ops[amount].df["arg0"])
    said = max(i for i in range(stock, amount)
               if row.ops[i].op == "GetGlobal" and gv(row.ops[i].df["dst"]) == named)
    index = gv(row.ops[stock].df["arg1"])
    guard(row.ops[stock - 1].op == "Int" and gv(row.ops[stock - 1].df["dst"]) == index,
          "a faction's row does not name Standing's index just before reading it")
    went = insert(bc, row, said + 1, [op(bc, "Call1", dst=named, fun=have["id_or"], arg0=named)],
                  "tiers: a faction's council gain of the drawn resource", traps.IN_PLAY)
    went += insert(bc, row, stock, [op(bc, "Call1", dst=index, fun=have["index_or"],
                                       arg0=index)],
                   "tiers: a faction's stock of the drawn resource", traps.IN_PLAY)
    return went


def minus_once(bc):
    """A faction's council loss reads -4, not --4: the number already carries its minus."""
    row = function_named(bc, ROW_UI)
    amount = one_site(row, AMOUNT, bc)
    # its loss branch: below zero, a text, then the number written out and joined to it
    said = next(i for i in range(amount, amount + 8) if row.ops[i].op == "GetGlobal")
    guard(row.ops[said - 1].op == "JSGte" and [o.op for o in row.ops[said + 1:said + 6]]
          == ["Mov", "Ref", "Call2", "Call2", "Call2"],
          "a faction's row does not put a minus before a council loss")
    row.ops[said].df["global"].value = text_object(bc, "")
    return 0


def install(bc):
    from standalone import onoff
    if not onoff.on(NAME):
        return "tiers: OFF"
    have = tiers.install(bc)
    went = updates(bc, have) + tooltip(bc, have) + ladder_parts(bc, have) + minus_once(bc)
    return "tiers: %d function(s) of ours, %d instruction(s) in the game's" % (len(have), went)
