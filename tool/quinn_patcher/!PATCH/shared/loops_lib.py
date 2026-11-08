#!/usr/bin/env python3
"""LOOPS FOR THE LOAN-WEEK TOOLKIT -- the prerequisite for the numbered slot families.

Every block written here so far is straight-line and forward-only: `capturecancel` and kin compute
each bail offset by hand and assert it is positive. A family loop (`Ability_1`, `Ability_2`, ...
until the row is absent) needs a BACK-EDGE, so the offsets stop being computable by hand and the
forward-only assumption has to go -- carefully, because getting this wrong is one of the most
expensive mistakes in this project's history.

THE RULE, from HANDOFF.md GOTCHAS group A, and it is not negotiable:
    A BACK-EDGE MUST LAND ON A `Label` OP.
All 18,462 backward jumps in vanilla land on one, without exception; HashLink uses `OLabel` to mark
a loop header for the JIT. Every appended loop that ever crashed this game omitted it. A label in a
BUILD SCRIPT's bookkeeping is not a `Label` op -- the op must actually be emitted.

AND THE GAME ITSELF IS THE WORKED EXAMPLE, on the very rows a family loop walks:
`ui.comp.InputBindings.init` f@28115 ops 22-49 --
    22 Int i, 0                              23 Label            <- the header, a real op
    24 NullCheck rows                        25 Field len
    26 JSGte i >= len -> 107                 27 Mov / 28 Incr i
    ... body ...                             49 JAlways -> 23    <- the back-edge, onto the Label
That is the shape produced below, and it is the shape asserted.

PRECISION worth keeping (GOTCHAS group A): the rule is about LOOP HEADERS, not about every
backward jump. A jump that closes no cycle -- a trampoline return, say -- may land anywhere. This
module only ever emits cycle-closing back-edges, so it applies the strict rule to all of them.

AND THE STAGE H RULE (HANDOFF_remote §6j): a conditional whose target IS its own fall-through
decides nothing and passes every landing assertion. Asserted here for every jump, forward or back.

USAGE -- a block is a list of:
    Opcode                  emitted as-is
    ("@", "name")           a bookkeeping label; emits NOTHING
    ("@L", "name")          a LOOP HEADER; emits a real `Label` op at that point
and any jump operand may be a STRING naming a label instead of a number. The reserved name "OUT"
means "the first op after the whole block", i.e. the vanilla body.

    flat = resolve(block, tag="Ability slots")
    n, preds = splice(fn, C, flat, "Ability slots")

Self-test: `python loops_lib.py` -- builds a loop, a forward bail and three deliberate mistakes, and
requires each mistake to be REFUSED. It needs no game file and takes no time, so it is run in the
sandbox rather than costing the user a round trip.
"""
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
for _cl in (os.path.join(os.path.dirname(os.path.dirname(HERE)), "lib"),):
    if os.path.isdir(os.path.join(_cl, "crashlink")):
        sys.path.insert(0, _cl)
        break
from crashlink.opcodes import opcodes              # noqa: E402
from crashlink.core import Opcode, VarInt, Reg     # noqa: E402


class LoopGuardError(AssertionError):
    pass


def _guard(cond, msg):
    if not cond:
        raise LoopGuardError("LOOP GUARD: " + msg)


def op(name, **df):
    o = Opcode()
    o.op = name
    o.df = df
    return o


def label(name):
    """A bookkeeping mark. Emits nothing -- use it for forward targets."""
    return ("@", name)


def header(name):
    """A LOOP HEADER. Emits a real `Label` op, which is what a back-edge must land on."""
    return ("@L", name)


def _jump_operands(o):
    return [nm for nm, pt in opcodes.get(o.op or "", {}).items()
            if pt == "JumpOffset" and o.df.get(nm) is not None]


