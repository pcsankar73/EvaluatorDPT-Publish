# Calibration Report

## Objective

Assess whether model confidence is reliable enough for governed deployment.

## Scope (latest)

- Experiment: xp_t90_S12B_boundarypack_ep1_fromS12ep3
- Checkpoint: output/checkpoints/exp_t90_S12B_boundarypack_ep1_fromS12ep3/best_model_epoch_1.pt
- Dataset/split: DS-L (	okenized_s12_20260525_dsl), validation (n=44,404)
- Report date: 2026-05-26

## Required Metrics

| Metric | Value | Notes |
|---|---:|---|
| ECE | 0.0338 | From xperiments/S12B_20260526/certification/calibration_data_val.json |
| MCE | TODO | Not currently emitted |
| Brier Score | TODO | Not currently emitted |

## Reliability / Bin Table

Reliability bin table + ECE are stored in:
- xperiments/S12B_20260526/certification/calibration_data_val.json

## Threshold Sweep Summary

Decision threshold sweep (TBD-fallback) artifacts:
- xperiments/S12B_20260526/certification/threshold_sweep_decision_20260526/

Note: The legacy certified S4 threshold policy remains tracked under xperiments/S4_threshold_20260521/.

## Deployment Decision

- Use the stored threshold sweep artifacts above to select a defensible deployment policy for this checkpoint.
