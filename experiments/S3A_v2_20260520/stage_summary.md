# Stage Summary — S3A-v2

## Experiment
exp_t90_S3A_v2_L9-11_Hds_v6nli_F8196_ep8

## Purpose
Focal loss boundary sharpening with corrected class weights.

## Dataset
tokenized_v6_nli_20260520 — v6 NLI-corrected (355,408 train / 44,404 val)

## Model Configuration

| Parameter               | Value              |
|-------------------------|--------------------|
| Base model              | bert-base-uncased  |
| Layers unfrozen         | 9, 10, 11 + heads  |
| Focal gamma             | 2.0                |
| Decision class weights  | 1.0 / 1.0 / 1.2    |
| Loss weights            | 1.0 / 0.3 / 0.6    |
| Learning rate           | 6e-6               |
| Scheduler               | cosine             |
| Seed                    | 42                 |

## Best Checkpoint
best_model_epoch_3.pt

## Final Metrics

| Metric   | Value  |
|----------|-------:|
| Macro F1 | 0.8215 |
| YES F1   | 0.8250 |
| NO F1    | 0.8482 |
| TBD F1   | 0.7913 |
| Accuracy | 0.8222 |
| ECE      | 0.0620 |
