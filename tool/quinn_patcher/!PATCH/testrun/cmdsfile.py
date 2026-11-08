#!/usr/bin/env python3
"""Let the bench type console lines from a file, on the stress step that runs one."""
from copy import deepcopy

from tools.project import gv, guard
from testrun.switches import ARG_READER, DONOR, FILE_READER
from tools.hlcode import (argument_kind, assemble, calls, field_by_name, function_named, make_nop,
                          number, register_like, returns_type, slot_global, template, text_object,
                          written)
from tools.splice import insert
from framework import sayonce, traps
from framework.loadguard import ALSO_READY_AT
from framework.parsed import a_new_place

# where the game's own path to a console command starts, and the runner it ends at
FROM = "$Main.stressTest"
RUNNER = "h2d.Console.runCommand"
# the rest of what the sequence calls; what both lifts share is in `switches.py`
SPLITTER = "String.split"
# the word on the command line that names the file of lines, and what separates one line
SWITCH, BREAK = "cmds", "\n"
# our own count of how many have been typed already, and what this splice is called
TYPED = "console lines already typed"
SPLICE = "the console lines"
# the two fixed words; neither latches, since how many times the step is reached is half the answer
REACHED = "the step that types a console line"
FOUND = "a file of console lines was named"
UNARMED = "no file of console lines was named, so none are armed"
# an array says how many it holds and what it holds them in, and it says so by name
HOW_MANY, BACKING = "length", "array"
# WHEN they are typed: readiness arms the step, since the loading screen is too early for the map
WAITER = "hxd.WaitEvent.wait"
READ_DELAY = "$Std.parseFloat"
# the word on the command line that says how long after readiness, and what the arming is called
DELAY_SWITCH, ARMING = "wait", "when the console lines are typed"
# the second arming lets one match do then undo; a COUNT, as minted and split texts never compare
LIMIT = "console lines this pass may type"
UPTO_SWITCH = "upto"
LATER_SWITCH, LATER_ARMING = "wait2", "when the rest of the console lines are typed"
# what the limit is when no switch asks for one: every line there could be
NO_LIMIT = 1 << 20


def donor_op(bc, name):
    """One instruction of that kind, copied from the donor first, then from anywhere at all."""
    donor = function_named(bc, DONOR)
    found = next((o for o in (donor.ops or []) if o.op == name), None)
    if found is None:
        found = next((o for f in bc.functions for o in (f.ops or []) if o.op == name), None)
    guard(found is not None, "the file has no %s to copy" % name)
    return found


def _reached_from(fn):
    """Every function this one hands on to, as a closure or a call."""
    out = []
    for o in fn.ops or []:
        at = o.df.get("fun")
        if at is not None and (o.op.startswith("Call") or o.op.endswith("Closure")):
            out.append(gv(at))
    return out


def the_step(bc):
    """The ONE step the stress switch reaches that calls the console's runner, walked outward."""
    runner = gv(function_named(bc, RUNNER).findex)
    by_index = {gv(f.findex): f for f in bc.functions}
    seen, queue, found = set(), _reached_from(function_named(bc, FROM)), []
    while queue:
        at = queue.pop(0)
        if at in seen:
            continue
        seen.add(at)
        fn = by_index.get(at)
        if fn is None:
            continue
        if any(o.op.startswith("Call") and gv(o.df.get("fun", -1)) == runner for o in fn.ops or []):
            found.append(fn)
        else:
            queue += _reached_from(fn)
    guard(len(found) == 1,
          "%s reaches %d steps that run a console command, and this reads the one"
          % (FROM, len(found)))
    return found[0]


def what_is_in_hand(bc):
    """The step, the console it holds, the place its call answers into, and where ours go."""
    step = the_step(bc)
    runner = gv(function_named(bc, RUNNER).findex)
    runs = [i for i, o in enumerate(step.ops)
            if o.op.startswith("Call") and gv(o.df.get("fun", -1)) == runner]
    guard(len(runs) == 1, "that step runs %d commands, and this reads the one" % len(runs))
    at = runs[0]
    guard(step.ops[-1].op == "Ret", "that step does not end by returning")
    guard(at == len(step.ops) - 2,
          "running the command is not the last thing that step does -- it is at %d of %d"
          % (at, len(step.ops)))
    # ours go AFTER the game's own command and before it returns
    return step, gv(step.ops[at].df["arg0"]), gv(step.ops[-1].df["ret"]), len(step.ops) - 1


