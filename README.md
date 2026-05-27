# EvaluatorDPT

**Auditable Decision Models with Learned Abstention and Real-Time Steering**

*Sankar Palamadai — Simple Machine Mind*

EvaluatorDPT is a bounded operational decision-control layer for AI workflows where uncertainty must be routed, governed, and audited. It does not generate free-form decisions. It emits a constrained decision distribution over **YES**, **NO**, and **TBD** so downstream policy can decide whether to act, block, or defer.

TBD is a learned deferral class, not only a post-hoc confidence rejection rule. This allows insufficient-evidence cases to shape the model representation while still allowing deployment owners to apply external, versioned operating thresholds.

## What It Produces

| Output | Current status | Purpose |
|---|---|---|
| Decision distribution | Validated | Probability distribution over YES / NO / TBD |
| Decision confidence | Validated | Confidence for threshold and fallback review |
| Value signals | Architectural / staged validation | Decision-relative auxiliary channel requiring separate validation before deployment claims |
| Emotion/sentiment signals | Disabled for the evaluated model version | No emotion-head performance claim is made |

## Operational Use

EvaluatorDPT is intended for governed AI routing workflows:

- Policy approval or rejection routing
- Compliance and risk triage
- Moderation escalation
- Enterprise workflow gating
- Human-in-the-loop review queues

A deployment can increase or reduce automation without retraining the model by changing the recorded threshold policy. This separation between model distribution and operating policy is the core auditability mechanism.

## Evaluation Evidence

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

Additional evidence:

- Validation ECE: **0.0338**
- Multi-seed validation stability: **PASS** (`std=0.0` over seeds 42, 0, 7)
- Forced binary YES/NO view without deferral: **Macro F1=0.4945**
- Targeted boundary refinement keeps raw F1 essentially flat while reducing high-confidence error rate on the test split from **0.0558** to **0.0485** under the paired comparison procedure

## Documentation Map

| Area | Location |
|---|---|
| Hugging Face model card | `huggingface/README.md` |
| Model card | `model_card/MODEL_CARD.md` |
| Evaluation reports | `evaluation/` |
| Governance policy | `governance/` |
| Data schema | `data_schema/` |
| Reproducibility | `reproducibility/` |
| Paper source and PDF | `paper/arxiv_v2/` |

## Paper

**Auditable Decision Models with Learned Abstention and Real-Time Steering**

- Paper package: `paper/arxiv_v2/`
- Compiled PDF: `paper/arxiv_v2/main.pdf`
- OSF preprint: <https://osf.io/ztnya/>

## License

- Repository code and documentation: MIT, see `LICENSE`.
- Model artifacts: CC BY-NC 4.0 for non-commercial research and evaluation use.
- Training data is not redistributed in this repository. Source datasets remain governed by their original licenses and terms.
