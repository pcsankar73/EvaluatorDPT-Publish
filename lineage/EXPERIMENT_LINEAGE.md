# Experiment Lineage (Publication Summary)

This document summarizes the publication lineage at a level appropriate for a public repository. Internal run identifiers are intentionally omitted.

## Current Evaluated Release

| Field | Value |
|---|---|
| Release date | 2026-05-26 |
| Output contract | YES / NO / TBD |
| Validation Macro F1 | 0.8213 |
| Test Macro F1 | 0.8252 |
| Validation ECE | 0.0338 |

## Lineage Summary (High level)

| Stage family | Purpose | Outcome |
|---|---|---|
| Corpus construction | Build NLI-compatible decision examples for YES/NO/TBD boundaries | Established initial decision-routing behavior |
| Boundary correction | Correct systematic contradiction/insufficient-evidence boundary issues | Reduced recurring label-boundary failure modes |
| Fixed-split baseline | Establish stable held-out validation and test splits | Enabled comparable evaluation across iterations |
| Targeted hard-case enrichment | Add targeted stress cases (negation, role/number changes, high-overlap contradictions, long-context) | Improved robustness and auditability under ambiguity |
| Boundary refinement pass | One short sharpening step on targeted hard examples | Preserved raw F1 while improving calibration and high-confidence error behavior in paired comparison |

## Interpretation

The evaluated release should be described as an auditable operational decision-control checkpoint with learned deferral. Its strongest claim is not raw-F1 improvement over the baseline comparison; it is the combination of learned deferral behavior, calibration evidence, threshold-policy separability, and reviewable evaluation reporting.

## Index

| Artifact | Location |
|---|---|
| Model card | `model_card/MODEL_CARD.md` |
| Evaluation reports | `evaluation/` |
| Governance policy | `governance/` |
| Reproducibility templates | `reproducibility/` |
| Paper package | `paper/arxiv_v2/` |
