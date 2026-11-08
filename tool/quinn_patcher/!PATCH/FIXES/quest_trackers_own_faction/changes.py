"""This tick's changes, in the order the build applies them."""
from standalone import questowner

CHANGES = (
    ("a quest's pillage and liberation trackers count only its own faction", questowner.install),
)
