# System Overview

This system performs multi-output prediction under ambiguity and production constraints.

## Inputs
Context-signal decision-event inputs tokenized to max sequence length 128.

## Outputs
1. Primary bounded output: YES, NO, TBD
2. Decision confidence
3. Structured reason codes with reason-code confidence scores

## Evaluation Summary (current publish candidate: S12B)
- Dataset/split: DS-L validation (n=44,404) and DS-L test (n=44,597)
- Validation decision metrics: Macro F1=0.8213, Accuracy=0.8224
- Test decision metrics: Macro F1=0.8252, Accuracy=0.8260
- Calibration (validation): ECE=0.0338
- Checkpoint: `exp_t90_S12B_boundarypack_ep1_fromS12ep3/best_model_epoch_1.pt` (see `experiments/S12B_20260526/`)

Notes:
- Emotion head is masked in the DS-L lineage; do not claim emotion performance for S12B.

## Latency (re-measure if needed)
- p50 latency: ~200 ms
- p95 latency: ~415 ms

This document intentionally provides a high-level description only.
