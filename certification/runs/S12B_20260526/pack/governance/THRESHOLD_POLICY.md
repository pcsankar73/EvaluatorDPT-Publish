# Threshold Policy

## Objective

Define the production decision policy applied after model probability generation.

## Inference Pipeline

```text
input
→ tokenizer
→ BERT encoder
→ decision logits
→ probabilities
→ threshold policy
→ final YES/NO/TBD label
```

## Certified Policy — v1.0 (2026-05-21)

| Parameter       | Value                                           |
|-----------------|-------------------------------------------------|
| Policy version  | 1.0                                             |
| Policy date     | 2026-05-21                                      |
| Checkpoint      | exp_t90_S3A_v2_L9-11_Hds_v6nli_F8196_ep8 ep3   |
| Dataset         | v6-nli-corrected (tokenized_v6_nli_20260520)    |
| Routing rule    | Independent per-class threshold                 |
| Fallback mode   | TBD                                             |

### Thresholds

```json
{
  "YES": 0.3222,
  "NO":  0.4556,
  "TBD": 0.5444,
  "fallback_mode": "tbd",
  "routing_rule": "independent_per_class_threshold"
}
```

### Routing Logic

1. Compute softmax probabilities over YES / NO / TBD.
2. For each class, check if `prob >= threshold`.
3. If exactly one class clears its threshold → predict that class.
4. If multiple classes clear their thresholds → predict the highest-probability qualifying class.
5. If no class clears its threshold → predict **TBD** (governed deferral).

### Validation Results

| Mode            | YES thr | NO thr | TBD thr | Macro F1 | Δ baseline |
|-----------------|---------|--------|---------|----------|------------|
| Baseline argmax | 0.500   | 0.500  | 0.500   | 0.8209   | —          |
| Argmax fallback | 0.278   | 0.544  | 0.456   | 0.8227   | +0.0017    |
| **TBD fallback**| **0.322** | **0.456** | **0.544** | **0.8222** | **+0.0012** |

Evaluated on validation split, n=10,000. Sweep: 19-step grid, 6,859 combinations per mode.

## Policy Principles

- Do not force YES/NO when confidence is insufficient.
- Route uncertain or low-margin cases to TBD.
- Use TBD as governed deferral, not model failure.
- TBD fallback preferred over argmax fallback for deployment: avoids forced decisions on ambiguous samples even at marginal F1 cost.

## Validation

Thresholds selected on validation split. Must be confirmed once on test split before final deployment.

## Artifact Reference

Full sweep data: `experiments/S4_threshold_20260521/threshold_sweep_results.csv`
Policy definition: `experiments/S4_threshold_20260521/policy_definition.json`
