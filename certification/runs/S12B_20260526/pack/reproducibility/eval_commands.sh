#!/usr/bin/env bash
set -euo pipefail

# Full validation and test evaluation for S12B.

python scripts/evaluate_only.py \
  --checkpoint output/checkpoints/exp_t90_S12B_boundarypack_ep1_fromS12ep3/best_model_epoch_1.pt \
  --tokenized_pt data/tokenized_s12_20260525_dsl/validation_tokenized.pt \
  --out_dir reports/exp_t90_S12B_boundarypack_ep1_fromS12ep3_FULLVAL \
  --limit 0

python scripts/evaluate_only.py \
  --checkpoint output/checkpoints/exp_t90_S12B_boundarypack_ep1_fromS12ep3/best_model_epoch_1.pt \
  --tokenized_pt data/tokenized_s12_20260525_dsl/test_tokenized.pt \
  --out_dir reports/exp_t90_S12B_boundarypack_ep1_fromS12ep3_FULLTEST \
  --limit 0

python scripts/multi_seed_eval.py \
  --checkpoint output/checkpoints/exp_t90_S12B_boundarypack_ep1_fromS12ep3/best_model_epoch_1.pt \
  --tokenized_dir data/tokenized_s12_20260525_dsl \
  --experiment exp_t90_S12B_boundarypack_ep1_fromS12ep3_cert_stability_val_20260526 \
  --seeds 42,0,7 \
  --split validation

python scripts/calibration_plots.py \
  --checkpoint output/checkpoints/exp_t90_S12B_boundarypack_ep1_fromS12ep3/best_model_epoch_1.pt \
  --tokenized_dir data/tokenized_s12_20260525_dsl \
  --experiment exp_t90_S12B_boundarypack_ep1_fromS12ep3_cert_calibration_val_20260526 \
  --split validation
