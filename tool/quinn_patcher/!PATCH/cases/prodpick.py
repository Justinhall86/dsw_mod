"""What proves `framework/prodpick.py`. Nothing here goes into the game."""
from tools.project import guard
from framework import effecttable, prodpick
from framework.acts.gain_res_prod import NO_TARGET, NONE, OWN, PICKED_DOMAIN
from framework.parammatch import NOTHING_SPELLED, number_of


def _wanted(families, part, spelled, param, domain):
    """What the families pick for one row, read straight off them: (attribute, case) or None."""
    for named, way, enum, kinds in families:
        if (way == OWN) != bool(spelled) or (named is not None and named != part):
            continue
        case = NO_TARGET if enum is None else enum
        if way == PICKED_DOMAIN and any(w == NONE for _n, w, _e, _k in families):
            if domain is None:
                continue
        elif way == PICKED_DOMAIN:
            case = case if domain is not None else NO_TARGET
        elif way == NONE and domain is not None:
            continue
        for word, attribute in kinds:
            if (NOTHING_SPELLED if word is None else number_of(word)) == param:
                return attribute, case
        return None
    return None


def _walked(entries, at, row_part, spelled, param, domain):
    """What the play's walk of the table picks for one row, entry by entry as the game reads."""
    cursor = entries[at]
    families = entries[cursor]
    cursor += 1
    for _ in range(families):
        way, part, wanted, kinds = entries[cursor:cursor + 4]
        cursor += 4
        after = cursor + 2 * kinds
        fits = (way == prodpick.WAY_CODES[OWN]) == bool(spelled) and part in (0, row_part)
        case = wanted
        if way == prodpick.DOMAIN_ALONE and domain is None:
            case = NO_TARGET
        elif way == prodpick.DOMAIN_WITH_ALL:
            fits = fits and domain is not None
        elif way == prodpick.WAY_CODES[NONE]:
            fits = fits and domain is None
        if not fits:
            cursor = after
            continue
        for _k in range(kinds):
            if entries[cursor] == param:
                return entries[cursor + 1], case
            cursor += 2
        return None
    return None


def check(bc):
    """Each held word's row, every way it can be spelled, picks off the table as its families."""
    held = effecttable.held_rows()
    entries = [int(t) if t.lstrip("-").isdigit() else t
               for t in prodpick.table_text(held, lambda enum: enum).split(prodpick.SEP) if t]
    parts = prodpick.parts_of(held)
    domains = (None, "a domain") if any(
        w == PICKED_DOMAIN for one in held for _n, w, _e, _k in one.families) else (None,)
    weighed = 0
    for at, one in enumerate(held):
        params = {NOTHING_SPELLED} | {number_of(w) for _n, _w, _e, kinds in one.families
                                      for w, _a in kinds if w is not None}
        row_part = parts.index(one.part) + 1 if one.part in parts else 0
        for spelled in (0, 1):
            for param in sorted(params):
                for domain in domains:
                    want = _wanted(one.families, one.part, spelled, param, domain)
                    got = _walked(entries, at, row_part, spelled, param, domain)
                    guard(want == got, "`%s` spelled %d, parameter %d, domain %s: its families "
                          "pick %r and the table %r" % (one.word, spelled, param, domain, want,
                                                        got))
                    weighed += 1
    return ("the attribute pick: %d row shape(s) of %d held word(s) pick off the table as off "
            "their families" % (weighed, len(held)))
