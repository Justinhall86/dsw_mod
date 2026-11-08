"""Which game attribute a production row adds, and whether an application already is its target."""
from framework.acts.gain_res_prod import (APPLICATION, NO_TARGET, NONE, OWN, PART, PICKED_DOMAIN,
                                          REMOVE, SPELLED_ON, TARGET)
from framework.parammatch import NAMED as PARAMETER, NOTHING_SPELLED, number_of
from tools.project import guard

# the held table: where the play reads it, and the function that builds it on first use
TABLE = ("the held table", "the held table's entries", "the held table, built")
# how a family names its target, as the table holds it; a domain pick tells two apart
WAY_CODES = {NONE: 0, OWN: 1}
DOMAIN_ALONE, DOMAIN_WITH_ALL = 2, 3
SEP = ","
# the places the pick works in, each a plain number but the two below
NUMBERS = ("cursor", "families", "way", "part", "wanted", "kinds", "after", "spare", "row part")
LABELS = ("ready", "parted", "family", "skip", "own", "spelled", "part fits", "not own",
          "not alone", "every domain", "none", "kinds", "next kind")


def parts_of(held):
    """Every part a held family names, once each: a family's part is its place here plus one."""
    out = []
    for one in held:
        for named, _way, _enum, _kinds in one.families:
            if named is not None and named not in out:
                out.append(named)
    return out


def way_code(way, families):
    """The number a family's way is held as; a domain pick says if an all-domains one sits by."""
    if way != PICKED_DOMAIN:
        return WAY_CODES[way]
    return DOMAIN_WITH_ALL if any(w == NONE for _n, w, _e, _k in families) else DOMAIN_ALONE


def records(held, case_of):
    """Per held word: its family count, then per family way, part, case, kind count, kinds."""
    parts = parts_of(held)
    out = []
    for at, one in enumerate(held):
        guard(one.number == held[0].number + at, "`%s` is held number %d, not %d"
              % (one.word, one.number, held[0].number + at))
        rec = [len(one.families)]
        for named, way, enum, kinds in one.families:
            rec += [way_code(way, one.families), 0 if named is None else parts.index(named) + 1,
                    NO_TARGET if enum is None else case_of(enum), len(kinds)]
            for word, attribute in kinds:
                guard(SEP not in attribute and not attribute.lstrip("-").isdigit(),
                      "`%s` cannot be told apart from the held table's numbers" % attribute)
                rec += [NOTHING_SPELLED if word is None else number_of(word), attribute]
        out.append(rec)
    return out


def table_text(held, case_of):
    """The held table's text: each word's place, then each word's record."""
    recs = records(held, case_of)
    starts, at = [], len(recs)
    for rec in recs:
        starts.append(at)
        at += len(rec)
    return SEP.join(str(t) for t in starts + [t for rec in recs for t in rec])


def install_table(bc, like, case_of):
    """The held table's builder, made once per file, and the text it reads."""
    from framework import wordtable
    from framework.effecttable import held_rows
    from framework.rowreader import reader_for
    text = table_text(held_rows(), case_of)
    return wordtable.builder(bc, like, reader_for(bc), text, TABLE, listed=True), text


def _made_at_install(_hands):
    guard(False, "the held table's builder is made as the production act installs, not here")


def picking_by_table(place, kind, case, target, picked, unmatched, held, first):
    """As each held word's families say, read off the table: no instruction here is per word."""
    from framework.acts.gain_res import WHICH
    every = tuple(family for one in held for family in one.families)
    zero, domain, out = _reading_the_domain(place, target, unmatched, every)
    r = {name: place.scratch_like(place.row[WHICH]) for name in NUMBERS}
    r.update(zero=zero, domain=domain, kind=kind, case=case, target=target,
             asked=place.row["name.%s" % PARAMETER], got=place.scratch_of("Dyn"))
    r["param"] = place.scratch_like(r["asked"])
    l = {w: place.here("held table: %s" % w) for w in LABELS}  # noqa: E741
    l.update(picked=picked, unmatched=unmatched)
    out += _ready(place, r, l, held)
    out += [place.op("Int", dst=r["spare"], ptr=place.number(first)),
            place.op("Sub", dst=r["cursor"], a=place.row[WHICH], b=r["spare"])]
    # ⛔ THE WORD'S PLACE IS READ INTO THE CURSOR ITSELF, so nothing steps it on
    out += _read(place, r, "cursor")[:2] + _read(place, r, "families")
    return out + _family(place, r, l) + _way(place, r, l) + _kinds(place, r, l)


def _read(place, r, into):
    """The table's next entry into `into`, and the cursor on past it."""
    return [place.op("GetArray", dst=r["got"], array=r["backing"], index=r["cursor"]),
            place.op("SafeCast", dst=r[into], src=r["got"]), place.op("Incr", dst=r["cursor"])]


