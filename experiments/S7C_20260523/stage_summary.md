# Stage Summary — S7C

## Experiment
exp_t90_S7C_HeadsOnly_v6b

## Dataset
v6b (DS-G)

## Best checkpoint
best_model_epoch_2.pt

## Metrics

| Metric | Value |
|---|---:|
| Macro F1 | 0.8211 |
| Accuracy | 0.8217 |
| YES F1 | 0.8242 |
| NO F1 | 0.8482 |
| TBD F1 | 0.7908 |
| ECE | 0.0310 |

## Notes
- Frozen encoder + unfrozen heads; decision class weights 1.0/1.0/1.2; label_smoothing=0.05.
- Val set size 44,404; best calibration in programme (ECE=0.0310).

