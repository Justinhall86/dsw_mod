"""`PerAgt` -- a trailing word: the amount on its left times the agents the faction owns."""
from framework import scopes
WORD = "PerAgt"
# everything else is its scope's own, read off that file: its noun, its question, its list
globals().update(scopes.counting(WORD))
