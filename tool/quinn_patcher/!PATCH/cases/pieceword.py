#!/usr/bin/env python3
"""What proves `framework/pieceword.py`. Nothing here goes into the game."""
from copy import deepcopy

from tools.project import gv, guard
from tools.hlcode import assemble, calls, lands_at, minted_text, template, written
from framework.names import TARGET_MARK, parse, parse_piece, vocabulary
from framework.pieceword import (AFTER, IN_FRONT, PLURAL_MARK, TAKES_OWNERS, WANTED, WITHIN,
                                 emit_classify, emit_owner_off, grouped, owners_cut,
                                 owners_taken, plurals, read_whole, registers, spellings, stems,
                                 where_of)
from framework.rowreader import reader_for

# pieces worth reading, and what taking the digits off each of them should leave
PIECES = (("GainTRes", "GainTRes", 0), ("GainTRes3", "GainTRes", 3), ("GainTRes20", "GainTRes", 20),
          ("Faction", "Faction", 0), ("Res3x", "Res3x", 0), ("3", "", 3), ("", "", 0))


def what_the_digits_leave(text):
    """The SAME walk backwards as the block emits, in the open; ⚠ checked against S3's parser."""
    first = len(text)
    at = len(text) - 1
    while at >= 0:
        if not text[at].isdigit():          # one character, asked on its own
            break
        first = at
        at -= 1
    stem = text[:first]
    return stem, (int(text[first:]) if first < len(text) else 0)


def what_the_classifier_would_read(text, every):
    """The SAME two steps as the block: digits off, then compare as text; ⚠ S3's parser checks."""
    stem, column = what_the_digits_leave(text)
    for one in every:
        # the very test the block writes: at the front, AND the same length
        if stem.find(one.text) == 0 and len(stem) == len(one.text):
            return one.word.spelling, one.targeted, (column or (1 if one.targeted else 0))
    return None, False, column


def a_function_with_a_piece(bc, reader):
    """A copy of a real function, with one register holding the piece being read."""
    real = [f for f in bc.functions if getattr(f, "nregs", None) is not None and f.ops]
    fn = deepcopy(min(real, key=lambda f: len(f.ops)))
    return fn, reader.borrow_register(bc, fn, "text_kind")


def check(bc):
    """The cases: the digits, the word it lands on, the spellings it knows, and the shape."""
    words = vocabulary()
    _the_digits_it_takes_off(words)
    every = _the_spellings_it_knows(words)
    _the_word_it_lands_on(words, every)
    cut = _an_owner_word_comes_off(words, every) + _a_mark_and_a_plural_come_off(words)
    return (_the_shape_it_writes(bc, read_whole(words)) + cut + _the_table_reads_back(bc, words)
            + _no_owner_word_is_written(bc, words))


def _the_table_reads_back(bc, words):
    """Every looked-up way of writing comes back off the table as its shape and its own numbers."""
    from framework import wordtable
    from framework.pieceword import _owner_fits
    reader = reader_for(bc)
    fn, _piece = a_function_with_a_piece(bc, reader)
    regs = registers(bc, fn, reader)
    known = [(one, [written(template(bc, "Int"), dst=regs["column"], ptr=n)])
             for n, one in enumerate(read_whole(words))]
    groups = grouped(known, words)
    looked = wordtable.looked_up(groups)
    families = {one.word.family for g in looked for one, _ in g.slots.values()}
    guard(families == set(wordtable.FAMILIES),
          "the table holds words of %s, not of every family it reads" % sorted(families))
    guard(all(g.text not in [o.text for o in groups if o not in looked] for g in looked),
          "a looked-up word's text is also compared for")
    _past, branches = wordtable.branches_of(
        bc, regs, looked, "a case", regs["owner"],
        lambda one, past, tag: _owner_fits(bc, regs, one, words, past, tag))
    shapes, text = wordtable.layout(bc, branches)
    where, numbers = wordtable.read_back(text)
    ways = 0
    for word, slotted in branches:
        guard(word in where, "`%s` is not in the table" % word)
        for at, items in enumerate(slotted):
            record = numbers[where[word] + at]
            if items is None:
                guard(record == wordtable.ABSENT, "`%s` way %d is read, and has none" % (word, at))
                continue
            held = wordtable.numbers_in(bc, items)
            guard(wordtable.shape_of(shapes[numbers[record]]) == wordtable.shape_of(items)
                  and numbers[record + 1:record + 1 + len(held)] == held,
                  "`%s` way %d comes off the table as another word" % (word, at))
            ways += 1
    guard(len(shapes) < ways, "%d shape(s) for %d way(s): no two words share one"
          % (len(shapes), ways))
    return ways + _each_number_is_read_from_its_own_place(bc, fn, regs, reader, looked, words)


