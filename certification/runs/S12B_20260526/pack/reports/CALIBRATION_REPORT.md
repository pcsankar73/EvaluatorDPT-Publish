# Calibration Report (S12B)

## Objective

Assess whether model confidence is reliable enough for governed deployment.

## Scope

- Run ID: S12B_20260526
- Experiment: `exp_t90_S12B_boundarypack_ep1_fromS12ep3`
- Dataset/split: DS-L validation (n=44,404)
- Report date: 2026-05-26

## Metrics (available)

| Metric | Value | Source |
|---|---:|---|
| ECE | 0.0338 | `experiments/S12B_20260526/certification/calibration_data_val.json` |

## Reliability Data

- Reliability bin table + ECE: `experiments/S12B_20260526/certification/calibration_data_val.json`

## Threshold Sweep

- Decision threshold sweep (TBD-fallback): `experiments/S12B_20260526/certification/threshold_sweep_decision_20260526/`

## Legacy Policy Reference

- Prior certified threshold policy: `governance/THRESHOLD_POLICY.md`
