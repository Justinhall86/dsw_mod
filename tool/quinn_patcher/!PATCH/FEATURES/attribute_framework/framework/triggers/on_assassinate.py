"""`OnAssassinate` -- fires when an assassination succeeds; `OnTAssassinate` on the victim named."""
from framework.trailing import NO_FAMILY_TRAILER, OPENS_THE_RULE, VAL_NOT_ITS
WORD = "OnAssassinate"
# its family on the catalogue
KIN = 'Elimination'
# the editor text, with and without a target, then the holder's
PHRASE = "when {actor} assassinate{s} [::target::]"
BARE = "when {actor} assassinate{s} another faction"
HOLDER = "when my faction assassinates [::target::]"
HOLDER_BARE = "when my faction assassinates another faction"
TARGET = "optional"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), NO_FAMILY_TRAILER
NEEDS, NEEDS_NONE = (), OPENS_THE_RULE
# `OnNotTAssassinate2`: `Not` after this text fires on every victim but the one named
TURNED_AFTER = "On"
TURNED_PHRASE = "when {actor} assassinate{s} a faction other than [::target::]"
TURNED_HOLDER = "when my faction assassinates a faction other than [::target::]"
# the cdb sheet a target column names
SHEET = "faction"
# which trigger this is, as a number of ours. Never where the word sits in a list
NUMBER = 3
# WHERE IT IS RAISED FROM: the game's success of an assassination, before the victim is ended
SITE = "logic.faction.SpyManager.updateAssassinations"
# the one call there that ends the victim, and with it its main base; the word fires ahead of it
BEFORE = "logic.state.State.losePlayer"
# what that function is about, checked by name the way a scope's site is
ABOUT = "logic.faction.SpyManager"
# the things in hand there, by the names the game's own types give them
ASSASSIN_ON = "owner"
RECORD_ON = "assassination"
VICTIM_ON = "target"
# THE PLACE IT FIRES IN, asked by every narrowing spelled after it, and who holds that place
FIRED_IN = VICTIM_ON
FIRED_IN_HELD_BY = "ent.Entity.get_owner"
# that place in the word builder's words, and the scope whose rules it is asked by
PLACE, PLACE_IS = "the victim", "Faction"
# what the victim is called, which is the `faction` sheet id a target column names
CALLED = "kind"
# WHERE THE NUMBER FLOATS: the victim's main base, else the victim, both as the game's entity
SHOWN_AT = "ent.Faction.get_mainBase"
SHOWN_AS = "ent.Entity"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
VAL_NONE = VAL_NOT_ITS
