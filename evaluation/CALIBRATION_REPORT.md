# Calibration Report (Evaluated Release: 2026-05-26)

## Objective

Assess whether confidence scores support threshold-governed routing and audit review.

## Scope

| Field | Value |
|---|---|
| Release date | 2026-05-26 |
| Dataset/split | Held-out validation split |
| N | 44,404 |
| Report date | 2026-05-26 |

## Stored Calibration Metric

| Metric | Value |
|---|---:|
| ECE | 0.0338 |

## Paired Comparison Summary

| Metric | Baseline validation | Evaluated release validation | Baseline test | Evaluated release test |
|---|---:|---:|---:|---:|
| Macro F1 | 0.8211 | 0.8213 | 0.8254 | 0.8252 |
| ECE, comparison procedure | 0.0461 | 0.0413 | 0.0426 | 0.0411 |
| High-confidence error @0.85 | 0.0574 | 0.0499 | 0.0558 | 0.0485 |

## Interpretation

The evaluated release does not materially change raw Macro F1 relative to the baseline comparison. Its measurable benefit is improved calibration behavior and lower high-confidence error rate under the paired comparison procedure. Calibration should be remeasured after domain transfer, threshold-policy changes, or additional fine-tuning.
