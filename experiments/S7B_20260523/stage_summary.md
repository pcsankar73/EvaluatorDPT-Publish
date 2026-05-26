# Stage Summary — S7B

## Experiment
exp_t90_S7B_L10-11_AuxAdapt_v6b

## Dataset
v6b (DS-G)

## Best checkpoint
best_model_epoch_1.pt

## Metrics

| Metric | Value |
|---|---:|
| Macro F1 | 0.8201 |
| Accuracy | 0.8212 |
| YES F1 | 0.8255 |
| NO F1 | 0.8476 |
| TBD F1 | 0.7873 |
| ECE | 0.0403 |

## Notes
- Unfroze encoder layers 10-11; decision head still frozen anchor from S7A.
- Val set size 44,404; encoder unfreezing alone did not improve decision F1 beyond anchor.