def _each_number_is_read_from_its_own_place(bc, fn, regs, reader, looked, words):
    """No step moves the table's place once a way is found: a skipped number shifts no other."""
    from framework import wordtable
    from framework.pieceword import _owner_fits
    ops = assemble(wordtable.emit_looked_up(
        bc, fn, regs, reader, looked, "a case", regs["owner"],
        lambda one, past, tag: _owner_fits(bc, regs, one, words, past, tag))
        + ["a case DONE:", written(template(bc, "Label"))])
    reads = [op for op in ops if op.op == "GetArray"]
    found = gv(reads[0].df["index"])
    moved = [i for i, op in enumerate(ops) if gv(op.df.get("dst", -1)) == found]
    guard(len(moved) <= 4, "the place a way is read from moves %d time(s)" % len(moved))
    pairs = [(gv(a.df["a"]), gv(a.df["b"])) for a in ops if a.op == "Add"
             and gv(a.df["dst"]) == gv(reads[-1].df["index"])]
    guard(pairs and all(a == found for a, _b in pairs),
          "a number is read from a place counted along the way, not from where its way starts")
    return len(reads)


def _a_mark_and_a_plural_come_off(words):
    """Every spelling, its `T` and plural `s` cut off as the block cuts them, lands on itself."""
    plain = read_whole(words)
    groups = grouped([(one, []) for one in plain], words)
    guard(plurals(words), "no effect has a plural, so no `s` is ever cut")

    def land(stem):
        marked = plural = False
        while True:
            for g in groups:
                if g.text == stem and (marked, plural) in g.slots:
                    return g.slots[(marked, plural)][0]
            at = next((i for i in range(len(stem) - 1) if stem[i] == "T"
                       and stem[i + 1] == stem[i + 1].upper()), None)
            if not marked and at is not None:
                stem, marked = stem[:at] + stem[at + 1:], True
            elif not plural and len(stem) > 1 and stem.endswith(PLURAL_MARK):
                stem, plural = stem[:-1], True
            else:
                return None
    for one in plain:
        landed = land(one.text)
        guard(landed is not None and (landed.word, landed.targeted) == (one.word, one.targeted),
              "`%s` lands on %r" % (one.text, landed))
    return len(plain)


def _an_owner_word_comes_off(words, every):
    """Every owner word glued on, cut off the table as the block cuts it, leaves its own word."""
    from framework.wordtable import owner_text, read_back
    plain = read_whole(words)
    where_at, numbers = read_back(owner_text(words))
    sides = [at for at, owners in owners_cut(plain, words) if owners]
    glued = [one for one in every if one.with_owner is not None]
    guard(glued, "no owner word may be glued to any word, so nothing here is cut")
    for one in glued:
        rest, owner, where = one.text, None, None
        for at in sides:
            for stem in stems(plain) if at == WITHIN else [""]:
                if not rest.startswith(stem):
                    continue
                for length in range(len(rest) - len(stem) - 1, 0, -1):
                    cut = (rest[:length] if at == IN_FRONT else rest[len(rest) - length:]
                           if at == AFTER else rest[len(stem):len(stem) + length])
                    if cut in where_at and numbers[where_at[cut] + 1 + at]:
                        owner, where = cut, at
                        rest = (rest[length:] if at == IN_FRONT else rest[:len(rest) - length]
                                if at == AFTER else stem + rest[len(stem) + length:])
                        break
                if owner:
                    break
            if owner:
                break
        landed = next((p for p in plain if p.text == rest and owner in [
            w.spelling for w in owners_taken(p, words)] and where == where_of(p.word)), None)
        guard(landed is not None and (landed.word, landed.targeted) == (one.word, one.targeted)
              and owner == one.with_owner.spelling,
              "`%s` cuts to %r + %r, not `%s` + `%s`" % (one.text, owner, rest,
                                                       one.with_owner.spelling, one.word.spelling))
        only = numbers[where_at[owner] + 1]
        guard(only in (0, TAKES_OWNERS.index(one.word.family) + 1),
              "`%s` is refused by the owner table: only before family %d" % (one.text, only))
    return len(glued)


