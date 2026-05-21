# VEGD Ontology

## Overview

The VEGD ontology defines the semantic structure behind the Value-Emotion Governance Dataset.

It connects three layers:

```text
Context
  -> Values
  -> Emotions
  -> Governance Decision
```

The ontology is designed for models that need to infer both motivational and affective signals before making a decision-oriented classification.

---

## Core Principle

VEGD separates three concepts that are often collapsed in ordinary datasets:

| Concept | Meaning |
|---|---|
| Value | Motivational or governance orientation |
| Emotion | Affective signal |
| Decision | Governance outcome |

The decision is not assumed to be identical to sentiment or emotion. It is the outcome of context, value signals, and emotional signals.

---

## Value Ontology

VEGD uses 10 value dimensions.

| Index | Value | Description |
|---:|---|---|
| 0 | Self-Direction | Independent thought, creativity, freedom, autonomy |
| 1 | Stimulation | Novelty, challenge, excitement, exploration |
| 2 | Hedonism | Pleasure, enjoyment, gratification |
| 3 | Achievement | Competence, success, ambition, accomplishment |
| 4 | Power | Status, dominance, influence, control |
| 5 | Security | Safety, stability, order, protection |
| 6 | Conformity | Rule-following, restraint, obedience, social discipline |
| 7 | Tradition | Respect for customs, continuity, humility, inherited norms |
| 8 | Benevolence | Care for close others, honesty, loyalty, support |
| 9 | Universalism | Fairness, equality, tolerance, broad social concern |

---

## Value Base Affinity

VEGD treats value affinity as a prior, not a final decision.

| Value | Base Affinity |
|---|---|
| Self-Direction | Positive |
| Stimulation | Positive |
| Hedonism | Positive |
| Achievement | Positive |
| Power | Negative |
| Security | Negative |
| Conformity | Negative |
| Tradition | Negative |
| Benevolence | Neutral |
| Universalism | Neutral |

Benevolence and Universalism are treated as neutral because they are ethical orientations rather than direct sentiment states. They can be guided positive, negative, or ambiguous by context and emotion.

---

## Emotion Ontology

VEGD uses 28 GoEmotions labels.

| Index | Emotion | Feeling Polarity |
|---:|---|---|
| 0 | admiration | Positive |
| 1 | amusement | Positive |
| 2 | anger | Negative |
| 3 | annoyance | Negative |
| 4 | approval | Positive |
| 5 | caring | Positive |
| 6 | confusion | Neutral |
| 7 | curiosity | Positive |
| 8 | desire | Positive |
| 9 | disappointment | Negative |
| 10 | disapproval | Negative |
| 11 | disgust | Negative |
| 12 | embarrassment | Negative |
| 13 | excitement | Positive |
| 14 | fear | Negative |
| 15 | gratitude | Positive |
| 16 | grief | Negative |
| 17 | joy | Positive |
| 18 | love | Positive |
| 19 | nervousness | Negative |
| 20 | optimism | Positive |
| 21 | pride | Positive |
| 22 | realization | Neutral |
| 23 | relief | Positive |
| 24 | remorse | Negative |
| 25 | sadness | Negative |
| 26 | surprise | Positive |
| 27 | neutral | Neutral |

---

## Decision Ontology

The decision head uses three labels.

| Label | Meaning |
|---|---|
| YES | Constructive, acceptable, aligned, safe, or permitted |
| NO | Harmful, unsafe, not aligned, reject, or blocked |
| TBD | Ambiguous, incomplete, uncertain, conflicting, or context-dependent |

---

## Emotional Signatures by Value

| Value | Primary Emotional Signature | Base Governance Tendency |
|---|---|---|
| Self-Direction | curiosity + optimism | Positive |
| Stimulation | excitement + surprise | Positive |
| Hedonism | joy + desire | Positive |
| Achievement | pride + admiration | Positive |
| Power | pride + desire + anger | Negative |
| Security | relief + fear | Negative |
| Conformity | fear + embarrassment | Negative |
| Tradition | gratitude + sadness | Negative |
| Benevolence | caring + love | Neutral |
| Universalism | caring + optimism | Neutral |

---

## Why Benevolence and Universalism Are Neutral

Benevolence and Universalism are not treated as automatically positive because they describe the target and scope of concern, not the final emotional or governance outcome.

| Value | Scope |
|---|---|
| Benevolence | Close others, family, friends, team, local group |
| Universalism | All people, society, humanity, nature, broad fairness |

Both can be constructive, ambiguous, or harmful depending on context.

Examples:

| Value | Emotion | Possible Decision |
|---|---|---|
| Benevolence | love | YES |
| Benevolence | fear | TBD |
| Benevolence | anger | NO |
| Universalism | optimism | YES |
| Universalism | sadness | TBD |
| Universalism | disgust | NO |

---

## Multi-Label Nature

VEGD assumes context can activate multiple values and multiple emotions at once.

This means the true decision space is not limited to 10 x 28 individual pairs.

The model receives:

```text
value_array[10] + emotion_array[28]
```

This creates a 38-dimensional multi-label signal space.

The model should learn patterns across the full vector combination rather than relying on hand-enumerated rules.

---

## Role of Pairwise Value-Emotion Tables

A 10 x 28 value-emotion table can be used as a seed ontology, validation guide, or explainability layer.

It should not be treated as the full decision space.

The production model should learn:

```text
Context + Value Vector + Emotion Vector -> Decision
```

rather than manually enumerating every possible vector combination.

---

## Ontology Version

Current ontology version:

```text
VEGD-Ontology-v1
```
