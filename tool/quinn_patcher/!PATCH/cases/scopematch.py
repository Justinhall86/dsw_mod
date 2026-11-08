#!/usr/bin/env python3
"""What proves `framework/scopematch.py`. Nothing here goes into the game."""
from copy import deepcopy

from tools.project import gv, guard
from tools.hlcode import function_named, lands_at, minted_text, number, text_object
from cases.gain_res import borrow
from cases.pipeline import a_function_and_a_row, refused
from framework.names import module_of, vocabulary
from framework.pieceword import spellings
from framework.driver import scopes_with_drivers
from framework import sayonce
from framework.pipeline import Pipeline, SCOPE_IS, Stage
from framework.rowreader import reader_for
from framework.names import DECLARES
from framework.scopematch import (SAME_AS_BY, ASKS_BY, AT_COLUMN, FOUND, GATE, HOLDER, NAMED,
                              NO_COLUMN, NOTHING_NAMED, answers_for, branches, checked, emit_forget,
                              gate_for, narrowers_of, number_of, numbers, only_scopes,
                              registers)


def check(bc):
    """The cases: the rules a number has, the latch, every branch, and the gate itself."""
    words = vocabulary()
    ints, globals_before = len(_pool(bc)), len(bc.global_types)

    _a_number_is_its_own()
    _asked_for_by_the_word(words)
    forgets = _the_place_is_emptied_first(bc)
    branched = _one_branch_per_spelling(bc, words)
    _a_narrower_rides_a_road_it_does_not_own(words)
    synonyms = _a_synonym_asks_nothing(bc, words)
    ops = _the_gate_is_this_roads_own(bc)
    _each_entry_asks_its_own_question(bc, words)
    _a_faction_question_is_one_function(bc, words)

    # the numbers the cases wrote were all put in the pool when the feature was installed
    guard(len(_pool(bc)) == ints, "the cases put a number into the file's own pool")
    guard(len(bc.global_types) == globals_before, "the cases changed the game file")
    return len(forgets) + branched + synonyms + len(ops)


def _a_faction_question_is_one_function(bc, words):
    """A narrowing never touching the thing in hand is one function that every kind calls."""
    from tools.hlcode import SHARED_ON
    from framework.narrowmatch import bits
    copies = {}
    for key in getattr(bc, SHARED_ON, None) or {}:
        head = key[0]
        if not (isinstance(head, tuple) and len(head) == 4 and isinstance(head[0], tuple)
                and head[0][:1] == ("narrowing",) and not head[0][3:]):
            continue
        copies.setdefault(head[0][1], []).append((head[3], head[2], head[1], key[1:]))
    asked = [w for w in sorted(bits(words)) if getattr(module_of(words[w]), "ASKED_OF", None)
             == "ent.Faction" and not getattr(module_of(words[w]), "BARE_ASKS_ITSELF", False)]
    guard(asked, "no narrowing word asks a faction, so nothing here proves one function")
    for word in asked:
        made = copies.get(word, [])
        guard(made, "`%s` was never written as a function of its own" % word)
        guard(len(made) == 1 and made[0][0] == (),
              "`%s` is %d functions, not one: (holder, ticked, parts, kinds) %s"
              % (word, len(made), made))


def _a_number_is_its_own():
    """The rules a claim passes, and handing the claims over in another order moves none."""
    guard(checked({"A": 1, "B": 2}) == {"A": 1, "B": 2}, "two plain claims were not kept")
    # one clash refuses with one sentence, whichever way round the claims are handed over
    why, saying = "two scopes claimed one number", "both claim the number 1"
    one_way = refused(lambda: checked({"B": 1, "A": 1}), why, saying=saying)
    the_other = refused(lambda: checked({"A": 1, "B": 1}), why, saying=saying)
    guard(one_way == the_other,
          "one clash refuses with two sentences: %s / %s" % (one_way, the_other))
    refused(lambda: checked({"A": NOTHING_NAMED}), "a scope claimed the emptiness itself",
            saying="a whole one that is neither")
    refused(lambda: checked({"A": "1"}), "a scope claimed something that is not a number",
            saying="a whole one that is neither")
    refused(lambda: checked({"A": True}), "a scope claimed a yes and it read as a 1",
            saying="a whole one that is neither")
    refused(lambda: checked({}), "nothing claimed anything at all", saying="no scope declares")


