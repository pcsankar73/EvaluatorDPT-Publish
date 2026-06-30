# Threshold Policy

## Objective

Define how a deployment converts EvaluatorDPT output distributions into governed routing decisions.

## Policy-Separable Inference

```text
input
-> tokenizer
-> transformer encoder
-> decision logits
-> bounded decision distribution
-> versioned runtime policy
-> routed operational decision
-> audit log
```

The checkpoint supplies the decision distribution. The deployment policy supplies thresholds, fallback behavior, escalation rules, and route handling. This separation allows runtime operating behavior to change without retraining the checkpoint while preserving auditability through policy versioning.

## Evidence Use

This repository includes calibrated-metric summaries and evaluation reports intended to support policy review and threshold selection. Threshold selection should be treated as deployment-specific policy, not as a universal setting.

## Routing Logic

1. Compute output probabilities for the bounded decision space.
2. Apply the deployment's recorded thresholds and fallback rules.
3. Route low-confidence or low-margin cases to deferral or escalation when the policy requires conservative handling.
4. Log the model identifier, policy version, probabilities, final routed label, and fallback reason.

## Policy Principles

- Do not force high-automation routing when evidence is insufficient under the deployment policy.
- Preserve an explicit governed deferral path.
- Select thresholds using validation evidence and deployment risk tolerance.
- Recheck calibration and threshold behavior after domain transfer or fine-tuning.
- Preserve every deployed runtime policy as a versioned artifact.

## Evidence Summary (Evaluated Release: 2026-05-26)

- Validation ECE: 0.0338
- Test Macro F1: 0.8252
- Forced non-deferral view: Macro F1=0.4945

These artifacts support deployment review but do not replace deployment-specific governance.
