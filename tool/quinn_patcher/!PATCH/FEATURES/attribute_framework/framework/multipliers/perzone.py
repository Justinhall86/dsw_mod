"""`PerZone` -- a trailing word: the amount on its left times the regions the faction owns."""
from framework import scopes
WORD = "PerZone"
# everything else is its scope's own, read off that file: its noun, its question, its list
globals().update(scopes.counting(WORD))
