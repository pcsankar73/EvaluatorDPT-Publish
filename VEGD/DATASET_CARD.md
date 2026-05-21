# Dataset Card: VEGD

## Dataset Name

VEGD — Value-Emotion Governance Dataset

---

## Summary

VEGD is a structured dataset for training AI systems that infer values, emotions, and decision-oriented governance outcomes from natural language context.

Each example contains:

```text
value_array[10]
emotion_array[28]
decision_label
source_name (coarse provenance)
```

The dataset is designed to support multi-head models that jointly learn:

1. motivational/value structure,
2. affective/emotional structure,
3. final governance decision outcome.

---

## Motivation

Modern AI systems increasingly need more than sentiment classification or toxicity detection. Agentic systems, policy-aware systems, moderation pipelines, robotics, and enterprise AI evaluators require models that can reason about:

- what a context means,
- what emotional signals are present,
- what motivational values are activated,
- whether the situation should be accepted, rejected, or marked ambiguous.

VEGD is designed to support this need.

---

## License / Access

VEGD is released under a **research & non-commercial** license.

- Non-commercial research use: allowed
- Model training for research: allowed
- Commercial use: not allowed

See `LICENSE.md` for the binding terms.

---

## Sources / Provenance

VEGD is constructed from existing datasets and additional processing/label-mapping.

Upstream sources and license details should be listed in `SOURCES.md`.

---

## Distribution (Annotations-Only)

This release of VEGD is **annotations-only**:

- We do **not** redistribute upstream raw text by default.
- Each VEGD row includes coarse provenance (`source_name`, optional `source_config`) and VEGD labels/vectors.
- No per-record upstream identifiers are included in the default release.

This approach is used to respect upstream dataset and platform redistribution terms while allowing VEGD to be shared for **research and non-commercial** use.

---

## Dataset Objective

The objective of VEGD is to train models that map:

```text
Context -> Value Vector + Emotion Vector + Decision Label
```

The decision label is a 3-class governance output:

- `YES`
- `NO`
- `TBD`

The `TBD` class is a first-class label, not an error bucket. It captures ambiguity, conflict, uncertainty, and cases where a final decision requires additional context.

---

## Data Fields

| Field | Type | Description |
|---|---|---|
| `record_id` | string | Unique VEGD row identifier |
| `value_array` | float[10] or int[10] | Multi-label value vector |
| `emotion_array` | float[28] or int[28] | Multi-label emotion vector |
| `decision_label` | enum | `YES`, `NO`, or `TBD` |
| `source_name` | string | Source dataset or generation lineage (coarse) |
| `source_config` | string | Optional source subset/config (coarse) |
| `confidence` | float | Optional confidence score from labeling pipeline |
| `rule_version` | string | Ontology/rule version used |
| `split` | enum | `train`, `validation`, or `test` |
| `context_text_sha256` | string | Optional hash of upstream text (non-reversible) |

---

## Label Spaces

### Value Labels

| Index | Value |
|---:|---|
| 0 | Self-Direction |
| 1 | Stimulation |
| 2 | Hedonism |
| 3 | Achievement |
| 4 | Power |
| 5 | Security |
| 6 | Conformity |
| 7 | Tradition |
| 8 | Benevolence |
| 9 | Universalism |

### Emotion Labels

| Index | Emotion |
|---:|---|
| 0 | admiration |
| 1 | amusement |
| 2 | anger |
| 3 | annoyance |
| 4 | approval |
| 5 | caring |
| 6 | confusion |
| 7 | curiosity |
| 8 | desire |
| 9 | disappointment |
| 10 | disapproval |
| 11 | disgust |
| 12 | embarrassment |
| 13 | excitement |
| 14 | fear |
| 15 | gratitude |
| 16 | grief |
| 17 | joy |
| 18 | love |
| 19 | nervousness |
| 20 | optimism |
| 21 | pride |
| 22 | realization |
| 23 | relief |
| 24 | remorse |
| 25 | sadness |
| 26 | surprise |
| 27 | neutral |

### Decision Labels

| Label | Meaning |
|---|---|
| `YES` | Aligned, acceptable, constructive, safe, or permitted |
| `NO` | Not aligned, unsafe, harmful, reject, or blocked |
| `TBD` | Ambiguous, uncertain, incomplete, mixed, or context-dependent |

---

## Annotation and Labeling Philosophy

VEGD treats values and emotions as separate but interacting semantic layers.

Values describe motivational orientation. Emotions describe affective polarity and intensity. The decision label captures the governance outcome.

The dataset is based on this conceptual model:

```text
Value = latent orientation
Emotion = affective activator
Decision = emergent governance outcome
```

This allows the same value to produce different decision outcomes depending on emotional context and language context.

---

## Why This Is Not Common

Public datasets usually focus on one target at a time:

- sentiment,
- emotion,
- toxicity,
- hate speech,
- ethical acceptability,
- entailment,
- fact verification.

They typically do not jointly encode:

```text
context + value vectors + emotion vectors + decision outcome
```

VEGD is designed to fill that gap.

---

## Intended Users

| Audience | Use Case |
|---|---|
| AI safety teams | Governance/evaluator training |
| Agentic AI systems | Decision routing and action gating |
| Alignment research | Value-emotion interaction studies |
| Moderation systems | Contextual reasoning and ambiguity handling |
| Enterprise AI | Policy-aware evaluators |
| Robotics / embodied AI | Behavioral governance |
| Cognitive AI research | Latent motivational-affective modeling |

---

## Applications

VEGD can support:

- evaluator models,
- guardrail systems,
- action approval systems,
- conversational moderation,
- policy-aware enterprise AI,
- uncertainty-aware classification,
- robotics safety layers,
- ethical decision support,
- cognitive semantic modeling,
- value-emotion fusion research.

---

## Evaluation Recommendations

Models trained on VEGD should be evaluated with:

| Target | Metric |
|---|---|
| Decision label | Accuracy, macro F1, per-class F1 |
| TBD class | TBD recall, TBD precision |
| Value array | Micro/macro F1, per-value F1 |
| Emotion array | Micro/macro F1, per-emotion F1 |
| Robustness | Hard-negative tests |
| Calibration | Expected calibration error, confidence analysis |

The `TBD` class should be evaluated separately because it is central to ambiguity-aware governance.

---

## Limitations

VEGD should not be interpreted as a universal moral authority. It is a structured dataset for training and evaluating governance reasoning systems.

Known limitations may include:

- inherited bias from source datasets,
- cultural variation in value interpretation,
- ambiguity in decision labels,
- distribution shifts across domains,
- overfitting risk if labels are rule-generated too rigidly,
- the need for human review in sensitive deployments.

---

## Ethical Considerations

VEGD is intended to improve AI systems by making decision logic more interpretable and ambiguity-aware.

However, any system trained on VEGD should be carefully evaluated for:

- bias,
- false positives,
- false negatives,
- cultural assumptions,
- over-blocking,
- under-blocking,
- inappropriate deployment in high-stakes domains.

VEGD should be used as part of a broader safety and governance process, not as a standalone authority.

---

## Release Strategy

A recommended release structure is:

| Release Type | Contents |
|---|---|
| Public benchmark | Small representative subset |
| Research access | Larger controlled subset |
| Commercial/proprietary | Full dataset and ontology |
| Internal | Full pipeline, methodology, balancing, and calibration logic |

---

## Citation

If released publicly, cite as:

```text
VEGD: Value-Emotion Governance Dataset.
Simple Machine Mind.
```
