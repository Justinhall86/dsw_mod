#!/usr/bin/env python3
"""How many instructions our own shared functions hold, by kind and by word, off the file."""
from collections import defaultdict

from tools.hlcode import SHARED_ON


def _named(key):
    # a key nests its kind first: `(("narrowing", spelling, bit), parts)` reads as narrowing
    head = key[0]
    while isinstance(head, tuple) and head and isinstance(head[0], tuple):
        head = head[0]
    if isinstance(head, tuple):
        return str(head[0]), str(head[1]) if len(head) > 1 else ""
    return str(head), ""


def named(bc):
    """Each function of ours by a name every build gives it alike: instructions and places."""
    import itertools
    from tools.project import gv
    out, seen = {}, {}
    for key, fn in (getattr(bc, SHARED_ON, None) or {}).items():
        # its name without the kinds it is handed: a word adding a handed part grows it, no more
        name = repr(tuple(itertools.takewhile(lambda one: not isinstance(one, int), key)))
        seen[name] = seen.get(name, 0) + 1
        # ⛔ ITS NUMBER TOO: a copy of ours carries the game function's name it was made like
        out["ours %s #%d" % (name, seen[name])] = [
            len(fn.ops), len(fn.regs), gv(bc.types[gv(fn.type)].definition.nargs),
            gv(fn.findex)]
    return out


def write(bc, path):
    """Our functions' sizes filed beside the build, for the next build's size check to weigh."""
    import json
    import os
    try:
        os.makedirs(os.path.dirname(path), exist_ok=True)
        json.dump(named(bc), open(path, "w", encoding="utf-8"), indent=0)
    except OSError:
        return None


def report(bc):
    """One line: every kind's functions and instructions, then each word's copies and size."""
    made = getattr(bc, SHARED_ON, None) or {}
    kinds, words = defaultdict(lambda: [0, 0]), defaultdict(lambda: [0, 0])
    for key, fn in made.items():
        kind, word = _named(key)
        kinds[kind][0] += 1
        kinds[kind][1] += len(fn.ops)
        if word:
            words[(kind, word)][0] += 1
            words[(kind, word)][1] += len(fn.ops)
    whole = sum(size for _, size in kinds.values())
    by_kind = ", ".join("%s %d/%d" % (k, n, s) for k, (n, s) in
                        sorted(kinds.items(), key=lambda p: -p[1][1]))
    by_word = ", ".join("`%s` %d/%d" % (w, n, s) for (_, w), (n, s) in
                        sorted(words.items(), key=lambda p: -p[1][1])) or "none"
    return ("OUR OWN FUNCTIONS: %d, %d instructions -- %s; per word, copies/instructions: %s"
            % (len(made), whole, by_kind, by_word))
