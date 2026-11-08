#!/usr/bin/env python3
"""What proves `framework/storewalk.py`. It reads the SPLICED site, and changes nothing itself."""
from tools.project import gv, guard
from tools.hlcode import function_named
from tools.splice import distances_in, every_distance_in, where
from framework import boundary, gone, ownermatch
from framework.acts.gain_res import GAIN
from framework.acts.gain_ttrait_stacks import saying_the_count
from framework.settle import saying_the_count_per_faction
from framework.parsed import READ, STORES
from framework.storewalk import BUCKETS, Site, scopes_with_roads, splice_name
from framework.tray import READS_PER_ROW as WHERE_IT_DRAWS
from framework.names import vocabulary
from framework.storewalk import _declared
from framework import driver
from framework import storewalk
from framework.pipeline import a_road


def check(bc):
    """The cases: the block is there, everything reaches it, and it does the road's work."""
    from framework.names import vocabulary
    words = vocabulary()
    scopes = scopes_with_roads(words)
    guard(scopes, "no scope says where its rules run, so nothing was spliced")
    total = 0
    for spelling in scopes:
        site = Site(bc, spelling, words)
        spliced = where(bc, splice_name(spelling))
        guard(spliced, "the `%s` rules never went in" % spelling)
        at, how_many = spliced
        _the_site_still_opens_as_it_did(bc, site, at, how_many)
        _everything_lands_inside(site.fn)
        _nothing_is_cut_off(site.fn, at, at + how_many, spelling)
        _what_the_block_does(bc, site, at, at + how_many)
        total += how_many
    reading = _a_road_reading_its_region_can_reach_one(bc, words)
    _an_unworded_row_off_a_region_is_ours(bc)
    return "%d scope(s), %d instruction(s), %d reading its region" % (len(scopes), total, reading)


def _an_unworded_row_off_a_region_is_ours(bc):
    """Telling the owner gate which pass is the region's adds ONE run, and changes nothing else."""
    from cases.pipeline import a_function_and_a_row
    from framework.pipeline import OWNER_IS, Pipeline, Stage
    from framework.record import FROM_REGION
    from framework import foreignwalk, scopematch
    shapes = []
    for region in (None, FROM_REGION):
        # ⛔ A FRESH FUNCTION EACH TIME, or the first's scratch places shrink the second
        fn, row = a_function_and_a_row(bc)
        road = Pipeline("the owner gate, told %s" % ("which pass" if region else "nothing"),
                        road="Unit", stages=(
            Stage(ownermatch.GATE, "GATE",
                  reads=(OWNER_IS, scopematch.HOLDER, scopematch.PAYEE,
                         foreignwalk.FROM_FOREIGN, foreignwalk.WHOSE_RULE, FROM_REGION),
                  body=ownermatch.gate_for(OWNER_IS, scopematch.HOLDER,
                                           foreignwalk.WHOSE_RULE, foreignwalk.FROM_FOREIGN,
                                           road="Unit", region_part=region)),))
        shapes.append([o.op for o in road.emit(bc, fn, dict(row))])
    plain, told = shapes
    grew = len(told) - len(plain)
    guard(grew > 0,
          "the gate told about the region pass is not longer, so it refuses nothing new")
    # where the two part company; past the inserted run is the gate exactly as it was
    at = 0
    while at < len(plain) and plain[at] == told[at]:
        at += 1
    guard(told[:at] + told[at + grew:] == plain,
          "telling the owner gate about the region pass moved something other than the run it "
          "inserts: %d instruction(s) added at %d, and what is left is not the gate it was"
          % (grew, at))


def _a_road_reading_its_region_can_reach_one(bc, words):
    """A road that says it reads its region's rules must have things that stand in one."""
    from framework.names import module_of
    from framework.scopematch import the_region_question
    from tools.hlcode import fields_of
    from framework.storewalk import READS_REGION_BY
    hops, held = the_region_question(words)
    guard(hops and held, "no word says how to reach the region a thing stands in")
    reading = 0
    for spelling in scopes_with_roads(words):
        if not getattr(module_of(words[spelling]), READS_REGION_BY, None):
            continue
        site = Site(bc, spelling, words)
        names, _ = fields_of(bc, site.holder_kind, "the holder these rules are about")
        guard(hops[0] in names,
              "`%s` says it reads the rules on its region, and its things carry no `%s` -- so "
              "the walk that finds one never runs and the pass would read a store off nothing"
              % (spelling, hops[0]))
        reading += 1
    # and the case is void if no road declares it at all
    guard(reading, "no road says it reads the rules written on its region")
    return reading


