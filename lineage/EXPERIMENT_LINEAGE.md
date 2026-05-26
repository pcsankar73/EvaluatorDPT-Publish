# Experiment Lineage

## Current Best Known Checkpoint

- Stage: S12B — boundary-pack sharpen
- Checkpoint: `output/checkpoints/exp_t90_S12B_boundarypack_ep1_fromS12ep3/best_model_epoch_1.pt`
- Macro F1: 0.8213 (val) / 0.8252 (test)



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
| S5      | exp_t90_S5_AuxHeads_v6nli_ep3                 | Aux head calibration (frozen)  | 0.8215       | v6-corrected| Encoder frozen insufficient; S6 needed |
| S6      | exp_t90_S6_AuxEncoderAnchor01_v6nli_ep3       | Encoder-anchor aux fix (ABORTED)| 0.8210      | v6-corrected| Emotion 0.027/1.000 unchanged 2 epochs; data problem confirmed |
| S7A     | exp_t90_S7A_AuxHeads_v6b                          | Aux heads recovery (decision frozen) | 0.8215*      | v6b (DS-G)   | Training/val macro F1 held at 0.8215; post-stage diagnostic on 10k test subset Macro F1=0.8266 |
| S7B     | exp_t90_S7B_L10-11_AuxAdapt_v6b                   | Unfreeze encoder L10-11 (aux adapt)  | 0.8201       | v6b (DS-G)   | Val set 44,404; encoder unfreeze alone insufficient |
| S7C     | exp_t90_S7C_HeadsOnly_v6b                         | Unfreeze heads (calibration)         | 0.8211       | v6b (DS-G)   | Val set 44,404; best calibration ECE=0.0310 |

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

## S5 Reproducibility Configuration

| Parameter               | Value                                                        |
|-------------------------|--------------------------------------------------------------|
| Base model              | bert-base-uncased                                            |
| Parent checkpoint       | exp_t90_S3A_v2_L9-11_Hds_v6nli_F8196_ep8 ep3               |
| Dataset                 | v6-nli-corrected (tokenized_v6_nli_20260520)                 |
| Encoder                 | Fully frozen (unfreeze_layers="" encoder_lr_map="")          |
| Decision head           | Frozen (--freeze_decision_head)                              |
| Trainable               | emotion_head + value_head only (4 tensors)                   |
| Loss weights            | 0.0 / 1.0 / 1.0 (decision / emotion / value)                |
| Emotion pos_weights     | 28-dim, cap=50 (from aux_label_stats.py)                     |
| Value pos_weights       | 10-dim, no cap needed (max=2.76)                             |
| Learning rate           | 1e-4                                                         |
| Scheduler               | cosine, warmup 0.05                                          |
| Seed                    | 42                                                           |
| Epochs completed        | 2 (ep3 killed — zero marginal value)                         |
| Best checkpoint         | best_model_epoch_1.pt                                        |
| Outcome                 | Emotion still collapsed P=0.027/R=1.000 — S6 required        |

## Artifact Index

| Stage   | Experiment Package                    |
|---------|---------------------------------------|
| S3A-v2  | experiments/S3A_v2_20260520/          |
| S3B     | experiments/S3B_20260521/             |
| S4      | experiments/S4_threshold_20260521/    |
| S5      | No blob push (no decision F1 improvement; diagnostic only)  |
| S6      | experiments/S6_20260521/ (ABORTED — emotion collapse root cause confirmed) |
| S7A     | experiments/S7A_20260523/          |
| S7B     | experiments/S7B_20260523/          |
| S7C     | experiments/S7C_20260523/          |
| S12     | exp_t90_S12_L9-11_Hds_dsl                         | DS-L baseline (no focal, label smoothing) | 0.8211       | DS-L        | Stable; boundary pack created for TBD sharpening |
| S12B ⭐  | exp_t90_S12B_boundarypack_ep1_fromS12ep3          | Boundary pack sharpen                    | 0.8213 (val) / 0.8252 (test) | DS-L + BP   | Cert: multi-seed PASS; ECE=0.0338; threshold sweep saved |



