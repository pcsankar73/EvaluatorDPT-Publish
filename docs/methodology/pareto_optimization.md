# Pareto Optimization (Model + Policy Tuning)

This project is built around **multi-objective** deployment: you rarely optimize a single metric without hurting another.
Pareto optimization is the practical way to choose an operating point when you care about **multiple tradeoffs at once**
(precision/recall, autonomy/safety, confidence/coverage, latency/cost, etc.).

## Key idea: the Pareto frontier

Given a set of candidate operating points (e.g., different confidence thresholds and routing policies), one point **dominates**
another if it is **at least as good on every objective** and **strictly better on at least one**.

The **Pareto frontier** is the set of **non-dominated** points. Everything off the frontier is objectively worse than some
other available choice.

## What counts as an “operating point” here?

Typically a combination of:
- **Decision thresholding** (e.g., require higher decision confidence to auto-approve YES/NO, otherwise return TBD)
- **Routing policy** (e.g., “TBD → human review”, “NO → block”, “YES → proceed”)
- **Guardrails** using auxiliary outputs (values/emotions) as *control variables* (optional, deployment-specific)

## Common objectives (choose the ones you actually care about)

You can frame objectives as “maximize” or “minimize”:
- Maximize: **macro F1**, **precision(YES)**, **recall(NO)**, **TBD precision** (quality of deferrals)
- Minimize: **unsafe automation rate**, **false positive cost**, **latency p95**, **human review load**
- Constrain: “TBD rate ≤ X%”, “precision(YES) ≥ Y”, “p95 latency ≤ Z ms”, “NO recall ≥ R”

## Mapping the typical tradeoffs

- **Precision vs recall:** raising a threshold tends to increase precision but reduce recall (more misses / more deferrals).
- **Autonomy vs safety:** more automation (fewer TBDs) increases autonomy but usually reduces safety margins.
- **Confidence vs coverage:** “only act when confident” increases confidence but lowers coverage (more TBDs).
- **Automation vs human review:** lower deferral means more automation; higher deferral increases review workload.
- **Accuracy vs interpretability:** adding constraints/guardrails and emitting reason codes can improve interpretability, but may
  reduce raw accuracy (or increase TBD rate) if you force conservative behavior.

## Simple workflow

1. **Generate candidates**: sweep thresholds/policies across a reasonable range.
2. **Measure objectives**: for each candidate, compute the metrics you care about (plus deferral rate).
3. **Compute frontier**: remove dominated points to get the Pareto set.
4. **Pick with constraints**: apply non-negotiables (e.g., “precision(YES) ≥ 0.85”) and choose a point on the frontier.
5. **Validate**: re-check on a holdout set and in a shadow deployment before changing production behavior.

## Practical tip: treat “TBD” as a first-class budget

Deferral is how you buy safety and interpretability:
- If you need **higher safety**, allow a higher TBD rate (more human review).
- If you need **higher autonomy**, accept a lower TBD rate (more automated action) and enforce strict guardrails.

## Output: what you should publish internally

For each candidate operating point, record:
- Threshold/policy definition (human-readable)
- Precision/recall/F1 per class (YES/NO/TBD)
- Overall accuracy + macro F1
- TBD rate (coverage proxy) and estimated human review load
- Latency p50/p95 (if policy changes affect it)

That table/plot is your decision record; the Pareto frontier makes tradeoffs explicit.

