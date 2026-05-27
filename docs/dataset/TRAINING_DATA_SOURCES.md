# Training Data Sources

This document describes the source scope at publication level. Raw training data is not redistributed in this repository.

## Source Scope

The EvaluatorDPT lineage combines:

- Natural-language inference style examples for entailment, contradiction, and insufficient-evidence boundaries.
- Curated decision examples mapped to YES, NO, and TBD.
- Targeted boundary material for negation, role swaps, number changes, high lexical overlap contradictions, low-overlap support, long-context stress, and modal or hedged language.
- Auxiliary source families for value, sentiment, emotion, social-norm, and ethical context signals.

## Licensing

Public source datasets remain governed by their original licenses and terms. Users must verify those licenses before reusing source data. This publication repository provides documentation and evaluation artifacts, not raw dataset redistribution.

## Current Evaluation Dataset

The evaluated release uses fixed held-out validation and test splits:

| Split | Rows |
|---|---:|
| Validation | 44,404 |
| Test | 44,597 |

A 323-row targeted boundary refinement pack was used for one sharpening epoch. It is not a separate benchmark and is not used as the validation or test split.
