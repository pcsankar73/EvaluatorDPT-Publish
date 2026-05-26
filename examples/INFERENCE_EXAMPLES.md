# Inference Examples

## Purpose

Provide representative model inputs and outputs for reviewers.

## Example Format

```json
{
  "input": "premise [SEP] hypothesis",
  "probabilities": {
    "YES": 0.0,
    "NO": 0.0,
    "TBD": 0.0
  },
  "final_decision": "TBD",
  "threshold_policy_version": "1.0",
  "values": [],
  "emotions": []
}
```

## Required Examples

- clear YES
- clear NO
- clear TBD
- soft entailment
- contradiction
- negation
- long-text case
- threshold-routed TBD

