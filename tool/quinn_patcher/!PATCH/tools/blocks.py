#!/usr/bin/env python3
"""Each spliced block's function, length and op-name shape, build over build."""
import hashlib
import io
import json
import os

from tools.project import gv
from tools.splice import KINDS_ON, SPLICED_ON
from tools.splice import feeds_of, reads_by_block  # FEEDS


READINGS = "~readings in"


def _readings_in():
    from standalone import onoff
    return sorted(n for n in onoff.A_READING if onoff.ON.get(n))


def _shape(ops):
    """The op-name sequence of one block, as a short stable digest."""
    names = "|".join(o.op or "?" for o in ops)
    return hashlib.sha1(names.encode("utf-8")).hexdigest()[:12]


def of(bc):
    """{block name: {where it is, how long, what shape, what kind}} for this built file."""
    made = getattr(bc, SPLICED_ON, None) or {}
    kinds = getattr(bc, KINDS_ON, None) or {}
    out = {}
    for what, (at, how_many, findex) in made.items():
        fn = next((f for f in bc.functions if gv(f.findex) == findex), None)
        ops = list(fn.ops or [])[at:at + how_many] if fn else []
        out[what] = {"fn": findex, "at": at, "ops": how_many,
                     "shape": _shape(ops), "kind": kinds.get(what, "")}
        out[what]["feeds"] = feeds_of(bc).get(what, [])
        out[what]["reads"] = reads_by_block(bc).get(what, [])
    return out


def write(bc, path):
    """Record this build's blocks beside its signature."""
    try:
        folder = os.path.dirname(path)
        if folder:
            os.makedirs(folder, exist_ok=True)
        made = dict(of(bc), **{READINGS: _readings_in()})
        io.open(path, "w", encoding="utf-8").write(json.dumps(made, indent=1, sort_keys=True))
    except OSError:
        return None
    return path


def write_said(path):
    """READS: every word's NAMEs as this build read them, beside its blocks."""
    from framework.names import said
    io.open(path, "w", encoding="utf-8").write(json.dumps(said(), indent=1, sort_keys=True))
    return path


def read(path):
    try:
        return json.loads(io.open(path, encoding="utf-8").read())
    except Exception:
        return None


def changed(before, now):
    """(gone, arrived, altered) -- names only; a block that merely SLID is not altered."""
    if not before:
        return [], [], []
    before = {n: b for n, b in before.items() if n != READINGS}
    now = {n: b for n, b in now.items() if n != READINGS}
    gone = sorted(set(before) - set(now))
    arrived = sorted(set(now) - set(before))
    altered = sorted(n for n in set(before) & set(now)
                     if (before[n].get("shape"), before[n].get("ops"))
                     != (now[n].get("shape"), now[n].get("ops")))
    return gone, arrived, altered


def _named_in(text, block):
    """Is this block named in the build's header? Generous: one word of its name counts."""
    low = (text or "").lower()
    if block.lower() in low:
        return True
    words = [w.strip("`'\".,") for w in block.split()]
    words = [w for w in words if len(w) > 3]
    return bool(words) and all(w.lower() in low for w in words)


def readings_out(before, now):
    """The readings the baseline carried that this build leaves out; no record: every one out."""
    if not before or not now or READINGS not in now:
        return []
    if READINGS not in before:
        from standalone import onoff
        return sorted(set(onoff.A_READING) - set(now[READINGS]))
    return sorted(set(before[READINGS]) - set(now[READINGS]))


def _only_lost(before, now, b):
    """Gone, or shorter: what taking a reading out does, and all it does."""
    if b not in now:
        return True
    return (now[b].get("ops") or 0) < (before.get(b, {}).get("ops") or 0)


def unmentioned(header, gone, arrived, altered, before=None, now=None):
    """Every changed block the header never mentions, past what a reading taken out explains."""
    out = readings_out(before, now)
    return [b for b in list(gone) + list(arrived) + list(altered)
            if not _named_in(header, b) and not (out and _only_lost(before, now, b))]


def unnamed_now(bc, header, before_path):
    """The changed blocks the header never names, off the code in hand before the cases run."""
    before, now = read(before_path), dict(of(bc), **{READINGS: _readings_in()})
    # a block missing yet is one spliced after the features; the check after the build judges it
    _, arrived, altered = changed(before, now) if before else ([], [], [])
    return unmentioned(header, [], arrived, altered, before, now)
