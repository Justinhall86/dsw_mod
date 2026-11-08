#!/usr/bin/env python3
"""What proves `framework/triggermatch.py`. Nothing here goes into the game."""
from tools.project import guard
from tools.hlcode import assemble
from framework.triggermatch import (AT_COLUMN, NOTHING_NAMED, NAMED, branches, checked, emit_forget,
                             number_of, numbers, only_hooks, registers)
from framework.names import vocabulary
from framework.pieceword import spellings


def check(bc):
    """The cases: every trigger has its own number, and every spelling writes the same one."""
    words = vocabulary()
    every = numbers(words)
    guard(every, "no trigger declares a number")
    _each_number_is_its_own(every)
    _the_user_ruled_on_this_one(words, every)
    _every_spelling_writes_its_own_word(bc, words, every)
    _only_a_marked_spelling_keeps_a_column(bc, words)
    return "%d trigger(s): %s" % (len(every),
                                  ", ".join("`%s`=%d" % p for p in sorted(every.items())))


def _each_number_is_its_own(every):
    """No two triggers share one, and none of them is the emptiness."""
    guard(len(set(every.values())) == len(every),
          "two triggers share a number: %s" % sorted(every.items()))
    guard(NOTHING_NAMED not in every.values(),
          "a trigger claims %d, which is what the place holds when nothing was named"
          % NOTHING_NAMED)
    # and the refusals fire, rather than being described
    for bad, why in (({"A": 0}, "the emptiness"), ({"A": True}, "a boolean"),
                     ({"A": 1, "B": 1}, "a number twice"), ({}, "nothing at all")):
        try:
            checked(bad)
        except RuntimeError:
            continue
        guard(False, "a trigger claiming %s was accepted" % why)


def _the_user_ruled_on_this_one(words, every):
    """`OnThis` means once when the row is applied, so it names no target."""
    guard("OnThis" in every, "`OnThis` has no number, and it is the trigger 11 of the modder's "
                             "own rows carry")
    guard(words["OnThis"].target == "never",
          "`OnThis` says its target is %r; it is about the row's own application, so a target "
          "column would mean nothing" % words["OnThis"].target)
    # AND `never` HAS TO MEAN SOMETHING: a word that never names a target is offered no mark
    offered = sorted(one.text for one in spellings(words) if one.word.spelling == "OnThis")
    guard(offered == ["OnThis"],
          "`OnThis` says its target is never and is offered %s" % offered)
    for spelling, word in words.items():
        marked = [one.text for one in spellings({spelling: word}) if one.targeted]
        guard(bool(marked) == (word.target != "never"),
              "`%s` says its target is %r and is offered %d marked spelling(s)"
              % (spelling, word.target, len(marked)))


def _every_spelling_writes_its_own_word(bc, words, every):
    """One branch per spelling, each writing its WORD's number; the mark changes no trigger."""
    made = branches(bc, registers(bc, _a_function(bc), None), words)
    guard(len(made) == len(spellings(only_hooks(words))),
          "%d branch(es) for %d spelling(s)" % (len(made), len(spellings(only_hooks(words)))))
    for one, block in made:
        ops = assemble(block)
        guard(len(ops) == 1 and ops[0].op == "Int",
              "the branch for `%s` writes %s, and a number is one instruction"
              % (one.text, [o.op for o in ops]))
    by_word = {}
    for one, _ in made:
        by_word.setdefault(one.word.spelling, set()).add(one.text)
    for word, texts in by_word.items():
        guard(number_of(word, words) == every[word],
              "`%s` reads back as a different number than its own file writes" % word)
        guard(len(texts) >= 1, "`%s` has no spelling at all" % word)


def _only_a_marked_spelling_keeps_a_column(bc, words):
    """A marked spelling writes the column and a bare one does not; the forget empties both."""
    fn = _a_function(bc)
    r = registers(bc, fn, None)
    guard(r[NAMED] != r[AT_COLUMN], "the trigger and its column share one place")
    made = branches(bc, r, words, column=r[NAMED])
    for one, block in made:
        ops = assemble(block)
        kinds = [o.op for o in ops]
        guard(kinds == (["Int", "Mov"] if one.targeted else ["Int"]),
              "`%s` is %s and writes %s" % (one.text,
                                            "marked" if one.targeted else "bare", kinds))
    emptied = [o for o in assemble(emit_forget(bc, r))]
    guard(len(emptied) == len(registers(bc, fn, None)),
          "the forget writes %d place(s) and there are %d" % (len(emptied), len(r)))
    guard(sorted(o.df["dst"].value for o in emptied) == sorted(r.values()),
          "the forget does not empty every place the branches may write")


def _a_function(bc):
    """Any real function, to hang the branch's one place on. Nothing is spliced."""
    from copy import deepcopy
    real = [f for f in bc.functions if getattr(f, "nregs", None) is not None and f.ops]
    guard(real, "no function in the file carries registers to copy")
    return deepcopy(min(real, key=lambda f: len(f.ops)))
