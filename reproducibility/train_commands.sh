#!/usr/bin/env bash
set -euo pipefail

# Evaluated release (2026-05-26) — boundary-refinement training template.
#
# Notes:
# - This repository does not redistribute tokenized datasets or checkpoints.
# - Provide the paths/identifiers used in your environment.

CHECKPOINT_IN="${CHECKPOINT_IN:-/path/to/base_checkpoint.pt}"
TOKENIZED_BOUNDARY_PACK_DIR="${TOKENIZED_BOUNDARY_PACK_DIR:-/path/to/tokenized_boundary_pack}"
CHECKPOINT_OUT_DIR="${CHECKPOINT_OUT_DIR:-/path/to/output_checkpoints}"

python scripts/fine_tune_only.py \
  --experiment release_2026-05-26_boundary_refined \
  --start_from checkpoint \
  --load_from "$CHECKPOINT_IN" \
  --checkpoint_dir "$CHECKPOINT_OUT_DIR" \
  --model_name bert-base-uncased \
  --tokenized_dir "$TOKENIZED_BOUNDARY_PACK_DIR" \
  --epochs 1 \
  --batch_size 32 \
  --eval_batch_size 64 \
  --learning_rate 5e-6 \
  --encoder_lr_map '9:1e-6,10:7.5e-7,11:5e-7' \
  --unfreeze_layers 9,10,11 \
  --label_smoothing 0.05 \
  --loss_weights 1.0,0.3,0.3 \
  --warmup_ratio 0.05 \
  --scheduler cosine \
  --seed 42