def helpers(bc):
    """Everything the new lines call, found by name and checked to take what we hand them."""
    step, console, void, goes_at = what_is_in_hand(bc)
    ask, read = function_named(bc, ARG_READER), function_named(bc, FILE_READER)
    split, runner = function_named(bc, SPLITTER), function_named(bc, RUNNER)
    text = gv(list(ask.regs)[0])
    guard(gv(list(read.regs)[0]) == text, "%s does not take text" % FILE_READER)
    guard(gv(list(split.regs)[0]) == text, "%s does not take text" % SPLITTER)
    lines = returns_type(split, SPLITTER)
    counted, count_kind = field_by_name(bc, lines, HOW_MANY, "a split line list")
    held, held_kind = field_by_name(bc, lines, BACKING, "a split line list")
    return {"step": step, "console": console, "void": void, "goes_at": goes_at,
            "ask": ask, "read": read, "split": split, "runner": runner,
            "text": text, "lines": lines, "counted": counted, "count_kind": count_kind,
            "held": held, "held_kind": held_kind}


def registers(bc, kit):
    """Every place the new lines need, each of a kind the game itself declares."""
    step = kit["step"]
    wanted = (("name", "text"), ("default", "text"), ("path", "text"), ("text", "text"),
              ("separator", "text"), ("line", "text"),
              ("lines", "lines"), ("backing", "held_kind"),
              ("at", "count_kind"), ("many", "count_kind"), ("one", "count_kind"),
              ("limit", "count_kind"))
    out, first = {}, len(list(step.regs))
    for i, (name, kind) in enumerate(wanted):
        step.regs.append(deepcopy(register_like(bc, kit[kind])))
        out[name] = first + i
    step.nregs.value = len(list(step.regs))
    return out


def emit_type(bc, kit, r, word, separator, typed, limit):
    """Read the file the switch names; type each new line, up to the end or the arming's `limit`."""
    top, out, done = "another line", "every line is typed", "no lines were asked for"

    def op(name, **operands):
        return written(donor_op(bc, name), **operands)

    # BOTH SAYINGS NEED THE QUIET BYPASS: without it they emit nothing and a zero proves nothing
    return (sayonce.emit_word_always(bc, kit["step"], REACHED, even_when_quiet=True) + [
        op("GetGlobal", **{"dst": r["name"], "global": word}),
        op("Null", dst=r["default"]),
        op("Call2", dst=r["path"], fun=gv(kit["ask"].findex),
           arg0=r["name"], arg1=r["default"]),
        # no switch means no lines, and the step does exactly what it always did
        (op("JNull", reg=r["path"]), done),
    ] + sayonce.emit_word_always(bc, kit["step"], FOUND, even_when_quiet=True) + [
        op("Call1", dst=r["text"], fun=gv(kit["read"].findex), arg0=r["path"]),
        op("GetGlobal", **{"dst": r["separator"], "global": separator}),
        op("Call2", dst=r["lines"], fun=gv(kit["split"].findex),
           arg0=r["text"], arg1=r["separator"]),
        (op("JNull", reg=r["lines"]), done),
        # START WHERE THE LAST RUN STOPPED: the step is reached more than once
        op("GetGlobal", **{"dst": r["at"], "global": typed}),
        op("Int", dst=r["one"], ptr=_one(bc)),
        top + ":",
        op("Label"),
        op("Field", dst=r["many"], obj=r["lines"], field=kit["counted"]),
        (op("JSGte", a=r["at"], b=r["many"]), out),
        # ⛔ the arming's ceiling LIFTS ITSELF here, where the pass stops: no other moment is safe
        op("GetGlobal", **{"dst": r["limit"], "global": limit}),
        (op("JSLt", a=r["at"], b=r["limit"]), "under the ceiling"),
        op("Int", dst=r["limit"], ptr=number(bc, NO_LIMIT)),
        op("SetGlobal", **{"global": limit, "src": r["limit"]}),
        (op("JAlways"), out),
        "under the ceiling" + ":",
        op("Label"),
        op("Field", dst=r["backing"], obj=r["lines"], field=kit["held"]),
        op("GetArray", dst=r["line"], array=r["backing"], index=r["at"]),
        op("Add", dst=r["at"], a=r["at"], b=r["one"]),
        # the line itself, said before it is handed over, so what is in the log is what went in
    ] + sayonce.emit_always(bc, kit["step"], r["line"]) + [
        op("Call2", dst=kit["void"], fun=gv(kit["runner"].findex),
           arg0=kit["console"], arg1=r["line"]),
        # counted the moment the console takes it, so a line that throws replays none before it
        op("SetGlobal", **{"global": typed, "src": r["at"]}),
        (op("JAlways"), top),
        out + ":",
        op("Label"),
        done + ":",
        op("Label"),
    ])


