# Stage Summary — S12B (Boundary Pack Sharpen) — 2026-05-26

## Experiment
`exp_t90_S12B_boundarypack_ep1_fromS12ep3`

## Purpose
Targeted **TBD boundary sharpening** using a small “boundary pack” generated from S12 diagnostics, to reduce high-confidence errors and improve TBD class quality without destabilizing YES/NO.

## Parent Checkpoint
`exp_t90_S12_L9-11_Hds_dsl/best_model_epoch_3.pt` (DS-L baseline run)

## Dataset
- Baseline: `tokenized_s12_20260525_dsl` (DS-L)
- Sharpen pack: `tokenized_s12_boundarypack_20260526` (1 epoch)

## Best Checkpoint
`output/checkpoints/exp_t90_S12B_boundarypack_ep1_fromS12ep3/best_model_epoch_1.pt`

## Metrics (decision head)
- Full validation Macro F1: **0.8213**
- Full test Macro F1: **0.8252**
- Test per-class F1: YES=0.8314 | NO=0.8486 | TBD=0.7956

## Certification checks (validation)
- Multi-seed stability (seeds 42/0/7): **PASS** (std=0.0)
  - `reports/multi_seed/exp_t90_S12B_boundarypack_ep1_fromS12ep3_cert_stability_val_20260526/`
- Calibration data exported: ECE=0.0338
  - `reports/figures/exp_t90_S12B_boundarypack_ep1_fromS12ep3_cert_calibration_val_20260526/calibration_data.json`

## Threshold sweep (decision, TBD-fallback)
- Best val Macro F1: **0.821547** (YES=0.40, NO=0.10, TBD=0.10)
- Applied to test: **0.825163**
- Artifacts: `reports/threshold_sweep/exp_t90_S12B_boundarypack_ep1_fromS12ep3_20260526/`

## Notes
- Emotion head is **masked** in DS-L lineage (0 valid emotion samples after mask) — metrics intentionally skipped; this is documented in SOP and stage metrics.
