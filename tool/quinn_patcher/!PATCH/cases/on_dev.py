#!/usr/bin/env python3
"""What proves the development raise: it reads the SPLICED site, and changes nothing."""
from tools.project import gv, guard
from tools.hlcode import call_sites, field_by_name, function_named, kind_named
from tools.splice import site_of, where
from framework.triggers import on_dev as dev_word
from framework.raises.on_dev import SPLICE
from cases.on_siege_action import _it_writes_nothing


def check(bc):
    """The block sits right before the feedback, and reads only the owner off the manager."""
    found = where(bc, SPLICE)
    guard(found, "nothing is spliced where a development is acquired")
    at, how_many = found
    site = function_named(bc, dev_word.SITE)
    guard(site_of(bc, SPLICE) == gv(site.findex),
          "the development block went somewhere other than the site the trigger names")
    after = call_sites(site, function_named(bc, dev_word.BEFORE))
    guard(after == [at + how_many], "the development block ends at %d, and the feedback is "
          "at %s; it belongs right before" % (at + how_many, after))
    block = site.ops[at:at + how_many]
    read = {gv(o.df["field"]) for o in block if o.op == "GetThis"}
    owner = field_by_name(bc, kind_named(bc, dev_word.ABOUT), dev_word.OWNER_ON,
                          "developments")[0]
    guard(read == {owner}, "the development block reads fields %s of the manager, and only "
          "its owner belongs" % sorted(read))
    _it_writes_nothing(block)
    return "%d instruction(s) where a development is acquired" % how_many