def _the_site_still_opens_as_it_did(bc, site, at, how_many):
    """The site's opening stands beside our block: behind its inherited call, or right after it."""
    if at == 0:
        after = site.fn.ops[how_many]
        guard(not after.op.startswith("J"),
              "the `%s` rules start the function and a %s follows them, so the site's own opening"
              " is gone" % (site.word, after.op))
        guard([o for o in site.fn.ops if o.op == "Ret"], "%s does not return" % site.name)
        return
    before = site.fn.ops[at - 1]
    guard(before.op.startswith("Call"),
          "the instruction in front of the `%s` rules is a %s, and the site opens with a call"
          % (site.word, before.op))
    guard([o for o in site.fn.ops if o.op == "Ret"], "%s does not return" % site.name)


def _everything_lands_inside(fn):
    """Every jump in the whole function, ours and the game's, lands somewhere in it."""
    for i, op in enumerate(fn.ops):
        for name in distances_in(op):
            target = i + 1 + gv(op.df[name])
            guard(0 <= target < len(fn.ops),
                  "the %s at %d lands at %d and the function has %d"
                  % (op.op, i, target, len(fn.ops)))


# ⛔ a block no jump reaches past one of these is never run: a word's check written and skipped
NEVER_FALLS_ON = ("JAlways", "Ret", "Throw", "Rethrow")


def _nothing_is_cut_off(fn, at, ends, spelling):
    """Every instruction we spliced is reached: by falling into it, or by a jump landing on it."""
    landed = {i + 1 + gv(d) for i, op in enumerate(fn.ops) for d in every_distance_in(op)}
    cut = [i for i in range(at + 1, ends)
           if fn.ops[i - 1].op in NEVER_FALLS_ON and i not in landed
           and _does_work(fn, i, ends, landed)]
    guard(not cut, "the `%s` rules hold %d block(s) nothing reaches: %s"
          % (spelling, len(cut), "; ".join("%d %s" % (i, " ".join(
              o.op for o in fn.ops[i:i + 6])) for i in cut[:4])))


def _does_work(fn, i, ends, landed):
    """Does the unreached run from `i` ask or change anything, beyond labels, jumps and numbers?"""
    for j in range(i, ends):
        if j > i and j in landed:
            return False
        if fn.ops[j].op not in ("Label", "Nop", "Int") + NEVER_FALLS_ON and not distances_in(
                fn.ops[j]):
            return True
        if fn.ops[j].op in NEVER_FALLS_ON:
            return False
    return False


def two_holders_here(site):
    """Does this road read a second holder -- the thing's own rows, and then its owner's?"""
    return _declared(site.word, storewalk.OWNER_BY, vocabulary()) != storewalk.ITSELF


def _calls(bc, block, name):
    # every instruction in the block that calls that named function
    wanted = gv(function_named(bc, name).findex)
    return [o for o in block if o.op.startswith("Call") and gv(o.df.get("fun", -1)) == wanted]


def _slot_calls(bc, block, kind, method):
    # every instruction calling that method on its SLOT, so the receiver answers its own way
    from tools.hlcode import kind_named, method_slot
    wanted = method_slot(bc, kind_named(bc, kind), method, kind)
    return [o for o in block
            if o.op == "CallMethod" and gv(o.df.get("field", -1)) == wanted]


def _owner_pick_walks():
    """One walk over the factions per narrowing an owner word may stand in front of."""
    from framework import ownerpicks
    return ownerpicks.walks()


