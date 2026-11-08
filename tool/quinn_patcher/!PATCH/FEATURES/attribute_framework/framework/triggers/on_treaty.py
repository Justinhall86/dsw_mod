"""`OnTreaty` -- fires for each signer of a new treaty; `OnTTreaty` only on the treaty named."""
from framework.trailing import OPENS_THE_RULE, OWES_ITS_TREATIES, VAL_NOT_ITS
WORD = "OnTreaty"
# its family on the catalogue
KIN = 'Treaty'
# the editor text, with and without a target, then the holder's; `{s}` is empty after "you"
PHRASE = "when {actor} sign{s} [::target::]"
BARE = "when {actor} sign{s} a treaty"
HOLDER = "when my faction signs [::target::]"
HOLDER_BARE = "when my faction signs a treaty"
TARGET = "optional"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS = ()
OFFERS_OWED = {"a treaty pick": OWES_ITS_TREATIES}
NEEDS, NEEDS_NONE = (), OPENS_THE_RULE
# `OnNotTTreaty2`: `Not` after this text fires on every treaty but the one named
TURNED_AFTER = "On"
TURNED_PHRASE = "when {actor} sign{s} a treaty other than [::target::]"
TURNED_HOLDER = "when my faction signs a treaty other than [::target::]"
# the cdb sheet a target column names
SHEET = "treaty"
# which trigger this is, as a number of ours. Never where the word sits in a list
NUMBER = 10
# WHERE IT IS RAISED FROM: the game's start of a treaty; a renewal leaves before the signing
SITE = "logic.state.DiplomacyManager.startTreaty"
# the call there that alerts each signer, once the treaty is in place; the word fires ahead of it
BEFORE = "$HEvent.addEvent"
# what that function is about, and the kind of both signers it is handed
ABOUT = "logic.state.DiplomacyManager"
SIGNER = "ent.Faction"
# THE PLACE IT FIRES IN, asked by every narrowing spelled after it, and who holds that place
FIRED_IN = "the faction signing"
FIRED_IN_HELD_BY = "ent.Entity.get_owner"
PLACE, PLACE_IS = "the signing faction", "Faction"
# it happens NOWHERE: its number floats over the scope's own thing, a place of this kind
SHOWN_AS = "ent.Entity"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
VAL_NONE = VAL_NOT_ITS
