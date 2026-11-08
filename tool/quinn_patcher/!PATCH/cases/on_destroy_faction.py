#!/usr/bin/env python3
"""What proves the destruction raise: it reads the SPLICED site, and changes nothing."""
from tools.project import gv, guard
from tools.hlcode import call_sites, function_named
from tools.splice import site_of, where
from framework.triggers import on_destroy_faction as destroy_word
from framework.raises.on_destroy_faction import SPLICE
from cases.on_siege_action import _it_writes_nothing


def check(bc):
    """The block sits right before the victim is ended, and reads nothing off the faction."""
    found = where(bc, SPLICE)
    guard(found, "nothing is spliced where a faction loses its last main base")
    at, how_many = found
    site = function_named(bc, destroy_word.SITE)
    guard(site_of(bc, SPLICE) == gv(site.findex),
          "the destruction block went somewhere other than the site the trigger names")
    ends = call_sites(site, function_named(bc, destroy_word.BEFORE))
    guard(ends == [at + how_many], "the destruction block ends at %d, and the victim is "
          "ended at %s; it belongs right before" % (at + how_many, ends))
    block = site.ops[at:at + how_many]
    read = sorted({gv(o.df["field"]) for o in block if o.op == "GetThis"})
    guard(not read, "the destruction block reads fields %s of the faction, and none belong"
          % read)
    _it_writes_nothing(block)
    return "%d instruction(s) where a faction loses its last main base" % how_many
