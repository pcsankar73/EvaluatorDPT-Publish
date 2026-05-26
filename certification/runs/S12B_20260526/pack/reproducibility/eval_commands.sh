#!/usr/bin/env bash
set -euo pipefail

# Post-stage diagnostics (produces confusion matrix, calibration bins, error buckets, etc.)
# Template from training SOP; adjust split/limit as needed.

# S7C best (epoch 2) — validation full set
nohup python scripts/post_stage_diagnostics.py \
  --checkpoint_dir output/checkpoints/exp_t90_S7C_HeadsOnly_v6b \
  --checkpoint     output/checkpoints/exp_t90_S7C_HeadsOnly_v6b/best_model_epoch_2.pt \
  --experiment     exp_t90_S7C_HeadsOnly_v6b \
  --tokenized_dir  data/tokenized_v6b_20260522 \
  --split validation --seed 42 \
  --output_dir reports/diagnostics/exp_t90_S7C_HeadsOnly_v6b_ep2 \
  > logs/diag_exp_t90_S7C_HeadsOnly_v6b_ep2.log 2>&1 &

# S7A diagnostic example (test subset 10k)
nohup python scripts/post_stage_diagnostics.py \
  --checkpoint_dir output/checkpoints/exp_t90_S7A_AuxHeads_v6b \
  --checkpoint     output/checkpoints/exp_t90_S7A_AuxHeads_v6b/best_model_epoch_3.pt \
  --experiment     exp_t90_S7A_AuxHeads_v6b \
  --tokenized_dir  data/tokenized_v6b_20260522 \
  --split test --limit 10000 --seed 42 \
  --output_dir reports/diagnostics/exp_t90_S7A_AuxHeads_v6b_ep3 \
  > logs/diag_exp_t90_S7A_AuxHeads_v6b_10k.log 2>&1 &

# Threshold policy sweep is tracked in `governance/THRESHOLD_POLICY.md` (certified v1.0 on DS-F).
