# Ablation Report

## Objective

Show which design choices materially improve performance.

## Required Ablations (DS-F / v6-nli-corrected lineage)

| Variant             | Macro F1 | Δ vs Previous | Notes |
|---------------------|----------|---------------|-------|
| Majority baseline   | n/a     | —             | Not yet computed in publish repo |
| YES/NO/TBD baseline | n/a     | —             | Not yet computed in publish repo |
| S2A                 | 0.7750   | —             | Layers 8-11, v4 data, BCELoss fix applied |
| S2B                 | 0.8079   | +0.0329       | Layers 9-11, v5 NLI-only, L8 frozen |
| S2C                 | 0.8076   | -0.0003       | Heads-only, freeze_heads bug fixed |
| S3A focal           | 0.8196   | +0.0120       | gamma=2.0, stopped ep2 (weight redesign needed) |
| S3A-v2              | 0.8215   | +0.0019       | weights 1.0/1.0/1.2, emotion loss 0.3 |
| S3B                 | 0.8215   | 0.0000        | heads-only calibration; no improvement vs S3A-v2 |
| S4 threshold policy | 0.8222   | +0.0013       | TBD fallback certified (see `governance/THRESHOLD_POLICY.md`) |
| S5 aux calibration  | 0.8215   | 0.0000        | Frozen encoder+decision; aux heads still collapsed; S6 required |
| S6 encoder-anchor   | 0.8210   | -0.0005       | ABORTED — confirmed data root cause; S7 required |

## S7 Series (DS-G / v6b) — recorded separately

S7A–S7C use v6b / DS-G and are not strictly comparable to DS-F stages above. Deltas vs DS-F are therefore reported as n/a.

| Stage | Variant / Key change | Macro F1 | Accuracy | ECE | Split / N | Δ vs Previous | Notes |
|---|---|---:|---:|---:|---|---|---|
| S7A | Aux heads only (decision frozen) | 0.8266 | 0.8275 | 0.0594 | test subset / 10,000 | n/a | Post-stage diagnostic subset; decision anchor held at 0.8215 by design |
| S7B | Unfreeze encoder L10–L11 (aux adapt) | 0.8201 | 0.8212 | 0.0403 | validation / 44,404 | n/a | Encoder unfreeze alone insufficient for decision gains |
| S7C | Unfreeze heads (calibration) | 0.8211 | 0.8217 | 0.0310 | validation / 44,404 | n/a | Best calibration in programme (ECE=0.0310) |

Source artifacts (publish repo):
- `experiments/S7A_20260523/`
- `experiments/S7B_20260523/`
- `experiments/S7C_20260523/`

## Additional Ablations

- no auxiliary heads
- decision only
- emotion weight 0.6 vs 0.3
- class weights 1.0/1.2/1.4 vs 1.0/1.0/1.2
- focal gamma 0 vs 2


