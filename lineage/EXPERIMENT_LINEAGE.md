# Experiment Lineage

## Current Release Candidate

| Field | Value |
|---|---|
| Stage | S12B |
| Experiment | `exp_t90_S12B_boundarypack_ep1_fromS12ep3` |
| Checkpoint | `best_model_epoch_1.pt` |
| Dataset | DS-L validation/test with S12B boundary-pack sharpening |
| Validation Macro F1 | 0.8213 |
| Test Macro F1 | 0.8252 |
| Validation ECE | 0.0338 |

## Publication Lineage Summary

| Stage family | Purpose | Outcome |
|---|---|---|
| DS-E / v5 | NLI-compatible decision corpus construction | Improved semantic fit for YES / NO / TBD labels |
| DS-F / v6 | TBD-to-NO correction pass | Corrected systematic contradiction boundary issues |
| DS-J | Fixed split baseline | Established stable validation/test splits |
| DS-L | Current primary decision dataset | Added targeted hard cases while preserving fixed evaluation splits |
| S12 | DS-L decision checkpoint | Stable decision baseline |
| S12B | Boundary-pack sharpening | Preserved raw F1 while improving calibration and high-confidence error behavior |

## S12B Interpretation

S12B is the current publication and certification candidate. It should be described as an auditable operational decision-control checkpoint with learned deferral. Its strongest claim is not raw-F1 improvement over S12; it is the combination of learned TBD behavior, calibration evidence, threshold-sweep artifacts, stability checks, and reviewable certification packaging.

## Artifact Index

| Artifact | Location |
|---|---|
| Certification pack | `certification/runs/S12B_20260526/` |
| Evaluation reports | `evaluation/` |
| Governance policy | `governance/` |
| Reproducibility commands | `reproducibility/` |
| Paper package | `paper/arxiv_v2/` |
