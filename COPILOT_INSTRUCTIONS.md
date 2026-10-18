# Copilot Instructions for dsw_mod

Purpose: provide guidance for the assistant when making edits to this mod toolkit.

When modifying the repo, follow these rules:

- Keep changes minimal and scoped to the task.
- Run tests after edits and ensure they pass.
- When adding new features, include a small test and documentation.
- Use `src/dsw_mod` as the package root. Expose public API in `__init__.py`.
- Prefer standard libs; add dependencies to `pyproject.toml` or `requirements.txt`.

Project conventions:

- Python >=3.10.
- Use pytest for tests under `tests/`.
- CLI entrypoint lives in `src/dsw_mod/cli.py`.