def _narrowing_walks(site):
    """Each narrowing word's own walks, once bare and once more where an owner word picks."""
    from framework import narrowmatch, ownerpicks
    from framework.names import module_of, vocabulary
    words, total = vocabulary(), 0
    for spelling in narrowmatch.bits(words):
        word = module_of(words[spelling])
        walks = getattr(word, "WALKS_ON", {}).get(site.word, getattr(word, "WALKS", 0))
        asks = 1 + bool(getattr(word, narrowmatch.OWNERS_PICK_BY, False)
                        and getattr(word, ownerpicks.BARE_ASKS_ITSELF_BY, False))
        total += walks * asks
    return total


def _scaling_walks(bc, site):
    """One walk per multiplier per act, per count asking each member, two per weighed group."""
    from framework import membercount, multmatch, narrowcount, questions
    from framework.names import vocabulary
    # a summed count's own walk, and the summing function's, now reached through the word's link
    here = multmatch.counted_here(bc, site)
    return (len(multmatch.words_of()) + 2 * len(narrowcount.narrowers_of())
            + membercount.WALKS) * len(
        [s for s in a_road().stages if set(multmatch.READS) <= set(s.reads)]) + sum(
        multmatch.walks_of(w) + (0 if questions.picked_counts_itself(w) else getattr(
            questions.summing(w), "WALKS", 0)) for w in here) + 2 * sum(
        len(narrowcount.weighed_by(w)) for w in vocabulary().values())


def _acts_run_for_whom():
    """How many acts the rider's step runs around: every one but those that settle it themselves."""
    from framework.pipeline import LATER_ACTS
    from framework.acts import gain_res, gain_ttrait_stacks
    return len([a for a in (gain_res, gain_ttrait_stacks) + LATER_ACTS
                if not getattr(a, "RIDER_SETTLED", False)])


def _acts_own_loops():
    """The loops each act declares in its own file (`LOOPS`), run only when its row fires."""
    from framework.pipeline import LATER_ACTS
    from framework.acts import gain_res, gain_ttrait_stacks
    return sum(getattr(a, "LOOPS", 0) for a in (gain_res, gain_ttrait_stacks) + LATER_ACTS)


def _with_what_it_shares(bc, block):
    """The block, then once each the body of every shared function of ours it reaches."""
    from tools.hlcode import SHARED_ON
    shared = {gv(f.findex): f for f in (getattr(bc, SHARED_ON, None) or {}).values()}
    called, walked = [], list(block)
    # ⛔ THROUGH EVERY CALL, never one deep: a word's check or scaling calls the next word's
    for o in walked:
        fun = gv(o.df["fun"]) if o.op.startswith("Call") and "fun" in o.df else None
        if fun in shared and fun not in called:
            called.append(fun)
            walked += shared[fun].ops
    return list(block) + [o for fun in called for o in shared[fun].ops]


