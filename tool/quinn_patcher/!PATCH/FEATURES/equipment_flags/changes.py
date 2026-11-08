"""This tick's changes, in the order the build applies them."""
from standalone import kept_fixes

CHANGES = kept_fixes.only("armouryfee", "alwayscosts", "slotprice", "cannotremove")
