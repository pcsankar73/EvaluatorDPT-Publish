# Certification

This directory contains certifier-facing evidence bundles for EvaluatorDPT release candidates.

## Current Certification Candidate

| Field | Value |
|---|---|
| Run ID | `S12B_20260526` |
| Model framing | Auditable operational decision control with learned deferral |
| Primary validated output | YES / NO / TBD decision distribution |
| Evaluation dataset | DS-L validation and test splits |
| Certification pack | `certification/runs/S12B_20260526/` |

Start with `certification/runs/S12B_20260526/CERTIFIER_README.md`.

## Review Focus

The certification package is organized to answer four questions:

1. What checkpoint and dataset were evaluated?
2. What are the full-split decision, calibration, and threshold results?
3. Can the runtime routing policy be reconstructed from recorded artifacts?
4. What limitations must be considered before deployment?
