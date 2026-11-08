#!/usr/bin/env python3
"""OFF, a fixed-word stand-in for `::target3::` and up; `targetn.py` draws the real values."""
from standalone import kit, onoff
from standalone.kit import Anchors, C, _guard, _gv, _sv  # noqa: F401
from tools.hlcode import text_object
from tools.splice import insert
# the splicer, since a block going in MID-function needs every jump spanning the point stretched
from framework.traps import IN_PLAY

NAME = "press"
# the other changes, by NAME, this one cannot work without; "attributes" is the framework
RELIES_ON = ()

# the walker every marker family comes through; the adapter is the closure IT builds
NEEDS = {
    "textWalker": "static $HText.replaceStaticText (",
}

# one and two are the game's own; ours start here
LOWEST_OURS = 3
# what it answers with when switched on, in place of the column's value
PLACEHOLDER = "[press]"


def install(bc):
    if not onoff.on(NAME):
        return "press: OFF"
    return "press: " + str(apply_press(bc, kit.context(bc)))


def apply_press(game, resolved):
    walker = resolved["funcs"]["textWalker"]

    # ---- the adapter is resolved FROM the walker: the closure it hands to the marker map ----
    closures = [o for o in (walker.ops or []) if o.op == "InstanceClosure"]
    _guard(len(closures) == 1,
           "the text walker builds %d closures, so which one answers a marker is not obvious"
           % len(closures))
    made = _gv(closures[0].df["fun"])
    adapters = [f for f in game.functions if _gv(f.findex) == made]
    _guard(len(adapters) == 1, "the walker's closure does not resolve to one function")
    adapter = adapters[0]
    code = adapter.ops
    at = Anchors(adapter, resolved["global_text"], "the marker adapter")

    AT_ASK_FAMILY = at.first("CallClosure")           # handing the marker to whichever family
    answered = _gv(code[AT_ASK_FAMILY].df["dst"])
    AT_TEST = at.first("JNull", after=AT_ASK_FAMILY)
    AT_GIVE_UP = at.first("Int", after=AT_TEST)       # the verbatim re-emit begins here
    _guard(_gv(code[AT_TEST].df["reg"]) == answered,
           "the test after the family call does not look at the family's answer")
    AT_DECLINED = at.first("Ret", after=(AT_REEMIT := at.first("Call2", after=AT_GIVE_UP)))
    _guard(_gv(code[AT_DECLINED].df["ret"]) == _gv(code[AT_REEMIT].df["dst"]), "decline re-emits")
    _guard((code[AT_GIVE_UP].df or {}).get("offset") is None,
           "the instruction we go in front of is a jump, and hooking one moves where it lands")

    # THE NUMBER THE MARKER CARRIES, already parsed by the adapter and taken from its test
    kinds = [_gv(r) for r in adapter.regs]
    name_arg = _gv(code[AT_ASK_FAMILY].df["args"].value[0])
    # of the adapter's null tests, the one about something that is not text is the number
    AT_HAS_NUMBER = None
    for i in range(AT_ASK_FAMILY):
        o = code[i]
        if o.op == "JNotNull" and kinds[_gv(o.df["reg"])] != kinds[name_arg]:
            AT_HAS_NUMBER = i
            break
    _guard(AT_HAS_NUMBER is not None,
           "the adapter asks about no number before it hands the marker to a family")
    number = _gv(code[AT_HAS_NUMBER].df["reg"])

    # ---- places of our own: the number as a plain one, what we compare it against, the answer ----
    def new_reg(like):
        r = C(adapter.regs[like])
        adapter.regs.append(r)
        return len(adapter.regs) - 1

    counted = _gv(code[AT_GIVE_UP].df["dst"])      # the re-emit's own number register, so a number
    plain = new_reg(counted)
    lowest = new_reg(counted)
    answer = new_reg(name_arg)                     # typed like the marker's own name: text
    try:
        adapter.nregs.value = len(adapter.regs)
    except Exception:
        pass

    # ---- the block ----
    block = []

    def emit(op):
        block.append(op)
        return len(block) - 1

    # no number -> leave it to the game; ⛔ cloned from the `JNull`, never the `JNotNull`
    _guard(code[AT_TEST].op == "JNull" and code[AT_HAS_NUMBER].op == "JNotNull",
           "the two tests this reads are not the two shapes it needs")
    no_number = _sv(C(code[AT_TEST]), "reg", number)
    jump_when_none = emit(no_number)

    # the number, as a plain one this can compare; these templates may come from anywhere
    unwrap = C(resolved["template"]("SafeCast"))
    _sv(unwrap, "dst", plain)
    _sv(unwrap, "src", number)
    emit(unwrap)
    emit(_sv(_sv(C(code[AT_GIVE_UP]), "dst", lowest), "ptr",
             resolved["int_index_or_add"](LOWEST_OURS)))

    # one or two is the game's own marker -> leave it alone
    below = C(resolved["template"]("JSLt"))
    _sv(below, "a", plain)
    _sv(below, "b", lowest)
    jump_when_theirs = emit(below)

    # ours: answer it, instead of the marker being re-emitted as written
    emit(_sv(_sv(C(resolved["template"]("GetGlobal")), "dst", answer),
             "global", text_object(game, PLACEHOLDER)))
    emit(_sv(C(code[AT_DECLINED]), "ret", answer))

    # both refusals land on the instruction after the block, which is the re-emit we went before
    for where in (jump_when_none, jump_when_theirs):
        _sv(block[where], "offset", len(block) - (where + 1))

    went_in = insert(game, adapter, AT_GIVE_UP, block, "the press", IN_PLAY)
    return ("press (%d instructions on the decline path of f@%d, answering %s and up)"
            % (went_in, _gv(adapter.findex), LOWEST_OURS))
