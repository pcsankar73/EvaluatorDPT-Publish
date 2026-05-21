# Diagnostics — S3B

Split: validation, n=5,000
Date: 2026-05-21

## Performance Summary

| Metric                        | Value  |
|-------------------------------|-------:|
| Macro F1                      | 0.8166 |
| YES F1                        | 0.8158 |
| NO F1                         | 0.8420 |
| TBD F1                        | 0.7920 |
| ECE                           | 0.0649 |
| Ambiguous zone (margin < 0.5) |   7.6% |

## Confusion Matrix (n=5,000)

|          | Pred YES | Pred NO | Pred TBD |
|----------|--------:|--------:|---------:|
| True YES |    1373 |     120 |      195 |
| True NO  |     122 |    1431 |      183 |
| True TBD |     183 |     112 |     1281 |
