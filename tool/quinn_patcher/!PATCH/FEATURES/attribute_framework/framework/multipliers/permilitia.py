"""`PerMilitia` -- a trailing word: the amount on its left times the faction's militia units."""
from framework import scopes
WORD = "PerMilitia"
# everything else is its scope's own, read off that file: its noun, its question, its list
globals().update(scopes.counting(WORD))
