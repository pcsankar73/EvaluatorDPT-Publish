# Dataset Datasheet — Evaluated Decision Corpus (held-out splits)

## Dataset Purpose

This corpus supports evaluation of auditable operational decision control with learned deferral. The primary labels are YES, NO, and TBD.

## Current Evaluation Splits

| Split | YES | NO | TBD | Total |
|---|---:|---:|---:|---:|
| Validation | 14,962 | 15,534 | 13,908 | 44,404 |
| Test | 14,883 | 15,650 | 14,064 | 44,597 |

## Training Scope

The evaluated training corpus contains 418,725 training examples. A 323-row targeted boundary refinement pack was used for one additional sharpening epoch during the evaluated release process. The validation and test splits remain fixed.

## Label Semantics

| Label | Meaning |
|---|---|
| YES | Sufficient evidence supports the affirmative decision or action |
| NO | Sufficient evidence supports rejection, blocking, or contradiction |
| TBD | Evidence is insufficient, ambiguous, modal, or not strong enough for direct action or direct rejection |

## Data Transparency

The corpus lineage uses public NLP sources and curated decision examples. Raw training data is not redistributed in this repository. Source datasets retain their original licenses and terms.

## Known Limitations

- Maximum sequence length is 128 tokens.
- The TBD boundary is semantically difficult because insufficient evidence can resemble support or contradiction at the surface level.
- Domain transfer requires separate validation and calibration review.
- Emotion-head evaluation is not claimed for the evaluated release because the emotion head is disabled in this lineage.