def what_wrote(fn, reg, before):
    """The last instruction above `before` that put something in that place."""
    for i in range(before - 1, -1, -1):
        if gv(fn.ops[i].df.get("dst", -1)) == reg:
            return fn.ops[i]
    guard(False, "nothing writes place %d above %d" % (reg, before))


def the_arming(bc, step):
    """Where the game arms that step, found by shape, and all it hands the wait-event."""
    waits = function_named(bc, WAITER)
    for fn in bc.functions:
        for i, o in enumerate(fn.ops or []):
            if not (o.op.endswith("Closure") and gv(o.df.get("fun", -1)) == gv(step.findex)):
                continue
            at = next((j for j in range(i, len(fn.ops)) if calls(fn.ops[j], waits)), None)
            guard(at is not None,
                  "that step is made into a closure and never handed to %s" % WAITER)
            call = fn.ops[at]
            event, delay, held = (gv(call.df["arg0"]), gv(call.df["arg1"]), gv(call.df["arg2"]))
            reads = what_wrote(fn, event, at)
            guard(reads.op == "Field", "the wait-event is not read off a field before the arming")
            as_soon = what_wrote(fn, delay, at)
            guard("dst" in as_soon.df and "ptr" in as_soon.df,
                  "the delay handed to %s is not a plain number" % WAITER)
            return {"where": fn, "at": at, "field": gv(reads.df["field"]), "as_soon": as_soon,
                    "event": gv(list(fn.regs)[event]), "delay": gv(list(fn.regs)[delay]),
                    "held": gv(list(fn.regs)[held])}
    guard(False, "nothing in the file arms that step")


def places_for_arming(bc, ready, arm, counting=None):
    """Every place the arming needs, each of a kind the game itself declares."""
    text = argument_kind(bc, ARG_READER)
    wanted = (("delay", arm["delay"]), ("event", arm["event"]), ("held", arm["held"]),
              ("name", text), ("default", text), ("said", text),
              ("void", returns_type(function_named(bc, WAITER), WAITER)))
    # and the ceiling's place, only when this arming sets one, of the line count's kind
    if counting is not None:
        wanted += (("upto", counting),)
    return {name: a_new_place(bc, ready, kind) for name, kind in wanted}


