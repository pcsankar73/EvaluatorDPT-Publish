# Robustness Report

## Objective

Validate model behavior under perturbation, ambiguity, and domain shift.

## Test Suites

### 1. Negation Robustness

Examples:
- not
- never
- cannot
- no longer
- unlikely
- failed to
- denied

Metrics:
- accuracy
- macro F1
- YES↔NO flip rate

### 2. Long-Text Robustness

Because max_length=128, measure:
- performance by token length bucket
- truncation failure rate
- long-text confusion matrix

### 3. Ambiguity Robustness

Evaluate borderline:
- weak entailment
- missing context
- conflicting claims
- modal statements

### 4. Paraphrase Robustness

Same semantic decision with varied wording.

### 5. OOD Validation

Test on unseen:
- domains
- styles
- vocabulary
- social-media text
- formal text

## Summary Table (status)

No dedicated robustness suites have been executed in the publish repo as of 2026-05-23.

| Suite | Macro F1 | Main Failure Mode | Status |
|---|---:|---|---|
| Negation | n/a | not yet measured | pending run |
| Long text | n/a | not yet measured | pending run |
| Ambiguity | n/a | not yet measured | pending run |
| OOD | n/a | not yet measured | pending run |

## How to run

Recommended starting point (experiment repo):
- Run post-stage diagnostics for the target checkpoint (produces length buckets + error buckets): `scripts/post_stage_diagnostics.py`
- Add dedicated perturbation suites after S7 series closes so results don’t churn.
