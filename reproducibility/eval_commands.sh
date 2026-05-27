#!/usr/bin/env bash
set -euo pipefail

# Evaluated release (2026-05-26) — evaluation command templates.

CHECKPOINT="${CHECKPOINT:-/path/to/best_model.pt}"
TOKENIZED_VALIDATION_PT="${TOKENIZED_VALIDATION_PT:-/path/to/validation_tokenized.pt}"
TOKENIZED_TEST_PT="${TOKENIZED_TEST_PT:-/path/to/test_tokenized.pt}"
TOKENIZED_DIR="${TOKENIZED_DIR:-/path/to/tokenized_dir}"
OUT_DIR_VAL="${OUT_DIR_VAL:-reports/release_2026-05-26_FULLVAL}"
OUT_DIR_TEST="${OUT_DIR_TEST:-reports/release_2026-05-26_FULLTEST}"

python scripts/evaluate_only.py \
  --checkpoint "$CHECKPOINT" \
  --tokenized_pt "$TOKENIZED_VALIDATION_PT" \
  --out_dir "$OUT_DIR_VAL" \
  --limit 0

python scripts/evaluate_only.py \
  --checkpoint "$CHECKPOINT" \
  --tokenized_pt "$TOKENIZED_TEST_PT" \
  --out_dir "$OUT_DIR_TEST" \
  --limit 0

python scripts/multi_seed_eval.py \
  --checkpoint "$CHECKPOINT" \
  --tokenized_dir "$TOKENIZED_DIR" \
  --experiment release_2026-05-26_stability_val \
  --seeds 42,0,7 \
  --split validation

python scripts/calibration_plots.py \
  --checkpoint "$CHECKPOINT" \
  --tokenized_dir "$TOKENIZED_DIR" \
  --experiment release_2026-05-26_calibration_val \
  --split validation
