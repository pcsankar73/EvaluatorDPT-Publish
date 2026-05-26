---
license: cc-by-nc-4.0
language: en
tags:
  - decision-making
  - auditable-ai
  - bounded-decisions
  - multi-task
  - transformers
  - explainability
  - confidence-scoring
  - human-values
  - sentiment-analysis
metrics:
  - f1
  - accuracy
pipeline_tag: text-classification
inference: true
gated: true
extra_gated_prompt: "Access is provided for research and evaluation use only. Redistribution, commercial use, or publication of model weights is not permitted without written approval from Simple Machine Mind."
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

# Evaluator v2 — Auditable AI Decision System (EvaluatorDPT)

**Model ID:** `pcsankar73s/EvaluatorModel`
**License:** CC BY-NC 4.0 (non-commercial; approval required for inference)
**Access:** 🔒 Gated — visible to all, usable only with explicit approval
**Author:** Sankaranarayanan Palamadai Chandrasekaran · [Simple Machine Mind](https://www.smsquared.ai)

---

## Overview

Most AI systems are built to always give an answer — even when they shouldn't. EvaluatorDPT is built differently: it reads structured signals, doesn't generate text, and produces a bounded decision of **YES**, **NO**, or **defer to a human**. Because it is signal-based and deterministic, it doesn't hallucinate. When it flags a case as uncertain, it is right to do so **93% of the time** (TBD precision: 0.9306). The deferral threshold is tunable at deployment — teams can steer decisions toward their risk tolerance or business objective without retraining the underlying model.

EvaluatorDPT is a BERT-based multi-task model for **auditable decision control under ambiguity**. It produces a bounded three-class decision (YES / NO / TBD) alongside structured auxiliary outputs that remain available at inference time as explainability signals and control variables.

Unlike conventional classifiers that force a binary output regardless of evidence quality, EvaluatorDPT treats **TBD (defer)** as a trained first-class outcome — enabling uncertain cases to be routed to conservative handling without retraining the core model.

The model predicts:
- **Decision** — YES / NO / TBD (defer)
- **Auxiliary Head 1** — Detects sentiment turbulence: emotional noise affecting decision clarity (28 labels)
- **Auxiliary Head 2** — Captures semantic value signals: ethical anchors such as fairness or caution (10 labels)

Auxiliary outputs are **retained at inference time** as structured control variables for downstream steering, thresholding, and reason-code generation.

Input/output contract: a context signal is mapped to a bounded decision, decision confidence, structured reason codes, and reason-code confidence scores.

---

## Architecture

**Backbone:** `bert-base-uncased` (12-layer Transformer)

**Heads:**
- `decision` — primary 3-class classifier (YES / NO / TBD) with confidence score
- `auxiliary_head_1` — multi-label signal layer for sentiment turbulence (28 labels)
- `auxiliary_head_2` — multi-label signal layer for value alignment (10 labels)

All inputs are tokenized to a maximum sequence length of 128 tokens.

**Training recipe:** Gradual unfreeze → full unfreeze · LR = 1e-5 · Batch size = 32 · Early stopping (patience = 2) · Threshold sweep · Layer-wise differential learning rates · Cosine decay with warmup ratio 0.1 · Class weights on decision head for imbalance handling

---

## Performance

Latest publish candidate: **S12B** (`exp_t90_S12B_boundarypack_ep1_fromS12ep3`, DS-L + boundary pack).

Evaluation (DS-L):
- Validation split (n=44,404): Accuracy **0.8224**, Macro F1 **0.8213**
- Test split (n=44,597): Accuracy **0.8260**, Macro F1 **0.8252**

**Per-class breakdown (test):**

| Class | Precision | Recall | F1 | Support |
|---|---:|---:|---:|---:|
| YES | 0.8205 | 0.8425 | 0.8314 | 14,883 |
| NO | 0.8598 | 0.8376 | 0.8486 | 15,650 |
| TBD | 0.7955 | 0.7958 | 0.7956 | 14,064 |

Notes:
- Emotion head is **masked** in DS-L lineage (0 valid samples after mask), so emotion metrics are intentionally skipped for this publish candidate.
- Decision threshold sweep artifacts (TBD-fallback) are stored for auditability: `experiments/S12B_20260526/certification/threshold_sweep_decision_20260526/`.

## Data Processing Modules

| Included for Further Progress | Cited (for Reference / Citation) |
|---|---|
| process_semeval2017_local | process_sentiment140 |
| process_financial_phrasebank | process_imdb |
| process_tweeteval | process_multinli |
| process_goemotions | process_tweeteval_health |
| process_normbank_csv_concatenated | |
| process_mft_from_json | |
| process_meld | |
| process_empathetic_dialogues | |
| process_social_bias_frames | |
| process_ethics_local | |
| process_ethics_virtue | |

---

## Use Cases

**Decision gating under ambiguity** — route inputs to YES, NO, or deferred handling based on evidence quality without forcing a binary commit.

**Auditable AI workflows** — every decision ships with a confidence score, value alignment signal, and sentiment turbulence signal that downstream systems can log, inspect, and act on.

**Risk-sensitive deployments** — use TBD precision (0.9306) and confidence scores to calibrate the YES execution threshold for deployment-specific risk tolerance without retraining.

**Reason-code generation** — auxiliary outputs provide structured context for human-readable explanations alongside each decision.

---

## Example Usage

```python
from transformers import AutoTokenizer, AutoModelForSequenceClassification

tokenizer = AutoTokenizer.from_pretrained("pcsankar73s/EvaluatorModel")
model = AutoModelForSequenceClassification.from_pretrained("pcsankar73s/EvaluatorModel")

inputs = tokenizer(
    "Should we proceed given the current context?",
    return_tensors="pt",
    max_length=128,
    truncation=True,
)
outputs = model(**inputs)
# outputs.logits → decision probabilities (YES / NO / TBD)
# confidence score derived from softmax of decision logits
```

---

## Limitations

- Results are specific to the training distribution; generalization to other domains requires separate validation.
- Class imbalance in the NO class (13.9% of test split) limits NO performance; targeted sampling may improve this.
- Inputs exceeding 128 tokens are truncated; longer documents require chunking or preprocessing.
- Reported latency is hardware-dependent; re-characterize for your inference environment.
- Auxiliary heads provide structured signals, not ground-truth classifiers for values or emotions.

---

## Links

- GitHub: [pcsankar73/EvaluatorDPT-Publish](https://github.com/pcsankar73/EvaluatorDPT-Publish)
- OSF preprint: [https://osf.io/ztnya/](https://osf.io/ztnya/)
- Paper (arXiv): TBD
- Contact: sankar@smsquared.ai

---

## License

Model artifacts: [CC BY-NC 4.0](https://creativecommons.org/licenses/by-nc/4.0/) — non-commercial use; contact for commercial licensing.
Code and documentation: see repository [LICENSE](https://github.com/pcsankar73/EvaluatorDPT-Publish/blob/main/LICENSE).

---
