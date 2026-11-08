"""`GainDevDay` -- an effect doing one game action; `GainDevDays`, its with-`val` form, adds val."""
WORD = 'GainDevDay'
# its family on the catalogue
KIN = 'Development'
# the game action it does, by the name `effecttable.ACTIONS` knows it by
DOES = 'add research days'
TARGET = 'optional'
# the editor text
PHRASE = 'a research day on [::target::]'
BARE = 'a research day on a random development'
AMOUNT = 'one'
# its with-`val` form: its own spelling and wordings
WITH_VAL = {
    'WORD': 'GainDevDays',
    'TARGET': 'optional',
    'PHRASE': '::value:: research days on [::target::]',
    'BARE': '::value:: research days on a random development',
    'TURNED_PHRASE': '::value:: research days on a random development other than [::target::]',
}
# with `Not` after 'Gain': the editor text, a random pick that skips the one named
TURNED_AFTER = 'Gain'
TURNED_PHRASE = 'a research day on a random development other than [::target::]'
