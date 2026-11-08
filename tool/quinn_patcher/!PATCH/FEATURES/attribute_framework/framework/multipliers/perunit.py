"""`PerUnit` -- a trailing word: the amount on its left times the faction's unit count."""
from framework import scopes
WORD = "PerUnit"
# everything else is its scope's own, read off that file: shuttles and carryalls passed over
globals().update(scopes.counting(WORD))
