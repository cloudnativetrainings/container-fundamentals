# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repository is

This is the **content** for the "Container Fundamentals" hands-on training course (Docker / Podman / container basics). It is not an application — the deliverable is the set of lab instructions trainees follow. Each top-level `NN_topic/` directory is one self-contained lab: a `README.md` of step-by-step instructions plus any supporting files (Dockerfiles, source, compose files). Editing or reviewing this teaching material is the primary task here.

Trainees run the labs in a GitHub Codespace built from `.devcontainer/devcontainer.json`, which uses a prebuilt image (`quay.io/kubermatic-labs/...trainee-environment`) running Docker-in-Docker, privileged, with host networking. The repo is mounted at **`/training/`** inside that environment.

## Commands

There is no build or test suite — the labs are executed by hand by trainees. The relevant tooling:

- `make verify` — the only repo command; checks the trainee environment has `docker`, `podman`, `dive`, `hadolint`, and `docker compose` installed and the Docker socket reachable. These five tools are what labs assume is present.
- `hadolint <Dockerfile>` — lint a Dockerfile (used directly in lab `18_linting`).

## Lab structure and conventions

Match these patterns when adding or editing labs — they are consistent across the repo:

- **Numbering groups topics with intentional gaps**: `01`–`06` container basics, `10`–`18` Dockerfile/image-build topics, `20`–`23` runtime (volumes, networking, compose, privileged). Leave gaps for future labs rather than renumbering.
- **README shape**: `# Title`, then a one-line `In this training, you will…` intro. Labs that ship files start with a navigate step using an **absolute `/training/...` path** (e.g. `` cd /training/14_caching ``). Steps are `## Imperative headings` with fenced ` ```bash ` blocks; explanatory asides use `>` blockquotes.
- **Cleanup**: most labs end with a `## Cleanup` section, typically `docker rm -f $(docker ps -qa)` and `docker rmi -f $(docker images -qa)`.
- **Codespaces URL** is surfaced to trainees via `echo "https://${CODESPACE_NAME}-80.app.github.dev/"`.
- **`.solution/` subdirectories** (hidden) hold the corrected/finished artifact for a lab — e.g. `18_linting/.solution/Dockerfile` is the clean version of the intentionally-flawed `18_linting/Dockerfile`.

## Critical guardrails

- **Some files in lab roots are intentionally "wrong"** and must not be "fixed": `18_linting/Dockerfile` has deliberate hadolint violations, unpinned base images and `apt` versions exist on purpose, and `15_dockerignore/passwords.txt` is a teaching prop. The fix is the lab exercise. When in doubt, compare against any `.solution/` dir before changing.
- **Do not read or grep `.99_todos/`** — it is denied in `.claude/settings.json` (instructor's private notes/slides). Likewise treat any `.secrets/` as off-limits.
- **Do not "fix" intentional placeholders** like `TODO`, `XXXXX`, or `TODO-STUDENT-EMAIL@...`, and do not change pinned versions or image tags.
- **Instructor-only files** are hidden from trainees via `files.exclude` in the devcontainer: `.git/`, `.gitignore`, `.devcontainer/`, `.99_todos/`, `makefile`, `.claude/`, and this `CLAUDE.md`. Keep instructor material in those paths so it stays out of the trainee's editor.

## Skills

`.claude/skills/` defines repo-specific helpers, invoked by the phrases in their descriptions:

- **md-linter** ("lint md") — prose/typo/grammar review of lab READMEs only (ignores code blocks). Verifies file paths are absolute under `/training`.
- **code-linter** ("lint code") — reviews the code/YAML inside lab READMEs and code files (ignores prose).
- **secrets-remover** ("remove secrets") — scans for credentials/tokens/kubeconfigs before pushing.

All three: when a lab number is given, scope to that one dir; else scope to `git diff` changed files; else the whole repo. They never touch `.99_todos/` or `.secrets/`, and ask before modifying files.

> Note: the lint skills' text was templated from another course and references unrelated examples (`01_install-kcp-locally/`, `K1_VERSION`, `KKP_INSTALLER_VERSION`). Those identifiers do not exist here — apply the general rules, ignore the stale examples.
