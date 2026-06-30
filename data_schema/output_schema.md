# Output Schema

```json
{
  "model_id": "EvaluatorDPT-S12B",
  "policy_version": "deployment-policy-version",
  "decision_probabilities": {
    "route_a": 0.18,
    "route_b": 0.12,
    "defer": 0.70
  },
  "routed_decision": "defer",
  "fallback_reason": "defer selected by runtime policy",
  "auxiliary_signals": []
}
```

This public schema illustrates the required operational fields for a bounded routing deployment:

- model identifier
- runtime policy version
- decision probability distribution
- final routed decision
- fallback rationale when applicable
- optional validated auxiliary signals

Public documentation uses de-identified route labels here to emphasize the operational contract rather than a private internal label vocabulary.
