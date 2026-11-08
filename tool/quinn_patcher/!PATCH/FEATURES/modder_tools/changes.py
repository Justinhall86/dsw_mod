"""This tick's changes, in the order the build applies them."""
from standalone import hideerrors, inspector

CHANGES = (
    ("the interface inspector", inspector.install),
    ("the interface error overlay hidden", hideerrors.install),
)
