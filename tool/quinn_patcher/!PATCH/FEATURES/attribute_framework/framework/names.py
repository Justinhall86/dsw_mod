#!/usr/bin/env python3
"""Read a name by asking the folders what each `_` piece is, never where it sits; a word a file."""
import difflib
import importlib
import os
import pkgutil
import re

from tools.project import guard

# one folder per kind of word; the folder a word is found in is what the word IS
FAMILIES = ("scopes", "owners", "narrowing", "triggers", "effects", "riders",
            "modifiers", "multipliers", "parameters", "comparisons", "negations")
# folders whose files the effect table and the questions read, so each claims its own words
BY_TABLE = ("effects", "narrowing")
# what a word may say about a target column; `NEVER` stops a marked spelling being offered
NEVER = "never"
TARGETING = ("required", "optional", NEVER)
# what a word's file calls the number it claims, and its kind -- here once, for every matcher
DECLARES = "NUMBER"
NUMBER_KEPT_IN = "count_kind"
# the letter that means "the one named in a target column", wherever it sits in the piece
TARGET_MARK = "T"
# where a name's pieces are joined
JOIN = "_"
# READS: what a block's writer read when it asked for every word there is
WORD_LIST = "the word list"


class Word:
    """One word of the grammar: its spelling, the kind it is, and what it says about targets."""

    def __init__(self, spelling, family, target, source):
        self.spelling = spelling
        self.family = family
        self.target = target
        self.source = source

    def __repr__(self):
        return "%s(%s)" % (self.spelling, self.family)


class Piece:
    """One piece of a name, once the vocabulary has said what it is."""

    def __init__(self, text, word=None, targeted=False, column=0, problem=None):
        self.text = text
        self.word = word
        self.targeted = targeted
        self.column = column
        self.problem = problem

    @property
    def family(self):
        return self.word.family if self.word else None

    def __repr__(self):
        if self.problem:
            return "%s(?)" % self.text
        return "%s(%s%s%s)" % (self.text, self.word.spelling,
                               " targeted" if self.targeted else "",
                               " col %d" % self.column if self.column else "")


class Name:
    """A whole attribute id, read into the six parts the grammar has."""

    def __init__(self, text, pieces, problem=None):
        self.text = text
        self.pieces = pieces
        self.problem = problem
        self.owner = self._one("owners")
        self.scope = self._one("scopes")
        self.hook = self._one("triggers")
        self.effect = self._one("effects")
        self.narrowing = [p for p in pieces if p.family == "narrowing"]
        self.riders = [p for p in pieces if p.family == "riders"]

    def _one(self, family):
        found = [p for p in self.pieces if p.family == family]
        return found[0] if found else None


_MEMBERS = {}


def _stamp(folders):
    """When each folder last changed, or None where that cannot be asked."""
    try:
        return tuple(os.stat(p).st_mtime_ns for p in folders)
    except OSError:
        return None


def members(package):
    """A package's modules by name, asked of the package so a packaged app finds them too."""
    try:
        found = importlib.import_module(package)
    except ImportError:
        return []
    # ⛔ READ AGAIN ONLY WHEN A FOLDER CHANGED: a build asks this hundreds of thousands of times
    when, held = _stamp(found.__path__), _MEMBERS.get(package)
    if when is None or not held or held[0] != when:
        held = _MEMBERS[package] = (when, sorted(
            name for _, name, folder in pkgutil.iter_modules(found.__path__)
            if not folder and not name.startswith("__")))
    return list(held[1])


# the folders do not change during a run, so each word list is read out of them once
_READ = {}


def vocabulary(families=FAMILIES, package="framework"):
    """Every word the grammar knows, read out of the folders -- one file, one word."""
    from tools.hlcode import read
    read(WORD_LIST)
    key = (tuple(families), package)
    if key not in _READ:
        _READ[key] = _vocabulary(families, package)
    return dict(_READ[key])


def _vocabulary(families, package):
    """The word list, read out of the folders."""
    from framework.trailing import claim_form
    words = {}
    for family in families:
        if family in BY_TABLE and package == "framework":
            continue
        for name in members("%s.%s" % (package, family)):
            where = "%s/%s.py" % (family, name)
            module = importlib.import_module("%s.%s.%s" % (package, family, name))
            spelling = getattr(module, "WORD", None)
            guard(spelling, "%s declares no WORD" % where)
            target = getattr(module, "TARGET", None)
            guard(target in TARGETING,
                  "%s says its target is %r, which is not one of %s" % (where, target, TARGETING))
            claim(words, spelling, family, target, where)
            claim_form(claim, words, module, family, where)
    if "effects" in families and package == "framework":
        from framework.effecttable import sheet_rows
        for held in sheet_rows():
            claim(words, held.word, "effects", held.target, held.source)
    if "narrowing" in families and package == "framework":
        from framework import questions
        for ask in questions.rows():
            claim(words, ask.word, "narrowing", ask.target, ask.source)
    for family in (families if package == "framework" else ()):
        for spelling in dummy_files(family):
            claim(words, spelling, family, dummy_module(spelling).TARGET, DUMMY_SOURCE)
    return words


