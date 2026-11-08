"""`OnDev` -- a faction acquires a development, researched or free; `OnTDev` on the one named."""
from framework.trailing import OPENS_THE_RULE, VAL_NOT_ITS
WORD = "OnDev"
# its family on the catalogue
KIN = 'Development'
# the editor text, with and without a target, then the holder's; `{s}` is empty after "you"
PHRASE = "when {actor} acquire{s} [::target::]"
BARE = "when {actor} acquire{s} a development"
HOLDER = "when my faction acquires [::target::]"
HOLDER_BARE = "when my faction acquires a development"
TARGET = "optional"
# what it hands the words on its right and takes from its left; why, when nothing
NEEDS, NEEDS_NONE = (), OPENS_THE_RULE
# `OnNotTDev2`: `Not` after this text fires on every development but the one named
TURNED_AFTER = "On"
TURNED_PHRASE = "when {actor} acquire{s} a development other than [::target::]"
TURNED_HOLDER = "when my faction acquires a development other than [::target::]"
# the cdb sheet a target column names
SHEET = "development"
# which trigger this is, as a number of ours. Never where the word sits in a list
NUMBER = 6
# what a trailing word on its right may attach to: `OfTDomain`, naming the development's domain
OFFERS = ("a development count", "a domain")
# WHERE IT IS RAISED FROM: the one place every development is acquired, never a load
SITE = "logic.faction.Developments.doAcquireDevelopment"
# the call there made once the development is the faction's; the word fires ahead of it
BEFORE = "logic.faction.Developments.acquireDevelopmentFeedback"
# what that function is about, checked by name the way a scope's site is
ABOUT = "logic.faction.Developments"
# the things in hand there, by the names the game's own types give them
OWNER_ON = "owner"
DEVELOPMENT = "logic.faction.Development"
# what the development is called, which is the `development` sheet id a target column names
CALLED = "kind"
# and its domain, which is the `domain` sheet id `OfTDomain` names
ITS_ROW = "logic.faction.Development.get_inf"
ITS_DOMAIN = "_Data.$Development_Impl_.get_domainId"
# THE PLACE IT FIRES IN, asked by every narrowing spelled after it, and who holds that place
FIRED_IN = "the faction acquiring"
FIRED_IN_HELD_BY = "ent.Entity.get_owner"
# that place in the word builder's words, and the scope whose rules it is asked by
PLACE, PLACE_IS = "the acquiring faction", "Faction"
# it happens NOWHERE: its number floats over the scope's own thing, a place of this kind
SHOWN_AS = "ent.Entity"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
VAL_NONE = VAL_NOT_ITS
