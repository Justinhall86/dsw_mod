"""Command-line helpers for dsw_mod."""
from pathlib import Path
import argparse
import json
from .core import ModProject


def main(argv=None):
    parser = argparse.ArgumentParser(prog="dsw_mod")
    parser.add_argument("root", nargs="?", default=".", help="Path to mod project root")
    parser.add_argument("--manifest", action="store_true", help="Print manifest JSON")
    args = parser.parse_args(argv)

    root = Path(args.root).resolve()
    # naive metadata discovery
    meta_file = root / "mod.toml"
    metadata = {}
    if meta_file.exists():
        # Minimal parsing to avoid extra deps
        for line in meta_file.read_text(encoding="utf8").splitlines():
            if "=" in line:
                k, v = line.split("=", 1)
                metadata[k.strip()] = v.strip().strip('"')

    proj = ModProject(root=root, metadata=metadata)
    valid = proj.validate()
    print(f"Valid: {valid}")
    if args.manifest:
        print(json.dumps(proj.build_manifest(), indent=2))


if __name__ == "__main__":
    main()
