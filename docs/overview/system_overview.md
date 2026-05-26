# System Overview

EvaluatorDPT is an auditable operational decision-control system with learned deferral.

## Operational Interface

The model receives a decision-event context and emits a bounded decision distribution over:

- YES — sufficient support to proceed
- NO — sufficient support to reject or block
- TBD — insufficient evidence; route to governed deferral

A deployment policy applies versioned thresholds and fallback rules to this distribution. The final routed label is therefore policy-governed and auditable.

## Current Release Candidate

| Field | Value |
|---|---|
| Candidate | S12B |
| Run ID | `S12B_20260526` |
| Validation Macro F1 | 0.8213 |
| Test Macro F1 | 0.8252 |
| Validation ECE | 0.0338 |
| Validated output | YES / NO / TBD decision head |

## Audit Record

Each deployment decision should preserve model identifier, policy version, probabilities, final routed label, and fallback reason. Auxiliary channels may be recorded only when validated for the lineage.
