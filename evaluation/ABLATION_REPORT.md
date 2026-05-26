# Ablation and Comparison Summary

## Purpose

This report summarizes the comparisons that are directly relevant to the S12B publication claim. The paper does not position S12B as a new abstention algorithm or a top-tier ML algorithmic novelty result. It positions S12B as an auditable operational decision-control checkpoint with learned deferral.

## Key Comparisons

| Comparison | Result | Interpretation |
|---|---:|---|
| Learned TBD, full coverage | Macro F1=0.8252 | Primary S12B decision result on DS-L test |
| Forced binary YES/NO, full coverage | Macro F1=0.4945 | Removing deferral collapses the TBD class |
| Confidence reject, 90% retained coverage | Macro F1=0.8631 | Retained-set result after abstaining on 10% |
| Entropy reject, 90% retained coverage | Macro F1=0.8624 | Similar retained-set behavior |
| Margin reject, 90% retained coverage | Macro F1=0.8625 | Similar retained-set behavior |
| S12 to S12B raw Macro F1 | 0.8254 → 0.8252 | Raw F1 is essentially flat |
| S12 to S12B high-confidence error @0.85 | 0.0558 → 0.0485 | Boundary pack improves high-confidence error behavior |

## Interpretation

The defensible claim is that learned deferral provides a full-coverage decision interface that preserves TBD as a routable outcome. Threshold rejection remains useful as an operating-policy layer, but retained-coverage scores are not direct replacements for the full-coverage learned-TBD result.

## Future Comparisons

Independent baselines such as separately trained selective classifiers, conformal wrappers, and domain-transfer evaluations are future work.