def claim(words, spelling, family, target, where):
    """Add one word, and refuse the spelling if another folder has already claimed it."""
    # ⛔ B2: a word is its own file in its family's folder; no sheet, table or list stands in
    guard(where == DUMMY_SOURCE or (where.startswith(family + "/") and where.endswith(".py")),
          "B2: `%s` comes from %s, not from its own file in `%s/`" % (spelling, where, family))
    # two kinds cannot share a spelling: the folder a word is in is what says what it IS
    guard(spelling not in words,
          "`%s` is declared twice: %s and %s"
          % (spelling, words[spelling].source if spelling in words else "?", where))
    words[spelling] = Word(spelling, family, target, where)
    return words[spelling]


def module_of(word, package="framework"):
    """The file a word was found in, opened -- so what else it declares can be read off it."""
    return Said(opened(word, package), word.spelling)


def opened(word, package="framework"):
    """The file a word was found in, as it is, with nothing noted of what is read off it."""
    if word.family == "effects" and package == "framework":
        from framework.effecttable import held_module
        return held_module(word.spelling)
    if word.family == "narrowing" and package == "framework":
        from framework import questions
        return questions.module_for(word.spelling)
    from framework.trailing import val_form
    if word.source == DUMMY_SOURCE:
        return dummy_module(word.spelling)
    return val_form(own_file(word, package), word)


def own_file(word, package="framework"):
    """A word's own file as written, before any table adds what its action or question says."""
    return importlib.import_module("%s.%s" % (package, word.source[:-3].replace("/", ".")))


class Said:
    """A word's file as a block's writer reads it: each NAME asked is noted as `Word.NAME`."""
    __slots__ = ("_module", "_word")

    def __init__(self, module, word):
        object.__setattr__(self, "_module", module)
        object.__setattr__(self, "_word", word)

    def __getattr__(self, name):
        if name.isupper():
            from tools.hlcode import read
            read("%s.%s" % (self._word, name))
        return getattr(self._module, name)

    def __setattr__(self, name, value):
        setattr(self._module, name, value)

    def __dir__(self):
        return dir(self._module)

    def __eq__(self, other):
        return self._module is getattr(other, "_module", other)

    def __hash__(self):
        return hash(self._module)

    def __repr__(self):
        return repr(self._module)


def said(words=None):
    """READS: every word's NAMEs as their files say them now, `Word.NAME` to its text."""
    words = vocabulary() if words is None else words
    out = {}
    for spelling, word in sorted(words.items()):
        module = opened(word)
        for name in dir(module):
            value = getattr(module, name) if name.isupper() else None
            if name.isupper() and isinstance(value, (str, int, float, bool, tuple, list, dict,
                                                     type(None))):
                out["%s.%s" % (spelling, name)] = repr(value)
    return out


def stems_of(text):
    """The spelling as written, and -- when it ends in digits -- the spelling without them."""
    written_as = [(text, None)]
    digits = re.search("[0-9]+$", text)
    if digits:
        written_as.append((text[:digits.start()], int(digits.group())))
    return written_as


def a_mark_may_sit_at(stem, i):
    # the mark sits right in front of a capital (`TUnit`, `GainTRes`); elsewhere `T` is a letter
    return stem[i] == TARGET_MARK and i + 1 < len(stem) and stem[i + 1].isupper()


def ways_of_writing(word):
    """Every way one word may be written: as it stands, and with the mark where one may sit."""
    return [word] + [word[:at] + TARGET_MARK + word[at:]
                     for at in range(len(word)) if word[at].isupper()]


def without_the_mark(stem):
    """The stem with one `T` out, once per `T` that may be the mark (so `GaiTnRes` is no word)."""
    return [(stem[:i] + stem[i + 1:], True)
            for i in range(len(stem)) if a_mark_may_sit_at(stem, i)]


def readings(text):
    """Every reading of a piece (word, `T` out?, column), whole spelling first; two is ambiguous."""
    out = []
    for stem, column in stems_of(text):
        # the stem as it stands, then each way one of its `T`s could have been the mark
        for word, targeted in [(stem, False)] + without_the_mark(stem):
            reading = (word, targeted, column)
            if reading not in out:
                out.append(reading)
    return out


def nearest(text, words):
    # the word we know that looks most like this one, for a complaint worth reading
    close = difflib.get_close_matches(text, sorted(words), n=1, cutoff=0.5)
    return close[0] if close else None


