# S12B Certification Pack

Run ID: `S12B_20260526`

This package contains the certifier-facing evidence for EvaluatorDPT S12B, an auditable operational decision-control checkpoint with learned deferral.

## Review Order

1. `pack/reports/EVALUATION_REPORT.md` — full-split decision metrics and post-training evidence summary
2. `pack/reports/CALIBRATION_REPORT.md` — calibration and paired S12/S12B comparison
3. `pack/governance/MODEL_CARD.md` — intended use, limits, and validated claims
4. `pack/governance/THRESHOLD_POLICY.md` — policy-separable routing model
5. `pack/governance/GOVERNANCE_AND_SAFETY.md` — logging, escalation, and domain-transfer requirements
6. `pack/artifacts/post_training_tests/` — abstention, coverage, TBD audit, annotation, dataset, and comparison reports
7. `ARTIFACT_POINTERS.md` — controlled artifact locations and identifiers

## Evaluated Scope

| Field | Value |
|---|---|
| Experiment | `exp_t90_S12B_boundarypack_ep1_fromS12ep3` |
| Primary checkpoint | `best_model_epoch_1.pt` |
| Dataset | DS-L validation/test, with S12B boundary-pack sharpening |
| Validation split | 44,404 examples |
| Test split | 44,597 examples |
| Validated output | YES / NO / TBD decision head |
| Auxiliary status | Emotion head masked in DS-L; no S12B emotion performance claim |

## Key Results

| Split | Accuracy | Macro F1 |
|---|---:|---:|
| Validation | 0.8224 | 0.8213 |
| Test | 0.8260 | 0.8252 |

Additional findings:

- Validation ECE: 0.0338
- Multi-seed stability: PASS, std=0.0 over seeds 42, 0, and 7
- Forced binary YES/NO without learned deferral: Macro F1=0.4945
- S12B paired comparison: high-confidence error rate at 0.85 improves from 0.0558 to 0.0485 on test

## Defensible Interpretation

S12B should be described as an auditable decision-control checkpoint with validated learned deferral behavior. The boundary-pack pass improves calibration and high-confidence error behavior; it should not be described as a material raw-F1 improvement over S12.

The model artifact and deployment policy are separable. The checkpoint emits a bounded distribution; a versioned threshold policy governs runtime routing and must be logged for auditability.
