#!/usr/bin/env python3
"""What proves the assassination raise: it reads the SPLICED site, and changes nothing."""
from tools.project import gv, guard
from tools.hlcode import call_sites, function_named
from tools.splice import site_of, where
from framework.triggers import on_assassinate as assassinate_word
from framework.raises.on_assassinate import SPLICE, what_is_in_hand
from cases.on_siege_action import _it_writes_nothing


def check(bc):
    """The block sits right before the victim is ended, and reads only its two fields."""
    found = where(bc, SPLICE)
    guard(found, "nothing is spliced where an assassination succeeds")
    at, how_many = found
    site = function_named(bc, assassinate_word.SITE)
    guard(site_of(bc, SPLICE) == gv(site.findex),
          "the assassination block went somewhere other than the site the trigger names")
    ends = call_sites(site, function_named(bc, assassinate_word.BEFORE))
    guard(ends == [at + how_many], "the assassination block ends at %d, and the victim is "
          "ended at %s; it belongs right before" % (at + how_many, ends))
    block = site.ops[at:at + how_many]
    read = {gv(o.df["field"]) for o in block if o.op == "GetThis"}
    guard(read == set(what_is_in_hand(bc)),
          "the assassination block reads fields %s of the manager, and only the assassin and "
          "the assassination belong" % sorted(read))
    _it_writes_nothing(block)
    return "%d instruction(s) where an assassination succeeds" % how_many