def cannot_place(text, found, words):
    """Why this piece is not one word of ours -- or nothing at all, when it is exactly one."""
    if not text:
        return "a name has an empty piece -- two `%s` with nothing between" % JOIN
    if len(found) > 1:
        return ("`%s` could be %s, and two words cannot both own a piece"
                % (text, [spelling for spelling, _, _ in found]))
    if not found:
        like = nearest(text, words)
        return "`%s` is not a word I know%s" % (text, ", nearest is `%s`" % like if like else "")
    return None


def refusals(text, spelling, word, targeted, column):
    """The four rules a placed piece must pass, in order, each with the sentence refusing it."""
    return (
        (word.target == "required" and not targeted,
         "`%s` needs a target: write `%s` with a %s in it" % (text, spelling, TARGET_MARK)),
        (word.target == "never" and (targeted or column is not None),
         "`%s` takes no target at all" % text),
        (column is not None and not targeted,
         "`%s` has a number but no `%s`, and without a target there is no column to name"
         % (text, TARGET_MARK)),
        (targeted and column == 0,
         "`%s` is targeted at column zero, which is what leaving the `%s` off already means"
         % (text, TARGET_MARK)),
    )


def parse_piece(text, words):
    """One piece, read against the vocabulary. A piece it cannot place says so and stops."""
    found = [reading for reading in readings(text) if reading[0] in words]
    unplaceable = cannot_place(text, found, words)
    if unplaceable:
        return Piece(text, problem=unplaceable)

    spelling, targeted, column = found[0]
    word = words[spelling]
    for broken, why in refusals(text, spelling, word, targeted, column):
        if broken:
            return Piece(text, problem=why)
    # a number says which column; targeted with no number means the first
    return Piece(text, word=word, targeted=targeted,
                 column=column if column is not None else (1 if targeted else 0))


def parse(text, words):
    """A whole name. Every piece is asked about; the first one that cannot be placed stops it."""
    # every piece is kept, empty ones included: an empty piece is a fault, not a nothing
    pieces = [parse_piece(part, words) for part in text.split(JOIN)]
    stuck = next((p for p in pieces if p.problem), None)
    if stuck:
        return Name(text, pieces, problem="%s (in `%s`)" % (stuck.problem, text))
    # each kind may appear once, and a use with no effect does nothing at all
    for family in ("scopes", "owners", "triggers", "effects"):
        seen = [p for p in pieces if p.family == family]
        if len(seen) > 1:
            return Name(text, pieces,
                        problem="`%s` names %d %s, and one is the most it may name"
                                % (text, len(seen), family))
    name = Name(text, pieces)
    if name.effect is None:
        return Name(text, pieces, problem="`%s` says nothing about what to DO" % text)
    if name.scope is None:
        return Name(text, pieces, problem="`%s` says nothing about who it is about" % text)
    return __import__("framework.effecttable").effecttable.unparametered(name) or name


# ------------------------------------- MADE-UP WORDS, for the word-cost guard; none in a real build

# how many of each kind the guard adds (0 when unset), and which kinds, all unless it narrows them
DUMMIES = int(os.environ.get("DUMMY_WORDS") or 0)
DUMMY_KINDS = [k for k in (os.environ.get("DUMMY_KINDS") or "").split(",") if k]
# where a made-up word says it came from, so `module_of` opens no file for it
DUMMY_SOURCE = "the word-cost guard"
# the real word each made-up file word copies, by the folder it would sit in
DUMMY_LIKE = {"multipliers": "perquestdone", "scopes": "army", "owners": "enemy",
              "triggers": "on_dev", "riders": "formet", "parameters": "anytier",
              "comparisons": "orless", "negations": "not_"}
# and the rows copied: an Ask word's question; the effect tab's one-shot rows copy its first
DUMMY_ASK_LIKE = "quests completed"


def dummies_on(kind):
    """Does this build add made-up words of `kind`?"""
    return bool(DUMMIES) and (not DUMMY_KINDS or kind in DUMMY_KINDS)


