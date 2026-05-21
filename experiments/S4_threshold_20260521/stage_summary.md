# Stage Summary — S4 Threshold Sweep

## Experiment
S4_threshold_sweep_S3A_v2_ep3

## Purpose
Determine optimal per-class decision thresholds for the production checkpoint using independent threshold routing with both argmax and TBD fallback policies.

## Checkpoint
exp_t90_S3A_v2_L9-11_Hds_v6nli_F8196_ep8/best_model_epoch_3.pt

## Dataset
tokenized_v6_nli_20260520 (v6-nli-corrected), validation split, n=10,000

## Sweep Configuration

| Parameter       | Value                              |
|-----------------|------------------------------------|
| Routing rule    | Independent per-class threshold    |
| Grid steps      | 19 per class (0.1 → 0.9)           |
| Grid size       | 6,859 combinations per mode        |
| Fallback modes  | argmax and TBD (both evaluated)    |

## Results

| Mode            | YES thr | NO thr | TBD thr | Macro F1 | Δ baseline |
|-----------------|---------|--------|---------|----------|------------|
| Baseline argmax | 0.500   | 0.500  | 0.500   | 0.8209   | —          |
| Argmax fallback | 0.278   | 0.544  | 0.456   | 0.8227   | +0.0017    |
| TBD fallback    | 0.322   | 0.456  | 0.544   | 0.8222   | +0.0012    |

## Certified Policy

**TBD fallback** selected as the certified deployment policy.

Rationale: When no class clears its threshold the model is by definition uncertain.
Routing to TBD in that case is the governance-preferred behavior — it avoids forcing
a YES/NO decision on ambiguous samples. The F1 difference (+0.0012 vs +0.0017) is
negligible and the safety property justifies the choice.

## Decision

S4 complete. Policy locked in policy_definition.json.
Certified thresholds: YES=0.322, NO=0.456, TBD=0.544 (TBD fallback).
