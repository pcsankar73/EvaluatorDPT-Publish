# Ablation and Comparison Summary

## Purpose

This report summarizes comparisons that are directly relevant to the publication claim. The paper does not position the evaluated release as a new abstention algorithm. It positions the evaluated release as an auditable operational decision-control checkpoint with learned deferral.

## Key Comparisons

| Comparison | Result | Interpretation |
|---|---:|---|
| Learned TBD, full coverage | Macro F1=0.8252 | Primary full-coverage decision result on the held-out test split |
| Forced binary YES/NO, full coverage | Macro F1=0.4945 | Removing deferral collapses performance under ambiguity |
| Confidence reject, 90% retained coverage | Macro F1=0.8631 | Retained-set result after abstaining on 10% |
| Entropy reject, 90% retained coverage | Macro F1=0.8624 | Similar retained-set behavior |
| Margin reject, 90% retained coverage | Macro F1=0.8625 | Similar retained-set behavior |
| Baseline vs evaluated release (raw Macro F1) | 0.8254 → 0.8252 | Raw F1 is essentially flat |
| Baseline vs evaluated release (HC error @0.85) | 0.0558 → 0.0485 | Boundary refinement improves high-confidence error behavior |

## Interpretation

The defensible claim is that learned deferral provides a full-coverage decision interface that preserves TBD as a routable outcome. Threshold rejection remains useful as an operating-policy layer, but retained-coverage scores are not direct replacements for the full-coverage learned-TBD result.

## Future Comparisons

Independently trained selective classifiers, conformal wrappers, and external domain-transfer evaluations are future work.
