# Output Schema

```json
{
  "model_id": "EvaluatorDPT-S12B",
  "policy_version": "deployment-policy-version",
  "decision_probabilities": {
    "YES": 0.18,
    "NO": 0.12,
    "TBD": 0.70
  },
  "routed_decision": "TBD",
  "fallback_reason": "TBD probability selected by policy",
  "auxiliary_signals": []
}
```

Allowed routed decisions are `YES`, `NO`, and `TBD`.

Auxiliary signals should be included only when the corresponding auxiliary channel has been validated for the deployed lineage.
