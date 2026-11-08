"""`PerMainBase` -- a trailing word: the amount on its left times the faction's main bases."""
from framework import scopes
WORD = "PerMainBase"
# everything else is its scope's own, read off that file: its noun, its question, its list
globals().update(scopes.counting(WORD))