def emit_arm(bc, step, arm, r, word, gate, limit=None, upto=None, naming="", said_in=None):
    """Arm that step `wait` seconds after readiness, only when `gate` is on the command line."""
    waits, asks = function_named(bc, WAITER), function_named(bc, ARG_READER)
    reads = function_named(bc, READ_DELAY)
    at_once = "no delay was asked for%s" % naming
    no_ceiling = "no ceiling was asked for%s" % naming
    unarmed, armed = UNARMED + naming, "the console lines are armed%s" % naming

    def op(what, **operands):
        return written(template(bc, what), **operands)

    # ⛔ no file named, no arming: the step skips the player's tutorial, which multiplayer lacks
    gated = [
        op("GetGlobal", **{"dst": r["name"], "global": gate}),
        op("Null", dst=r["default"]),
        op("Call2", dst=r["said"], fun=gv(asks.findex), arg0=r["name"], arg1=r["default"]),
        (op("JNull", reg=r["said"]), unarmed),
    ]

    ceiling = [] if limit is None else [
        op("Int", dst=r["upto"], ptr=number(bc, NO_LIMIT)),
        op("GetGlobal", **{"dst": r["name"], "global": upto}),
        op("Null", dst=r["default"]),
        op("Call2", dst=r["said"], fun=gv(asks.findex), arg0=r["name"], arg1=r["default"]),
        (op("JNull", reg=r["said"]), no_ceiling),
        # read as a number, then narrowed to the line count's kind, which the step compares with
        op("Call1", dst=r["delay"], fun=gv(reads.findex), arg0=r["said"]),
        op("ToInt", dst=r["upto"], src=r["delay"]),
        no_ceiling + ":",
        op("Label"),
        op("SetGlobal", **{"global": limit, "src": r["upto"]}),
    ]

    return gated + ceiling + [
        # the game's own delay for this arming, so a run with no switch keeps the game's timing
        written(arm["as_soon"], dst=r["delay"]),
        op("GetGlobal", **{"dst": r["name"], "global": word}),
        op("Null", dst=r["default"]),
        op("Call2", dst=r["said"], fun=gv(asks.findex), arg0=r["name"], arg1=r["default"]),
        (op("JNull", reg=r["said"]), at_once),
        op("Call1", dst=r["delay"], fun=gv(reads.findex), arg0=r["said"]),
        at_once + ":",
        op("Label"),
        # readiness holds the world first, and the wait-event hangs off it there as it does here
        op("Field", dst=r["event"], obj=0, field=arm["field"]),
        op("InstanceClosure", dst=r["held"], fun=gv(step.findex), obj=0),
        op("Call3", dst=r["void"], fun=gv(waits.findex),
           arg0=r["event"], arg1=r["delay"], arg2=r["held"]),
        (op("JAlways"), armed),
        unarmed + ":",
        op("Label"),
    ] + ([] if said_in is None else
         sayonce.emit_word_always(bc, said_in, UNARMED, even_when_quiet=True)) + [
        armed + ":",
        op("Label"),
    ]


def _one(bc):
    """The number one, as this file already spells it."""
    from tools.hlcode import number
    return number(bc, 1)


def install(bc):
    """Give the step that types one console line the ability to type a file of them."""
    kit = helpers(bc)
    typed = slot_global(bc, TYPED, kit["count_kind"])
    limit = slot_global(bc, LIMIT, kit["count_kind"])
    r = registers(bc, kit)
    block = assemble(emit_type(bc, kit, r, text_object(bc, SWITCH),
                               text_object(bc, BREAK), typed, limit))
    how_many = insert(bc, kit["step"], kit["goes_at"], block, SPLICE, traps.IN_PLAY)

    # and WHEN: the game's own arming goes, and readiness arms it once, `wait` seconds later
    arm = the_arming(bc, kit["step"])
    ready = function_named(bc, ALSO_READY_AT)
    guard(ready.ops[-1].op == "Ret", "%s does not end by returning" % ALSO_READY_AT)
    armed = assemble(emit_arm(bc, kit["step"], arm,
                              places_for_arming(bc, ready, arm, kit["count_kind"]),
                              text_object(bc, DELAY_SWITCH), text_object(bc, SWITCH),
                              limit=limit, upto=text_object(bc, UPTO_SWITCH), said_in=ready))
    later = insert(bc, ready, len(ready.ops) - 1, armed, ARMING, traps.AT_A_MOMENT)
    # ⛔ AND AGAIN, LATER, WITH NO CEILING: it types what the first pass stopped short of
    again = assemble(emit_arm(bc, kit["step"], arm,
                              places_for_arming(bc, ready, arm),
                              text_object(bc, LATER_SWITCH), text_object(bc, SWITCH),
                              naming=", later"))
    insert(bc, ready, len(ready.ops) - 1, again, LATER_ARMING, traps.AT_A_MOMENT)
    make_nop(arm["where"].ops[arm["at"]])
    return ("CONSOLE LINES: `%s` is read on the step that already runs one -- %d instructions, "
            "and no switch leaves it typing exactly what it always did. `%s` arms that step "
            "instead of the loading screen, %d instructions in, only when `%s` is named, and the "
            "game's own arming is gone" % (SWITCH, how_many, ALSO_READY_AT, later, SWITCH))
