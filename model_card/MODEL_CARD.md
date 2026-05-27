# Model Card — EvaluatorDPT (Release: 2026-05-26)

## Model Identity

| Field | Value |
|---|---|
| Model name | EvaluatorDPT |
| Release date | 2026-05-26 |
| Model version | Boundary-refined release |
| Base model | `bert-base-uncased` |
| Max sequence length | 128 |
| Primary output | YES / NO / TBD |
| Evaluation dataset | Fixed held-out validation and test splits |

## Purpose

EvaluatorDPT is an auditable operational decision-control model. It is designed to expose uncertainty as a routable output rather than forcing every input into YES or NO. The model produces a bounded decision distribution, and deployment policy applies recorded thresholds and fallback rules to produce the final routed decision.

## Intended Use

Appropriate research and evaluation uses include:

- governed decision routing
- policy-aware AI workflow control
- deferral-aware triage
- compliance or moderation escalation
- human-in-the-loop review queues

The model is not intended to act as a standalone authority. It should be deployed only with an explicit threshold policy, logging, and escalation path.

## Out-of-Scope Use

Do not use the model as a standalone decision authority for medical diagnosis, legal adjudication, emergency response, autonomous weapons, credit decisions, employment decisions, or other regulated decisions without an approved governance process and human oversight.

## Validated Metrics

| Split | N | Accuracy | Macro F1 |
|---|---:|---:|---:|
| Validation | 44,404 | 0.8224 | 0.8213 |
| Test | 44,597 | 0.8260 | 0.8252 |

Test per-class F1:

| Class | F1 |
|---|---:|
| YES | 0.8314 |
| NO | 0.8486 |
| TBD | 0.7956 |

Additional evidence:

- Validation ECE: 0.0338
- Multi-seed validation stability: PASS, std=0.0 over seeds 42, 0, and 7
- Forced binary YES/NO without deferral: Macro F1=0.4945
- S12B boundary-pack pass: improves calibration and high-confidence error behavior; it is not a material raw-F1 improvement over S12

## Auxiliary Outputs

The architecture includes value and emotion/sentiment auxiliary heads. For the evaluated model version, the emotion head is masked during evaluation, so no emotion-head performance claim is made. Auxiliary channels should be treated as architectural signals requiring separate validation before they are used as deployment claims or policy controls.

## Threshold Policy

The recommended deployment pattern is policy-separable:

1. The checkpoint emits YES / NO / TBD probabilities.
2. A versioned threshold policy applies routing thresholds and fallback rules.
3. The final routed label and policy version are logged.
4. Deferred cases route to human review, additional evidence collection, or another governed fallback.


## Limitations

- Results are specific to the evaluated corpus and the S12B setup.
- New domains require separate validation, calibration review, threshold selection, and error audit.
- The model truncates inputs to 128 tokens.
- TBD is a policy-governed deferral output, not a guarantee of correctness.
- The certification evidence supports review; it does not remove the need for deployment-specific governance.
