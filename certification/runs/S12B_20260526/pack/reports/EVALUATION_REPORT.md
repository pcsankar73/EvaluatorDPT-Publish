# Evaluation Report (S12B)

## Model Under Evaluation

- Run ID: S12B_20260526
- Experiment: `exp_t90_S12B_boundarypack_ep1_fromS12ep3`
- Checkpoint (pointer): `certification/runs/S12B_20260526/ARTIFACT_POINTERS.md`
- Dataset version: DS-L
- Report date: 2026-05-26

## Decision Metrics

### Validation (n=44,404)

| Metric | Value |
|---|---:|
| Macro F1 | 0.8213 |
| Accuracy | 0.8224 |

| Class | Precision | Recall | F1 | Support |
|---|---:|---:|---:|---:|
| YES | 0.8155 | 0.8352 | 0.8252 | 14962 |
| NO  | 0.8582 | 0.8411 | 0.8496 | 15534 |
| TBD | 0.7907 | 0.7877 | 0.7892 | 13908 |

Confusion matrix (validation): `experiments/S12B_20260526/confusion_matrix.csv`

### Test (n=44,597)

| Metric | Value |
|---|---:|
| Macro F1 | 0.8252 |
| Accuracy | 0.8260 |
| YES/NO/TBD F1 | 0.8314 / 0.8486 / 0.7956 |

## Calibration

- ECE (validation): 0.0338
- Source: `experiments/S12B_20260526/certification/calibration_data_val.json`

## Threshold Policy Evidence

- Decision threshold sweep artifacts (TBD-fallback): `experiments/S12B_20260526/certification/threshold_sweep_decision_20260526/`

## Post-Training Certification Tests

Additional post-training tests are stored in `pack/artifacts/post_training_tests/`.

| Test | Key result | Interpretation |
|---|---:|---|
| Learned TBD, full coverage | Macro F1 = 0.8252 | Primary reported S12B decision result |
| Forced binary YES/NO, full coverage | Macro F1 = 0.4945 | Removing deferral collapses the TBD class |
| Confidence reject, 90% retained coverage | Macro F1 = 0.8631 | Thresholding improves retained-set quality by abstaining on 10% |
| Entropy reject, 90% retained coverage | Macro F1 = 0.8624 | Similar retained-set behavior to confidence rejection |
| Margin reject, 90% retained coverage | Macro F1 = 0.8625 | Similar retained-set behavior to other reject rules |
| TBD qualitative audit | 7,758 errors / 44,597 | Residual errors concentrate in over-commit and false-abstention boundaries |
| S12→S12B comparison | Test HC error @0.85: 0.0558→0.0485 | Boundary pack improves high-confidence error behavior more than raw F1 |

Coverage-sensitive reject baselines are not direct replacements for the full-coverage learned-TBD score; they evaluate retained subsets after abstaining.

## Notes

- Emotion head is masked in the DS-L lineage; emotion metrics are intentionally omitted for S12B.
- S12B should be described as calibration/high-confidence-error stabilization over S12, not as a raw-F1 improvement.
