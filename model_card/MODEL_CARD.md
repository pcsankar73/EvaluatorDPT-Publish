# Model Card - EvaluatorDPT (Release: 2026-05-26)

## Model Identity

| Field | Value |
|---|---|
| Model name | EvaluatorDPT |
| Release date | 2026-05-26 |
| Model version | Boundary-refined release |
| Base model | `bert-base-uncased` |
| Max sequence length | 128 |
| Primary output type | Bounded decision distribution with governed routing support |
| Evaluation dataset | Fixed held-out validation and test splits |

## Purpose

EvaluatorDPT is an auditable operational decision model for governed AI workflows. Its purpose is to support bounded routing decisions in settings where automation must remain reviewable, policy-controlled, and deployment-governed.

The model is designed to expose uncertainty as an operationally usable output rather than collapsing every case into forced automation. Final routed behavior is determined by deployment policy, logging rules, and fallback procedures.

## Intended Use

Appropriate research and evaluation uses include:

- governed decision routing
- policy-aware workflow control
- deferral-aware triage
- compliance or moderation escalation
- human-in-the-loop review queues
- operational studies of bounded AI decision infrastructure

The model is not intended to act as a standalone authority. It should be deployed only with an explicit runtime policy, logging, and escalation path.

## Out-of-Scope Use

Do not use the model as a standalone decision authority for medical diagnosis, legal adjudication, emergency response, autonomous weapons, credit decisions, employment decisions, or other regulated decisions without an approved governance process and human oversight.

## Release-Specific Metrics

The following metrics describe the released evaluation setup. They are evidence for the public release, not the complete statement of the repository's scope or long-term research direction.

| Split | N | Accuracy | Macro F1 |
|---|---:|---:|---:|
| Validation | 44,404 | 0.8224 | 0.8213 |
| Test | 44,597 | 0.8260 | 0.8252 |

Decision-class F1 for the released evaluation setup:

| Class | F1 |
|---|---:|
| Positive route | 0.8314 |
| Negative route | 0.8486 |
| Deferral route | 0.7956 |

Additional evidence:

- Validation ECE: 0.0338
- Multi-seed validation stability: PASS, std=0.0 over seeds 42, 0, and 7
- Forced non-deferral view: Macro F1=0.4945
- Boundary-refined release improves calibration and high-confidence error behavior; it is not primarily a raw-F1 claim

## Auxiliary Outputs

The evaluated system includes auxiliary signal pathways that may support richer operational instrumentation. For the public release, only the validated bounded-decision behavior should be treated as a deployment claim. Auxiliary channels require separate validation before operational use.

## Deployment Pattern

The recommended deployment pattern is policy-separable:

1. The checkpoint emits a bounded decision distribution.
2. A versioned runtime policy applies thresholds, routing rules, and fallback behavior.
3. The final routed label and policy version are logged.
4. Deferred or low-confidence cases route to human review, additional evidence collection, or another governed fallback.

## Limitations

- Results are specific to the evaluated corpus and the released setup.
- New domains require separate validation, calibration review, threshold selection, and error audit.
- The model truncates inputs to 128 tokens.
- Deferral is a governed output, not a guarantee of correctness.
- Public evidence supports review; it does not replace deployment-specific governance.