def _ready(place, r, l, held):
    """The table built on first use, its entries in hand, and the row's part as it numbers it."""
    from framework.tray import ARRAY_OF_ENTRIES, BACKING_ON, ONE_PER_RESOURCE
    the_map, the_list = place.scratch_of(ONE_PER_RESOURCE), place.scratch_of(ARRAY_OF_ENTRIES)
    backing_at, r["backing"] = place.field_of(ARRAY_OF_ENTRIES, BACKING_ON)
    built = place.scratch_like(r["zero"])
    builder = place._hands["shared"]((TABLE[2],), [place.kind_of(r["zero"])],
                                     place.kind_of(r["zero"]), _made_at_install)
    out = [place.op("GetGlobal", **{"dst": the_map, "global": place.slot(TABLE[0])}),
           (place.op("JNotNull", reg=the_map), l["ready"]),
           place.op("Call1", dst=built, fun=builder, arg0=r["zero"]),
           l["ready"] + ":", place.op("Label"),
           place.op("GetGlobal", **{"dst": the_list, "global": place.slot(TABLE[1])}),
           (place.op("JNull", reg=the_list), l["unmatched"]),
           place.op("Field", dst=r["backing"], obj=the_list, field=backing_at),
           place.op("Int", dst=r["row part"], ptr=place.number(0))]
    # ONE TEST PER PART A FAMILY NAMES, never per word; 0 fits only a family naming no part
    text = place.scratch_like(place.row[PART])
    for at, named in enumerate(parts_of(held)):
        other = place.here("held table: the row's part is no %s" % named)
        out += [place.op("GetGlobal", **{"dst": text, "global": place.text_object(named)}),
                (place.op("JNotEq", a=place.row[PART], b=text), other),
                place.op("Int", dst=r["row part"], ptr=place.number(at + 1)),
                (place.op("JAlways"), l["parted"]),
                other + ":", place.op("Label")]
    return out + [l["parted"] + ":", place.op("Label")]


def _family(place, r, l):
    """The next family's head read; on to `skip` unless the row's target and part fit it."""
    return [l["family"] + ":", place.op("Label"),
            (place.op("JSGte", a=r["zero"], b=r["families"]), l["unmatched"]),
            place.op("Decr", dst=r["families"])] + _read(place, r, "way") + _read(
        place, r, "part") + _read(place, r, "wanted") + _read(place, r, "kinds") + [
        place.op("Add", dst=r["after"], a=r["cursor"], b=r["kinds"]),
        place.op("Add", dst=r["after"], a=r["after"], b=r["kinds"]),
        # ⛔ A TARGETED FAMILY LEAVES A ROW WITH NO TARGET; THE OTHERS LEAVE A ROW WITH ONE
        place.op("Int", dst=r["spare"], ptr=place.number(WAY_CODES[OWN])),
        (place.op("JNotEq", a=r["way"], b=r["spare"]), l["own"]),
        (place.op("JEq", a=place.row[SPELLED_ON], b=r["zero"]), l["skip"]),
        (place.op("JAlways"), l["spelled"]),
        l["own"] + ":", place.op("Label"),
        (place.op("JNotEq", a=place.row[SPELLED_ON], b=r["zero"]), l["skip"]),
        l["spelled"] + ":", place.op("Label"),
        (place.op("JEq", a=r["part"], b=r["zero"]), l["part fits"]),
        (place.op("JNotEq", a=r["part"], b=r["row part"]), l["skip"]),
        l["part fits"] + ":", place.op("Label")]


def _way(place, r, l):
    """The target and case the family's way sets; on to the kinds, or `skip`."""
    own = [place.op("Int", dst=r["spare"], ptr=place.number(WAY_CODES[OWN])),
           (place.op("JNotEq", a=r["way"], b=r["spare"]), l["not own"]),
           place.op("Mov", dst=r["target"], src=place.row["columns.named"]),
           place.op("Mov", dst=r["case"], src=r["wanted"]),
           (place.op("JAlways"), l["kinds"]),
           l["not own"] + ":", place.op("Label")]
    domain, none = r["domain"], [place.op("Null", dst=r["target"])]
    if domain is None:
        return own + none + [place.op("Mov", dst=r["case"], src=r["wanted"])]
    # ⛔ NO DOMAIN PICKED AND NO ALL-DOMAINS ATTRIBUTE: the domain's own, with no target
    return own + [
        place.op("Int", dst=r["spare"], ptr=place.number(DOMAIN_ALONE)),
        (place.op("JNotEq", a=r["way"], b=r["spare"]), l["not alone"]),
        (place.op("JNull", reg=domain), l["every domain"]),
        place.op("Mov", dst=r["target"], src=domain),
        place.op("Mov", dst=r["case"], src=r["wanted"]),
        (place.op("JAlways"), l["kinds"]),
        l["every domain"] + ":", place.op("Label"),
        place.op("Null", dst=r["target"]),
        place.op("Int", dst=r["case"], ptr=place.number(NO_TARGET)),
        (place.op("JAlways"), l["kinds"]),
        l["not alone"] + ":", place.op("Label"),
        place.op("Int", dst=r["spare"], ptr=place.number(DOMAIN_WITH_ALL)),
        (place.op("JNotEq", a=r["way"], b=r["spare"]), l["none"]),
        (place.op("JNull", reg=domain), l["skip"]),
        place.op("Mov", dst=r["target"], src=domain),
        place.op("Mov", dst=r["case"], src=r["wanted"]),
        (place.op("JAlways"), l["kinds"]),
        l["none"] + ":", place.op("Label")] + none + [
        (place.op("JNotNull", reg=domain), l["skip"]),
        place.op("Mov", dst=r["case"], src=r["wanted"])]


