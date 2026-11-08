"""`PerLocalSietch` -- a trailing word: the amount on its left times the local sietches."""
from framework import scopes
WORD = "PerLocalSietch"
# everything else is its scope's own, read off that file: its noun, its question, its list
globals().update(scopes.counting(WORD))
