# Post-Training Evidence Tests

This folder contains post-training evaluation artifacts for the S12B checkpoint. These tests were run after training and are used to support model review, certification, and paper claims.

## Included Evidence

| Artifact | Purpose |
|---|---|
| `abstention_baselines.txt` / `.json` | Compares learned TBD at full coverage with forced binary YES/NO and reject-threshold operating policies |
| `coverage_curves.csv` | Records TBD-rate, coverage, Macro F1, YES F1, and false-action-rate across TBD thresholds |
| `tbd_error_audit.txt` / `tbd_audit_summary.json` | Summarizes 7,758 test-set errors by over-commit, false-abstention, and hard binary-confusion category |
| `dataset_transparency_report.txt` / `.json` | Documents DS-B→DS-L lineage, split sizes, class distributions, and known dataset-construction limitations |
| `annotation_policy_report.txt` / `.json` | Documents decision-label semantics, NLI label mapping, inherited annotation assumptions, and known IAA limitations |
| `s12_vs_s12b_comparison.txt` / `.json` / `.csv` | Compares S12 and S12B on Macro F1, ECE, high-confidence error rate, TBD rate, and normalized confusion behavior |

## Defensible Interpretation

- Learned TBD is evaluated at full coverage and reaches test Macro F1 = 0.8252.
- Forced binary YES/NO classification without deferral reaches test Macro F1 = 0.4945.
- Reject-threshold baselines improve retained-set Macro F1 by abstaining on part of the data; they are operating policies, not direct full-coverage replacements.
- S12B should be interpreted as improving calibration and high-confidence error behavior over S12, not as materially improving raw Macro F1.
