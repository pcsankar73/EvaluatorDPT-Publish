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

## Paired Checkpoint Comparison

The paired S12/S12B comparison in `pack/artifacts/post_training_tests/s12_vs_s12b_comparison.txt` reports the boundary-pack effect using the same comparison procedure across both checkpoints.

| Metric | S12 val | S12B val | S12 test | S12B test |
|---|---:|---:|---:|---:|
| Macro F1 | 0.8211 | 0.8213 | 0.8254 | 0.8252 |
| ECE (comparison procedure) | 0.0461 | 0.0413 | 0.0426 | 0.0411 |
| High-confidence error @0.85 | 0.0574 | 0.0499 | 0.0558 | 0.0485 |

Interpretation: S12B does not materially change raw Macro F1 over S12. Its measurable benefit is lower calibration error and lower high-confidence error rate under the paired comparison procedure. The ECE value in the metrics table remains the primary stored calibration value for this certification pack.

## Legacy Policy Reference

- Prior certified threshold policy: `governance/THRESHOLD_POLICY.md`
