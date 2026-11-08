"""`PerVillage` -- a trailing word: the amount on its left times the villages the faction owns."""
from framework import scopes
WORD = "PerVillage"
# everything else is its scope's own, read off that file: its noun, its question, its list
globals().update(scopes.counting(WORD))
