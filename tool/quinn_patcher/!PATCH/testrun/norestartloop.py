#!/usr/bin/env python3
"""Stop the stress switch restarting the match: the delay handed its own incoming callback."""
from tools.project import gv, guard
from tools.hlcode import (assemble, calls, function_named, make_nop, number, slot_global,
                          template, text_object, written)
from tools.splice import insert
from framework import sayonce, traps
from framework.parsed import a_new_place
# where the chain starts is the console lines' own handle -- one switch, named in one place
from testrun.cmdsfile import FROM, READ_DELAY, TYPED, WAITER, what_wrote
from testrun.switches import ARG_READER
from framework.loadguard import ALSO_READY_AT
from tools.hlcode import returns_type

# the engine's own "run this later"
DELAY = "haxe.$Timer.delay"
# `again` on the command line lets the restart through ONCE: the menu, then a new match (`D2`)
AGAIN_SWITCH = "again"
RESTARTED = "second games already started"
SPLICE = "a second game, once, when the bench asks"
# said when it is let through, so the log says where the first game ends
SECOND_GAME = "the bench starts a second game in this launch"
# ⚠ THE GATES, for the first run that reads them (747 restarted nothing and said nothing)
ARMED = "readiness arms the restart"
REACHED = "the restart step is reached"
ASKED = "the restart step finds `again` asked for"
ARMING = "readiness arms the second game"


def _handed_on(fn):
    """Every function this one hands on to, as a closure or a call."""
    out = []
    for o in fn.ops or []:
        at = o.df.get("fun")
        if at is not None and (o.op.startswith("Call") or o.op.endswith("Closure")):
            out.append(gv(at))
    return out


def _reachable(bc, start):
    """Every function the switch can get to, however deep."""
    by_index = {gv(f.findex): f for f in bc.functions}
    seen, queue = set(), _handed_on(start)
    while queue:
        at = queue.pop(0)
        if at in seen:
            continue
        seen.add(at)
        fn = by_index.get(at)
        if fn is not None:
            queue += _handed_on(fn)
    return [by_index[i] for i in seen if i in by_index]


def install(bc):
    """Make the restart a do-nothing. Everything the run does before it is untouched."""
    delay = function_named(bc, DELAY)

    hits = []
    for fn in _reachable(bc, function_named(bc, FROM)):
        for i, op in enumerate(fn.ops or []):
            if not calls(op, delay):
                continue
            passed = gv(op.df["arg0"])
            # an incoming callback is never written inside the function; a made one always is
            if not any(gv(o.df.get("dst", -1)) == passed for o in fn.ops or []):
                hits.append((fn, i))

    guard(len(hits) == 1,
          "%d steps hand the delay their own callback, and this expects one" % len(hits))
    fn, at = hits[0]
    restart = {name: gv(fn.ops[at].df[name]) for name in ("dst", "arg0", "arg1")}
    make_nop(fn.ops[at])
    guard(fn.ops[at + 1].op == "Ret", "the restart is not the last thing that step does")
    block = assemble(emit_once(bc, fn, restart))
    went = insert(bc, fn, at + 1, block, SPLICE, traps.AT_A_MOMENT)
    # ⛔ the stress step's own wait is armed in the loading screen and never fires; readiness arms it
    ready = function_named(bc, ALSO_READY_AT)
    armed = assemble(emit_arm(bc, ready, fn, the_armer(bc, fn)))
    insert(bc, ready, len(ready.ops) - 1, armed, ARMING, traps.AT_A_MOMENT)
    return ("RESTART: the switch's own loop is broken -- and `%s` lets it through once, %d "
            "instruction(s), so one launch plays a second game" % (AGAIN_SWITCH, went))


def the_armer(bc, fn):
    """How the stress step arms the restart: the wait, its event, and the callback it binds."""
    waits = function_named(bc, WAITER)
    armers = [f for f in bc.functions
              if any(o.op == "InstanceClosure" and gv(o.df.get("fun", -1)) == gv(fn.findex)
                     for o in f.ops or [])]
    guard(len(armers) == 1, "%d steps arm the restart, and this expects one" % len(armers))
    armer = armers[0]
    made = next(i for i, o in enumerate(armer.ops)
                if o.op == "InstanceClosure" and gv(o.df.get("fun", -1)) == gv(fn.findex))
    at = next((j for j in range(made, len(armer.ops)) if calls(armer.ops[j], waits)), None)
    guard(at is not None, "the restart is made into a closure and never waited on")
    call = armer.ops[at]
    event = what_wrote(armer, gv(call.df["arg0"]), at)
    guard(event.op == "Field", "the wait-event is not read off a field")
    regs = list(armer.regs)
    # the callback the stress switch bound into that step: a closure it made of a plain function
    start = function_named(bc, FROM)
    binds = [o for o in start.ops
             if o.op == "InstanceClosure" and gv(o.df.get("fun", -1)) == gv(armer.findex)]
    guard(len(binds) == 1, "the stress switch binds that step %d times" % len(binds))
    source = what_wrote(start, gv(binds[0].df["obj"]), start.ops.index(binds[0]))
    guard(source.op == "StaticClosure", "the callback is not a closure of a plain function")
    return {"field": gv(event.df["field"]), "event": gv(regs[gv(call.df["arg0"])]),
            "delay": gv(regs[gv(call.df["arg1"])]), "held": gv(regs[gv(call.df["arg2"])]),
            "callback": gv(list(start.regs)[gv(source.df["dst"])]),
            "calls_back": gv(source.df["fun"])}


