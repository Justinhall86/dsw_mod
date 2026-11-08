#!/usr/bin/env python3
"""A loaded save plays at the speed the run asked for, not at the level's own multiple of it."""
from tools.hlcode import (assemble, field_by_name, function_named, kind_named, returns_type,
                          template, written)
from tools.project import gv, guard
from tools.splice import insert
from standalone import onoff
from framework import traps
from framework.parsed import a_new_place
from testrun.loadplays import WHERE

NAME = "loadspeed"
ASKS = "Game.getGameSpeedLevel"
SETS = "logic.state.State.set_gameSpeed"
# the two places read by name, never counted to: the game's own state, and its base speed
ON_THE_GAME, STATE_ON = "Game", "state"
ON_THE_STATE, SPEED_ON = "logic.state.State", "gameSpeed"
# where the block leaves, and what it is called once it is in
PAST = "the loaded speed is already the run's own"
IN_PLACE = "the loaded speed divided by the level's step"


def _op(bc, name, **operands):
    return written(template(bc, name), **operands)


def install(bc):
    """Divide the step out of the base at the one function only a load reaches."""
    if not onoff.on(NAME):
        return "loadspeed: OFF"
    fn = function_named(bc, WHERE)
    leaves = [i for i, o in enumerate(fn.ops) if o.op == "Ret"]
    guard(len(leaves) == 1,
          "%s leaves %d time(s), so there is no one place that is last" % (WHERE, len(leaves)))
    guard(gv(fn.regs[0]) == kind_named(bc, ON_THE_GAME),
          "%s is not handed the game where its own kind says it is" % WHERE)
    asks, sets = function_named(bc, ASKS), function_named(bc, SETS)
    state_at, state_kind = field_by_name(bc, kind_named(bc, ON_THE_GAME), STATE_ON, ON_THE_GAME)
    speed_at, speed_kind = field_by_name(bc, kind_named(bc, ON_THE_STATE), SPEED_ON, ON_THE_STATE)
    step_kind = returns_type(asks, ASKS)
    guard(step_kind == speed_kind,
          "the level's own step and `%s` are different kinds, so one divides wrong" % SPEED_ON)
    state = a_new_place(bc, fn, state_kind)
    step, zero = a_new_place(bc, fn, step_kind), a_new_place(bc, fn, step_kind)
    base = a_new_place(bc, fn, speed_kind)
    spare = a_new_place(bc, fn, returns_type(sets, SETS))
    block = [
        _op(bc, "Field", dst=state, obj=0, field=state_at),
        (_op(bc, "JNull", reg=state), PAST),
        _op(bc, "Call1", dst=step, fun=gv(asks.findex), arg0=0),
        # zero out of the step itself, because a number of this kind cannot be written by hand
        _op(bc, "Sub", dst=zero, a=step, b=step),
        (_op(bc, "JSGte", a=zero, b=step), PAST),
        _op(bc, "Field", dst=base, obj=state, field=speed_at),
        _op(bc, "SDiv", dst=base, a=base, b=step),
        # through the game's own way in, so what a save and a second player read is marked
        _op(bc, "Call2", dst=spare, fun=gv(sets.findex), arg0=state, arg1=base),
        PAST + ":", _op(bc, "Label"),
    ]
    put = insert(bc, fn, leaves[0], assemble(block), IN_PLACE, traps.IN_PLAY)
    return ("loadspeed: %s divides the level's step out of `%s`, so a loaded save plays at the "
            "number the run typed -- %d instruction(s)" % (WHERE, SPEED_ON, put))
