"""`Faction` -- a use about a whole faction; its driver finds the live path in the update."""
from framework.trailing import OPENS_THE_RULE, SCOPE_HANDS_NOTHING, VAL_NOT_ITS
WORD = "Faction"
# the editor text, with and without a target; the owner word's `AS` frames the name as `{name}`
PHRASE = "[::target::-longname]"
BARE = ""
# the noun an owner word frames when no faction is named
NOUN = "faction"
# a faction use can name a faction in a target column, or mean the holder's own
TARGET = "optional"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), SCOPE_HANDS_NOTHING
NEEDS, NEEDS_NONE = (), OPENS_THE_RULE
# `Not` in front: every one of its kind but the one its column names
TURNED_AFTER = ""
TURNED_PHRASE = "any faction but [::target::-longname]"
# the game's own per-faction update, and what it is about -- both by name, both checked
SITE = "ent.Faction.updateAttributes"
ENTITY = "ent.Faction"
# where this scope's RULES run: the faction's own tick, never inside the update above
ROAD = "ent.Faction.regularUpdate"
# WHO GETS PAID: the faction in hand itself
OWNER = "itself"
# a faction has no thing of its own on the map, so its numbers appear over its main base
SHOWN_AT = "ent.Faction.get_mainBase"
# our unique scope number, never a list place
NUMBER = 1
# the game's reach case this word is the holder for: such a row is read against a faction
REHOSTS_FROM = "EFaction"
# and that holder, by the name the road keeps it under
REHOSTS_ONTO = "owner"

# the field a marked spelling matches (its cdb id); without it the UNIT matcher refuses the row
MARKED_ID = "kind"
# the cdb sheet a target column names
SHEET = "faction"
# why no neutral one exists: the builder hides it while the owner is `Neutral`
NEUTRAL_NONE = "every faction is a player; a neutral one is no faction"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
VAL_NONE = VAL_NOT_ITS
