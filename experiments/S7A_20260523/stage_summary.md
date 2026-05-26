# Stage Summary — S7A

## Experiment
exp_t90_S7A_AuxHeads_v6b

## Dataset
v6b (DS-G)

## Best checkpoint
best_model_epoch_3.pt

## Metrics

| Metric | Value |
|---|---:|
| Macro F1 | 0.8266 |
| Accuracy | 0.8275 |
| YES F1 | 0.8304 |
| NO F1 | 0.8561 |
| TBD F1 | 0.7934 |
| ECE | 0.0594 |

## Notes
- Decision head frozen; encoder fully frozen; trained only aux heads (emotion/value).
- Training/val macro F1 held at 0.8215 due to frozen decision head; this folder captures post-stage diagnostic on a 10k subset.

