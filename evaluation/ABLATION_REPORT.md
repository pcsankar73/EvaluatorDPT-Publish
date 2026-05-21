# Ablation Report

## Objective

Show which design choices materially improve performance.

## Required Ablations

| Variant             | Macro F1 | Δ vs Previous | Notes                                              |
|---------------------|----------|---------------|----------------------------------------------------|
| Majority baseline   | TODO     | —             | always majority class                              |
| YES/NO/TBD baseline | TODO     | —             | bounded decision                                   |
| S2A                 | 0.7750   | —             | Layers 8-11, v4 data, BCELoss fix applied          |
| S2B                 | 0.8079   | +0.0329       | Layers 9-11, v5 NLI-only, L8 frozen               |
| S2C                 | 0.8076   | -0.0003       | Heads-only, freeze_heads bug fixed                 |
| S3A focal           | 0.8196   | +0.0120       | gamma=2.0, stopped ep2 (weight redesign needed)    |
| S3A-v2              | 0.8215   | +0.0019       | weights 1.0/1.0/1.2, emotion loss 0.3             |
| S3B                 | PENDING  | PENDING       | heads-only calibration, running 2026-05-21         |
| S4 threshold policy | PENDING  | PENDING       | no training, post-S3B                             |

## Additional Ablations

- no auxiliary heads
- decision only
- emotion weight 0.6 vs 0.3
- class weights 1.0/1.2/1.4 vs 1.0/1.0/1.2
- focal gamma 0 vs 2
