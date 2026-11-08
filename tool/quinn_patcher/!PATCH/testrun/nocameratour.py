#!/usr/bin/env python3
"""Stop the stress switch touring the camera: the step that picks at random and aims it, by name."""
from tools.project import guard
from tools.hlcode import call_sites, calls, function_named, make_nop

# the two the step is recognised by -- a random pick, and the camera being aimed
PICK = "lib.$ProxyUtils.pickRandom"
MOVE = "CameraController.setTarget"


def install(bc):
    """Take the camera move out of the repeating step. Nothing else in it changes."""
    pick, move = function_named(bc, PICK), function_named(bc, MOVE)

    steps = [fn for fn in bc.functions
             if any(calls(o, pick) for o in fn.ops or [])
             and any(calls(o, move) for o in fn.ops or [])]
    guard(len(steps) == 1,
          "%d steps both pick at random and aim the camera, and this expects one" % len(steps))

    step = steps[0]
    sites = call_sites(step, move)
    guard(len(sites) == 1,
          "that step aims the camera %d times, and this expects one" % len(sites))

    make_nop(step.ops[sites[0]])
    return "CAMERA: the switch's own tour does not move the view"
