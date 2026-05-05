# Output Schema

```json
{
  "decision": "TBD",
  "decision_confidence": 0.72,
  "reason_codes": [
    {"code": "VALUE_SECURITY", "label": "Security", "type": "human_value", "confidence": 0.81},
    {"code": "EMOTION_CONFUSION", "label": "confusion", "type": "emotion_sentiment", "confidence": 0.74}
  ]
}
```

Allowed primary decisions: YES, NO, TBD.
