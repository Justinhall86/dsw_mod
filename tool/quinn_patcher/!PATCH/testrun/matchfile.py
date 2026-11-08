#!/usr/bin/env python3
"""Let the bench aim a match from a file named by a switch, through the empty start-config hook."""
from copy import deepcopy

from tools.project import gv, guard
from testrun.switches import ARG_READER, DONOR, FILE_READER
from cases import matchfile as matchfile_cases
from tools.hlcode import (assemble, calls, function_named, register_like, replace_body,
                          returns_type, text_object, written)

# the empty hook the match constructor calls when nobody handed it settings
STUB = "Game.loadStartConfig"
# the rest of what the sequence calls; what both lifts share is in `switches.py`
UNSERIALISER = "$CustomUnserializer.run"
# the word on the command line that names the match file
SWITCH = "conf"
# the stub's own register for what it hands back; it arrives with exactly these two
RESULT = 1
STUB_REGS = 2


def donor_op(donor, name):
    # one instruction of that kind, copied from the very function that already does this job
    found = next((o for o in (donor.ops or []) if o.op == name), None)
    guard(found is not None, "%s has no %s to copy" % (DONOR, name))
    return found


def helpers(bc):
    """The hook, the donor, and the three functions the sequence calls -- all found by name."""
    stub = function_named(bc, STUB)
    donor = function_named(bc, DONOR)
    ask = function_named(bc, ARG_READER)
    read = function_named(bc, FILE_READER)
    parse = function_named(bc, UNSERIALISER)

    # the stub must still be the empty one, or we are overwriting something that does a job
    guard([o.op for o in stub.ops] == ["Null", "Ret"],
          "the start-config hook is not empty -- it is %s" % [o.op for o in stub.ops])
    guard(len(list(stub.regs)) == STUB_REGS,
          "the hook has %d registers, expected %d" % (len(list(stub.regs)), STUB_REGS))
    # the donor must still do this job, or the instructions we copy do not mean what we think
    guard(any(calls(o, read) for o in donor.ops), "%s does not read a file" % DONOR)
    guard(any(calls(o, parse) for o in donor.ops), "%s does not unserialise" % DONOR)

    text = gv(list(ask.regs)[0])
    guard(gv(list(read.regs)[0]) == text, "%s does not take text" % FILE_READER)
    guard(gv(list(parse.regs)[0]) == text, "%s does not take text" % UNSERIALISER)
    return {"stub": stub, "donor": donor, "ask": ask, "read": read, "parse": parse,
            "text": text, "any": returns_type(parse, UNSERIALISER),
            "config": gv(list(stub.regs)[RESULT])}


def registers(bc, kit):
    """Five registers on the hook: four for text, one for whatever the file turns out to hold."""
    stub, out = kit["stub"], {}
    # the word asked for, its default, the path handed over, the file's text, that text read back
    wanted = (("name", "text"),
              ("default", "text"),
              ("arg", "text"),
              ("text", "text"),
              ("any", "any"))
    first = len(list(stub.regs))
    for i, (name, kind) in enumerate(wanted):
        stub.regs.append(deepcopy(register_like(bc, kit[kind])))
        out[name] = first + i
    stub.nregs.value = len(list(stub.regs))
    return out


def emit_read(bc, kit, regs, word):
    """The hook's new body: ask for the switch, and read the file it names when there is one."""
    r, donor = regs, kit["donor"]

    def op(name, **operands):
        return written(donor_op(donor, name), **operands)

    return [
        # ask the game for the switch, with nothing as the answer when it was not given
        op("GetGlobal", **{"dst": r["name"], "global": word}),
        op("Null", dst=r["default"]),
        op("Call2", dst=r["arg"], fun=gv(kit["ask"].findex), arg0=r["name"], arg1=r["default"]),
        # no switch means no aimed match, and the hook answers exactly as the empty one did
        (op("JNull", reg=r["arg"]), "NOTHING"),
        op("Call1", dst=r["text"], fun=gv(kit["read"].findex), arg0=r["arg"]),
        op("Call1", dst=r["any"], fun=gv(kit["parse"].findex), arg0=r["text"]),
        # what the file holds, handed back as the settings the match constructor wanted
        op("ToVirtual", dst=RESULT, src=r["any"]),
        op("Ret", ret=RESULT),
        "NOTHING:",
        op("Null", dst=RESULT),
        op("Ret", ret=RESULT),
    ]


def install(bc):
    """Give the empty start-config hook a body that reads the match file, when one is named."""
    word = text_object(bc, SWITCH)
    kit = helpers(bc)
    regs = registers(bc, kit)
    ops = assemble(emit_read(bc, kit, regs, word))
    replace_body(kit["stub"], ops)
    # its own cases run HERE, the only place every piece is in hand
    matchfile_cases.check(bc, kit, regs, ops, RESULT)
    return ("MATCH FILE: `%s` is read by %s -- %d instructions, and no switch leaves it "
            "answering exactly as the empty hook did" % (SWITCH, STUB, len(ops)))
