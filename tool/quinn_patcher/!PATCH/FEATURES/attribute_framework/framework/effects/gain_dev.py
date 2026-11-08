"""`GainDev` -- an effect doing one game action; `GainDevs`, its with-`val` form, gains several."""
WORD = 'GainDev'
# its family on the catalogue
KIN = 'Development'
# the game action it does, by the name `effecttable.ACTIONS` knows it by
DOES = 'acquire development'
TARGET = 'optional'
# the editor text
PHRASE = '[::target::]'
BARE = 'a random development'
AMOUNT = 'one'
# its with-`val` form: its own spelling and wordings
WITH_VAL = {
    'WORD': 'GainDevs',
    'TARGET': 'never',
    'PHRASE': '::value:: random developments',
}
# with `Not` after 'Gain': the editor text, a random pick that skips the one named
TURNED_AFTER = 'Gain'
TURNED_PHRASE = 'a random development other than [::target::]'
