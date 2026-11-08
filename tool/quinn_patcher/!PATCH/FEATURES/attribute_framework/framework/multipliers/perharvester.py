"""`PerHarvester` -- a trailing word: the amount on its left times the faction's harvesters."""
from framework import scopes
WORD = "PerHarvester"
# everything else is its scope's own, read off that file: its noun, its question, its list
globals().update(scopes.counting(WORD))