def _no_owner_word_is_written(bc, words):
    """Cutting an owner word, and `Not` after one, write no owner word: both read the table."""
    from framework import turned
    reader = reader_for(bc)
    fn, _piece = a_function_with_a_piece(bc, reader)
    regs = registers(bc, fn, reader)
    ops = emit_owner_off(bc, fn, regs, reader, "a case", regs["owner"], read_whole(words), words)
    ops += turned.emit_taken_off(bc, fn, regs, reader, regs["owner"], "a case")
    named = {gv(m) for m in (minted_text(bc, s) for s in words if words[s].family == "owners")
             if m is not None}
    wrote = [o for o in ops if not isinstance(o, (str, tuple)) and o.op == "GetGlobal"
             and gv(o.df["global"]) in named]
    guard(named and not wrote, "%d owner word(s) written into the reading" % len(wrote))
    return len(named)


def _the_digits_it_takes_off(words):
    """THE ARITHMETIC: what is left, and what number came off, agree with S3's own parser."""
    for text, stem, column in PIECES:
        guard(what_the_digits_leave(text) == (stem, column),
              "taking the digits off `%s` leaves %r, and it should leave %r"
              % (text, what_the_digits_leave(text), (stem, column)))
    # and where S3 can read the whole piece, the two roads to the column agree
    for text in ("GainTRes", "GainTRes3", "OnTSiegeAction7"):
        read = parse("Faction_%s" % text, words) if "Gain" in text else None
        if read is None or read.problem:
            continue
        guard(what_the_digits_leave(text)[1] in (0, read.effect.column),
              "`%s` reads as column %d and the digits say %d"
              % (text, read.effect.column, what_the_digits_leave(text)[1]))


def _the_spellings_it_knows(words):
    """EVERY WAY A WORD MAY BE WRITTEN, settled when we build so the game never looks for a mark."""
    every = spellings(words)
    by_text = {one.text: one for one in every}
    guard(len(by_text) == len(every), "two spellings came out with the same text")
    for spelling in ("GainRes", "TGainRes", "GainTRes"):
        guard(spelling in by_text, "`%s` is not one of the spellings" % spelling)
        guard(by_text[spelling].word.spelling == "GainRes",
              "`%s` was filed under %s" % (spelling, by_text[spelling].word))
    guard(not by_text["GainRes"].targeted and by_text["GainTRes"].targeted,
          "the mark was not settled when the spellings were made")
    # a spelling that puts the mark inside a chunk is not offered at all
    guard("GaiTnRes" not in by_text, "a typo was minted as a legal spelling")
    guard(all(one.text.count(TARGET_MARK) >= one.word.spelling.count(TARGET_MARK)
              for one in every), "a spelling lost a letter of its own word")
    return every


def _the_word_it_lands_on(words, every):
    """THE MATCH: what the comparison would find agrees with what S3's own parser makes of it."""
    agreed = 0
    for text in ("Faction", "OnSiegeAction", "OnTSiegeAction", "OnTSiegeAction7",
                 "GainTRes", "GainTRes3", "TGainRes", "Wibble", "GaiTnRes", "Res3x", ""):
        read = parse_piece(text, words)
        found, targeted, column = what_the_classifier_would_read(text, every)
        if read.problem:
            # the parser refuses some spellings the classifier names; the rule applies after
            continue
        guard((found, targeted, column) == (read.word.spelling, read.targeted, read.column),
              "`%s` would be read as %r and the parser makes it %r"
              % (text, (found, targeted, column),
                 (read.word.spelling, read.targeted, read.column)))
        agreed += 1
    guard(agreed >= 5, "only %d spelling(s) were checked against the parser" % agreed)
    # and a piece that is none of our words lands on none of them
    for nothing in ("Wibble", "GaiTnRes", "Res3x", ""):
        guard(what_the_classifier_would_read(nothing, every)[0] is None,
              "`%s` was read as a word we know" % nothing)


def _a_bare_targeted_word_means_column_one(ops, regs, every, bare):
    """A targeted spelling with no number leaves column ONE, as `framework/columns.py` does."""
    marked = [one for one in every if one.targeted]
    guard(len(bare) == len(marked),
          "%d spelling(s) ask whether a number was written and %d carry the mark"
          % (len(bare), len(marked)))
    for at in bare:
        wrote = ops[at + 1]
        guard(wrote.op == "Mov" and gv(wrote.df["dst"]) == regs["column"]
              and gv(wrote.df["src"]) == regs["one"],
              "the branch at %d does not make the column one; it is a %s" % (at, wrote.op))
        guard(lands_at(ops[at], at) > at + 1,
              "the test at %d steps over nothing, so a written number would be overwritten" % at)


