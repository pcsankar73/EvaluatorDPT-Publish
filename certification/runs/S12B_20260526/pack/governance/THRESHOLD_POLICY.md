# Threshold Policy

## Objective

Define how a deployment converts EvaluatorDPT probabilities into a governed YES, NO, or TBD routing decision.

## Policy-Separable Inference

```text
input
→ tokenizer
→ BERT encoder
→ decision logits
→ YES / NO / TBD probabilities
→ versioned threshold policy
→ routed YES / NO / TBD decision
→ audit log
```

The checkpoint supplies the probability distribution. The deployment policy supplies thresholds, fallback behavior, and escalation rules. This separation allows runtime operating behavior to change without retraining the model, while preserving auditability through policy versioning.

## S12B Evidence

S12B threshold-sweep artifacts are included at:

`certification/runs/S12B_20260526/pack/artifacts/threshold_sweep_decision_20260526/`

The sweep evaluates threshold-governed routing with TBD fallback. It should be used as evidence for selecting an operating point, not as a universal deployment policy.

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

## Certification Evidence

S12B reports validation ECE=0.0338 and test Macro F1=0.8252 on DS-L. The certification pack also includes retained-coverage abstention baselines and S12/S12B paired comparison evidence. These artifacts support threshold review but do not replace deployment-specific governance.