def _asked_for_by_the_word(words):
    """Every scope's own file declares one, and it is asked for by the word a modder types."""
    every = numbers(words)
    every_scope = sorted(only_scopes(words))
    guard(sorted(every) == every_scope,
          "the scopes are %s and %d of them declare a %s"
          % (every_scope, len(every), DECLARES))
    # read out of the scope's own file here, rather than back out of the same call
    for scope in every_scope:
        declared = getattr(module_of(words[scope]), DECLARES, None)
        guard(number_of(scope, words) == declared,
              "`%s` declares %r and answers %r"
              % (scope, declared, number_of(scope, words)))
    refused(lambda: number_of("NoSuchScope", words), "a word that is no scope answered anyway",
            saying="not a scope this build knows")


def _the_place_is_emptied_first(bc):
    """The latch's other end: one place, of the kind the game counts in, emptied before an id."""
    fn = _a_function(bc)
    r = registers(bc, fn)
    guard(sorted(r) == sorted(name for name, _ in FOUND),
          "the places are %s and this hands on %s" % (sorted(r), [n for n, _ in FOUND]))
    guard(gv(list(fn.regs)[r[NAMED]]) == reader_for(bc).count_kind,
          "the scope is kept somewhere that is not the kind the game counts in")
    ops = emit_forget(bc, r)
    # BOTH places, one instruction each: the scope named, and the column a MARKED one narrows by
    guard([o.op for o in ops] == ["Int", "Int"],
          "emptying the places wrote %s" % [o.op for o in ops])
    guard(gv(ops[0].df["dst"]) == r[NAMED], "the emptying writes somewhere else")
    guard(gv(ops[0].df["ptr"]) == number(bc, NOTHING_NAMED),
          "the place is emptied with something that is not the emptiness")
    guard(gv(ops[1].df["dst"]) == r[AT_COLUMN], "the column's emptying writes somewhere else")
    guard(gv(ops[1].df["ptr"]) == number(bc, NO_COLUMN),
          "the column is emptied with something that is not its own emptiness")
    return ops


def _one_branch_per_spelling(bc, words):
    """Every way a scope may be written has a branch, and each writes that scope's own number."""
    fn = _a_function(bc)
    r = registers(bc, fn)
    every = numbers(words)
    # counted from the WHOLE vocabulary and filtered, as the branches are, for owner-word spellings
    every_way = [o for o in spellings(words) if o.word.family == "scopes"]
    made = branches(bc, r, words)
    guard(len(made) == len(every_way),
          "%d branch(es) for %d spelling(s)" % (len(made), len(every_way)))
    # the marked spellings are here too: `TFaction` is that scope named in a target column
    guard([one for one, _ in made if one.targeted], "no marked spelling of a scope has a branch")
    for one, block in made:
        guard([o.op for o in block] == ["Int"],
              "`%s` wrote %s" % (one.text, [o.op for o in block]))
        guard(gv(block[0].df["dst"]) == r[NAMED], "`%s` writes somewhere else" % one.text)
        guard(gv(block[0].df["ptr"]) == number(bc, every[one.word.spelling]),
              "`%s` writes a number that is not its own scope's" % one.text)
    return len(made)


def _a_narrower_rides_a_road_it_does_not_own(words):
    """A narrower names the road it rides and a question, and it names no road of its own."""
    from framework.driver import DECLARES as DRIVEN_BY
    from framework.storewalk import DECLARES as ROAD_BY
    for scope in scopes_with_drivers():
        for narrower in narrowers_of(scope, words):
            here = module_of(words[narrower])
            # it rides another's road, so it names no site, thing or road of its own -- only a WORD
            for what in tuple(w for w in DRIVEN_BY if w != "WORD") + (ROAD_BY,):
                guard(not hasattr(here, what),
                      "`%s` narrows `%s` and names its own %s, so it would get a second road"
                      % (narrower, scope, what))
            # OR IT SAYS IT IS A SYNONYM, a claim rather than a missing question: `Region` IS `Zone`
            guard(getattr(here, ASKS_BY, None) or getattr(here, SAME_AS_BY, None),
                  "`%s` names neither a question nor what it is the same as" % narrower)
        # the road's own word is first, and every word it answers for has a number of its own
        answers = answers_for(scope, words)
        guard(answers[0] == scope, "the `%s` road answers for %r first" % (scope, answers[0]))
        guard(len(set(number_of(one, words) for one in answers)) == len(answers),
              "two words the `%s` road answers for share a number" % scope)


