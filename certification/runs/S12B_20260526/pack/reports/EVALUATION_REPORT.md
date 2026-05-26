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

## Notes

- Emotion head is masked in the DS-L lineage; emotion metrics are intentionally omitted for S12B.
