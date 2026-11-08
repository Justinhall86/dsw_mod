#!/usr/bin/env python3
"""The kept fixes in their tick folders, one switched item each, in their load-bearing order."""
import sys

from tools.project import on_path
from standalone import onoff


def _passes():
    """The kept fixes' own modules, by bare name, since they import each other that way."""
    on_path()
    import armouryfee, alwayscosts, slotprice, cannotremove, abilitykeys, capturecancel
    import keycancel, abilitywalk, hostlimit, hostlimitflat
    return sys.modules


def _abilitykeys(bc, m):
    # the two resolves only read; the walk clones what the first found, the cancel the second
    m["abilitykeys"].apply_w33(bc, emit=False)
    m["capturecancel"].apply_w33cap(bc, emit=False)
    m["abilitywalk"].apply_w38(bc)


# NAME, what it does in the game, the items it cannot work without, and the fix itself; in order
ITEMS = (
    ("armouryfee", "the Armoury's remove fee comes from the item's own cost in the cdb", (),
     lambda bc, m: m["armouryfee"].apply_w39(bc)),
    ("alwayscosts", "costToEquip: equipping charges the item's cost; removing it is free", (),
     lambda bc, m: m["alwayscosts"].apply_w30d(bc)),
    ("slotprice", "the price follows the equipment slot it is going into", (),
     lambda bc, m: m["slotprice"].apply_w30f(bc)),
    ("cannotremove", "cannotRemove: prevents taking a marked equipment off", (),
     lambda bc, m: m["cannotremove"].apply_w30h(bc)),
    ("abilitykeys", "an ability key, named or numbered, starts its ability button", (),
     _abilitykeys),
    ("keycancel", "the named key cancels as well as casts", ("abilitykeys",),
     lambda bc, m: m["keycancel"].apply_w37cap(bc)),
    ("hostlimit", "hostLimit: a building's own props say how many a host may hold", (),
     lambda bc, m: m["hostlimit"].apply_w41(bc)),
    ("hostlimitflat", "HostLimit_Flat: an authored row ADDS to that limit", ("hostlimit",),
     lambda bc, m: m["hostlimitflat"].apply_w42(bc, verbose=False)),
)


def _install(name, run):
    def install(bc):
        if not onoff.on(name):
            return "KEPT %s: OFF" % name
        run(bc, _passes())
        return "KEPT %s: applied" % name
    return install


def only(*names):
    """The build's lines for the named items, in their load-bearing order."""
    return tuple((what, _install(name, run)) for name, what, _needs, run in ITEMS
                 if name in names)
