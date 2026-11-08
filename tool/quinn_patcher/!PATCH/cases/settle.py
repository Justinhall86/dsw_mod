#!/usr/bin/env python3
"""What proves `framework/settle.py`. It reads the SPLICED road, and changes nothing itself."""
from tools.project import gv, guard
from tools.hlcode import function_named, kind_named
from tools.splice import where
from framework.acts.gain_ttrait_stacks import GRANT
from framework.oneshot import MAP
from framework.running import GET
from framework.storewalk import Site, scopes_with_roads, splice_name
from framework.settle import KNOWN, NOTED, SLOT, SETTLED, every_road, slot
from framework.tray import ARRAY_OF_ENTRIES, PUSH


def check(bc):
    """Both places are there, a road notes what it grants, and it sweeps past its last row."""
    # ONE SET PER ROAD, every one checked, so no road's zero lands on another's grant
    for road in every_road():
        for which, holds in ((SLOT, ARRAY_OF_ENTRIES), (KNOWN, MAP)):
            guard(slot(bc, which, road) is not None,
                  "there is no place called `%s` for the `%s` road in this file" % (which, road))
    for which, holds in ((SLOT, ARRAY_OF_ENTRIES), (KNOWN, MAP)):
        made = slot(bc, which, every_road()[0])
        guard(made is not None, "there is no place called `%s` in this file" % which)
        guard(gv(bc.global_types[made]) == kind_named(bc, MAP),
              "`%s` holds a t@%s, and one %s per receiver wants a %s"
              % (which, gv(bc.global_types[made]), holds, MAP))

    from framework.names import vocabulary
    words = vocabulary()
    roads = scopes_with_roads(words)
    guard(roads, "no scope says where its rules run, so nothing is ever swept")
    for spelling in roads:
        site = Site(bc, spelling, words)
        spliced = where(bc, splice_name(spelling))
        guard(spliced, "the `%s` rules never went in" % spelling)
        at, how_many = spliced
        block = site.fn.ops[at:at + how_many]
        _noted_what_it_grants(bc, spelling, block)
        _nothing_totalled_still_walks(bc, spelling, site, block)
    return "%d road(s) note what they grant" % len(roads)


def _nothing_totalled_still_walks(bc, spelling, site, block):
    """A receiver totalled NOTHING still reaches the walk and is handed zero: retraction."""
    from framework import running
    asking = gv(function_named(bc, running.GET).findex)
    asked = [i for i, o in enumerate(block)
             if o.op.startswith("Call") and gv(o.df.get("fun", -1)) == asking]
    guard(asked, "the `%s` rules never ask what this pass totalled for a trait" % spelling)
    # the walk's own read is the LAST of them: the note asks first, to see if it already knows
    at = asked[-1]
    asked_of = gv(block[at].df.get("arg0", -1))
    # right in front of it: a jump taken when that map is empty, landing INSIDE the walk
    guarded = [i for i in range(max(0, at - 3), at)
               if block[i].op == "JNull" and gv(block[i].df.get("reg", -1)) == asked_of]
    guard(guarded,
          "the `%s` rules ask what this pass totalled at %d with nothing guarding an empty map. "
          "Either the read faults for a receiver that was totalled nothing, or an exit above it "
          "is keeping that receiver out of the walk -- and that exit is what makes the last mark "
          "unretractable" % (spelling, at))
    lands = guarded[-1] + 1 + gv(block[guarded[-1]].df.get("offset", 0))
    guard(lands < len(block),
          "the `%s` rules jump OUT of the block when the totals are empty, which is the old exit "
          "wearing a guard's clothes" % spelling)


def _calls(bc, block, name):
    findex = gv(function_named(bc, name).findex)
    return [i for i, o in enumerate(block)
            if o.op.startswith("Call") and gv(o.df.get("fun", -1)) == findex]


def _noted_what_it_grants(bc, spelling, block):
    """A trait this road grants is written down, so a later pass knows to take it back."""
    granting = _calls(bc, block, GRANT)
    if not granting:
        return
    pushed = _calls(bc, block, PUSH)
    guard(pushed, "the `%s` rules grant a trait and never write down that they did, so nothing "
                  "could ever take it back" % spelling)
    guard(min(pushed) < max(granting),
          "the `%s` rules note a trait at %d and grant last at %d -- a trait noted after the "
          "last grant is one the sweep has already passed" % (spelling, min(pushed),
                                                              max(granting)))


def _swept_after_the_last_grant(bc, spelling, block):
    """NOT RUN WHILE THE SWEEP IS OUT OF THE ROAD: it needs a pass that can say it was COMPLETE."""
    asked = _calls(bc, block, GET)
    granting = _calls(bc, block, GRANT)
    if not granting:
        return
    guard(len(granting) >= 2,
          "the `%s` rules call the grant %d time(s): one for a row that grants and one for the "
          "sweep that takes a trait back is the shape" % (spelling, len(granting)))
    guard(asked, "the `%s` rules sweep without asking what this pass totalled, so a trait still "
                 "being granted would be written back to nothing" % spelling)
    guard(max(asked) > min(granting),
          "the `%s` rules ask the totals last at %d and first grant at %d -- the sweep's own "
          "asking has to come after the rows have granted" % (spelling, max(asked),
                                                              min(granting)))
    guard(NOTED and SETTLED, "the sweep says nothing, and a build that cannot see it ran cannot "
                           "tell an empty list from a sweep that never happened")
