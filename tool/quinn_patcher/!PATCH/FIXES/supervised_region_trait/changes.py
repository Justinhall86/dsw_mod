"""This tick's changes, in the order the build applies them."""
from standalone import regionsupervision

CHANGES = (
    ("a supervised region gains the trait", regionsupervision.install),
)
