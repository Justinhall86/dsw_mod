#!/usr/bin/env python3
"""What proves the treaty raise: two calls at the SPLICED site, a walk that changes nothing."""
from tools.project import gv, guard
from tools.hlcode import call_sites, function_named
from tools.splice import site_of, where
from framework.triggers import on_treaty as treaty_word
from framework.raises.on_treaty import SPLICE, SIGNERS
from cases.on_siege_action import _it_writes_nothing


def check(bc):
    """One call per signer right before the first signing alert; the walk reads nothing kept."""
    found = where(bc, SPLICE)
    guard(found, "nothing is spliced where a treaty is signed")
    at, how_many = found
    site = function_named(bc, treaty_word.SITE)
    guard(site_of(bc, SPLICE) == gv(site.findex),
          "the treaty block went somewhere other than the site the trigger names")
    after = call_sites(site, function_named(bc, treaty_word.BEFORE))
    guard(after and after[0] == at + how_many, "the treaty block ends at %d, and the first "
          "signing alert is at %s; it belongs right before" % (at + how_many, after))
    block = site.ops[at:at + how_many]
    guard(len(block) == 1 and block[0].op == "Call4",
          "the treaty block is %s, and one call belongs there" % [o.op for o in block])
    both = _function(bc, block[0])
    calls = [o for o in both.ops if o.op == "Call4"]
    walks = {gv(o.df["fun"]) for o in calls}
    guard(len(walks) == 1, "the signers call %d different walks, and one is shared" % len(walks))
    handed = [(gv(o.df["arg2"]), gv(o.df["arg3"])) for o in calls]
    guard(handed == list(SIGNERS), "the walk is handed the signers as %s, and each signer once "
          "as the actor belongs: %s" % (handed, list(SIGNERS)))
    walk = _function(bc, calls[0])
    read = {gv(o.df["field"]) for o in walk.ops if o.op == "GetThis"}
    guard(not read, "the treaty walk reads fields %s of the diplomacy, and none belongs"
          % sorted(read))
    _it_writes_nothing(walk.ops)
    return "1 call where a treaty is signed, walking %d signers in %d instruction(s)" % (
        len(calls), len(walk.ops))


def _function(bc, call):
    """The function of ours one call reaches."""
    return next(f for f in bc.functions if gv(f.findex) == gv(call.df["fun"]))
