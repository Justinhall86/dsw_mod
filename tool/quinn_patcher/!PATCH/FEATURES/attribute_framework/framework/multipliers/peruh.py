"""`PerUH` -- a trailing word: the amount on its left times the UHQs the faction owns."""
from framework import scopes
WORD = "PerUH"
# everything else is its scope's own, read off that file: its noun, its question, its list
globals().update(scopes.counting(WORD))
