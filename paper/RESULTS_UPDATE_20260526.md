# Results update (for arXiv revision)

New best publish candidate: `exp_t90_S12B_boundarypack_ep1_fromS12ep3` (DS-L + boundary pack).

Full validation (n=44,404):
- Accuracy: 0.8224
- Macro F1: 0.8213
- YES F1: 0.8252 | NO F1: 0.8496 | TBD F1: 0.7892

Full test (n=44,597):
- Accuracy: 0.8260
- Macro F1: 0.8252
- YES F1: 0.8314 | NO F1: 0.8486 | TBD F1: 0.7956

Certification checks (validation):
- Multi-seed stability (seeds 42/0/7): PASS (std=0.0) — see `experiments/S12B_20260526/certification/multi_seed_00_summary.txt`
- Calibration: ECE=0.0338 — see `experiments/S12B_20260526/certification/calibration_data_val.json`

Notes:
- Emotion head is masked in DS-L lineage; do not claim emotion performance for S12B in the paper.
- Threshold sweep artifacts saved: `experiments/S12B_20260526/certification/threshold_sweep_decision_20260526/`
