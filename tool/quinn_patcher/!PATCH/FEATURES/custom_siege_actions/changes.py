"""This tick's changes, in the order the build applies them."""
from standalone import siegeactions, siegecost, siegespawn

CHANGES = (
    ("per-faction siege actions", siegeactions.install),
    ("a custom siege action's own cost", siegecost.install),
    ("a generic spawn for a custom siege action", siegespawn.install),
)
