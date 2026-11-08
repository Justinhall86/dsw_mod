#!/usr/bin/env python3
"""What proves the trailing words' gate and the multipliers it gates. Nothing goes into the game."""
from tools.project import gv, guard
from tools.hlcode import function_named, kind_named
from framework import multmatch
from framework.forwhom import COUNTED_ON
from framework.names import module_of, parse, vocabulary
from framework.pieceword import spellings
from framework.trailing import attached, gated, kinds, needs_of, offers_of

# each id, and each needing piece in it with the piece it takes, or nothing where it is skipped
IDS = (("Faction_GainTTraitStack_PerUnit_PerDev",
        (("PerUnit", "GainTTraitStack"), ("PerDev", "GainTTraitStack"))),
       ("Faction_GainTTraitStack_PerUnit_PerUnit",
        (("PerUnit", "GainTTraitStack"), ("PerUnit", "GainTTraitStack"))),
       ("Faction_PerUnit_GainTTraitStack", (("PerUnit", None),)),
       ("Faction_OnThis_SpawnTUnits_WithTTrait2_PerDev",
        (("WithTTrait2", "SpawnTUnits"), ("PerDev", "SpawnTUnits"))),
       ("Faction_OnThis_GainTRes_WithTTrait2", (("WithTTrait2", None),)),
       ("Faction_GainTTraitStack_PerDev_PerBuilding_OfTDomain2",
        (("PerDev", "GainTTraitStack"), ("PerBuilding", "GainTTraitStack"),
         ("OfTDomain2", "PerBuilding"))),
       ("Faction_GainTTraitStack_PerBuilding_PerDev_OfTDomain2",
        (("PerBuilding", "GainTTraitStack"), ("PerDev", "GainTTraitStack"),
         ("OfTDomain2", "PerDev"))))


def check(bc):
    """The cases: every need is offered, each id attaches as written, every act scales."""
    words = vocabulary()
    needed = kinds(words)
    _each_id_attaches_as_written(words)
    _every_multiplier_says_what_it_counts(bc, words)
    _a_marked_spelling_counts_by_its_bare_route(words)
    _every_act_offering_an_amount_reads_every_multiplier(words)
    _a_needing_branch_is_gated_and_an_offering_one_marks(bc, words, needed)
    return "%d kind(s) needed (%s), %d id(s) attached as written, %d multiplier(s) counted" % (
        len(needed), ", ".join(needed), len(IDS), len(multmatch.words_of(words)))


def _each_id_attaches_as_written(words):
    """The nearest word on the left offering the need, or nothing; never a word on the right."""
    for text, wanted in IDS:
        name = parse(text, words)
        guard(name.problem is None, "`%s` does not parse: %s" % (text, name.problem))
        got = tuple((piece.text, taken.text if taken else None)
                    for piece, taken in attached(name.pieces))
        guard(got == wanted, "`%s` attaches %s, and it should be %s" % (text, got, wanted))


def _every_multiplier_says_what_it_counts(bc, words):
    """Each names a kind this file has and a way there it can ask, and keeps a tally of its own."""
    for word in multmatch.words_of(words):
        asked, hops, _bands = multmatch.declared(word, words)
        kind_named(bc, asked)
        for hop in hops:
            if "." in hop:
                function_named(bc, hop)
        guard(multmatch.TIMES % word in multmatch.NAMES, "`%s` keeps no tally" % word)
        guard(("%s.%s" % (multmatch.COUNTED, word) if word in multmatch.passed_words()
               else COUNTED_ON) in multmatch.READS,
              "no act could read what `%s` counts" % word)


def _a_marked_spelling_counts_by_its_bare_route(words):
    """`PerTTreaty2` counts as `PerTreaty` does; only the kind it names is handed on."""
    from framework import membercount, rescount
    routes, members = {}, membercount.counters(words)
    for one in multmatch.written_ways(words):
        # a member count's bare spelling also counts its members, as its marked one does
        route = ("members" if membercount.claims(one, words) or one.word.spelling in members
                 else "held" if rescount.claims(one) else "counted")
        routes.setdefault(one.word.spelling, set()).add(route)
    for word, taken in sorted(routes.items()):
        guard(len(taken) == 1, "`%s` counts its marked and bare spellings by different routes: %s"
              % (word, ", ".join(sorted(taken))))


def _every_act_offering_an_amount_reads_every_multiplier(words):
    """An effect offering what a multiplier needs is carried out by an act needing the factor."""
    from framework.forwhom import HOW_MUCH
    from framework.pipeline import a_road
    stages = {s.name: s for s in a_road().stages}
    missing = [p for p in multmatch.READS if p not in stages[HOW_MUCH].reads]
    guard(not missing, "the how-much step never reads %s" % missing)
    amounts = {kind for word in multmatch.words_of(words) for kind in needs_of(words[word])}
    guard(len(amounts) == 1, "the multipliers need %s, and one kind was expected" % amounts)
    for spelling, word in sorted(words.items()):
        if amounts & set(offers_of(word)):
            behaviour = module_of(word).BEHAVIOUR
            guard(HOW_MUCH in stages[behaviour].needs,
                  "`%s` offers an amount and `%s` never takes the factor" % (spelling, behaviour))


def _a_needing_branch_is_gated_and_an_offering_one_marks(bc, words, needed):
    """A needing branch opens on a test of its kind's place; an offering one ends by marking it."""
    from framework.trailing import LATEST
    places = {kind: 9000 + at for at, kind in enumerate(needed + [LATEST])}
    every = [(one, []) for one in spellings(words)]
    for one, block in gated(bc, places, every, 8999, "a case's piece"):
        needs, offers = needs_of(one.word), [k for k in offers_of(one.word) if k in places]
        if len(needs) == 1:
            jump, label = block[1]
            guard(jump.op == "JEq" and gv(jump.df["a"]) == places[needs[0]]
                  and block[-1].op == "Label" and block[-2] == label + ":",
                  "`%s` is not gated on %s" % (one.text, needs))
        elif needs:
            compared = {(gv(op[0].df["a"]), gv(op[0].df["b"])) for op in block
                        if isinstance(op, tuple) and op[0].op == "JSGte"}
            wanted = {(places[a], places[b]) for a in needs for b in needs if a != b}
            guard(compared == wanted, "`%s` needs %s and does not take the nearest: %s"
                  % (one.text, needs, sorted(compared)))
        moved = [gv(op.df["dst"]) for op in block if not isinstance(op, (str, tuple))
                 and op.op == "Mov" and gv(op.df["src"]) == places[LATEST]]
        guard(all(places[k] in moved for k in offers),
              "`%s` offers %s and marks %s" % (one.text, offers, moved))