def resolve(block, tag="block"):
    """Flatten a block with symbolic jump targets into real ops with numeric offsets."""
    flat, marks = [], {}
    for entry in block:
        if isinstance(entry, tuple) and len(entry) == 2 and entry[0] in ("@", "@L"):
            kind, name = entry
            _guard(name not in marks, "%s: label %r defined twice" % (tag, name))
            _guard(name != "OUT", "%s: OUT is reserved and cannot be defined" % tag)
            marks[name] = len(flat)
            if kind == "@L":
                flat.append(op("Label"))
            continue
        _guard(isinstance(entry, Opcode), "%s: %r is neither an op nor a label" % (tag, entry))
        flat.append(entry)
    K = len(flat)
    marks["OUT"] = K

    for i, o in enumerate(flat):
        for nm in _jump_operands(o):
            v = o.df[nm]
            # A symbolic target may arrive RAW ("TOP") or already wrapped by a caller's clone
            # helper, which happily wraps every keyword it is given -- including an offset. That
            # produced a jump operand whose value was the label STRING, which the first pass
            # skipped and the range check then tripped over with an unreadable type error.
            # Accept both shapes, so the mistake is impossible rather than merely reported.
            if not isinstance(v, str):
                inner = getattr(v, "value", None)
                if not isinstance(inner, str):
                    continue
                v = inner
            _guard(v in marks, "%s: op%d jumps to %r, which is never defined" % (tag, i, v))
            tgt = marks[v]
            off = tgt - (i + 1)
            # Stage H (HANDOFF_remote §6j): a conditional whose target is its own fall-through
            # decides NOTHING and passes every landing assertion ever written about it.
            _guard(off != 0, "%s: op%d (%s -> %r) lands on its own fall-through, so it decides "
                             "nothing" % (tag, i, o.op, v))
            if off < 0:
                # THE RULE. GOTCHAS group A: all 18,462 vanilla back-edges land on a `Label`.
                _guard(0 <= tgt < K and flat[tgt].op == "Label",
                       "%s: op%d jumps BACK to op%d, which is a %s and not a `Label`. A back-edge "
                       "that does not land on a `Label` is the exact shape that crashed every "
                       "appended loop in this project's history -- use header() for the loop head."
                       % (tag, i, tgt, flat[tgt].op if 0 <= tgt < K else "nothing"))
            o.df[nm] = VarInt(off)

    for i, o in enumerate(flat):
        for nm in _jump_operands(o):
            _guard(not isinstance(getattr(o.df[nm], "value", o.df[nm]), str),
                   "%s: op%d still carries the unresolved label %r" % (tag, i, o.df[nm]))
            t = i + 1 + o.df[nm].value
            _guard(0 <= t <= K, "%s: op%d jumps to %d, outside the block (0..%d)" % (tag, i, t, K))
    _guard(any(o.op == "Label" for o in flat) or
           all(o.df[nm].value > 0 for o in flat for nm in _jump_operands(o)),
           "%s: a block with no `Label` should have no backward jump" % tag)
    return flat


# ---------------------------------------------------------------------------------------------
if __name__ == "__main__":
    ok = 0

    def expect_refusal(what, fn):
        global ok
        try:
            fn()
        except LoopGuardError as e:
            print("  REFUSED as it should be -- %s\n      %s" % (what, e)); ok += 1; return
        raise SystemExit("*** NOT REFUSED: %s -- the guard is not doing its job ***" % what)

    print("1. a well-formed loop, shaped like the game's own row walk")
    blk = [
        op("Int", dst=Reg(1), ptr=VarInt(0)),
        header("TOP"),
        op("Field", dst=Reg(2), obj=Reg(0), field=VarInt(0)),
        op("JSGte", a=Reg(1), b=Reg(2), offset="OUT"),
        op("Incr", dst=Reg(1)),
        op("JAlways", offset="TOP"),
    ]
    flat = resolve(list(blk), "good loop")
    assert [o.op for o in flat] == ["Int", "Label", "Field", "JSGte", "Incr", "JAlways"]
    assert flat[3].df["offset"].value == 2, flat[3].df["offset"].value      # -> OUT (6)
    assert flat[5].df["offset"].value == -5, flat[5].df["offset"].value     # -> the Label (1)
    print("     ok: the bail reaches the vanilla body, the back-edge lands on the Label"); ok += 1

    print("2. a back-edge onto something that is not a Label")
    expect_refusal("back-edge onto a Field", lambda: resolve([
        op("Int", dst=Reg(1), ptr=VarInt(0)),
        label("TOP"),                                    # bookkeeping only -- emits nothing
        op("Field", dst=Reg(2), obj=Reg(0), field=VarInt(0)),
        op("JAlways", offset="TOP"),
    ], "bad back-edge"))

    print("3. a jump onto its own fall-through")
    expect_refusal("zero-offset jump", lambda: resolve([
        op("JNull", reg=Reg(1), offset="NEXT"),
        label("NEXT"),
        op("Incr", dst=Reg(1)),
    ], "dead branch"))

    print("4b. an offset wrapped by a caller's clone helper (the W36 build's real mistake)")
    _w = op("JNotEq", a=Reg(1), b=Reg(2), offset=Reg("TOP"))
    _f = resolve([op("Int", dst=Reg(1), ptr=VarInt(0)), header("TOP"), _w], "wrapped label")
    assert _f[2].df["offset"].value == -2, _f[2].df["offset"].value
    print("     ok: a wrapped label resolves like a raw one instead of failing unreadably"); ok += 1

    print("4. a jump to a label nobody defined")
    expect_refusal("undefined label", lambda: resolve([
        op("JNull", reg=Reg(1), offset="NOWHERE"),
        op("Incr", dst=Reg(1)),
    ], "undefined"))

    print("\n%d checks, 0 problems -- the toolkit can emit loops." % ok)
