# Evaluation Report (Evaluated Release: 2026-05-26)

## Model Under Evaluation

| Field | Value |
|---|---|
| Release date | 2026-05-26 |
| Dataset | Evaluated decision corpus (held-out splits) |
| Primary output | YES / NO / TBD decision head |
| Report date | 2026-05-26 |

## Decision Metrics

### Validation

| Metric | Value |
|---|---:|
| N | 44,404 |
| Macro F1 | 0.8213 |
| Accuracy | 0.8224 |

| Class | Precision | Recall | F1 | Support |
|---|---:|---:|---:|---:|
| YES | 0.8155 | 0.8352 | 0.8252 | 14,962 |
| NO | 0.8582 | 0.8411 | 0.8496 | 15,534 |
| TBD | 0.7907 | 0.7877 | 0.7892 | 13,908 |

### Test

| Metric | Value |
|---|---:|
| N | 44,597 |
| Macro F1 | 0.8252 |
| Accuracy | 0.8260 |

| Class | Precision | Recall | F1 | Support |
|---|---:|---:|---:|---:|
| YES | 0.8205 | 0.8425 | 0.8314 | 14,883 |
| NO | 0.8598 | 0.8376 | 0.8486 | 15,650 |
| TBD | 0.7955 | 0.7958 | 0.7956 | 14,064 |

## Calibration Summary

- Validation ECE: 0.0338

## Post-Training Comparison Tests (Summary)

| Test | Result | Interpretation |
|---|---:|---|
| Learned TBD, full coverage | Macro F1=0.8252 | Primary full-coverage decision result |
| Forced binary YES/NO, full coverage | Macro F1=0.4945 | Removing deferral collapses performance under ambiguity |
| Confidence reject, 90% retained coverage | Macro F1=0.8631 | Retained-set quality after abstaining on 10% |
| Entropy reject, 90% retained coverage | Macro F1=0.8624 | Similar retained-set behavior |
| Margin reject, 90% retained coverage | Macro F1=0.8625 | Similar retained-set behavior |
| TBD qualitative audit | 7,758 errors / 44,597 | Residual errors concentrate around over-commit and false-deferral boundaries |
| Paired comparison | Test HC error @0.85: 0.0558 → 0.0485 | Boundary refinement improves high-confidence error behavior more than raw F1 |

Coverage-sensitive reject baselines are not direct replacements for the full-coverage learned-TBD score. They evaluate retained subsets after abstaining.

## Scope Notes

- Emotion-head metrics are intentionally omitted for the evaluated release because the emotion head is disabled in this lineage.
- The evaluated release should be presented as calibration and high-confidence-error stabilization relative to a baseline comparison, not as a raw-F1 breakthrough.
