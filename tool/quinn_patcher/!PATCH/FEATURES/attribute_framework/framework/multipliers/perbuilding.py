"""`PerBuilding` -- a trailing word: the amount on its left times the faction's building count."""
from framework import scopes
WORD = "PerBuilding"
# everything else is its scope's own, read off that file: each structure's buildings
globals().update(scopes.counting(WORD))
