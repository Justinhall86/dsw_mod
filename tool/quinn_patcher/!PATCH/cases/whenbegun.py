#!/usr/bin/env python3
"""What proves `framework/whenbegun.py`. It reads the SPLICED sites and changes nothing itself."""
from tools.project import gv, guard
from tools.splice import site_of, where
from framework.bake import SPLICE as BAKE
from framework.loadguard import clear_site, ready_site
from framework.mark import slot as owed_slot
from framework.newworld import TURNED_ON_AGAIN
from framework.whenbegun import slot as was_made_slot


def check(bc):
    """Was-made is written where only a built world reaches, and asked where both do."""
    _only_a_built_world_says_it(bc)
    _the_bake_no_longer_asks(bc)
    _the_load_drops_what_it_raised(bc)
    return "said by a built world only, asked at the load's own readiness"


def _only_a_built_world_says_it(bc):
    """The whole design in one check: ONLY the turning-on a load cannot reach fills was-made."""
    where_made = was_made_slot(bc)
    writers = {gv(f.findex) for f in bc.functions
               for o in (f.ops or [])
               if o.op == "SetGlobal" and gv(o.df["global"]) == where_made}
    built, begins = gv(ready_site(bc).findex), gv(clear_site(bc).findex)
    guard(writers == {built, begins},
          "%d place(s) write was-made; exactly two may -- the built world's own moment, and "
          "the emptying when a new world begins. The load's own readiness may never be one "
          "of them, or every loaded game calls itself made and keeps what its restore "
          "raised" % len(writers))


def _the_bake_no_longer_asks(bc):
    """Nothing at the filing may read was-made: a set-up row is filed before it is ever written."""
    found = where(bc, BAKE)
    guard(found, "the bake is not spliced")
    at, how_many = found
    fn = [f for f in bc.functions if gv(f.findex) == site_of(bc, BAKE)]
    guard(len(fn) == 1, "the bake's own function cannot be found again")
    read = {gv(o.df["global"]) for o in fn[0].ops[at:at + how_many] if o.op == "GetGlobal"}
    guard(was_made_slot(bc) not in read,
          "the bake reads was-made, and at that moment it is empty on EVERY world -- so it "
          "would refuse a fresh game's own rows")


def _the_load_drops_what_it_raised(bc):
    """The marks map is emptied at the turning-on both kinds of world reach."""
    found = where(bc, TURNED_ON_AGAIN)
    guard(found, "the load's own turning-on is not spliced")
    at, how_many = found
    fn = [f for f in bc.functions if gv(f.findex) == site_of(bc, TURNED_ON_AGAIN)]
    guard(len(fn) == 1, "the load's turning-on cannot be found again")
    block = fn[0].ops[at:at + how_many]
    read = {gv(o.df["global"]) for o in block if o.op == "GetGlobal"}
    wrote = {gv(o.df["global"]) for o in block if o.op == "SetGlobal"}
    guard(was_made_slot(bc) in read, "the load's turning-on never asks which kind of world this is")
    guard(owed_slot(bc) in wrote, "a restored world never drops the marks its restore raised")
    guard(was_made_slot(bc) not in wrote,
          "the load's turning-on writes was-made, so a load would call itself made")
