#!/usr/bin/env python3
"""Which trigger an id named, and its marked column, as numbers under the application; no gate."""
from tools.project import guard
from tools.hlcode import number, template, written
from framework import names as vocab
from framework.names import module_of, vocabulary
from framework.pieceword import spellings
from framework.rowreader import reader_for

# the folder of trigger files; what each must declare is `framework/names.py`'s, as for a scope
FAMILY = "triggers"
# the two things this works out: which trigger, and which target column narrows it
NAMED = "hook"
AT_COLUMN = "hook column"
# and whether `Not` was glued in (`OnNotTDev`): every event of its kind but the one named
TURNED = "hook turned"
FOUND = ((NAMED, vocab.NUMBER_KEPT_IN), (AT_COLUMN, vocab.NUMBER_KEPT_IN),
         (TURNED, vocab.NUMBER_KEPT_IN))
# what the place holds when no trigger we know was named: the emptiness the branches latch against
NOTHING_NAMED = 0
# and what the column holds when the trigger named none, which means every event of its kind
NO_COLUMN = 0
# declared True by a trigger whose marked ways run its plain way's branch, the mark read there
ONE_BRANCH = "MARK_READ_IN_ITS_BRANCH"


def registers(bc, fn, reader=None):
    """The one place this needs, on `fn`, typed from a borrowed signature."""
    reader = reader or reader_for(bc)
    return {name: reader.borrow_register(bc, fn, kind) for name, kind in FOUND}


def only_hooks(words):
    """The vocabulary narrowed to the trigger words. THE ONE PLACE that narrowing is written."""
    return {spelling: word for spelling, word in words.items() if word.family == FAMILY}


def checked(claims):
    """Every claim against the rules a trigger's number has, in the spelling's settled order."""
    out = {}
    for spelling in sorted(claims):
        claimed = claims[spelling]
        # a whole number that is not the emptiness, and not the `True` that reads as a 1
        guard(isinstance(claimed, int) and not isinstance(claimed, bool)
              and claimed != NOTHING_NAMED,
              "`%s` says its %s is %r, and a trigger's number is a whole one that is not %d"
              % (spelling, vocab.DECLARES, claimed, NOTHING_NAMED))
        taken = [already for already, n in out.items() if n == claimed]
        guard(not taken,
              "`%s` and `%s` both claim the number %d, and a trigger's number is its own"
              % (taken[0] if taken else "?", spelling, claimed))
        out[spelling] = claimed
    guard(out, "no trigger declares a number, so no row could ever name one")
    return out


def numbers(words=None):
    """Every trigger word and the number its own file writes out for it."""
    words = vocabulary() if words is None else words
    return checked({spelling: getattr(module_of(word), vocab.DECLARES, None)
                    for spelling, word in only_hooks(words).items()})


def number_of(hook, words=None):
    """The number one trigger's file writes out for it, asked for BY THE WORD a modder types."""
    every = numbers(words)
    guard(hook in every,
          "`%s` is not a trigger this build knows: %s" % (hook, ", ".join(sorted(every))))
    return every[hook]


def emit_forget(bc, r):
    """Empty both places, before an id is read. The other end of the latch the branches are."""
    return [written(template(bc, "Int"), dst=r[NAMED], ptr=number(bc, NOTHING_NAMED)),
            written(template(bc, "Int"), dst=r[AT_COLUMN], ptr=number(bc, NO_COLUMN)),
            written(template(bc, "Int"), dst=r[TURNED], ptr=number(bc, NO_COLUMN))]


def branches(bc, r, words=None, column=None, opens=None, then=(), hands=None):
    """One branch per SPELLING of a trigger, `then` after each; a marked one keeps its column."""
    from framework.narrowcount import emit_weighing
    words = vocabulary() if words is None else words
    every = numbers(words)
    written_as = spellings(only_hooks(words))
    guard(written_as, "no trigger has a spelling, so no piece could ever match one")
    return [(one, _branch(bc, r, one, every[one.word.spelling], dict(hands or {}, column=column))
                  + list(then)
                  # `opens`: the count places a trigger offering a group (`OnDev_OfTDomain`) opens
                  + (emit_weighing(bc, opens, one.word) if opens is not None else []))
            for one in written_as]


def _branch(bc, r, one, claimed, hands):
    """Its number; its column and `Not` from its own way, or read off the piece (one branch)."""
    from framework.pieceword import SHARES_ITS_PLAIN
    from framework.turned import HAND, turnable

    def op(name, **operands):
        return written(template(bc, name), **operands)
    negated, column = hands.get(HAND), hands.get("column")
    out = [op("Int", dst=r[NAMED], ptr=number(bc, claimed))]
    if not (getattr(module_of(one.word), ONE_BRANCH, False) and "marked" in hands):
        return out + ([op("Mov", dst=r[AT_COLUMN], src=column)]
                      if one.targeted and column is not None else []) + (
            [op("Mov", dst=r[TURNED], src=negated)]
            if negated is not None and turnable(one) else [])
    # ⛔ ONE WORD, ONE BRANCH: its marked ways run this one, which reads the mark off the piece
    if one.targeted:
        SHARES_ITS_PLAIN.add(one.text)
    plain, given = ("%s %s" % (one.text, w) for w in ("written plain", "has its column"))
    return out + [(op("JEq", a=hands["marked"], b=hands["zero"]), plain),
                  (op("JNotEq", a=column, b=hands["zero"]), given),
                  op("Mov", dst=column, src=hands["one"]),
                  given + ":", op("Label"),
                  op("Mov", dst=r[AT_COLUMN], src=column),
                  op("Mov", dst=r[TURNED], src=negated),
                  plain + ":", op("Label")]


def install(bc):
    """Read every trigger's number out of its own file, and put those numbers in the pool."""
    every = numbers()
    for claimed in sorted(every.values()) + [NOTHING_NAMED]:
        number(bc, claimed)
    return ("HOOK MATCH: %d trigger(s), each with the number its own file writes out -- %s -- kept "
            "under the application with the target column a marked spelling named, so the place "
            "the event happens can read both a tick later"
            % (len(every), ", ".join("`%s` is %d" % pair for pair in sorted(every.items()))))
