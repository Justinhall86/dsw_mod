"""This tick's changes, in the order the build applies them."""
from standalone import factionstyles

CHANGES = (("each faction's own style file, read after the game's sheet", factionstyles.install),)
