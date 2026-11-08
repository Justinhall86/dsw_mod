#!/usr/bin/env python3
"""What proves `framework/ridermatch.py`. Nothing here goes into the game."""
from tools.project import guard
from tools.hlcode import assemble
from framework.effectdata import STAMP_IS
from framework.effecttable import STAMPS
from framework.names import vocabulary
from framework.pieceword import spellings
from framework.ridermatch import (NAMED, NOTHING_SPELLED, branches, checked,
                              credit_of, credits, emit_forget, only_riders, registers,
                              said_about_targets, stamped)


def check(bc):
    """The cases: every rider asks for a real credit, and every spelling writes that credit."""
    words = vocabulary()
    every = credits(words)
    guard(every, "no rider declares a credit")
    _the_three_the_user_named(words, every)
    _a_stamp_is_never_a_gift(every)
    _no_rider_may_ever_name_a_target(words)
    _a_credit_is_a_word_of_the_effect_table(every)
    _every_spelling_writes_its_own_credit(bc, words, every)
    _the_forget_empties_the_one_place(bc, words)
    return "%d rider(s): %s" % (len(every),
                                ", ".join("`%s`=%d" % p for p in sorted(every.items())))


def _the_three_the_user_named(words, every):
    """`ForMe`, `ForTarget` and `ForAll`, trailing, and none of them naming a target column."""
    for word in ("ForMe", "ForTarget", "ForAll"):
        guard(word in every, "`%s` is not a rider this build knows: %s"
                             % (word, ", ".join(sorted(every))))
        guard(words[word].target == "never",
              "`%s` says its target is %r, and a rider names no target column"
              % (word, words[word].target))
        offered = sorted(one.text for one in spellings(words) if one.word.spelling == word)
        guard(offered == [word], "`%s` is offered %s" % (word, offered))
    # AND THE THREE ARE NOT ONE THING SAID THREE WAYS: `ForMe` and `ForAll` must differ
    guard(every["ForMe"] != every["ForAll"],
          "`ForMe` and `ForAll` both credit %d, so no reading could tell them apart"
          % every["ForMe"])
    guard(every["ForTarget"] == STAMP_IS["target"],
          "`ForTarget` credits %d, and the settling's own default is %d -- spelling the word a "
          "modder can spell must ask for what spelling nothing already gives"
          % (every["ForTarget"], STAMP_IS["target"]))


def _a_stamp_is_never_a_gift(every):
    """`StampedTo…` is kept apart from `ForMe`/`ForAll`: a trait tells credit from receiver."""
    for word, credit in (("StampedToMe", "me"), ("StampedToTarget", "target"),
                         ("StampedToAll", "all")):
        guard(every.get(word) == stamped(credit),
              "`%s` credits %r, and a stamp of `%s` is %d"
              % (word, every.get(word), credit, stamped(credit)))
    gifts = {n for w, n in every.items() if not w.startswith("StampedTo")}
    stamps = {n for w, n in every.items() if w.startswith("StampedTo")}
    guard(not gifts & stamps, "a stamp and a gift share the number(s) %s" % sorted(gifts & stamps))


def _no_rider_may_ever_name_a_target(words):
    """EVERY rider says its target is `never`, and the refusal is the feature's, not this file's."""
    for spelling, word in only_riders(words).items():
        guard(word.target == "never",
              "`%s` says its target is %r, and a rider names no target column"
              % (spelling, word.target))
    for bad, why in (("required", "a rider demanding a target column"),
                     ("optional", "a rider offered a target column")):
        try:
            said_about_targets({"A": _a_word_saying(bad)})
        except RuntimeError:
            continue
        guard(False, "%s was accepted" % why)


class _a_word_saying:
    """The one thing the target guard reads, so the refusal can be fired without a folder."""

    def __init__(self, target):
        self.target = target
        self.spelling = "A"
        self.family = "riders"


def _a_credit_is_a_word_of_the_effect_table(every):
    """One vocabulary for credits, and the emptiness is not in it."""
    # `For<Owner>`'s owner word is put above the credit while the row is read, never in the file
    guard(set(every.values()) <= {STAMP_IS[w] for w in STAMPS} | {stamped(w) for w in STAMPS},
          "a rider asks for a credit the effect table does not name")
    guard(NOTHING_SPELLED not in every.values(),
          "a rider claims %d, which is what the place holds when no rider was spelled at all"
          % NOTHING_SPELLED)
    # and the refusals fire, rather than being described
    for bad, why in (({"A": "nobody"}, "a word the effect table does not have"),
                     ({"A": None}, "nothing at all"),
                     ({"A": "none"}, "the credit that means no rider spoke"),
                     ({}, "no rider at all")):
        try:
            checked(bad)
        except RuntimeError:
            continue
        guard(False, "a rider claiming %s was accepted" % why)


def _every_spelling_writes_its_own_credit(bc, words, every):
    """One branch per spelling, each writing the credit of the WORD it is a spelling of."""
    made = branches(bc, registers(bc, _a_function(bc), None), words)
    plain = [one for one in spellings(only_riders(words)) if one.with_owner is None]
    guard(len(made) == len(plain), "%d branch(es) for %d spelling(s)" % (len(made), len(plain)))
    for one, block in made:
        ops = assemble(block)
        guard(len(ops) == 1 and ops[0].op == "Int",
              "the branch for `%s` writes %s, and a credit is one instruction"
              % (one.text, [o.op for o in ops]))
        guard(credit_of(one.word.spelling, words) == every[one.word.spelling],
              "`%s` reads back as a different credit than its own file asks for"
              % one.word.spelling)


def _the_forget_empties_the_one_place(bc, words):
    """The other end of the latch: the place is emptied before an id is read."""
    fn = _a_function(bc)
    r = registers(bc, fn, None)
    emptied = assemble(emit_forget(bc, r))
    guard(len(emptied) == len(r),
          "the forget writes %d place(s) and there are %d" % (len(emptied), len(r)))
    guard(sorted(o.df["dst"].value for o in emptied) == sorted(r.values()),
          "the forget does not empty the place the branches write")
    guard(emptied[0].df["ptr"].value is not None, "the forget writes no number at all")
    guard(NAMED in r, "the rider has no place of its own")


def _a_function(bc):
    """Any real function, to hang the branch's one place on. Nothing is spliced."""
    from copy import deepcopy
    real = [f for f in bc.functions if getattr(f, "nregs", None) is not None and f.ops]
    guard(real, "no function in the file carries registers to copy")
    return deepcopy(min(real, key=lambda f: len(f.ops)))
