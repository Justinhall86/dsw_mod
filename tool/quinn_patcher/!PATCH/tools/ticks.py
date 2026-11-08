"""Each tick folder's own list of changes, the folders in alphabetical order."""
import importlib.util
import os

from tools.project import TICKS


def on(name, only=None):
    """Is this tick folder in the build `only` describes (every tick when it is empty)?"""
    return not only or name in {w.strip() for w in only.split(",")}


def changes(only=None, part="CHANGES"):
    """Every tick's `part`, or only the comma-separated tick folders `only` names."""
    wanted = {w.strip() for w in only.split(",")} if only else None
    out = ()
    for tick in sorted(TICKS, key=os.path.basename):
        name = os.path.basename(tick)
        if wanted is not None and name not in wanted:
            continue
        spec = importlib.util.spec_from_file_location("tick_" + name,
                                                      os.path.join(tick, "changes.py"))
        module = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(module)
        out += tuple(getattr(module, part, ()))
    return out
