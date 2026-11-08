"""The tick folders and `shared/` as one package, so `from standalone import x` still reads."""
from tools.project import SHARED, TICKS

__path__ = [SHARED] + TICKS
