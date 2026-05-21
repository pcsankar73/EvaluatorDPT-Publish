# Experiment Lineage

## Current Best Known Checkpoint

- Stage: S3A-v2 ep3 — production best. S3B confirmed no improvement.
- Checkpoint: `output/checkpoints/exp_t90_S3A_v2_L9-11_Hds_v6nli_F8196_ep8/best_model_epoch_3.pt`
- Macro F1: 0.8215 | ValLoss: 0.8219

## Stage Summary

| Stage   | Experiment                                    | Purpose                        | Best Macro F1 | Dataset     | Notes                     |
|---------|-----------------------------------------------|--------------------------------|--------------|-------------|---------------------------|
| S2A     | exp_t90_S2A_L8-11_Hds_p2datafixes_F7721_ep3  | Upper encoder adaptation       | 0.7750       | v4          | Layers 8-11, BCELoss fix  |
| S2B     | exp_t90_S2B_L9-11_Hds_v5nli_F7772_ep3        | Near-head consolidation        | 0.8079       | v5-nli-only | Layers 9-11, L8 frozen    |
| S2C     | exp_t90_S2C_HdsOnly_v5nli_F8073_ep2          | Heads-only calibration         | 0.8076       | v5-nli-only | Encoder frozen             |
| S3A     | exp_t90_S3A_L9-11_Hds_v6nli_F8076_ep3        | Focal sharpening (first run)   | 0.8196       | v6-corrected| gamma=2.0, stopped ep2    |
| S3A-v2  | exp_t90_S3A_v2_L9-11_Hds_v6nli_F8196_ep8    | Focal sharpening (corrected)   | 0.8215       | v6-corrected| weights 1.0/1.0/1.2 ✅    |
| S3B     | exp_t90_S3B_HdsOnly_v6nli_F8215_ep3          | Final heads-only calibration   | 0.8215       | v6-corrected| No improvement vs S3A-v2 ✅ |
| S4      | S4_threshold_sweep_S3A_v2_ep3                 | Threshold sweep + policy lock  | 0.8222       | v6-corrected| TBD fallback certified ✅  |

## S3A-v2 Reproducibility Configuration

| Parameter               | Value                                          |
|-------------------------|------------------------------------------------|
| Base model              | bert-base-uncased                              |
| Parent checkpoint       | exp_t90_S3A_L9-11_Hds_v6nli_F8076_ep3 ep2     |
| Dataset                 | v6-nli-corrected (tokenized_v6_nli_20260520)   |
| Layers unfrozen         | 9, 10, 11 + all heads                          |
| Focal gamma             | 2.0                                            |
| Decision class weights  | 1.0 / 1.0 / 1.2 (YES / NO / TBD)              |
| Loss weights            | 1.0 / 0.3 / 0.6 (decision / emotion / value)  |
| Learning rate           | 6e-6                                           |
| Scheduler               | cosine, warmup 0.05                            |
| Seed                    | 42                                             |
| Best checkpoint         | best_model_epoch_3.pt                          |

## S3B Reproducibility Configuration

| Parameter               | Value                                          |
|-------------------------|------------------------------------------------|
| Base model              | bert-base-uncased                              |
| Parent checkpoint       | exp_t90_S3A_v2_L9-11_Hds_v6nli_F8196_ep8 ep3  |
| Dataset                 | v6-nli-corrected (tokenized_v6_nli_20260520)   |
| Encoder                 | Fully frozen                                   |
| Focal gamma             | 0.0                                            |
| Decision class weights  | 1.0 / 1.0 / 1.2 (YES / NO / TBD)              |
| Loss weights            | 1.0 / 0.3 / 0.6 (decision / emotion / value)  |
| Learning rate           | 5e-5                                           |
| Scheduler               | cosine, warmup 0.05                            |
| Seed                    | 42                                             |
| Best checkpoint         | best_model_epoch_1.pt                          |

## Artifact Index

| Stage   | Experiment Package                    |
|---------|---------------------------------------|
| S3A-v2  | experiments/S3A_v2_20260520/          |
| S3B     | experiments/S3B_20260521/             |
| S4      | experiments/S4_threshold_20260521/    |
