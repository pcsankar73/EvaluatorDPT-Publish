#!/usr/bin/env bash
set -euo pipefail

# Final training commands (S7 series; best up to S7C). Do not include secrets.

# S7A — aux heads only (decision frozen), DS-G
nohup python scripts/fine_tune_only.py \
  --experiment              exp_t90_S7A_AuxHeads_v6b \
  --start_from              checkpoint \
  --load_from               output/checkpoints/exp_t90_S3A_v2_L9-11_Hds_v6nli_F8196_ep8/best_model_epoch_3.pt \
  --checkpoint_dir          output/checkpoints/exp_t90_S7A_AuxHeads_v6b \
  --model_name              bert-base-uncased \
  --tokenized_dir           data/tokenized_v6b_20260522 \
  --epochs                  8 --early_stopping --patience 2 \
  --batch_size              32 --eval_batch_size 64 \
  --learning_rate           1e-4 \
  --unfreeze_layers         '' \
  --encoder_lr_map          '' \
  --freeze_decision_head \
  --loss_weights            0.0,1.0,1.0 \
  --scheduler               cosine --warmup_ratio 0.05 \
  --seed                    42 \
  > logs/exp_t90_S7A_AuxHeads_v6b.log 2>&1 &

# S7B — unfreeze encoder L10–L11 (aux adapt), DS-G
nohup python scripts/fine_tune_only.py \
  --start_from              checkpoint \
  --load_from               output/checkpoints/exp_t90_S7A_AuxHeads_v6b/best_model_epoch_3.pt \
  --checkpoint_dir          output/checkpoints/exp_t90_S7B_L10-11_AuxAdapt_v6b \
  --model_name              bert-base-uncased \
  --experiment              exp_t90_S7B_L10-11_AuxAdapt_v6b \
  --tokenized_dir           data/tokenized_v6b_20260522 \
  --epochs                  3 \
  --batch_size              32 --eval_batch_size 64 \
  --learning_rate           5e-7 \
  --unfreeze_layers         10,11 \
  --encoder_lr_map          10:5e-7,11:5e-7 \
  --freeze_decision_head \
  --loss_weights            0.0,1.0,1.0 \
  --scheduler               cosine --warmup_ratio 0.05 \
  --seed                    42 \
  > logs/exp_t90_S7B_L10-11_AuxAdapt_v6b.log 2>&1 &

# S7C — unfreeze heads (calibration), DS-G
nohup python scripts/fine_tune_only.py \
  --start_from checkpoint \
  --load_from               output/checkpoints/exp_t90_S7A_AuxHeads_v6b/best_model_epoch_3.pt \
  --checkpoint_dir          output/checkpoints/exp_t90_S7C_HeadsOnly_v6b \
  --model_name              bert-base-uncased \
  --experiment              exp_t90_S7C_HeadsOnly_v6b \
  --tokenized_dir           data/tokenized_v6b_20260522 \
  --epochs                  3 \
  --batch_size              32 --eval_batch_size 64 \
  --learning_rate           5e-5 \
  --loss_weights            0.1,1.0,1.0 \
  --label_smoothing         0.05 \
  --decision_class_weights  1.0,1.0,1.2 \
  --freeze_heads            false \
  --scheduler               cosine --warmup_ratio 0.05 \
  --seed                    42 \
  > logs/exp_t90_S7C_HeadsOnly_v6b.log 2>&1 &
