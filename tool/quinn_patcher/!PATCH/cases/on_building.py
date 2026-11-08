#!/usr/bin/env python3
"""What proves the building moments: each block sits in its own site, and changes nothing."""
from tools.project import gv, guard
from tools.splice import site_of, where
from framework.raises.on_building import MOMENTS, site, where_spliced
from cases.on_siege_action import _it_writes_nothing


def check(bc):
    """Each moment's block is in its own game function, where that moment says, writing nothing."""
    said = []
    for moment in MOMENTS:
        found = where(bc, moment.SPLICE)
        guard(found, "nothing is spliced where a building is %s" % moment.NOUN)
        at, how_many = found
        fn = site(bc, moment)
        guard(site_of(bc, moment.SPLICE) == gv(fn.findex),
              "the block for a building %s went somewhere other than %s"
              % (moment.NOUN, moment.word.SITE))
        # the call or return it goes ahead of now sits right past it; a fixed place stays put
        wanted = where_spliced(bc, moment, fn)
        guard(wanted in (at, at + how_many),
              "the block for a building %s is at %d of %s, and belongs right before %d"
              % (moment.NOUN, at, moment.word.SITE, wanted))
        _it_writes_nothing(fn.ops[at:at + how_many])
        said.append("%d at %s" % (how_many, moment.word.SITE))
    return "; ".join(said)
