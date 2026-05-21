# VEGD Schema (Annotations-Only Release)

## Overview

This document defines the publishable schema for VEGD as an **annotations-only** dataset, following common industry practice:

- store **coarse provenance** (enough to describe what sources contributed, but not per-record IDs),
- store a **content hash** for join/verification,
- store your **annotations** and **annotation provenance** (versioning).

VEGD does **not** redistribute upstream raw text by default. Instead, each row contains:
- coarse source provenance (`source_name`, optional `source_config`)
- VEGD annotations (`decision_label`, `value_array`, `emotion_array`, etc.)

The core row format is:

```text
source_name, source_config, value_array[10], emotion_array[28], decision_label
```

---

## Canonical Columns

| Column | Type | Required | Description |
|---|---|---:|---|
| `record_id` | string | Yes | Unique identifier for each VEGD row |
| `source_name` | string | Yes | Upstream dataset name (HF dataset name or canonical project name) |
| `source_config` | string | No | Upstream dataset configuration/subset (e.g., `go_emotions/simplified`, `tweet_eval/sentiment`) |
| `value_array` | array[10] | Yes | 10-dimensional multi-label value vector |
| `emotion_array` | array[28] | Yes | 28-dimensional multi-label emotion vector |
| `decision_label` | enum | Yes | `YES`, `NO`, or `TBD` |
| `confidence` | float | No | Label confidence from pipeline |
| `rule_version` | string | Yes | Ontology or rule version |
| `split` | enum | Yes | `train`, `validation`, or `test` |
| `context_text_sha256` | string | No | Hash of upstream text to support join/verification without redistributing text |
| `source_ref` | string | No | Optional high-level reference (e.g., paper URL), not a per-record pointer |

---

## Value Array

The `value_array` field has length 10.

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

Allowed formats:

```json
[1,0,0,1,0,0,0,0,1,0]
```

or probability values:

```json
[0.88,0.04,0.02,0.71,0.01,0.10,0.03,0.02,0.66,0.22]
```

---

## Emotion Array

The `emotion_array` field has length 28.

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

Allowed formats:

```json
[0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0]
```

or probability values:

```json
[0.05,0.01,0.02,0.02,0.79,0.81,0.03,0.10,0.02,0.02,0.03,0.01,0.01,0.05,0.03,0.66,0.01,0.08,0.04,0.02,0.72,0.03,0.06,0.10,0.01,0.02,0.04,0.01]
```

---

## Notes on `context_text`

`context_text` is intentionally **not** part of the publishable schema for VEGD’s default release.
If you later choose to publish a hybrid release with redistributable text for a subset of sources,
add a separate column (e.g., `context_text`) and clearly mark per-source redistribution terms in `SOURCES.md`.

## Decision Label

Allowed labels:

```text
YES
NO
TBD
```

| Label | Meaning |
|---|---|
| `YES` | Accept, aligned, constructive, permitted |
| `NO` | Reject, unsafe, harmful, not aligned |
| `TBD` | Ambiguous, insufficient, context-dependent, mixed |

---

## Recommended File Formats

Recommended storage formats:

| Format | Use |
|---|---|
| Parquet | Training and production pipelines |
| JSONL | Interchange and inspection |
| CSV | Lightweight preview only |

For arrays in CSV, store arrays as JSON-encoded strings.

---

## JSONL Example

```json
{
  "record_id": "vegd_000001",
  "source_name": "synthetic_example",
  "source_config": "",
  "value_array": [0,0,0,1,0,0,0,0,1,0],
  "emotion_array": [0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0],
  "decision_label": "YES",
  "confidence": 0.94,
  "rule_version": "VEGD-Ontology-v2",
  "split": "train",
  "context_text_sha256": "0f5d7c..."
}
```

---

## CSV Example

```csv
record_id,source_name,source_config,value_array,emotion_array,decision_label,confidence,rule_version,split,context_text_sha256
vegd_000001,synthetic_example,,"[0,0,0,1,0,0,0,0,1,0]","[0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0]",YES,0.94,VEGD-Ontology-v2,train,0f5d7c...
```

---

## Dataset Split Recommendation

Recommended split:

| Split | Percentage |
|---|---:|
| Train | 80% |
| Validation | 10% |
| Test | 10% |

The test split should preserve class balance across:

- decision labels,
- value labels,
- emotion labels,
- source datasets.

---

## Quality Checks

Before release, validate:

| Check | Purpose |
|---|---|
| value array length = 10 | Prevent schema mismatch |
| emotion array length = 28 | Prevent schema mismatch |
| decision label in allowed set | Prevent invalid labels |
| no empty context | Data integrity |
| source dataset populated | Provenance tracking |
| split populated | Training reproducibility |
| class distribution reviewed | Avoid decision imbalance |
| per-label support reviewed | Avoid dead labels |

---

## Recommended Metrics

| Output | Metric |
|---|---|
| Decision label | Accuracy, macro F1, per-class F1 |
| Value array | Micro F1, macro F1, per-label F1 |
| Emotion array | Micro F1, macro F1, per-label F1 |
| TBD label | Precision, recall, confusion matrix |
| Calibration | Confidence calibration and reliability curves |
