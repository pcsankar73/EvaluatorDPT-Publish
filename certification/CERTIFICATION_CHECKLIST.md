# Certification Checklist (Public)

Purpose: quick visibility into which artifacts exist for a given run.

Canonical run pointers live under:
- `certification/runs/<RUN_ID>/ARTIFACT_POINTERS.md`

## Required (S12B publish candidate)

### Model
- [x] Final checkpoint pointer (S1/S2)
- [x] HF export pointer (S1/S2)
- [x] Threshold sweep artifacts (decision)
- [x] Calibration artifacts (ECE + bins)

### Data
- [x] Dataset datasheet (publish-safe)
- [ ] Public dataset release (if/when applicable)

### Evaluation
- [x] Evaluation report (val + test)
- [x] Confusion matrix
- [x] Multi-seed stability report

### Governance
- [x] Model card
- [x] Threshold policy (governance)
- [x] Safety/limitations notes

### Paper
- [x] Current preprint package (PDF + figures)

Notes:
- This repo does not ship raw training data.
- Do not commit secrets (SAS tokens, credentials).
