# Dataset Datasheet — DS-L

## Dataset Purpose

DS-L supports evaluation of auditable operational decision control with learned deferral. The primary labels are YES, NO, and TBD.

## Current Evaluation Splits

| Split | YES | NO | TBD | Total |
|---|---:|---:|---:|---:|
| Validation | 14,962 | 15,534 | 13,908 | 44,404 |
| Test | 14,883 | 15,650 | 14,064 | 44,597 |

## Training Scope

DS-L contains 418,725 training examples. S12B adds a 323-row boundary pack for one sharpening epoch. The validation and test splits remain fixed for S12 and S12B evaluation.

## Label Semantics

| Label | Meaning |
|---|---|
| YES | Sufficient evidence supports the affirmative decision or action |
| NO | Sufficient evidence supports rejection, blocking, or contradiction |
| TBD | Evidence is insufficient, ambiguous, modal, or not strong enough for direct action or direct rejection |

## Data Transparency

The dataset lineage uses public NLP sources and curated decision examples. Raw training data is not redistributed in this repository. Source datasets retain their original licenses and terms.

## Known Limitations

- Maximum sequence length is 128 tokens.
- The TBD boundary is semantically difficult because insufficient evidence can resemble support or contradiction at the surface level.
- Domain transfer requires separate validation and calibration review.
- Emotion-head evaluation is not claimed for S12B because the emotion head is masked in DS-L.
