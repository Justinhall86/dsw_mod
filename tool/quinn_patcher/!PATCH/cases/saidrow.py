#!/usr/bin/env python3
"""What proves `framework/saidrow.py`. It reads the SPLICED road, and changes nothing itself."""
from tools.project import gv, guard
from tools.hlcode import calls_into, function_named, kind_named, minted_text
from tools.splice import where
from framework.acts.gain_res import GAIN
from framework.oneshot import MAP, TELL
from framework.parsed import HELD_BY
from framework.saidrow import SLOT, TAG, slot
from framework.sayonce import COMPLAIN, SAYING
from framework.storewalk import RAN, REACHED

# the road's own diagnosis, said whatever the quiet switch says
ITS_OWN = (RAN, REACHED)
from framework.storewalk import (NAMED_BY, NAMED_BY_BY, Site, field_by_name, named_by_for,
                             scopes_with_roads, splice_name)


def check(bc):
    """The cases: the store is there, and every road reads both ids and says them before it acts."""
    from framework.names import vocabulary
    made = slot(bc)
    guard(made is not None, "there is no place called `%s` in this file" % SLOT)
    guard(gv(bc.global_types[made]) == kind_named(bc, MAP),
          "`%s` holds a t@%s and the key is an object, so it has to hold a %s"
          % (SLOT, gv(bc.global_types[made]), MAP))
    guard(minted_text(bc, TAG) is not None, "`%s` was never minted into this file" % TAG)

    words = vocabulary()
    scopes = scopes_with_roads(words)
    guard(scopes, "no scope says where its rules run, so nothing says anything")
    for spelling in scopes:
        site = Site(bc, spelling, words)
        spliced = where(bc, splice_name(spelling))
        guard(spliced, "the `%s` rules never went in" % spelling)
        at, how_many = spliced
        _both_ids_are_read(bc, site, site.fn.ops[at:at + how_many])
    return "%d road(s) name their holder and their row" % len(scopes)


def _reads(block, field, at_place=None, of_kind=None, regs=None):
    # every read of that field, off one named place or any place of one kind -- never the number
    def right_object(o):
        if at_place is not None:
            return gv(o.df["obj"]) == at_place
        return gv(list(regs)[gv(o.df["obj"])]) == of_kind

    return [i for i, o in enumerate(block)
            if o.op == "Field" and gv(o.df["field"]) == field and right_object(o)]


def _both_ids_are_read(bc, site, block):
    """The holder's id once per walk, the row's once per application, both said before the act."""
    application_kind = kind_named(bc, HELD_BY)
    # THE FIELD THE ROAD ASKED FOR, not the default: an agent keeps its own id in `name`
    holder_at, _ = field_by_name(bc, site.holder_kind, named_by_for(site.word),
                                 "the holder these rules are about")
    row_at, _ = field_by_name(bc, application_kind, NAMED_BY, "one application")
    # the holder is place ZERO; read at most TWICE: the walk's own, and a MARKED scope's per row
    holder = _reads(block, holder_at, at_place=0)
    guard(len(holder) <= 2,
          "the `%s` rules read the holder's own id %d time(s), and twice is the walk's own plus "
          "the scope gate's match against a marked column"
          % (site.word, len(holder)))
    row = _reads(block, row_at, of_kind=application_kind, regs=site.fn.regs)
    guard(len(row) == 1,
          "the `%s` rules read the row's own id %d time(s)" % (site.word, len(row)))
    guard(holder[0] < row[0],
          "the `%s` rules read the row's id before the holder's, so the pair would be said "
          "with whatever the last walk left" % site.word)
    # and both are said in front of the one thing that changes the game
    acts = calls_into(bc, block, gv(function_named(bc, GAIN).findex))
    guard(acts, "the `%s` rules carry no act, so there is nothing to be in front of" % site.word)
    guard(row[0] < acts[0],
          "the `%s` rules say the row after they act, so a gate would hide the rows this asks "
          "about" % site.word)
    _nothing_is_said_when_there_is_nothing(bc, site, block, holder[0], row[0])
    _the_row_is_put_away_after_the_road(bc, site, block, acts[-1])


def _the_row_is_put_away_after_the_road(bc, site, block, last_act):
    """The map is told AFTER the road, so every stage of this row still reads it unseen."""
    telling = gv(function_named(bc, TELL).findex)
    # ONLY the writes to THIS map: the one borrowed call writes to several
    made = slot(bc)
    ours = {gv(o.df["dst"]) for o in block
            if o.op == "GetGlobal" and gv(o.df.get("global", -1)) == made}

    def writes(o):
        return o.op.startswith("Call") and gv(o.df.get("fun", -1)) == telling

    # AND A MAP FILED UNDER OURS IS OURS TOO: a two-holder road marks the row in a per-THING map
    ours |= {gv(o.df["arg2"]) for o in block
             if writes(o) and gv(o.df.get("arg0", -1)) in ours
             and gv(o.df.get("arg1", -1)) != gv(o.df.get("arg2", -2))}
    # AND ONLY THE WRITES THAT MARK A ROW: these maps are sets, so a mark stores its own key
    told = [i for i, o in enumerate(block)
            if writes(o) and gv(o.df.get("arg0", -1)) in ours
            and gv(o.df.get("arg1", -1)) == gv(o.df.get("arg2", -2))]
    guard(told, "the `%s` rules never put a row away, so every tick would say every path again"
          % site.word)
    guard(min(told) > last_act,
          "the `%s` rules put a row away at %d and act at %d -- told that early, the road's own "
          "stages would read it as already seen" % (site.word, min(told), last_act))


def _given_to(op):
    # every place one call is handed, whatever shape of call it is
    return [gv(value) for name, value in op.df.items() if name.startswith("arg")]


def _nothing_is_said_when_there_is_nothing(bc, site, block, holder_read, row_read):
    """Neither id reaches a call untested for nothing; ⛔ while nothing is said, none at all."""
    wanted = {gv(block[holder_read].df["dst"]), gv(block[row_read].df["dst"])}
    if not SAYING:
        # each of the road's own words is behind a latch, never on the open path
        latched = [o for o in block if o.op == "SetGlobal"]
        guard(len(latched) >= len(ITS_OWN),
              "the `%s` rules say %d word(s) of their own and latch %d"
              % (site.word, len(ITS_OWN), len(latched)))
        return
    tested = set()
    for op in block[row_read + 1:]:
        if op.op == "JNull":
            tested.add(gv(op.df["reg"]))
        elif op.op.startswith("Call"):
            given = set(_given_to(op)) & wanted
            guard(given <= tested,
                  "the `%s` rules hand an id over untested, and one that is not there is not a "
                  "line" % site.word)
        if wanted <= tested:
            return
    guard(False, "the `%s` rules never test either id for nothing" % site.word)