def emit_arm(bc, ready, fn, arm):
    """At readiness, when `again` was asked and no second game began: wait, then restart."""
    asks, reads, waits = (function_named(bc, ARG_READER), function_named(bc, READ_DELAY),
                          function_named(bc, WAITER))
    text = gv(list(asks.regs)[0])
    kind = gv(bc.global_types[_typed(bc)])
    done = slot_global(bc, RESTARTED, kind)
    name, default, said = (a_new_place(bc, ready, text) for _ in range(3))
    count, one = (a_new_place(bc, ready, kind) for _ in range(2))
    seconds = a_new_place(bc, ready, arm["delay"])
    event = a_new_place(bc, ready, arm["event"])
    callback = a_new_place(bc, ready, arm["callback"])
    held = a_new_place(bc, ready, arm["held"])
    void = a_new_place(bc, ready, returns_type(waits, WAITER))
    skip = "the restart is not armed"

    def op(what, **operands):
        return written(template(bc, what), **operands)

    return ([op("GetGlobal", **{"dst": name, "global": text_object(bc, AGAIN_SWITCH)}),
             op("Null", dst=default),
             op("Call2", dst=said, fun=gv(asks.findex), arg0=name, arg1=default),
             (op("JNull", reg=said), skip),
             op("GetGlobal", **{"dst": count, "global": done}),
             op("Int", dst=one, ptr=number(bc, 1)),
             (op("JSGte", a=count, b=one), skip),
             op("Call1", dst=seconds, fun=gv(reads.findex), arg0=said),
             op("Field", dst=event, obj=0, field=arm["field"]),
             op("StaticClosure", dst=callback, fun=arm["calls_back"]),
             op("InstanceClosure", dst=held, fun=gv(fn.findex), obj=callback),
             op("Call3", dst=void, fun=gv(waits.findex), arg0=event, arg1=seconds, arg2=held)]
            + sayonce.emit_word_always(bc, ready, ARMED, even_when_quiet=True)
            + [skip + ":", op("Label")])


def emit_once(bc, fn, restart):
    """Let the restart through when `again` was asked for and no second game has started yet."""
    typed = _typed(bc)
    kind = gv(bc.global_types[typed])
    done = slot_global(bc, RESTARTED, kind)
    asks = function_named(bc, ARG_READER)
    text = gv(list(asks.regs)[0])
    name, default, said = (a_new_place(bc, fn, text) for _ in range(3))
    count, one, zero = (a_new_place(bc, fn, kind) for _ in range(3))
    skip = "no second game"

    def op(what, **operands):
        return written(template(bc, what), **operands)

    return (sayonce.emit_word_always(bc, fn, REACHED, even_when_quiet=True)
            + [op("GetGlobal", **{"dst": name, "global": text_object(bc, AGAIN_SWITCH)}),
               op("Null", dst=default),
               op("Call2", dst=said, fun=gv(asks.findex), arg0=name, arg1=default),
               (op("JNull", reg=said), skip)]
            + sayonce.emit_word_always(bc, fn, ASKED, even_when_quiet=True)
            + [op("GetGlobal", **{"dst": count, "global": done}),
             op("Int", dst=one, ptr=number(bc, 1)),
             (op("JSGte", a=count, b=one), skip),
             op("SetGlobal", **{"global": done, "src": one}),
             # the second game types the whole batch again, from its first line
             op("Int", dst=zero, ptr=number(bc, 0)),
             op("SetGlobal", **{"global": typed, "src": zero})]
            + sayonce.emit_word_always(bc, fn, SECOND_GAME, even_when_quiet=True)
            + [op("Call2", dst=restart["dst"], fun=gv(function_named(bc, DELAY).findex),
                  arg0=restart["arg0"], arg1=restart["arg1"]),
               skip + ":",
               op("Label")])


def _typed(bc):
    """The console lines' own count, which `cmdsfile` made; refused when it was never made."""
    from tools.hlcode import SLOTS_ON
    found = (getattr(bc, SLOTS_ON, None) or {}).get(TYPED)
    guard(found is not None, "the console lines' count was never made -- `cmdsfile` goes first")
    return found