def _what_the_block_does(bc, site, at, ends):
    """It asks once, walks the store, reads the parse back, and carries the act itself."""
    own, block = site.fn.ops[at:ends], _with_what_it_shares(bc, site.fn.ops[at:ends])
    # the sentinel is asked ONCE here, told from a restored row's lookup by the MINTED WORD
    sentinel = boundary.minted(bc)
    from_the_word = {gv(o.df["dst"]) for o in own
                     if o.op == "GetGlobal" and gv(o.df.get("global", -1)) == sentinel}
    asked = [o for o in _calls(bc, own, boundary.LOOKUP)
             if gv(o.df.get("arg0", -1)) in from_the_word]
    # ONE PER STAGE THAT OPENS WITH ONE, each once per walk -- never per ROW
    opens = len([s for s in a_road().stages if s.opening is not None])
    guard(len(asked) <= opens,
          "the `%s` rules ask where the sentinel sits %d time(s), and %d stage(s) open with one"
          % (site.word, len(asked), opens))
    # the holder is still in the game, asked as its update asks -- unless that update asks nothing
    if site.question is None:
        guard(driver.live_path_starts(
            function_named(bc, _declared(site.word, driver.DECLARES[1], vocabulary())),
            site.word) == 0,
            "the `%s` rules ask nothing, and its own update does steal an early exit" % site.word)
    else:
        guard(_calls(bc, block, site.question),
              "the `%s` rules never ask `%s`, so a holder out of the game still runs them"
              % (site.word, site.question))
    # AND THE WRITE ITSELF, ON THE SLOT, ONCE PER ROAD, so a building answers its own way
    on_the_slot = _slot_calls(bc, block, ownermatch.ASKED_ON,
                              ownermatch.OWNER_OF.rsplit(".", 1)[-1])
    guard(len(on_the_slot) == 1,
          "the `%s` rules ask who owns a receiver on the slot %d time(s), and the end-of-walk "
          "write is exactly one" % (site.word, len(on_the_slot)))
    # one bucket lookup, inside the walk
    guard(len(_calls(bc, block, BUCKETS)) == 1,
          "the `%s` rules ask %s %d time(s)" % (site.word, BUCKETS,
                                                len(_calls(bc, block, BUCKETS))))
    # everything the parse kept comes back, at least one read each
    guard(len(_calls(bc, block, READ)) >= len(STORES),
          "the `%s` rules read fewer maps than the parse keeps" % site.word)
    # the act itself -- the first code of ours in the game that changes anything
    guard(_calls(bc, block, GAIN),
          "the `%s` rules carry no act, so nothing they do would change the game" % site.word)
    # and the two loops close: a jump backwards out of each, landing on a Label of ours
    back = [i for i, o in enumerate(block)
            for name in distances_in(o) if i + 1 + gv(o.df[name]) < i]
    # PLUS WHATEVER THE BAKE CLOSES, counted off its splice and the shared bake it calls
    from framework import bake
    _bake_at, _bake_many = where(bc, bake.SPLICE)
    _bake = _with_what_it_shares(bc, bake.site(bc).ops[_bake_at:_bake_at + _bake_many])
    # the sweep runs once per receiver the pass touched, and its shared stamp walk over factions
    for_the_receiver_list = 1 + 1
    # the pass seeds itself from the durable per-holder list, dropping its dead first
    for_what_this_holder_owes = 1 + gone.WALKS
    # the count asked as EACH faction while read; the sum below already holds stackcount's two walks
    for_the_count_per_faction = (1 if saying_the_count_per_faction() else 0) - (
        0 if saying_the_count() else 2)
    # TWO PER ACT WHOSE RIDER IS SETTLED AROUND IT: the next faction for `ForAll`, and a skipped one
    for_paying_everyone = 2 * _acts_run_for_whom()
    # each act's declared loops; our bucket; production's two searches and its sweep's two way back
    for_spawning_each_unit, for_our_own_bucket = _acts_own_loops(), 1 + 2 + 2
    # TWO PER SET REACH: the membership walk re-enters on an empty place and on another member
    from framework import setreach
    for_each_set_case = 2 * len(setreach.routes(bc))
    # a restored row, the pass's two trays, each owner word picking a narrowing's factions, walks
    for_a_restored_row, for_the_pass_tray = 1 + _owner_pick_walks() + _narrowing_walks(site), 2
    # THE STORE LOOP IS EVERY ROAD'S; 3 + 2: the row's record read, and looked up (`parsed.py`)
    expected = 2 + 1 + 5 + _scaling_walks(bc, site) + for_the_pass_tray + for_the_receiver_list + (
        for_what_this_holder_owes) + for_the_count_per_faction + for_paying_everyone + (
        for_spawning_each_unit) + for_our_own_bucket + for_each_set_case + for_a_restored_row + len(
        [i for i, o in enumerate(_bake)
         for name in distances_in(o) if i + 1 + gv(o.df[name]) < i])
    guard(len(back) == expected,
          "the `%s` rules jump backwards %d time(s), and %d is the walk of rows and their "
          "applications plus the bake's own" % (site.word, len(back), expected))
    for i in back:
        lands = i + 1 + gv(block[i].df[distances_in(block[i])[0]])
        guard(0 <= lands < len(block) and block[lands].op == "Label",
              "a loop of the `%s` rules lands on a %s, and a loop lands on a Label"
              % (site.word, block[lands].op if 0 <= lands < len(block) else "instruction "
                 "outside the block"))
    return len(block)
