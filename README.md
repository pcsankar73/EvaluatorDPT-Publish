# EvaluatorDPT

**Auditable Operational Decision Infrastructure for Governed AI Systems**

EvaluatorDPT is a bounded decision component for AI workflows that require reviewability, controlled automation, and explicit fallback behavior. It is built for governed operational settings where systems must expose uncertainty, preserve routing discipline, and support audit records at deployment time.

This public repository presents EvaluatorDPT as part of a broader approach to dependable AI operations: bounded outputs, versioned runtime control, deployment-time governance, and reproducible evaluation. The repository intentionally focuses on operational artifacts and public validation materials rather than unpublished internal research frameworks.

## Public Scope

This repository documents a production-oriented decision layer that:

- emits bounded decision distributions for governed routing
- separates model outputs from deployment-time control policy
- supports deferral, escalation, and fallback handling
- preserves auditable runtime decisions and policy versions
- exposes reproducible evaluation and documentation artifacts

The repository does not publish private theory drafts, internal naming systems, or unpublished framework materials.

## What the Release Demonstrates

| Capability | Status | Public description |
|---|---|---|
| Bounded decision output | Validated | Constrained output space suitable for governed routing |
| Uncertainty-aware routing | Validated | Supports defer / escalate behavior instead of forced automation |
| Policy-separable deployment | Validated | Runtime control can change without retraining the checkpoint |
| Confidence and calibration evidence | Validated | Supports operational review and threshold selection |
| Auxiliary signals | Architectural / staged validation | Additional channels require independent validation before use |

## Operational Positioning

EvaluatorDPT is intended for governed AI workflows such as:

- compliance and risk review
- moderation escalation
- enterprise approval routing
- human-in-the-loop triage
- controlled workflow gating

The central operational pattern is separation between model distribution and deployment policy. The checkpoint produces bounded outputs. A recorded runtime policy determines when to approve, reject, defer, or escalate. This design supports controlled automation while preserving auditability.

## Evidence Snapshot

| Split | N | Accuracy | Macro F1 |
|---|---:|---:|---:|
| Validation | 44,404 | 0.8224 | 0.8213 |
| Test | 44,597 | 0.8260 | 0.8252 |

Additional public evidence:

- Validation ECE: **0.0338**
- Multi-seed validation stability: **PASS** (`std=0.0` over seeds 42, 0, 7)
- Forced non-deferral view shows materially weaker behavior: **Macro F1=0.4945**
- Boundary refinement reduces high-confidence error rate on the test split from **0.0558** to **0.0485** under the paired comparison procedure

## Repository Map

| Area | Location |
|---|---|
| Model card | `model_card/MODEL_CARD.md` |
| Evaluation summary | `evaluation/` |
| Governance policy | `governance/` |
| Data schema | `data_schema/` |
| Reproducibility commands | `reproducibility/` |
| Dataset source notes | `docs/dataset/` |

## Public Release Notes

This repository is a curated public release. It is intended to show the operational model, evaluation artifacts, governance pattern, and reproducibility surface needed to understand and assess the released system without disclosing unpublished internal research materials.

## License

- Repository code and documentation: MIT, see `LICENSE`.
- Model artifacts: CC BY-NC 4.0 for non-commercial research and evaluation use.
- Training data is not redistributed in this repository. Source datasets remain governed by their original licenses and terms.
