# Evaluation Report

## Final Model Under Evaluation

- Experiment: xp_t90_S12B_boundarypack_ep1_fromS12ep3
- Checkpoint: output/checkpoints/exp_t90_S12B_boundarypack_ep1_fromS12ep3/best_model_epoch_1.pt
- Threshold policy: TBD-fallback sweep stored under xperiments/S12B_20260526/certification/threshold_sweep_decision_20260526/
- Dataset version: DS-L (	okenized_s12_20260525_dsl)
- Evaluation split: validation (n=44,404)
- Report date: 2026-05-26

## Primary Metrics

| Metric | Value |
|---|---:|
| Macro F1 | 0.8213 |
| Accuracy | 0.8224 |

## Per-Class Metrics

| Class | Precision | Recall | F1 | Support |
|---|---:|---:|---:|---:|
| YES | 0.8155 | 0.8352 | 0.8252 | 14962 |
| NO | 0.8582 | 0.8411 | 0.8496 | 15534 |
| TBD | 0.7907 | 0.7877 | 0.7892 | 13908 |

## Confusion Matrix

| True \\ Pred | YES | NO | TBD |
|---|---:|---:|---:|
| YES | 12496 | 999 | 1467 |
| NO | 1035 | 13066 | 1433 |
| TBD | 1793 | 1160 | 10955 |

## Calibration

| Metric | Value |
|---|---:|
| ECE | 0.0338 |

Source: xperiments/S12B_20260526/certification/calibration_data_val.json

## Error Taxonomy

Track these buckets:
- YES→TBD soft entailment
- TBD→YES weak entailment leakage
- TBD→NO contradiction/neutral ambiguity
- YES↔NO hard semantic flip
- long-text truncation
- negation failure
- high-confidence wrong prediction
- low-margin overlap case

## Notes

- Source: full-split evaluation artifacts captured in DEV and copied into PUBLISH under xperiments/S12B_20260526/.
