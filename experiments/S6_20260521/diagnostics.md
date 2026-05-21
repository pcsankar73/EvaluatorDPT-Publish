# Diagnostics — S6 (ABORTED)

## Decision Head Performance (Epoch 2 — best checkpoint)

| Class | Precision | Recall | F1     |
|-------|-----------|--------|--------|
| YES   | 0.8153    | 0.8325 | 0.8238 |
| NO    | 0.8687    | 0.8326 | 0.8503 |
| TBD   | 0.7798    | 0.7983 | 0.7890 |
| **Macro** | —    | —      | **0.8210** |

## Confusion Matrix (n=5,000, epoch 2)

|          | Pred YES | Pred NO | Pred TBD |
|----------|----------|---------|----------|
| True YES | 1418     | 95      | 172      |
| True NO  | 107      | 1512    | 142      |
| True TBD | 202      | 116     | 1236     |

## Aux Head Status

| Head    | Precision | Recall | Status            |
|---------|-----------|--------|-------------------|
| Emotion | 0.027     | 1.000  | All-positive collapse — UNCHANGED from S3A-v2 |
| Value   | 0.236     | 1.000  | All-positive collapse — UNCHANGED from S3A-v2 |

## Key Finding

Emotion P/R identical across epoch 1 and epoch 2 (0.027/1.000 both epochs).
The encoder-anchor design provides no gradient path to break the collapse because
the underlying data (NLI pairs) contains no genuine emotion signal.
This is a data problem, not an architecture or LR problem.
