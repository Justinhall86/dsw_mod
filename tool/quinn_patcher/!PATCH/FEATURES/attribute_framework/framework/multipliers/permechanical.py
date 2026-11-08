"""`PerMechanical` -- a trailing word: the amount on its left times the mechanical units."""
from framework import scopes
WORD = "PerMechanical"
# everything else is its scope's own, read off that file: its noun, its question, its list
globals().update(scopes.counting(WORD))
