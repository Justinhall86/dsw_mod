"""Edit stage for the Ranger redesign recipes (`edits=[...]` in rd_build.py).  The operations now live in the shared skill
.claude/skills/dsw-model-qa/scripts/fit_ops.py (same code, moved there 2026-11-26 so other units can use it); this file only re-exports them."""
import os
import sys

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(os.path.abspath(__file__)), *[".."] * 5, ".claude", "skills", "dsw-model-qa", "scripts")))
from fit_ops import *  # noqa: E402,F401,F403
from fit_ops import run  # noqa: E402,F401
