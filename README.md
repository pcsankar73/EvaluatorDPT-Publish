# EvaluatorDPT

**Auditable AI Decision System with Bounded Decisions, Explainability, and Confidence Scores**

*Sankaranarayanan Palamadai Chandrasekaran — Simple Machine Mind*

---

## What It Does

EvaluatorDPT is a BERT-based multi-task model that produces three outputs for every decision event:

| Output | Type | Description |
|---|---|---|
| **Decision** | 3-class | YES / NO / TBD (defer) |
| **Human Values** | 10-label multi-label | Structured context signal |
| **Emotions/Sentiments** | 28-label multi-label | Structured context signal |

The auxiliary outputs are **not discarded after training**. They are retained at inference time as control variables for downstream steering, thresholding, and reason-code generation — making every decision auditable.

Input/output contract: a context signal is mapped to a bounded decision, decision confidence, structured reason codes, and reason-code confidence scores.

---

## System Overview

![EvaluatorDPT System Overview](paper/architecture.png)

---

## Key Results

Latest publish candidate: **S12B** (`exp_t90_S12B_boundarypack_ep1_fromS12ep3`, DS-L + boundary pack).

Full validation (DS-L, n=44,404):
- Accuracy: **0.8224**
- Macro F1: **0.8213**
- YES/NO/TBD F1: 0.8252 / 0.8496 / 0.7892

Full test (DS-L, n=44,597):
- Accuracy: **0.8260**
- Macro F1: **0.8252**
- YES/NO/TBD F1: 0.8314 / 0.8486 / 0.7956

Certification evidence (validation):
- Multi-seed stability (seeds 42/0/7): **PASS** (std=0.0) — `experiments/S12B_20260526/certification/multi_seed_00_summary.txt`
- Calibration: **ECE=0.0338** — `experiments/S12B_20260526/certification/calibration_data_val.json`
- Threshold sweep artifacts: `experiments/S12B_20260526/certification/threshold_sweep_decision_20260526/`

Notes:
- Emotion head is **masked** in the DS-L lineage; do not claim emotion performance for S12B.

## Architecture

The model uses `bert-base-uncased` as a shared encoder with three task-specific heads:

- **Decision head** — YES / NO / TBD + confidence score
- **Value head** — 10 Human Values labels
- **Emotion head** — 28 Emotions/Sentiments labels

![EvaluatorDPT Model Architecture](paper/architecture_l2.png)

---

## Paper

Full methodology, evaluation, ablation, and confusion analysis:

- [`paper/Auditable_AI_Decision_Systems_Bounded_Decisions.pdf.pdf`](paper/Auditable_AI_Decision_Systems_Bounded_Decisions.pdf.pdf) — compiled paper
- OSF preprint: [https://osf.io/ztnya/](https://osf.io/ztnya/)
- arXiv: `TBD` *(submission in progress)*

---

## Repository Layout

```
paper/          arXiv submission package (tex, bib, bbl, pdf, diagrams)
huggingface/    HuggingFace model card
inference/      Example inference interface
model/          Model configuration
data_schema/    Input / output schema definitions
docs/           System documentation
```

---

## Quickstart

```bash
pip install -r requirements.txt
python inference/predict.py
```

---

## Links

- HuggingFace: [pcsankar73s/EvaluatorModel](https://huggingface.co/pcsankar73s/EvaluatorModel)
- OSF preprint: [https://osf.io/ztnya/](https://osf.io/ztnya/)
- arXiv: TBD
- Pareto optimization notes: [`docs/methodology/pareto_optimization.md`](docs/methodology/pareto_optimization.md)
- Contact: sankar@smsquared.ai

---

## License

- Repository code + documentation: MIT (see LICENSE).
- Model weights (Hugging Face): CC BY-NC 4.0 (see huggingface/README.md).
- Training data is not redistributed; public datasets remain under their original licenses/terms.


