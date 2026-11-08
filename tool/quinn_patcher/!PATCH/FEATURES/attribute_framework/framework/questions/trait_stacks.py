"""Trait stacks: how many stacks of the column-named trait a thing has (`HasTraitStacks`)."""
from framework.trailing import ASKS_ITS_OWN
QUESTION = "trait stacks"
# what it hands the words on its right and takes from its left; why, when nothing
NEEDS, NEEDS_NONE = (), ASKS_ITS_OWN
# the game's own total of the trait's stacks, asked through the thing's traits as `HasTrait` is
ASKS = "logic.TraitsManager.getTraitTotalStacksCount"
THROUGH = "ent.Object.get_traits"
# compared with the row's `val`: at or above keeps it, unless a comparison word says otherwise
AT_LEAST = "value"
# what a trailing word on its right may attach to: the stacks counted, for a comparison word
OFFERS = ("a comparison",)
# the module that weighs it
WEIGHED_BY = "framework.stacksheld"