# the parts the gate reads for the narrowing words, named here the way the road names them
from framework import columns as _columns
from framework import parsed as _parsed
NARROWING_NAMED = _columns.PART_FOR_NARROWING
NARROWING_READS = (_parsed.NUMBERS_PART, NARROWING_NAMED)


def _a_gate_row(bc):
    """A function and a row holding the scope and every narrowing part, as the road hands them."""
    fn, row = a_function_and_a_row(bc)
    counts = {SCOPE_IS: borrow(bc, fn, reader_for(bc).count_kind)}
    listed = {part: borrow(bc, fn, reader_for(bc).listing_kind) for part in NARROWING_READS}
    return fn, dict(row, **counts, **listed)


def _a_synonym_asks_nothing(bc, words):
    """A word that IS the road's own word leaves where that word leaves, and is asked nothing."""
    from framework import foreignwalk
    from framework.scopematch import HELD_REGION
    fn, row = _a_gate_row(bc)
    seen = 0
    for scope in scopes_with_drivers():
        mine = [one for one in answers_for(scope, words)
                if getattr(module_of(words[one]), SAME_AS_BY, None) == scope]
        if not mine:
            continue
        # the same gate twice, knowing whose rule the row is and not; only the asking may differ
        shapes = []
        for whose in (None, foreignwalk.WHOSE_RULE):
            road = Pipeline("a synonym on the `%s` road" % scope, road=scope, stages=(
                Stage(GATE, "GATE",
                      reads=(SCOPE_IS, HOLDER) + NARROWING_READS + (
                          foreignwalk.WHOSE_RULE, HELD_REGION),
                      body=gate_for(scope, SCOPE_IS, whose_part=whose)),))
            shapes.append([o.op for o in road.emit(bc, fn, dict(row))])
        guard(shapes[0] == shapes[1],
              "`%s` rides the `%s` road as the same word and the gate asks it something: %d "
              "instruction(s) told whose rule it is, %d not"
              % (", ".join(mine), scope, len(shapes[1]), len(shapes[0])))
        seen += len(mine)
    # and the case is void if no word is a synonym at all
    guard(seen, "no word says it is the same as the road it rides, and `Region` says exactly that")
    return seen


def _asked_from_the_table(scope, answers, words, shape):
    """An asking word is never compared in the gate: one call into the road's table answers it."""
    table = [one for one in answers[1:] if getattr(module_of(words[one]), ASKS_BY, None)]
    k = 1 if table else 0
    guard(shape.count("CallClosure") == k,
          "the `%s` gate calls %d question(s) out of its table for %d asking word(s)"
          % (scope, shape.count("CallClosure"), len(table)))
    return [one for one in answers if one not in table], k


def _each_entry_asks_its_own_question(bc, words):
    """Each asking word is filed under its own number, as a function asking its own question."""
    from tools.hlcode import SHARED_ON
    from framework.scopechain import FILED, QUESTION
    made = getattr(bc, SHARED_ON, None) or {}
    heads = {key[0]: fn for key, fn in made.items() if isinstance(key[0], str)}
    asked = [s for s in only_scopes(words) if getattr(module_of(words[s]), ASKS_BY, None)]
    guard(asked, "no scope word asks a question, so no table proves anything")
    for spelling in asked:
        filed, question = heads.get(FILED % spelling), heads.get(QUESTION % spelling)
        guard(filed is not None and question is not None, "`%s` is in no road's table" % spelling)
        guard(number(bc, number_of(spelling, words)) in
              [gv(o.df["ptr"]) for o in filed.ops if o.op == "Int"],
              "`%s` is filed under a number not its own" % spelling)
        guard([gv(o.df["fun"]) for o in filed.ops if o.op == "StaticClosure"]
              == [gv(question.findex)], "`%s` is filed as another word's question" % spelling)
        own = getattr(module_of(words[spelling]), ASKS_BY)
        guard(any(o.op.startswith("Call") and gv(o.df.get("fun", -1))
                  == gv(function_named(bc, own).findex) for o in question.ops),
              "`%s`'s entry never asks `%s`" % (spelling, own))
    return len(asked)


def _weighs(module):
    """A narrowing word that weighs two numbers (`AGAINST` or `AT_LEAST`) rather than a name."""
    return getattr(module, "AGAINST", None) or getattr(module, "AT_LEAST", None)


def _turning(words, one, places=False):
    """Numbers (or places) a `Not` adds; with no `val` a weighed word only reads its own number."""
    from framework import turned
    from framework.names import module_of
    typo = words[one].target == "required"
    if getattr(module_of(words[one]), "AT_LEAST", None):
        return 0
    return 2 + typo if places else 2 * len(turned.where_they_sit(words)) + typo


