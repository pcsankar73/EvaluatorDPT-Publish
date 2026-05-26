# Objective "90 Score" - Spec + Next Steps

This document defines what "90 score" means, captures the current publish baseline, and lists the analyses + concrete next steps to run in the dev-run repo (where training/eval happens).

## 1) Objective definition (must be pinned before any model work)

We do not start model changes until these are fixed and written down:

1. Metric target (pick exactly one primary):
   - `macro_f1 >= 0.90` (recommended primary because TBD is majority class)
   - OR `accuracy >= 0.90`
   - OR `weighted_f1 >= 0.90`

2. Evaluation scope (pin the exact dataset/split):
   - Dataset name + version/hash
   - Split definition (train/dev/test) + fixed random seed
   - Any filtering / de-dup rules applied

3. Operating policy constraints (production realism):
   - Max acceptable TBD rate (human-review load) = `_____`
   - Minimum acceptable YES precision = `_____`
   - Minimum acceptable NO recall = `_____`
   - Latency guardrail (p50/p95) = `_____`

4. What counts as improvement:
   - Report primary metric + full per-class metrics (YES/NO/TBD) at the chosen operating point
   - Also report the Pareto frontier across thresholds/policies (not a single cherry-picked point)

## 2) Current baseline (publish candidate: S12B)

Baseline numbers are sourced from:
- `README.md`
- `experiments/S12B_20260526/certification/`

Decision metrics (DS-L):
- Validation (n=44,404): Accuracy 0.8224, Macro F1 0.8213
- Test (n=44,597): Accuracy 0.8260, Macro F1 0.8252

Certification artifacts (validation):
- Multi-seed stability (seeds 42/0/7): PASS (std=0.0)
- Calibration: ECE=0.0338
- Threshold sweep artifacts recorded for auditability

Notes:
- Emotion head is masked in the DS-L lineage; do not claim emotion performance for S12B.

## 3) Analysis inventory (what we have / what is missing)

Already captured in this publish repo:
- Top-line decision metrics (val + test) with class-wise F1 (in `README.md`)
- Confusion matrix counts (in `evaluation/EVALUATION_REPORT.md`)
- Calibration artifacts (in `experiments/S12B_20260526/certification/`)
- Threshold sweep artifacts (in `experiments/S12B_20260526/certification/threshold_sweep_decision_20260526/`)

Missing (should be produced and versioned in the dev-run repo):
- Slice metrics (domain/source, length buckets, negation, ambiguity markers, safety-critical buckets)
- Error taxonomy from manual review (sampled mispredictions categorized)
- Label quality audit / relabel rate on a small subset
- Leakage / near-duplicate audit across splits
- Ablations that isolate what truly moves macro-F1 (esp. TBD boundary)

## 4) Next steps to run in the dev-run repo (order matters)

Step A - Pin target + constraints
- Decide: is "90" macro_f1 or accuracy?
- Write max acceptable TBD rate and minimum safety constraints (YES precision / NO recall).

Step B - Produce a versioned run artifact bundle
Generate machine-readable artifacts for the baseline model + baseline policy:
- `metrics.json` (overall + per-class)
- `confusion_matrix.csv`
- `threshold_sweep.csv` (metrics vs thresholds, including TBD rate)
- `slices.csv` (metrics by slice keys)
- `calibration.csv` (confidence bins, ECE)
- `errors_sample.jsonl` (e.g., 200-500 sampled errors with text + labels + preds + confidences)
- `run_config.json` (hyperparams, seed, data version, code SHA)

Rule: every artifact must include dataset version/hash + git SHA + timestamp.

Step C - Error review -> improvement backlog
From `errors_sample.jsonl`, label each error with a small taxonomy, e.g.:
- label_noise / guideline_ambiguity
- truncation (128 token cutoff)
- negation / scope / contrast
- missing context
- hard NO vs soft NO boundary confusion
- should defer vs should decide mismatch

Turn the top 3 error buckets into backlog items with estimated impact + proposed data/model actions.

Step D - Choose the fastest lever(s) to 0.90
Choose based on evidence:
- Data: targeted sampling / hard-negative mining for the failing boundary
- Objective: class weighting / logit adjustment tuned to the failing boundary without overfitting
- Policy: threshold/routing changes that move you along the Pareto frontier (affects TBD rate)
- Input: reduce truncation failures via chunking/longer context (if feasible)

## 5) Definition of done (for "90")

We consider "90 achieved" only when:
- Target metric >= 0.90 on the frozen test set, with the frozen operating policy, and within the TBD/latency constraints.
- A report is generated that includes:
  - primary metric + per-class P/R/F1
  - confusion matrix + top error transitions
  - slice report (at least top 10 slices by volume)
  - calibration summary
  - Pareto frontier table/plot for transparency
