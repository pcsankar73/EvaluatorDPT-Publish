# Objective “90 Score” — Spec + Next Steps

This document defines what “90 = score” means, captures current baseline metrics, and lists the analyses and concrete next
steps to run in the **dev-run repo** (where training/eval actually happens).

## 1) Objective definition (must be pinned before any model work)

**We do not start model changes until these are fixed and written down:**

1. **Metric target (pick exactly one primary):**
   - `macro_f1 >= 0.90`  *(recommended primary because TBD is majority class)*
   - OR `accuracy >= 0.90`
   - OR `weighted_f1 >= 0.90`

2. **Evaluation scope (pin the exact dataset/split):**
   - Dataset name + version/hash
   - Split definition (train/dev/test) + fixed random seed
   - Any filtering / de-dup rules applied

3. **Operating policy constraints (production realism):**
   - Max acceptable **TBD rate** (human-review load) = `_____`
   - Minimum acceptable **YES precision** = `_____`
   - Minimum acceptable **NO recall** = `_____`
   - Latency guardrail (p50/p95) = `_____`

4. **What counts as improvement:**
   - Report *primary metric* + full per-class metrics (YES/NO/TBD) at the chosen operating point
   - Also report the **Pareto frontier** across thresholds/policies (not a single cherry-picked point)

## 2) Current baseline (from this publish repo)

Baseline numbers currently documented in `README.md`:

- Test set size: **22,748** (class supports: YES 5,871 · NO 3,159 · TBD 13,718; TBD majority at 60.3%)
- Overall: Accuracy **0.8485** · Macro F1 **0.8215** · Weighted F1 **0.8506**
- Per-class:
  - YES: Precision **0.7683** · Recall **0.9029** · F1 **0.8302**
  - NO: Precision **0.7164** · Recall **0.7923** · F1 **0.7524**
  - TBD: Precision **0.9306** · Recall **0.8381** · F1 **0.8819**
- Latency (T4 GPU, 200 runs): p50 **200 ms** · p95 **415 ms**

Interpretation (high-level):
- YES recall is high; YES precision is the main weakness for YES.
- NO is the weakest class overall; improving NO usually drives macro-F1 gains fastest.
- TBD precision is strong (deferrals are “high quality” when emitted).

## 3) Current analysis inventory (what we have / what’s missing)

**Already captured (in this repo):**
- Top-line metrics + per-class P/R/F1 (in `README.md`)
- High-level system overview + latency snapshot (in `docs/system_overview.md`)
- Safety/disclosure publishing rules (in `docs/safety_disclosure_rules.md`)
- Pareto optimization primer for multi-objective tuning (in `docs/pareto_optimization.md`)

**Missing (must be produced in dev-run repo):**
- Confusion matrix counts and top error transitions (e.g., NO→YES, NO→TBD, YES→NO, etc.)
- Threshold sweep plots/tables (risk–coverage curves, PR curves per class)
- Slice metrics (domain/source, length buckets, negation, ambiguity markers, safety-critical buckets, etc.)
- Calibration metrics (reliability diagrams, ECE, classwise calibration)
- Error taxonomy from manual review (sampled mispredictions categorized)
- Label quality audit / relabel rate on a small subset
- Leakage / near-duplicate audit across splits
- Ablations that isolate what truly moves macro-F1 (esp. NO)

## 4) Next steps to run in the dev-run repo (order matters)

### Step A — Pin the target and constraints
- Decide: is “90” `macro_f1` or `accuracy`?
- Write max acceptable TBD rate and minimum safety constraints (YES precision / NO recall).

### Step B — Produce a “run artifact bundle” for the current baseline
Generate versioned, machine-readable artifacts for the baseline model + baseline policy:
- `metrics.json` (overall + per-class)
- `confusion_matrix.csv`
- `per_class_report.csv`
- `threshold_sweep.csv` (metrics vs threshold(s), including TBD rate)
- `slices.csv` (metrics by slice keys)
- `calibration.csv` (confidence bins, ECE/ACE if available)
- `errors_sample.jsonl` (e.g., 200–500 sampled errors with text + labels + preds + confidences)
- `run_config.json` (hyperparams, seed, data version, code SHA)

**Rule:** every artifact must include dataset version/hash + git SHA + timestamp.

### Step C — Do error review and create the improvement backlog
From `errors_sample.jsonl`, label each error with a small taxonomy, e.g.:
- label_noise / guideline_ambiguity
- truncation (128 token cutoff)
- negation / scope / contrast
- missing context
- “hard NO” vs “soft NO” boundary confusion
- “should defer” vs “should decide” mismatch

Turn the top 3 error buckets into backlog items with estimated impact and proposed data/model actions.

### Step D — Decide the fastest lever(s) to 0.90
Choose based on evidence:
- Data: targeted sampling / hard-negative mining for NO, relabeling ambiguous regions
- Objective: class weighting / focal loss / logit adjustment tuned for NO without overfitting
- Policy: threshold/routing changes that move you along the Pareto frontier (may raise primary metric but affects TBD rate)
- Input: reduce truncation failures via chunking/longer context (if feasible)

## 5) Definition of done (for “90”)

We consider “90 achieved” only when:
- Target metric ≥ 0.90 on the **frozen test set**, with the **frozen operating policy**, and within the TBD/latency constraints.
- A report is generated that includes:
  - primary metric + per-class P/R/F1
  - confusion matrix + top error transitions
  - slice report (at least the top 10 slices by volume)
  - calibration summary
  - Pareto frontier table/plot for transparency

