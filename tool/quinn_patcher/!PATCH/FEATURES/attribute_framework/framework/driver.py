#!/usr/bin/env python3
"""Which scopes name a site of their own, and where that site's live path begins."""
from tools.project import guard

# what a scope's file must declare before it can have a driver at all
DECLARES = ("WORD", "SITE", "ENTITY")


# how far into a site an early exit may be before the shape has plainly moved
EARLY = 20


def live_path_starts(fn, site):
    """Where the live path begins: after the update's own early exit, else its first instruction."""
    ops = fn.ops or []
    guard(ops, "%s has no instructions at all" % site)
    early = [i for i, op in enumerate(ops) if op.op == "Ret" and i < EARLY]
    start = (early[-1] + 1) if early else 0
    guard(start < len(ops), "%s has nothing after its early exit" % site)
    # in front of a jump is not a place to put anything: the jump's own target moves
    guard(not ops[start].op.startswith("J"),
          "the live path of %s starts on a %s, and nothing may go in front of a jump"
          % (site, ops[start].op))
    return start


def scopes_with_drivers(words=None):
    """Every scope word whose file names a site: THE one list of roads and drivers."""
    from framework.names import module_of, vocabulary
    from framework.scopematch import only_scopes
    words = vocabulary() if words is None else words
    return sorted(spelling for spelling, word in only_scopes(words).items()
                  if all(hasattr(module_of(word), what) for what in DECLARES))
