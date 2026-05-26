# EvaluatorDPT

**Auditable Operational Decision Control with Learned Deferral**

*Sankaranarayanan Palamadai Chandrasekaran — Simple Machine Mind*

EvaluatorDPT is a bounded decision-control system for AI workflows where uncertainty must be routed, governed, and audited. It does not generate free-form decisions. It emits a constrained decision distribution over **YES**, **NO**, and **TBD** so downstream policy can decide whether to act, block, or defer.

The current release candidate is **S12B** (`S12B_20260526`). It is best understood as an auditable operational decision-control checkpoint: the model produces a bounded distribution, and deployment policy controls runtime routing through recorded thresholds, fallback rules, and review paths.

## What It Produces

| Output | Status in S12B | Purpose |
|---|---|---|
| Decision | Validated | YES / NO / TBD bounded decision distribution |
| Confidence | Validated | Softmax-derived decision confidence for threshold review |
| Value signals | Architectural / lineage-dependent | Decision-semantic auxiliary channel for future policy control |
| Emotion/sentiment signals | Masked in DS-L | Not claimed for S12B; future validation required |

TBD is a learned deferral class, not only a post-hoc confidence rejection rule. This allows insufficient-evidence cases to shape the model representation while still allowing deployment owners to apply external, versioned operating thresholds.

## Operational Use

EvaluatorDPT is intended for governed AI routing workflows:

- Policy approval or rejection routing
- Compliance and risk triage
- Moderation escalation
- Enterprise workflow gating
- Human-in-the-loop review queues

A deployment can increase or reduce automation without retraining the checkpoint by changing the recorded threshold policy. This separation between model distribution and operating policy is the core auditability mechanism.

## Current Evidence

Release candidate: **S12B** (`exp_t90_S12B_boundarypack_ep1_fromS12ep3`)

| Split | N | Accuracy | Macro F1 |
|---|---:|---:|---:|
| Validation | 44,404 | 0.8224 | 0.8213 |
| Test | 44,597 | 0.8260 | 0.8252 |

Test per-class F1:

| Class | F1 |
|---|---:|
| YES | 0.8314 |
| NO | 0.8486 |
| TBD | 0.7956 |

Additional certification evidence:

- Validation ECE: **0.0338**
- Multi-seed validation stability: **PASS** (`std=0.0` over seeds 42, 0, 7)
- Forced binary YES/NO view without deferral: **Macro F1=0.4945**
- S12B vs S12: raw F1 is essentially flat, but high-confidence error rate improves on test from **0.0558** to **0.0485** under the paired comparison procedure

## Documentation Map

| Area | Location |
|---|---|
| Hugging Face model card | `huggingface/README.md` |
| Certification package | `certification/runs/S12B_20260526/CERTIFIER_README.md` |
| Model card | `model_card/MODEL_CARD.md` |
| Evaluation reports | `evaluation/` |
| Governance policy | `governance/` |
| Data schema | `data_schema/` |
| Reproducibility | `reproducibility/` |
| Paper source and PDF | `paper/arxiv_v2/` |

## Paper

Current arXiv working title: **Auditable Operational Decision Control with Learned Deferral**.

- Paper package: `paper/arxiv_v2/`
- Compiled PDF: `paper/arxiv_v2/main.pdf`
- OSF preprint record: <https://osf.io/ztnya/>

## License

- Repository code and documentation: MIT, see `LICENSE`.
- Model artifacts: CC BY-NC 4.0 for non-commercial research and evaluation use.
- Training data is not redistributed in this repository. Source datasets remain governed by their original licenses and terms.
