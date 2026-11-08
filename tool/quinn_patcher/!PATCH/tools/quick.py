"""The build's hottest small steps, written for speed: copies, and the walk over our frames."""
import pickle
from copy import deepcopy

# each code object's own file, or None when it is not ours: worked out once, not per frame
FILE_OF = {}


def file_of(code):
    """`code`'s file under `!PATCH/`, or None for `tools/`, the build itself, or anything else."""
    p = code.co_filename.replace("\\", "/")
    p = p.split("/!PATCH/", 1)[1] if "/!PATCH/" in p else "tools/"
    FILE_OF[code] = None if p.startswith("tools/") or p == "build.py" else p
    return FILE_OF[code]


def ours(f):
    """Each frame of ours from `f` outward, with its file, as a list."""
    out, known = [], FILE_OF
    while f is not None:
        code = f.f_code
        p = known[code] if code in known else file_of(code)
        if p is not None:
            out.append((f, p))
        f = f.f_back
    return out


# per key read, the frame it was last read under: held, so no later frame can take its identity
LAST_UNDER = {}


def _next_ours(f):
    """The first frame of ours from `f` outward, or None."""
    known = FILE_OF
    while f is not None:
        code = f.f_code
        if (known[code] if code in known else file_of(code)) is not None:
            return f
        f = f.f_back
    return None


def read_into(read_by, key, f):
    """`key` into every frame of ours from `f` out; past the first, stop where it already went."""
    f, seen = _next_ours(f), 0
    while f is not None:
        seen += 1
        # the same live frame as last time: every frame outside it was given `key` then
        if seen == 2 and LAST_UNDER.get(key) is f:
            return
        if seen == 2:
            LAST_UNDER[key] = f
        read_by.setdefault((id(f), f.f_code), set()).add(key)
        f = _next_ours(f.f_back)


def copied(thing):
    """A whole copy, as `deepcopy` makes it, through pickle: the same objects, faster."""
    return pickle.loads(pickle.dumps(thing, pickle.HIGHEST_PROTOCOL))


def bodiless(like):
    """A copy of function `like` without its body, which the caller replaces at once."""
    marks = getattr(getattr(like, "debuginfo", None), "value", None)
    ops, regs, kept = like.ops, list(like.regs), list(marks) if marks else None
    like.ops, like.regs[:] = [], []
    if marks:
        marks[:] = kept[:1]
    try:
        return deepcopy(like)
    finally:
        like.ops, like.regs[:] = ops, regs
        if marks:
            marks[:] = kept
