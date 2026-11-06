---
name: commit-all-safe
description: Commit the user's uncommitted work in small, logical commits, then push, with guardrails for this repo. Use when the user says commit everything, commit all changes, commit what we did, push all work, one commit per file, clean up the working tree, or commit my changes. Also use after a long session that left many modified or untracked files. Make sure to use it whenever the request is to commit or push more than one file, even if the user does not say "all".
argument-hint: 'Optional: the files to commit, or context such as "these are all bug fixes"'
---

# Commit changes safely

Commit uncommitted work one logical change at a time, then push. The goal is a clean history where each commit can be explained in one line, and nothing gets pushed that the user did not mean to share.

## Why this is not a blind "commit everything"

This repo has a lot of uncommitted state that is not ours to publish: large model and data files under `model_inputs/`, `mod_files/data.cdb` (the live game database), `CLAUDE.md`, scratch scripts, and other people's or earlier sessions' work. A commit-everything pass would publish all of it, and a push makes it visible to anyone with access. So the default is to commit only what this session changed or what the user names.

## Steps

1. **Read the state.** Run `git status --porcelain` and `git branch --show-current`. Note the current branch.

2. **Pick the scope.** If the user named files or a topic, that is the scope. Otherwise use the files changed in this session. Everything else is out of scope: list it in the final report but do not commit it. If it is unclear whether a file belongs, ask.

3. **Check each in-scope file before committing.** Skip and report a file, instead of committing it, when:
   - it is larger than about 5 MB or is a binary the user did not ask to version (`.blend`, `.pak`, `.cdb`, `.fbx`, `.zip`, `.exe`, `.dat`), unless the user explicitly named it;
   - it looks like a secret or local setting (`.env`, credentials, tokens, `settings.local.json`);
   - it is generated output (caches, `__pycache__`, progress renders, workspace folders).
   If a skipped file is still needed, say so and let the user decide.

4. **Group the files.** One commit per logical change. Several files that together make one change, such as a script and its doc, share a commit. Unrelated changes get separate commits. A file that changed for two reasons should be split only if the diff makes the split obvious; otherwise say so and ask.

5. **Check the branch.** If the current branch is `main` (or the repo's default branch), create a topic branch first (`git checkout -b <topic>`), and say so. Never commit straight to the default branch without the user's yes.

6. **Write each message from the diff.** Read the diff (`git diff -- <file>`, or `git diff --cached` for staged work) and write a conventional message (`feat:`, `fix:`, `docs:`, `refactor:`, `chore:`) that describes only what that commit changes. Keep the subject under 72 characters. Add a short body when the why is not obvious.

7. **Commit.** Stage only the files for that commit (`git add -- <paths>`), then `git commit`. End the message with the attribution line from the session's system reminder, when there is one. If a commit fails, read the output before retrying.

8. **Show the plan before pushing.** After committing, list the commits and their files, plus anything skipped. Ask the user whether to push. Push only after they say yes, unless they already asked for the push in this same request. Push with `git push -u origin <branch>`.

9. **Report.** End with three lists: committed (with hashes), skipped (with the reason for each), and still uncommitted.

## Interference and stopping

- If git reports a lock or a busy index (`index.lock` or a concurrent git process), wait a few seconds and retry the same command. Do not delete the lock file.
- If the lock or conflict persists, a merge is in progress, or the remote rejects the push, stop. Report what was committed, what remains, and the exact error. Do not force-push.

## Rules

- Never commit a file just because it is in `git status`.
- Never use `git add -A` or `git add .` here. Name the paths.
- Never force-push, never rewrite published history, and never skip hooks.
- Do not push until the user has agreed to the list of commits.