def _dummy_spelled(kind, n):
    """No digit and no capital past the first: a digit or a `T` would read as a target column."""
    letters = "abcdefghijklmnopqrstuvwxyz"
    return "Dummy%s%s%s" % (kind[:5].lower(), letters[n // 26], letters[n % 26])


def dummy_asks(real):
    """`real` Ask rows, then the made-up ones, each on a bit past every real one."""
    import types
    like = next((a for a in real if a.asks == DUMMY_ASK_LIKE), None)
    if not dummies_on("narrowing") or like is None:
        return real
    made = [types.SimpleNamespace(**dict(vars(like), word=_dummy_spelled("ask", n),
                                         number=max(a.number for a in real) + 1 + n,
                                         source=DUMMY_SOURCE))
            for n in range(DUMMIES)]
    return tuple(real) + tuple(made)


def dummy_effects(held, shots):
    """The effect tab's rows, then made-up ones: one-shot for `effects`, held for `held`."""
    from copy import copy
    if dummies_on("held") and held:
        made = [copy(held[0]) for _ in range(DUMMIES)]
        for n, one in enumerate(made):
            one.word, one.number = _dummy_spelled("held", n), held[-1].number + 1 + n
            one.source = DUMMY_SOURCE
            one.families = tuple((part, way, enum, tuple((p, "%s_%s" % (a, one.word))
                                                         for p, a in kinds))
                                 for part, way, enum, kinds in one.families)
        held = tuple(held) + tuple(made)
    if not dummies_on("effects") or not shots:
        return held, shots
    made = [copy(shots[0]) for _ in range(DUMMIES)]
    for n, shot in enumerate(made):
        shot.word, shot.source = _dummy_spelled("shot", n), DUMMY_SOURCE
    return held, tuple(shots) + tuple(made)


def dummy_files(family):
    """The made-up spellings in one word folder."""
    return ([_dummy_spelled(family, n) for n in range(DUMMIES)]
            if family in DUMMY_LIKE and dummies_on(family) else [])


def dummy_module(spelling):
    """A made-up word's file: the real one's, under its own spelling and a number of its own."""
    import types
    family = next(f for f in DUMMY_LIKE if spelling in dummy_files(f))
    like = importlib.import_module("framework.%s.%s" % (family, DUMMY_LIKE[family]))
    module = types.ModuleType("framework.%s.%s" % (family, spelling))
    for name in dir(like):
        if name.isupper():
            setattr(module, name, getattr(like, name))
    module.WORD = spelling
    if hasattr(like, DECLARES):
        taken = [getattr(importlib.import_module("framework.%s.%s" % (family, m)), DECLARES, 0)
                 for m in members("framework.%s" % family)]
        setattr(module, DECLARES, max(taken) + 1 + dummy_files(family).index(spelling))
    return module


# the families whose words write a whole line of the editor text, so the holder's line too
WHOLE_LINE = ("triggers", "effects", "narrowing")


def wording_needed(word):
    """The editor wordings a word's file must hold: its own, without a target, when turned."""
    from framework.trailing import needs_of
    from framework.turned import turned_after
    module = module_of(word)
    if word.family == "negations":
        return []
    if word.family == "riders":
        moves = getattr(module, "STAMP", None) in ("me", "all") and not hasattr(
            module, "STAMP_ONLY")
        return ["SAYS[%s]" % verb for verb in sorted(rider_verbs())] if moves else ["PHRASE"]
    whole = word.family in WHOLE_LINE or (
        word.family == "multipliers" and "an amount" in needs_of(word))
    named = "[::target" in (getattr(module, "PHRASE", "") or "")
    bare = getattr(module, "TARGET", None) == "optional" and named
    turned = turned_after(word) is not None
    return (["PHRASE"] + ["HOLDER"] * whole + ["BARE"] * bare + ["HOLDER_BARE"] * (bare and whole)
            + ["TURNED_PHRASE"] * turned + ["TURNED_HOLDER"] * (turned and whole))


def rider_verbs():
    """Each effect verb a rider moves the receiver of: every effect's but one settling its own."""
    from framework.acts import gain_res, gain_ttrait_stacks
    from framework.effecttable import held_module, sheet_rows
    from framework.pipeline import LATER_ACTS
    acts = {a.STAGE: a for a in (gain_res, gain_ttrait_stacks) + LATER_ACTS}
    out = set()
    for row in sheet_rows():
        module = held_module(row.word)
        guard(module.BEHAVIOUR in acts, "`%s` does `%s`, which no act is" % (
            row.word, module.BEHAVIOUR))
        if not getattr(acts[module.BEHAVIOUR], "RIDER_SETTLED", False):
            out.add(module.FAMILY)
    return out


def _has(module, name):
    """Whether a word's file holds a wording; `SAYS[pays]` is the `pays` entry of its `SAYS`."""
    if "[" in name:
        table, key = name.rstrip("]").split("[")
        entry = (getattr(module, table, None) or {}).get(key)
        return bool(entry) and len(entry) == 2 and len(entry[0]) == 4 and all(
            "{x}" in form for form in entry[0])
    return hasattr(module, name)


def unworded(words=None):
    """Each real word whose file lacks an editor wording it needs, one line each."""
    words = vocabulary() if words is None else words
    out = []
    for spelling, word in sorted(words.items()):
        lacks = [n for n in wording_needed(word) if not _has(module_of(word), n)]
        if lacks and word.source != DUMMY_SOURCE:
            out.append("`%s` (%s) has no %s" % (spelling, word.source, ", ".join(lacks)))
    return out


def install(bc):
    """Read the vocabulary out of the folders. Nothing here is written into the game."""
    return ("NAMES: %d words in %d folders, a file each or a held-table row"
            % (len(vocabulary()), len(FAMILIES)))
