#!/usr/bin/env python3
"""What proves `framework/mark.py`. It reads the SPLICED road, and changes nothing itself."""
from tools.project import gv, guard
from tools.hlcode import calls_into, function_named
from tools.splice import where
from framework.acts.gain_res import GAIN
from framework.mark import SLOT, STAGE, slot
from framework.oneshot import MAP, TELL
from framework.parsed import READ, STORES
from framework import scopematch
from framework.tray import READS_PER_ROW as WHERE_IT_DRAWS
from framework.storewalk import Site, scopes_with_roads, splice_name
from tools.hlcode import kind_named


def check(bc):
    """The store is there, the road asks before it acts, and it spends only after."""
    made = slot(bc)
    guard(made is not None, "there is no place called `%s` in this file" % SLOT)
    guard(gv(bc.global_types[made]) == kind_named(bc, MAP),
          "`%s` holds a t@%s, and a count per application wants a %s"
          % (SLOT, gv(bc.global_types[made]), MAP))

    from framework.names import vocabulary
    words = vocabulary()
    scopes = scopes_with_roads(words)
    guard(scopes, "no scope says where its rules run, so nothing reads a mark")
    for spelling in scopes:
        site = Site(bc, spelling, words)
        spliced = where(bc, splice_name(spelling))
        guard(spliced, "the `%s` rules never went in" % spelling)
        at, how_many = spliced
        _asked_before_the_act_and_spent_after(bc, site, site.fn.ops[at:at + how_many])
    return "%d road(s) ask before acting and spend after" % len(scopes)


def _calls(block, findex):
    return [i for i, o in enumerate(block)
            if o.op.startswith("Call") and gv(o.df.get("fun", -1)) == findex]


def _the_marks_own_places(bc, site, block):
    """Every place the MARKS' map was read into, and the map under the thing, cast out of it."""
    made = slot(bc)
    mine = {gv(o.df["dst"]) for o in block
            if o.op == "GetGlobal" and gv(o.df.get("global", -1)) == made}
    reading = gv(function_named(bc, READ).findex)
    answers = {gv(o.df["dst"]) for o in block
               if o.op.startswith("Call") and gv(o.df.get("fun", -1)) == reading
               and gv(o.df.get("arg0", -1)) in mine}
    # only an answer CAST BACK TO A MAP is the inner one: the same call also hands back counts
    return mine | {gv(o.df["dst"]) for o in block
                   if o.op == "SafeCast" and gv(o.df.get("src", -1)) in answers
                   and gv(site.fn.regs[gv(o.df["dst"])]) == kind_named(bc, MAP)}


def _asked_before_the_act_and_spent_after(bc, site, block):
    """The count is READ before the act and WRITTEN only past it, so no refusal eats an event."""
    reading = _calls(block, gv(function_named(bc, READ).findex))
    marks = _the_marks_own_places(bc, site, block)
    # ⛔ FILING A MAP IS NOT SPENDING AN EVENT: that write makes a place, it pays nothing
    told = [i for i in _calls(block, gv(function_named(bc, TELL).findex))
            if gv(block[i].df["arg0"]) in marks
            and gv(site.fn.regs[gv(block[i].df["arg2"])]) != kind_named(bc, MAP)]
    # and a WRITE-OFF copies what happened straight back, on a narrowing's refusal, never paying
    answered = {gv(block[i].df["dst"]) for i in reading}
    written_off = [i for i in told if gv(block[i].df["arg2"]) in answered]
    telling = [i for i in told if i not in written_off]
    guard(written_off, "the `%s` rules never write off a refused event, so it pays later"
          % site.word)
    acting = calls_into(bc, block, gv(function_named(bc, GAIN).findex))
    guard(acting, "the `%s` rules carry no act" % site.word)
    guard(telling, "the `%s` rules never spend a mark, so one event would pay forever"
          % site.word)
    guard(min(reading) < acting[0],
          "the `%s` rules act at %d and first read a mark at %d -- the gate has to come first"
          % (site.word, acting[0], min(reading)))
    guard(min(telling) > acting[-1],
          "the `%s` rules spend a mark at %d and act last at %d -- spending before the act eats "
          "an event whenever a later stage refuses" % (site.word, min(telling), acting[-1]))


def the_stage_is_named():
    """The road's own name for it, so the log and the road agree."""
    guard(STAGE, "the stage has no name, and the log says one per row")
