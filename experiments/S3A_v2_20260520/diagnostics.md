# Diagnostics — S3A-v2

Split: validation, n=10,000
Date: 2026-05-20

## Performance Summary

| Metric                        | Value  |
|-------------------------------|-------:|
| Macro F1                      | 0.8209 |
| YES F1                        | 0.8218 |
| NO F1                         | 0.8458 |
| TBD F1                        | 0.7952 |
| ECE                           | 0.0620 |
| Ambiguous zone (margin < 0.5) |   7.2% |

## Confusion Matrix (n=5,000)

|          | Pred YES | Pred NO | Pred TBD |
|----------|--------:|--------:|---------:|
| True YES |    1421 |      87 |      177 |
| True NO  |     105 |    1503 |      153 |
| True TBD |     200 |     107 |     1247 |
