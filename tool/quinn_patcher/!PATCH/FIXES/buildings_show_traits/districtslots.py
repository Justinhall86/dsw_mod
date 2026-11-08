"""A building slot a trait added, which the base's model has no place for, is skipped when drawn."""
from standalone import kit, onoff
from standalone.kit import C, _guard, _gv, _sv, _tfields  # noqa: F401

NAME = "districtslots"
# the other changes, by NAME, this one cannot work without; "attributes" is the framework
RELIES_ON = ()

NEEDS = {
    # redraws a structure's building slots whenever a building starts or finishes
    "ds_update": "ent.StructureModel.updateDistricts (",
}

# the model's per-slot record, by the one field the error names
SLOTS_FIELD = "slots"


def install(game):
    if not onoff.on(NAME):
        return "districtslots: OFF"
    return "districtslots: " + str(skip_the_missing_record(game, kit.context(game)))


def _lands(ops, at):
    return at + 1 + _gv(ops[at].df["offset"])


def _reads(game, fn):
    """Every read of a slot record: the out-of-range branch that sets it empty, then the read."""
    ops = fn.ops
    found = []
    for k, o in enumerate(ops):
        if o.op != "ToVirtual" or k < 5:
            continue
        rec = _gv(o.df["dst"])
        if [f[0] for f in _tfields(game, _gv(fn.regs[rec]))] != [SLOTS_FIELD]:
            continue
        test, empty, over = ops[k - 5], ops[k - 4], ops[k - 3]
        _guard(test.op == "JULt" and empty.op == "Null" and _gv(empty.df["dst"]) == rec
               and over.op == "JAlways" and _lands(ops, k - 3) == k + 1,
               "the slot record at %d is not read behind a range test that empties it" % k)
        found.append((k - 4, k))
    return found


def _loop_continue(ops, at):
    """The jump back to the head of the loop this place sits in, or None outside one."""
    head = next((i for i in range(at, -1, -1) if ops[i].op == "Label"), None)
    if head is None:
        return None
    back = [j for j in range(at + 1, len(ops))
            if ops[j].op == "JAlways" and _lands(ops, j) == head]
    return back[0] if back else None


def _games_own_skip(ops, at):
    """Where the game itself goes when the record's first entry turns out empty."""
    fetched = {_gv(ops[i].df["dst"]) for i in range(at, len(ops)) if ops[i].op == "UnsafeCast"}
    test = next((i for i in range(at, len(ops))
                 if ops[i].op == "JNull" and _gv(ops[i].df["reg"]) in fetched), None)
    _guard(test is not None, "no empty-entry test after the slot record read at %d" % at)
    return _lands(ops, test)


def skip_the_missing_record(game, resolved):
    fn = resolved["funcs"]["ds_update"]
    ops = fn.ops
    reads = _reads(game, fn)
    _guard(len(reads) >= 1, "the district update reads no slot record by the name `%s`"
           % SLOTS_FIELD)

    pattern = next(o for o in ops if o.op == "JAlways")
    said = []
    for empty_at, read_at in reads:
        target = _loop_continue(ops, empty_at)
        how = "the next slot"
        if target is None:
            target = _games_own_skip(ops, read_at)
            how = "the game's own skip"
        _guard(target > empty_at, "the skip at %d would jump backward, to %d" % (empty_at, target))
        # one instruction for one: nothing below it moves
        jump = C(pattern)
        _sv(jump, "offset", target - empty_at - 1)
        ops[empty_at] = jump
        said.append("%d -> %s at %d" % (empty_at, how, target))
    return "%d slot record read(s) skip a slot the model lacks: %s" % (len(reads), "; ".join(said))
