#!/usr/bin/env python3
"""Which parameter an id named and the column it marked -- a THING the act may use."""
from tools.project import gv, guard
from tools.hlcode import function_named, number, returns_type, template, written
from framework import names as vocab
from framework.names import module_of, vocabulary
from framework.pieceword import spellings
from framework.rowreader import reader_for

# the folder whose files declare a parameter
FAMILY = "parameters"
# the two things this keeps: which parameter, and the column it marked
NAMED = "parameter"
AT_COLUMN = "parameter column"
FOUND = ((NAMED, vocab.NUMBER_KEPT_IN), (AT_COLUMN, vocab.NUMBER_KEPT_IN))
# what the place holds when none was spelled, and what the column holds when none was named
NOTHING_SPELLED = 0
NO_COLUMN = 0


def registers(bc, fn, reader=None):
    """The two places this needs, on `fn`, typed from a borrowed signature."""
    reader = reader or reader_for(bc)
    return {name: reader.borrow_register(bc, fn, kind) for name, kind in FOUND}


def only_parameters(words):
    """The vocabulary narrowed to the parameter words. THE ONE PLACE that narrowing is written."""
    return {spelling: word for spelling, word in words.items() if word.family == FAMILY}


def checked(claims):
    """Every claim against the rules a parameter's number has, read in a settled order."""
    out = {}
    for spelling in sorted(claims):
        claimed = claims[spelling]
        guard(isinstance(claimed, int) and not isinstance(claimed, bool)
              and claimed != NOTHING_SPELLED,
              "`%s` says its %s is %r, and a parameter's is a whole one that is not %d"
              % (spelling, vocab.DECLARES, claimed, NOTHING_SPELLED))
        taken = [already for already, n in out.items() if n == claimed]
        guard(not taken,
              "`%s` and `%s` both claim the number %d, and a parameter's is its own"
              % (taken[0] if taken else "?", spelling, claimed))
        out[spelling] = claimed
    guard(out, "no parameter declares a number, so no row could ever name one")
    return out


def numbers(words=None):
    """Every parameter word and the number its own file writes out for it."""
    words = vocabulary() if words is None else words
    return checked({spelling: getattr(module_of(word), vocab.DECLARES, None)
                    for spelling, word in only_parameters(words).items()})


def number_of(parameter, words=None):
    """The number one parameter's file writes out, asked for BY THE WORD a modder types."""
    every = numbers(words)
    guard(parameter in every,
          "`%s` is not a parameter this build knows: %s"
          % (parameter, ", ".join(sorted(every))))
    return every[parameter]


def emit_forget(bc, r, listed=None):
    """Empty every place, before an id is read. The other end of the latch the branches are."""
    return [written(template(bc, "Int"), dst=r[NAMED], ptr=number(bc, NOTHING_SPELLED)),
            written(template(bc, "Int"), dst=r[AT_COLUMN], ptr=number(bc, NO_COLUMN))] + (
        [written(template(bc, "Null"), dst=listed)] if listed is not None else [])


def branches(bc, r, words=None, column=None, listed=None, hands=None):
    """One branch per parameter spelling (all marked): its number, its column's name ADDED."""
    words = vocabulary() if words is None else words
    every = numbers(words)
    written_as = spellings(only_parameters(words))
    guard(written_as, "no parameter has a spelling, so no piece could ever match one")
    out = []
    for one in written_as:
        block = [written(template(bc, "Int"), dst=r[NAMED],
                         ptr=number(bc, every[one.word.spelling]))]
        if one.targeted and column is not None:
            block += [written(template(bc, "Mov"), dst=r[AT_COLUMN], src=column)]
            if listed is not None:
                block += emit_added(bc, column, listed, hands)
        out.append((one, block))
    return out


def emit_added(bc, column, listed, hands):
    """What `column` names, pushed onto `listed` (made at the first); nothing named adds nothing."""
    named = hands["place"](reader_for(bc).text_kind)
    past = "the parameter column named nothing, at %d" % named
    return hands["resolve"](column, named) + [
        (written(template(bc, "JNull"), reg=named), past),
    ] + emit_pushed(bc, named, listed, hands) + [past + ":", written(template(bc, "Label"))]


def emit_pushed(bc, value, listed, hands, length=None):
    """`value` pushed onto `listed`, made at the first push; the new length into `length`."""
    from framework import tray
    from framework.atload import emit_a_new_list

    def op(name, **operands):
        return written(template(bc, name), **operands)

    made, reader = tray.recipe(bc), reader_for(bc)
    size = hands["place"](reader.count_kind)
    typed, raw, backing = (hands["place"](made["of"][k]) for k in ("typed", "raw", "backing"))
    pushing = function_named(bc, tray.PUSH)
    pushed = hands["place"](returns_type(pushing, tray.PUSH)) if length is None else length
    there = "the parameter list is there, at %d" % value
    return [(op("JNotNull", reg=listed), there)] + emit_a_new_list(
        bc, op, made, reader.text_kind, listed, size, typed, raw, backing) + [
        there + ":", op("Label"),
        op("Call2", dst=pushed, fun=gv(pushing.findex), arg0=listed, arg1=value)]


def install(bc):
    """Read every parameter's number out of its own file, and put those numbers in the pool."""
    from framework import tray
    every = numbers()
    for claimed in sorted(every.values()) + [NOTHING_SPELLED]:
        number(bc, claimed)
    # ⛔ ONE LIST FOR EVERY PARAMETER WORD THAT NAMES A COLUMN: a second needs a list of its own
    listing = [s for s, w in only_parameters(vocabulary()).items() if w.target != vocab.NEVER]
    guard(len(listing) == 1, "%d column-naming parameter words share one list" % len(listing))
    guard(tray.recipe(bc)["of"]["entries"] == reader_for(bc).listing_kind,
          "the list the parse makes is not the kind the row keeps")
    return ("PARAMETER MATCH: %d parameter(s), each with the number its own file writes out -- "
            "%s -- kept under the application beside the column it marked, so an act can ask "
            "what a row handed it" % (len(every), ", ".join("`%s` is %d" % pair
                                                            for pair in sorted(every.items()))))
