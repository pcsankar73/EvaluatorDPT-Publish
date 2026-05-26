# Certification Artifacts

This folder is the **handoff surface** for external model certification.

## Structure

- `certification/runs/<RUN_ID>/ARTIFACT_POINTERS.md` — canonical links/pointers for a run.
- `experiments/<RUN_ID>/certification/` — the concrete reports copied from the dev-run repo.

`RUN_ID` convention used here: `S12B_20260526`.

## Current publish candidate

- Run: `S12B_20260526`
- Pointers: `certification/runs/S12B_20260526/ARTIFACT_POINTERS.md`
- Reports: `experiments/S12B_20260526/certification/`

## Notes

- Do not commit secrets (SAS tokens, private URLs, internal credentials).
- Tokenized datasets and checkpoints are referenced by storage URLs and are not stored in this repo.
