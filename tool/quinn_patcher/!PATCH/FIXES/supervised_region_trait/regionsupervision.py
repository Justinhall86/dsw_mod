#!/usr/bin/env python3
"""A region an agent supervises gains the named trait, by the game's own case, cloned."""
from standalone import kit, onoff
from standalone.kit import Anchors, C, _guard, _gv, _sv  # noqa: F401
from tools.splice import insert
# ⚠ the one thing borrowed from the spine: the splicer's kind word, as a splice made in play
from framework.traps import IN_PLAY

NAME = "regionsupervision"
# the other changes, by NAME, this one cannot work without; "attributes" is the framework
RELIES_ON = ()

# the one function this reaches into, by its exact signature
NEEDS = {
    "agentTraits": "logic.faction.Agent.updateTraits (logic.faction.Agent) -> Void",
}

# the region assignment, by its name in the game's own enum
REGION_SUPERVISION = "RegionSupervision"


def install(bc):
    # off means this build does not carry it; see `standalone/onoff.py`
    if not onoff.on(NAME):
        return "regionsupervision: OFF"
    return "regionsupervision: " + str(apply_region_supervision(bc, kit.context(bc)))


def _construct(game, type_index, name):
    enum = game.types[type_index]
    names = [game.strings.value[_gv(c.name)] for c in getattr(enum, "definition", enum).constructs]
    _guard(names.count(name) == 1, "the assignment enum names %s" % name)
    return names.index(name)


def apply_region_supervision(game, resolved):
    patched = resolved["funcs"]["agentTraits"]
    code = patched.ops
    at = Anchors(patched, resolved["global_text"], "the agent's traits")

    # ---- the places, described; the region case is read off the switch's OWN table ----
    AT_SWITCH = at.first("Switch")
    AT_ASSIGNMENT_KIND = at.before("EnumIndex", AT_SWITCH)      # which assignment this agent has
    held = _gv(code[AT_ASSIGNMENT_KIND].df["value"])
    AT_READ_ASSIGNMENT = at.before("GetThis", AT_ASSIGNMENT_KIND, dst=held)
    AT_CHECKED = at.checking("NullCheck", held, after=AT_READ_ASSIGNMENT)
    AT_EARLY_RETURN = at.first("Ret")                           # the return that skips the switch
    AT_HOOK = at.before("Call2", AT_EARLY_RETURN)
    AT_ASKED = at.before("Call1", AT_HOOK)                      # asking whether traits are applied
    _guard(AT_CHECKED < AT_ASSIGNMENT_KIND, "the assignment is not read the way this expects")
    _guard(at.first("JTrue", after=AT_ASKED) < AT_HOOK,
           "the answer to that question is not tested before the call we go in front of")
    region = _construct(game, _gv(patched.regs[held]), REGION_SUPERVISION)

    offsets = [_gv(x) for x in _gv(code[AT_SWITCH].df["offsets"])]
    _guard(len(offsets) > region,
           "the assignment switch has %d branches, too few to carry the region one" % len(offsets))
    case_from = AT_SWITCH + 1 + offsets[region]
    _guard(code[case_from].op == "EnumField" and _gv(code[case_from].df["construct"]) == region,
           "the switch does not send the region assignment where this expects")

    # the case ends at its own loop's back-edge: the jump that goes BACKWARDS to a label inside it
    case_to = None
    for i in range(case_from, len(code)):
        o = code[i]
        if o.op == "JAlways" and _gv(o.df["offset"]) < 0:
            lands = i + 1 + _gv(o.df["offset"])
            if lands >= case_from and code[lands].op == "Label":
                case_to = i
                break
    _guard(case_to is not None, "the region case has no loop of its own to end on")

    # ---- the block: the gate, then the game's own case, cloned ----
    block = [C(code[AT_READ_ASSIGNMENT]), C(code[AT_CHECKED]), C(code[AT_ASSIGNMENT_KIND])]
    kind_reg = _gv(code[AT_ASSIGNMENT_KIND].df["dst"])

    # A NUMBER TO COMPARE AGAINST, in the register the cloned instruction uses, so typed a number
    an_int = code[at.first("Int")]
    want = C(an_int)
    scratch = _gv(an_int.df["dst"])
    _sv(want, "dst", scratch)
    _sv(want, "ptr", resolved["int_index_or_add"](region))
    block.append(want)

    # not the region assignment -> step over everything below and let the displaced call run
    skip = C(code[at.first("JNotEq")])
    _sv(skip, "a", kind_reg)
    _sv(skip, "b", scratch)
    block.append(skip)
    gate_at = len(block) - 1

    # the case itself, copied whole; a jump that leaves the run is sent past our block instead
    leaving = []
    for i in range(case_from, case_to + 1):
        o = C(code[i])
        for slot in ("offset",):
            if slot not in (o.df or {}):
                continue
            lands = i + 1 + _gv(o.df[slot])
            if not (case_from <= lands <= case_to + 1):
                leaving.append((i, lands))
                _sv(o, slot, (case_to + 1) - (i + 1))      # aim it at the end of the run instead
        block.append(o)

    # the gate and anything that left the case land after our block, on the displaced call
    _sv(block[gate_at], "offset", len(block) - (gate_at + 1))

    went_in = insert(game, patched, AT_HOOK, block, "the region supervision grant",
                     IN_PLAY)
    return ("region supervision (%d instructions, the case cloned from op%d to op%d, %d jump(s) "
            "sent past it)" % (went_in, case_from, case_to, len(leaving)))