def _the_shape_it_writes(bc, every):
    """THE INSTRUCTIONS: one comparison per spelling, and everything lands in one place."""
    reader = reader_for(bc)
    fn, piece = a_function_with_a_piece(bc, reader)
    regs = registers(bc, fn, reader)
    guard(len(regs) == len(WANTED), "it took %d register(s), not %d" % (len(regs), len(WANTED)))

    # one telltale per spelling, so which branch was taken can be read off the block
    marks = {}
    known = []
    for one in every:
        mark = written(template(bc, "Mov"), dst=regs["word"], src=regs["stem"])
        marks[id(mark)] = one
        known.append((one, [mark]))
    missed = written(template(bc, "Mov"), dst=regs["stem"], src=regs["stem"])
    ops = assemble(emit_classify(bc, fn=fn, piece_reg=piece, regs=regs, known=known,
                                 reader=reader, unknown=[missed], cut=False))

    # every WORD is compared for, once: its `T` and plural `s` are slots of one comparison
    groups = grouped(known, vocabulary())
    slots = [one for g in groups for one, _ in g.slots.values()]
    looking = [i for i, op in enumerate(ops) if calls(op, reader.finding)]
    guard(len(looking) == len(groups),
          "it compares %d time(s) for %d word(s)" % (len(looking), len(groups)))
    # the digits come off BEFORE any comparison, or a numbered piece would match nothing
    counting = [i for i, op in enumerate(ops) if calls(op, reader.numbering)]
    guard(counting and counting[-1] < looking[0],
          "a comparison happens before the digits come off")

    # THE MATCH ITSELF: two tests per spelling, both leaving PAST it when they fail
    every_test = [i for i, op in enumerate(ops) if op.op == "JNotEq" and gv(op.df["a"]) not in
                  (regs["owner"], regs["owner_where"], regs["owner_only"], regs["marked"],
                   regs["plural"])]
    # and one MORE per targeted slot, whether a number was written, told apart by the column
    bare = [i for i in every_test if gv(ops[i].df["a"]) == regs["column"]]
    tests = [i for i in every_test if i not in bare]
    guard(len(tests) == 2 * len(groups),
          "%d test(s) for %d word(s), and each takes two" % (len(tests), len(groups)))
    _a_bare_targeted_word_means_column_one(ops, regs, slots, bare)
    for front, same in zip(tests[0::2], tests[1::2]):
        guard(gv(ops[front].df["a"]) == regs["found"] and gv(ops[front].df["b"]) == regs["zero"],
              "the first test does not ask whether the spelling is at the front")
        guard(gv(ops[same].df["a"]) == regs["slen"] and gv(ops[same].df["b"]) == regs["wlen"],
              "the second test does not ask whether they are the same length")
        guard(lands_at(ops[front], front) == lands_at(ops[same], same),
              "the two tests leave to different places, so one of them decides nothing")
        guard(lands_at(ops[front], front) > same,
              "a failed test lands before the other one, so it would fall into a match")
    # and the stem's length is read once for all of them, not once each
    slen = [i for i, op in enumerate(ops) if op.op == "Field" and gv(op.df["dst"]) == regs["slen"]]
    guard(len(slen) == 1, "the stem's length is read %d time(s)" % len(slen))
    guard(slen[0] < tests[0], "the stem's length is read after the first test needs it")

    # each branch ends up at the same place, so a caller can put its own work after this
    forward = [i for i, op in enumerate(ops) if op.op == "JAlways" and lands_at(op, i) > i]
    done = max(lands_at(ops[i], i) for i in forward)
    ends = [i for i in forward if lands_at(ops[i], i) == done]
    guard(len(ends) == len(slots), "%d branch(es) leave for the end, and there are %d slots"
          % (len(ends), len(slots)))

    for i, op in enumerate(ops):
        if "offset" in op.df:
            guard(0 <= lands_at(op, i) <= len(ops),
                  "a jump at %d lands at %d, outside a block %d long"
                  % (i, lands_at(op, i), len(ops)))

    # nothing may be read as a piece unless it IS text, and no spelling at all is refused
    for what, refused in ((regs["at"], "not the text a piece is"),
                          (piece, "no spelling was given")):
        try:
            emit_classify(bc, fn=fn, piece_reg=what, regs=regs, reader=reader,
                          known=[] if what is piece else known)
        except RuntimeError as no:
            guard(refused in str(no), "the wrong refusal: %s" % no)
        else:
            guard(False, "nothing refused %r" % refused)
    return len(ops)
