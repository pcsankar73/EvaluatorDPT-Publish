# Stage Summary — S3B

## Experiment
exp_t90_S3B_HdsOnly_v6nli_F8215_ep3

## Purpose
Heads-only calibration to test whether decision boundaries could be tightened without encoder changes.

## Parent Checkpoint
exp_t90_S3A_v2_L9-11_Hds_v6nli_F8196_ep8/best_model_epoch_3.pt

## Dataset
tokenized_v6_nli_20260520 (v6-nli-corrected)

## Model Configuration

| Parameter               | Value                                          |
|-------------------------|------------------------------------------------|
| Base model              | bert-base-uncased                              |
| Encoder                 | Fully frozen                                   |
| Focal gamma             | 0.0 (no focal sharpening)                      |
| Decision class weights  | 1.0 / 1.0 / 1.2 (YES / NO / TBD)              |
| Loss weights            | 1.0 / 0.3 / 0.6 (decision / emotion / value)  |
| Learning rate           | 5e-5                                           |
| Scheduler               | cosine, warmup 0.05                            |
| Seed                    | 42                                             |
| Best checkpoint         | best_model_epoch_1.pt                          |

## Final Metrics

| Metric    | Value  |
|-----------|-------:|
| Macro F1  | 0.8215 |
| YES F1    | 0.8215 |
| NO F1     | 0.8420 |
| TBD F1    | 0.8010 |
| ECE       | 0.0649 |

## Major Findings

- Heads-only calibration did not improve over S3A-v2 ep3 (ValLoss 0.8233 vs 0.8219)
- Decision boundaries are near-optimal given current encoder representations
- Remaining F1 gap is a representation and data problem, not a calibration problem

## Decision

S3B closed. Production best checkpoint remains S3A-v2 ep3.
Proceed to S4 threshold sweep against S3A-v2 ep3.
