# S12B Certification Pack (Run ID: S12B_20260526)

This folder contains the certification handoff artifacts for the EvaluatorDPT S12B checkpoint.

## What to Review (start here)

1. **Evaluation summary (metrics + scope):** `pack/reports/EVALUATION_REPORT.md`
2. **Calibration evidence:** `pack/reports/CALIBRATION_REPORT.md`
3. **Decision threshold sweep:** `pack/artifacts/threshold_sweep_decision_20260526/`
4. **Multi-seed stability:** `pack/artifacts/multi_seed_00_summary.txt`
5. **Post-training evidence tests:** `pack/artifacts/post_training_tests/`
6. **Governance / policy:** `pack/governance/THRESHOLD_POLICY.md`
7. **Model/data pointers:** `ARTIFACT_POINTERS.md`

## Run Scope

- Experiment: `exp_t90_S12B_boundarypack_ep1_fromS12ep3`
- Dataset: DS-L (tokenized dataset referenced via pointers)
- Evaluation splits reported:
  - Validation: n=44,404
  - Test: n=44,597

## Included Artifacts

All artifacts are vendored under `pack/` so the certifier does not need to chase links through the repo.

- `pack/artifacts/`
  - `metrics.json`, `confusion_matrix.csv`, `train_command.txt`, `stage_summary.md`, `diagnostics.md`
  - `calibration_data_val.json`
  - `multi_seed_00_summary.txt`, `multi_seed_seed_results.json`
  - `threshold_sweep_decision_20260526/` (CSV + thresholds + summary)
  - `post_training_tests/` (abstention baselines, risk/coverage curves, TBD error audit, dataset transparency, annotation policy, and S12/S12B comparison)
  - `ARTIFACT_POINTERS.md` (storage pointers copy)
- `pack/reports/`
  - `EVALUATION_REPORT.md`
  - `CALIBRATION_REPORT.md`
- `pack/governance/`
  - `MODEL_CARD.md`
  - `GOVERNANCE_AND_SAFETY.md`
  - `THRESHOLD_POLICY.md`
- `pack/reproducibility/`
  - `REPRODUCIBILITY.md`, `seed_config.json`, `train_commands.sh`, `eval_commands.sh`

## Model Files / Data

Model weights and tokenized datasets are not stored inside this repository. They are referenced in:
- `ARTIFACT_POINTERS.md`

## Defensible Interpretation

- S12B full-test Macro F1 is 0.8252 on DS-L test (n=44,597).
- Forced binary YES/NO classification without a deferral class drops to Macro F1=0.4945.
- Reject-threshold baselines are retained-coverage operating policies, not direct full-coverage replacements for learned TBD.
- The S12B boundary-pack pass should be interpreted as improving calibration and high-confidence error behavior, not as a material raw-F1 improvement over S12.