def _the_gate_is_this_roads_own(bc):
    """Per row: which of this road's words the row named, and that word's own question."""
    fn, row = _a_gate_row(bc)
    every, ops, words = numbers(), [], vocabulary()
    for scope in scopes_with_drivers():
        # named once and reused below, since the gate's own word carries the ROAD'S NAME
        driving = "the scope gate for `%s`" % scope
        road = Pipeline(driving, road=scope, stages=(
            Stage("does this scope match", "GATE",
                  # the narrowing parts: words the row spelled, the column named, what it named
                  reads=(SCOPE_IS, HOLDER) + NARROWING_READS,
                  body=gate_for(scope, SCOPE_IS)),))
        block = road.emit(bc, fn, row)
        shape = [o.op for o in block]
        answers = answers_for(scope, words)
        # ONE WORD AND NO QUESTION IS STILL TWO INSTRUCTIONS, whatever other roads grow
        if len(answers) == 1:
            guard(shape == ["Int", "JNotEq"],
                  "the `%s` gate answers for one word and wrote %s" % (scope, shape))
            guard(gv(block[0].df["ptr"]) == number(bc, every[scope]),
                  "the `%s` gate compares against a number that is not its own" % scope)
            wanted = gv(block[0].df["dst"])
            guard({gv(block[1].df["a"]), gv(block[1].df["b"])} == {wanted, row[SCOPE_IS]},
                  "the `%s` gate compares something other than the row against its own" % scope)
            guard(lands_at(block[1], 1) >= len(block),
                  "the `%s` gate's refusal lands inside its own block" % scope)
        else:
            # one branch per word it answers for, and each number written is one of theirs
            written = [gv(o.df["ptr"]) for i, o in enumerate(block) if o.op == "Int"
                       and not (i + 1 < len(block) and block[i + 1].op == "CallN")]
            # the scope's own numbers first; the narrowing block's follow, as it narrows a named set
            from framework import narrowmatch
            answers, k = _asked_from_the_table(scope, answers, words, shape)
            mine = [number(bc, every[one]) for one in answers]
            guard(written[k:k + len(mine)] == mine,
                  "the `%s` gate compares %s and answers for %s" % (scope, written, answers))
            # ⛔ each narrower's question is asked, COUNTED BY WHICH FUNCTION IS CALLED
            questions = set()
            for one in answers:
                named = getattr(module_of(words[one]), ASKS_BY, None)
                if named:
                    questions.add(gv(function_named(bc, named).findex))
            only_named = getattr(module_of(words[scope]), "ONLY", None)
            if only_named:
                questions.add(gv(function_named(bc, only_named).findex))
            asked = len([o for o in block
                         if o.op == "Call1" and gv(o.df.get("fun", -1)) in questions])
            wants = len([one for one in answers
                         if getattr(module_of(words[one]), ASKS_BY, None)])
            # plus the one thing the road itself passes over, when it declares one
            passes = 1 if getattr(module_of(words[scope]), "ONLY", None) else 0
            guard(asked >= wants + passes,
                  "the `%s` gate asks %d question(s) for %d narrower(s) and %d skip"
                  % (scope, asked, wants, passes))
        # ⛔ nothing OUR passes published is read here; the game's own class table is allowed
        from tools.hlcode import SLOTS_ON
        ours = set((getattr(bc, SLOTS_ON, None) or {}).values())
        published = [o for o in block if o.op == "GetGlobal" and gv(o.df["global"]) in ours]
        guard(not published,
              "the `%s` gate reads a value one of our own passes published, which is the fault v1 "
              "measured -- %d such read(s)" % (scope, len(published)))
        ops += block
    # a road for a scope this build does not know is refused as it is BAKED
    refused(lambda: gate_for("NoSuchScope", SCOPE_IS),
            "a road was baked for a scope nobody declared",
            saying="not a scope this build knows")
    return ops


def _a_function(bc):
    # a copy of the smallest real function, to write onto: the game file itself is untouched
    real = [f for f in bc.functions if getattr(f, "nregs", None) is not None and f.ops]
    return deepcopy(min(real, key=lambda f: len(f.ops)))


def _pool(bc):
    # the file's own list of plain numbers, which nothing here may add to
    return bc.ints.value if hasattr(bc.ints, "value") else bc.ints
