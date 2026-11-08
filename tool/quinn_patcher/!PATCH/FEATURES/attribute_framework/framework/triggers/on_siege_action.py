"""`OnSiegeAction` -- fires on every siege action; `OnTSiegeAction` only on the one named."""
from framework.trailing import NO_FAMILY_TRAILER, OPENS_THE_RULE, VAL_NOT_ITS
WORD = "OnSiegeAction"
# its family on the catalogue
KIN = 'Siege'
# the editor text, with and without a target, then the holder's; `{es}` is empty after "you"
PHRASE = "when {actor} finish{es} a [::target::]"
BARE = "when {actor} finish{es} a siege action"
HOLDER = "when {actor} finishes a [::target::]"
HOLDER_BARE = "when {actor} finishes a siege action"
TARGET = "optional"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), NO_FAMILY_TRAILER
NEEDS, NEEDS_NONE = (), OPENS_THE_RULE
# `OnNotTSiegeAction2`: `Not` after this text fires on every siege action but the one named
TURNED_AFTER = "On"
TURNED_PHRASE = "when {actor} finish{es} a siege action other than [::target::]"
TURNED_HOLDER = "when {actor} finishes a siege action other than [::target::]"
# the cdb sheet a target column names
SHEET = "siegeAction"
# which trigger this is, as a number of ours. Never where the word sits in a list
NUMBER = 2
# WHERE IT IS RAISED FROM: the game's end of one occupation action, once per completed action
SITE = "ent.comp.SiegeComponent.endOccupationAction"
# what that function is about, checked by name the way a scope's site is
ABOUT = "ent.comp.SiegeComponent"
# and the things in hand there, all by the names the component's own type gives them
BESIEGER_ON = "besiegingFaction"
BESIEGED_ON = "entity"
# THE PLACE IT FIRES IN, asked by every narrowing spelled after it, and who holds that place
FIRED_IN = BESIEGED_ON
FIRED_IN_HELD_BY = "ent.Entity.get_owner"
# that place in the word builder's words, and the scope whose rules it is asked by
PLACE, PLACE_IS = "the besieged village", "Village"
# the action that is finishing, and what it is called -- which is the id a target column names
ACTION_ON = "occupationAction"
CALLED = "action"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
VAL_NONE = VAL_NOT_ITS
