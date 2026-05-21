# VEGD: Value-Emotion Governance Dataset

VEGD is a multi-head governance reasoning dataset designed for AI systems that need to interpret context through both motivational values and emotional signals, then produce a decision-oriented outcome.

The dataset is structured around the following core pattern:

```text
Context
  -> Value Vector Array (10)
  -> Emotion Vector Array (28)
  -> Decision Label (YES / NO / TBD)
```

VEGD is designed for evaluator models, policy-aware AI systems, moderation systems, agentic decision routing, robotics governance, and cognitive AI research.

---

## What the Dataset Contains

Each row contains:

| Field | Description |
|---|---|
| `context` | Natural language input or situation |
| `value_array` | 10-dimensional multi-label value vector |
| `emotion_array` | 28-dimensional multi-label emotion vector |
| `decision_label` | Final governance label: `YES`, `NO`, or `TBD` |
| `source_name` | Coarse provenance/source lineage |
| `confidence` | Optional confidence score |
| `rule_version` | Ontology/rule version used during dataset creation |

---

## Value Taxonomy

VEGD uses a 10-dimensional value ontology inspired by Schwartz value theory:

1. Self-Direction
2. Stimulation
3. Hedonism
4. Achievement
5. Power
6. Security
7. Conformity
8. Tradition
9. Benevolence
10. Universalism

Values represent latent motivational or governance orientations.

---

## Emotion Taxonomy

VEGD uses the 28 GoEmotions labels:

- admiration
- amusement
- anger
- annoyance
- approval
- caring
- confusion
- curiosity
- desire
- disappointment
- disapproval
- disgust
- embarrassment
- excitement
- fear
- gratitude
- grief
- joy
- love
- nervousness
- optimism
- pride
- realization
- relief
- remorse
- sadness
- surprise
- neutral

Emotions represent affective signals that influence decision polarity.

---

## Decision Labels

| Label | Meaning |
|---|---|
| `YES` | Constructive, acceptable, aligned, or permitted |
| `NO` | Harmful, unsafe, reject, or not aligned |
| `TBD` | Ambiguous, uncertain, conflicting, or context-dependent |

The `TBD` class is intentional. It preserves ambiguity instead of forcing all inputs into binary allow/reject categories.

---

## Why VEGD Is Different

Most public datasets model only one semantic layer:

| Dataset Type | Typical Output |
|---|---|
| Sentiment dataset | Positive / Negative / Neutral |
| Emotion dataset | Emotion labels |
| Toxicity dataset | Toxic / Non-toxic |
| Ethics dataset | Moral / Immoral |
| NLI dataset | Entailment / Contradiction / Neutral |

VEGD combines value vectors, emotion vectors, and governance decisions in a single structure.

This enables models to learn not only how text feels, but also what motivational signals are present and how those signals should influence a governance decision.

---

## Intended Uses

VEGD is intended for:

- AI safety evaluator training
- Agentic AI decision routing
- Policy-aware enterprise AI
- Contextual moderation
- Alignment research
- Robotics and embodied AI governance
- Cognitive AI and motivational-affective modeling

---

## Not Intended For

VEGD is not intended to be used as the sole authority for high-stakes decisions involving employment, credit, housing, healthcare, criminal justice, immigration, or legally protected rights. Systems trained on VEGD should be evaluated, audited, and deployed with human oversight where appropriate.

---

## Example Row

| context | values | emotions | decision |
|---|---|---|---|
| "I want to help my team succeed together." | Benevolence, Achievement | caring, optimism | YES |

---

## Recommended Model Shape

```text
BERT / Transformer Encoder(context)
   ├── value_head[10]
   ├── emotion_head[28]
   └── decision_head[3]
```

An advanced architecture may fuse the shared representation with predicted value and emotion logits before producing the final decision label.

---

## Strategic Positioning

VEGD is best understood as a governance reasoning dataset, not a basic sentiment dataset.

Its main contribution is the joint representation of:

```text
Context + Values + Emotions -> Governance Decision
```

This makes it useful as a foundation for evaluator products, policy-aware AI systems, and ambiguity-aware decision engines.

---

## Repository Structure (HF Publishing)

- `data/`: Parquet splits (recommended via Git LFS)
- `hf_dataset_loader.py`: Hugging Face `datasets` loader script
- `DATASET_CARD.md`, `ONTOLOGY.md`, `SCHEMA.md`: documentation set
- `configs/`, `scripts/`, `examples/`, `benchmarks/`: supporting materials

---

## Notes (Annotations-Only)

This VEGD publishing package is intended to be released as **annotations-only** (no upstream raw text redistribution by default). See `SCHEMA.md`, `SOURCES.md`, and `DATASET_CARD.md`.