def _kinds(place, r, l):
    """The parameter picks the attribute; a family it fits and no kind takes leaves the row."""
    return [l["kinds"] + ":", place.op("Label"),
            (place.op("JSGte", a=r["zero"], b=r["kinds"]), l["unmatched"]),
            place.op("Decr", dst=r["kinds"])] + _read(place, r, "param") + [
        (place.op("JNotEq", a=r["param"], b=r["asked"]), l["next kind"]),
        place.op("GetArray", dst=r["got"], array=r["backing"], index=r["cursor"]),
        place.op("SafeCast", dst=r["kind"], src=r["got"]),
        (place.op("JAlways"), l["picked"]),
        l["next kind"] + ":", place.op("Label"),
        place.op("Incr", dst=r["cursor"]),
        (place.op("JAlways"), l["kinds"]),
        l["skip"] + ":", place.op("Label"),
        place.op("Mov", dst=r["cursor"], src=r["after"]),
        (place.op("JAlways"), l["family"])]


def _reading_the_domain(place, target, unmatched, families):
    """A zero to compare with, and the `OfTDomain` pick's domain when any family reads one."""
    zero = place.scratch_like(place.row[SPELLED_ON])
    out = [place.op("Int", dst=zero, ptr=place.number(0))]
    domain = None
    if any(way == PICKED_DOMAIN for _named, way, _enum, _kinds in families):
        from framework.acts.gain_devs import the_domain
        left_out, first = place.scratch_like(zero), place.scratch_like(zero)
        domain = place.scratch_like(target)
        out += the_domain(place, domain, left_out, first) + [
            (place.op("JNotEq", a=left_out, b=zero), unmatched)]
    return zero, domain, out


def same_target(place, app, other, picked, tag):
    """On to `other` unless the application's target is the row's own, or neither has one."""
    case, named, families = picked
    target_at, target = place.field_of(APPLICATION, "target")
    which, wanted = place.scratch_arg(REMOVE, 0), place.scratch_arg(REMOVE, 0)
    # ⛔ TWO TEXT PLACES COMPARED AS THEY ARE: a boxed one never matches
    held = place.scratch_like(named)
    same, targeted = (place.here("%s: the target is the row's own" % tag),
                      place.here("%s: the application has a target" % tag))
    out = [place.op("Int", dst=wanted, ptr=place.number(NO_TARGET)),
           place.op("Field", dst=target, obj=app, field=target_at),
           (place.op("JNotNull", reg=target), targeted),
           (place.op("JNotEq", a=case, b=wanted), other),
           (place.op("JAlways"), same),
           targeted + ":", place.op("Label"),
           place.op("EnumIndex", dst=which, value=target),
           (place.op("JNotEq", a=which, b=case), other)]
    for enum in cases_of(families):
        number_of_case = place.enum_case(TARGET, enum)
        not_this = place.here("%s: the target is no %s" % (tag, enum))
        out += [place.op("Int", dst=wanted, ptr=place.number(number_of_case)),
                (place.op("JNotEq", a=which, b=wanted), not_this),
                place.op("EnumField", dst=held, value=target, construct=number_of_case, field=0),
                (place.op("JNotEq", a=held, b=named), other),
                (place.op("JAlways"), same),
                not_this + ":", place.op("Label")]
    return out + [(place.op("JAlways"), other), same + ":", place.op("Label")]


def cases_of(families):
    """Every target case the families name, each once, in their order."""
    out = []
    for _named, _way, enum, _kinds in families:
        if enum is not None and enum not in out:
            out.append(enum)
    return out


def attributes(families):
    """Every game attribute the families add, by name."""
    return [attribute for _part, _way, _target, kinds in families for _word, attribute in kinds]
