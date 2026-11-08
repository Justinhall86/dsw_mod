"""Stop the engine complaining about OUR rows' scope, and leave its complaint about its own."""
from tools.hlcode import function_named, register_like, returns_type, template, written
from tools.project import gv, guard
from tools.splice import insert
from standalone import kit, onoff
from standalone.kit import C, _gv  # noqa: F401
from framework import boundary, traps
from framework.rowreader import reader_for

NAME = "quietscope"
# the other changes, by NAME, this one cannot work without; "attributes" is the framework
RELIES_ON = ("attributes",)

NEEDS = {
    # the one function that decides what scope a row should have had, and says so when it differs
    "scopecheck": "logic.AttributesManager.getExpectedAtbScope (",
}

# how many cases that function recognises, each with its own complaint
CASES = 4
# which argument of it carries the attribute's own number
THE_ROW = 1

# WHOSE ROWS GO QUIET: `True` is ours alone, the safe answer; the game's own rows earn it
OURS_ONLY = True


def install(bc):
    if not onoff.on(NAME):
        return "quietscope: OFF"
    return "quietscope: " + str(quiet(bc, kit.context(bc)))


def quiet(game, resolved):
    fn = resolved["funcs"]["scopecheck"]
    code = fn.ops
    reader = reader_for(game)

    lookup = boundary.id_lookup(game)
    minted = boundary.minted(game)
    guard(minted is not None, "the sentinel is not in this file yet -- the boundary goes first")
    guard(gv(list(fn.regs)[THE_ROW]) == returns_type(lookup, boundary.LOOKUP),
          "the engine's %dth argument is not the kind of number a row is" % THE_ROW)

    # ---- the four complaints, each found by the one call that makes it ----
    says = [i for i, o in enumerate(code) if o.op == "Call4"]
    guard(len(says) == CASES,
          "that function makes %d four-argument call(s), not the %d complaints it recognises"
          % (len(says), CASES))
    one = {gv(code[i].df["fun"]) for i in says}
    guard(len(one) == 1, "those %d calls do not all go to one place, so they are not one "
                         "complaint said four ways" % len(says))

    def place(kind):
        fn.regs.append(C(register_like(game, kind, reader.prefer)))
        fn.nregs.value = len(fn.regs)
        return len(fn.regs) - 1

    sentinel = place(gv(list(lookup.regs)[0]))
    where = place(returns_type(lookup, boundary.LOOKUP))

    def op(name, **operands):
        return written(template(game, name), **operands)

    # ---- back to front: a block put in earlier moves every instruction after it ----
    went_in = 0
    for which, says_at in reversed(list(enumerate(says))):
        # from just past the complaint's test to its call is the message, which we step over
        guards = [i for i in range(says_at) if code[i].op == "JFalse"]
        guard(guards, "complaint %d of %d is not guarded by a test" % (which + 1, CASES))
        at = guards[-1] + 1
        # it lands past the call, on the substitute scope the game returns anyway
        over = (says_at + 1) - at
        guard(over > 0, "complaint %d of %d does not come after the test that guards it"
              % (which + 1, CASES))
        if OURS_ONLY:
            # ours sits BELOW the sentinel in the sheet, which is a HIGHER number
            block = (boundary.emit_ask(op, gv(lookup.findex), minted, sentinel, where)
                     + [op("JSLt", a=where, b=THE_ROW, offset=over)])
        else:
            block = [op("JAlways", offset=over)]
        went_in += insert(game, fn, at, block,
                          "the scope complaint stepped over, %d of %d" % (which + 1, CASES),
                          traps.AT_AUTHORED_DATA)
    return ("%d instruction(s) across %d complaint(s) for %s, each landing on the scope the game "
            "returns anyway"
            % (went_in, len(says), "our rows" if OURS_ONLY else "every row"))
