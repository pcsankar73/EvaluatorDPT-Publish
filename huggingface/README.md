---
license: cc-by-nc-4.0
language: en
tags:
  - auditable-ai
  - decision-control
  - learned-deferral
  - governed-ai
  - policy-routing
  - trustworthy-ai
  - uncertainty-routing
  - transformers
metrics:
  - f1
  - accuracy
pipeline_tag: text-classification
inference: true
gated: true
extra_gated_prompt: "Access is provided for non-commercial research and evaluation use. Commercial use requires written approval from Simple Machine Mind."
extra_gated_fields:
  Organization: text
  Intended use:
    type: select
    options:
      - Research
      - Evaluation
      - Commercial evaluation
      - Other
  I agree to the access terms: checkbox
---

# EvaluatorDPT — Auditable Decision Models with Learned Abstention and Real-Time Steering

**Model ID:** `pcsankar73s/EvaluatorModel`  
**Author:** Sankaranarayanan Palamadai Chandrasekaran, Simple Machine Mind  
**License:** CC BY-NC 4.0 for non-commercial research and evaluation use  
**Access:** Gated model access

## Summary

EvaluatorDPT is a bounded operational decision-control model for AI workflows that need explicit, auditable handling of uncertainty. It emits a decision distribution over **YES**, **NO**, and **TBD**. TBD is a learned deferral outcome, not only a post-hoc rejection threshold.

The model is intended as a control layer between probabilistic model inference and downstream execution policy. A deployment domain supplies evidence, risk tolerance, and threshold policy; the model supplies a bounded distribution that can be governed at inference time through recorded thresholds, fallback rules, and review paths. This makes the model useful for auditable decision routing rather than free-form answer generation.

## Model Scope

| Field | Value |
|---|---|
| Base model | `bert-base-uncased` |
| Max sequence length | 128 |
| Primary output | YES / NO / TBD |
| Evaluated splits | Fixed held-out validation and test splits |
| Training data redistribution | Not included with this model |

## Evaluation Results

| Split | N | Accuracy | Macro F1 |
|---|---:|---:|---:|
| Validation | 44,404 | 0.8224 | 0.8213 |
| Test | 44,597 | 0.8260 | 0.8252 |

### Test Per-Class Performance

| Class | Precision | Recall | F1 | Support |
|---|---:|---:|---:|---:|
| YES | 0.8205 | 0.8425 | 0.8314 | 14,883 |
| NO | 0.8598 | 0.8376 | 0.8486 | 15,650 |
| TBD | 0.7955 | 0.7958 | 0.7956 | 14,064 |

### Additional Evidence

| Evidence | Result | Interpretation |
|---|---:|---|
| Validation ECE | 0.0338 | Confidence is suitable for threshold review under the evaluated validation split |
| Multi-seed validation stability | std=0.0 | Deterministic evaluation behavior under recorded seeds 42, 0, and 7 |
| Forced binary YES/NO view | Macro F1=0.4945 | Removing deferral collapses the TBD class |
| Targeted boundary refinement | HC error @0.85: 0.0558 → 0.0485 | Improves high-confidence error behavior more than raw F1 |


## Intended Use

EvaluatorDPT is intended for research and evaluation of auditable decision-routing systems, including:

- Policy-governed approval or rejection routing
- Compliance and risk triage
- Moderation escalation
- Enterprise workflow gating
- Human-in-the-loop review queues

The model should be used with a deployment-specific threshold policy. A deployment can route low-confidence or low-margin predictions to TBD without retraining the model.

## Outputs

| Output | Status | Description |
|---|---|---|
| Decision distribution | Validated | Probability distribution over YES, NO, and TBD |
| Decision confidence | Validated | Confidence used for threshold and fallback review |
| Value auxiliary channel | Architectural / staged validation | Decision-relative signal requiring separate validation before use as a deployment claim |
| Emotion/sentiment auxiliary channel | Disabled for the evaluated model version | No emotion-head performance claim is made |

Auxiliary channels are retained as part of the architecture because future validated versions can use them as policy-control signals. They should not be treated as validated outputs unless separately evaluated.

## Example Usage

```python
from transformers import AutoTokenizer, AutoModelForSequenceClassification
import torch

model_id = "pcsankar73s/EvaluatorModel"
tokenizer = AutoTokenizer.from_pretrained(model_id)
model = AutoModelForSequenceClassification.from_pretrained(model_id)

inputs = tokenizer(
    "The available evidence is incomplete, but the request may qualify for approval.",
    return_tensors="pt",
    max_length=128,
    truncation=True,
)

with torch.no_grad():
    logits = model(**inputs).logits
    probabilities = torch.softmax(logits, dim=-1)

# Label order must be read from the model config before deployment.
# Apply a recorded threshold policy outside the model to produce the routed label.
```

## Limitations

- Results are specific to the evaluated corpus and setup.
- The interface is domain-agnostic, but performance is not a domain-transfer claim.
- New domains require calibration review, threshold selection, policy-version review, and error audit.
- Inputs longer than 128 tokens require chunking or preprocessing.
- TBD is a governed deferral output, not a substitute for human or policy review.
- Auxiliary value and emotion/sentiment claims require separate validation before deployment use.

## Data and Licensing

The training data is not redistributed with this model. The evaluated corpus is built primarily from public natural-language inference and stance-style source families together with targeted hard-case construction. Public source datasets remain subject to their original licenses and terms. Users must verify source-data licensing before reuse.

## Links

- Publication repository: <https://github.com/pcsankar73/EvaluatorDPT-Publish>
- OSF preprint: <https://osf.io/ztnya/>
- Contact: sankar@smsquared.ai
