# Calibration Report — S12B

## Objective

Assess whether S12B confidence scores support threshold-governed routing and audit review.

## Scope

| Field | Value |
|---|---|
| Run ID | `S12B_20260526` |
| Experiment | `exp_t90_S12B_boundarypack_ep1_fromS12ep3` |
| Dataset/split | DS-L validation |
| N | 44,404 |
| Report date | 2026-05-26 |

## Stored Calibration Metric

| Metric | Value |
|---|---:|
| ECE | 0.0338 |

Reliability data is included in `pack/artifacts/calibration_data_val.json`.

## Paired S12/S12B Comparison

| Metric | S12 validation | S12B validation | S12 test | S12B test |
|---|---:|---:|---:|---:|
| Macro F1 | 0.8211 | 0.8213 | 0.8254 | 0.8252 |
| ECE, comparison procedure | 0.0461 | 0.0413 | 0.0426 | 0.0411 |
| High-confidence error @0.85 | 0.0574 | 0.0499 | 0.0558 | 0.0485 |

## Interpretation

S12B does not materially change raw Macro F1 relative to S12. Its measurable benefit is improved calibration behavior and lower high-confidence error rate under the paired comparison procedure. Calibration should be remeasured after domain transfer, threshold-policy changes, or additional fine-tuning.
