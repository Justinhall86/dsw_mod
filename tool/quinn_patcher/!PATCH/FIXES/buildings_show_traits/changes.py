"""This tick's changes, in the order the build applies them."""
from standalone import basenotintray, buildingtraits, districtslots, mainbasetraits
from standalone import traitshownonce, uhtraits

CHANGES = (
    ("a village building shows its own traits", buildingtraits.install),
    ("a main base's traits leave its region's tray", basenotintray.install),
    # AFTER it, because it imports that file's reading of where the panel's own strip begins
    ("a main base shows its own traits", mainbasetraits.install),
    # AFTER that one, because it CALLS it: the same row, one window along, for the headquarters
    ("an underworld headquarters shows its own traits", uhtraits.install),
    ("one trait, one icon", traitshownonce.install),
    ("a building slot a trait added is drawn without an error", districtslots.install),
)
