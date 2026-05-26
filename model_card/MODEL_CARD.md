# EvaluatorDPT Model Card

## Model Identity

- Model name: EvaluatorDPT
- Version: best_up_to_s12b_2026-05-26
- Release candidate: S12B snapshot (DS-L + boundary pack)
- Base model: bert-base-uncased
- Max sequence length: 128
- Primary output: YES / NO / TBD
- Auxiliary outputs:
  - Human Values: 10-dimensional multi-label vector
  - Emotions/Sentiments: 28-dimensional multi-label vector

## Intended Use

EvaluatorDPT is intended for bounded semantic decision routing where uncertainty must be explicitly represented.

Primary use cases:
- policy-aware AI routing
- governed decision control
- defer-aware semantic classification
- enterprise decision support
- audit-friendly AI inference

## Out-of-Scope Use

Do not use as a standalone authority for:
- medical diagnosis
- legal adjudication
- autonomous lethal systems
- emergency-response decisions
- decisions requiring regulated human review without oversight

## Current Best Metrics

**Best up to S12B (as of 2026-05-26)**

| Metric | Value |
|---|---:|
| Macro F1 (val) | 0.8213 |
| Accuracy (val) | 0.8224 |
| YES F1 (val) | 0.8252 |
| NO F1 (val) | 0.8496 |
| TBD F1 (val) | 0.7892 |
| ECE (val) | 0.0338 |

Checkpoint: output/checkpoints/exp_t90_S12B_boundarypack_ep1_fromS12ep3/best_model_epoch_1.pt
Validation set: 44,404 samples (DS-L)

Notes:
- Emotion head is masked in DS-L lineage; emotion metrics are intentionally skipped.

## Threshold Policy

- S12B decision threshold sweep artifacts (TBD-fallback): xperiments/S12B_20260526/certification/threshold_sweep_decision_20260526/
- Legacy certified policy (S4, DS-F): governance/THRESHOLD_POLICY.md

## Limitations

- max_length=128 may truncate long decision events
- TBD boundary remains the hardest semantic region
- emotion head is masked in DS-L lineage; do not claim emotion performance for S12B
- certification requires multi-seed and robustness validation

## Ethical and Safety Notes

EvaluatorDPT exposes TBD as a first-class defer state. Production systems should define escalation paths for TBD and low-confidence outputs.
