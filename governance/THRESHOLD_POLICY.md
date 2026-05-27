# Threshold Policy

## Objective

Define how a deployment converts EvaluatorDPT probabilities into a governed YES, NO, or TBD routing decision.

## Policy-Separable Inference

```text
input
→ tokenizer
→ transformer encoder
→ decision logits
→ YES / NO / TBD probabilities
→ versioned threshold policy
→ routed YES / NO / TBD decision
→ audit log
```

The checkpoint supplies the probability distribution. The deployment policy supplies thresholds, fallback behavior, and escalation rules. This separation allows runtime operating behavior to change without retraining the model, while preserving auditability through policy versioning.

## Evidence Use

This repository includes calibrated-metric summaries and evaluation reports intended to support threshold selection and review. Threshold selection should be treated as deployment-specific policy, not as a universal setting.

## Routing Logic

1. Compute softmax probabilities over YES, NO, and TBD.
2. Apply the deployment's recorded thresholds and fallback rules.
3. Route low-confidence or low-margin cases to TBD when the policy requires conservative handling.
4. Log the model identifier, policy version, probabilities, final routed label, and fallback reason.

## Policy Principles

- Do not force YES or NO when evidence is insufficient under the deployment policy.
- Use TBD as governed deferral.
- Select thresholds using validation evidence and deployment risk tolerance.
- Recheck calibration and threshold behavior after domain transfer or fine-tuning.
- Preserve every deployed threshold policy as a versioned artifact.

## Evidence Summary (Evaluated Release: 2026-05-26)

- Validation ECE: 0.0338
- Test Macro F1: 0.8252
- Forced binary YES/NO without deferral: Macro F1=0.4945

These artifacts support threshold review but do not replace deployment-specific governance.
