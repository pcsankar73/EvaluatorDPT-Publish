#!/usr/bin/env bash
set -euo pipefail

# S12B boundary-pack sharpening command.
# Paths are shown as reproducibility identifiers for the evaluated environment.

python scripts/fine_tune_only.py \
  --experiment exp_t90_S12B_boundarypack_ep1_fromS12ep3 \
  --start_from checkpoint \
  --load_from output/checkpoints/exp_t90_S12_L9-11_Hds_dsl/best_model_epoch_3.pt \
  --checkpoint_dir output/checkpoints/exp_t90_S12B_boundarypack_ep1_fromS12ep3 \
  --model_name bert-base-uncased \
  --tokenized_dir data/tokenized_s12_boundarypack_20260526 \
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
