# Robustness and Error Review

## Scope

This report summarizes robustness evidence available for S12B from the certification package. Dedicated external domain-transfer robustness suites are future work.

## Available Evidence

| Evidence | Result | Interpretation |
|---|---:|---|
| Full validation split | n=44,404 | Evaluates the fixed DS-L validation distribution |
| Full test split | n=44,597 | Evaluates the fixed DS-L test distribution |
| TBD qualitative audit | 7,758 errors / 44,597 | Residual errors concentrate around over-commit and false-deferral boundaries |
| High-confidence error comparison | 0.0558 → 0.0485 | S12B reduces high-confidence errors relative to S12 under paired comparison |
| Multi-seed validation stability | std=0.0 | Scoring procedure is stable under recorded seeds |

## Known Failure Modes

- True TBD routed as YES or NO when the text appears plausible but lacks sufficient evidence.
- NO or YES routed to TBD when the model is conservative around difficult semantic boundaries.
- Long inputs may be truncated at 128 tokens.
- Domain-transfer behavior is not established by the DS-L result.

## Required Deployment Review

Before use in a new domain, run domain-specific validation, calibration review, threshold selection, and representative error audit.
