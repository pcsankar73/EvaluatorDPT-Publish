# Training Data Sources (High Level)

This document describes, at a high level, the types of public NLP data sources and processing modules used across the EvaluatorDPT lineage.

- The raw training data is not redistributed in this repository.
- Public datasets each have their own licenses/terms; consult the original dataset licenses before reuse.
- This document is descriptive; exact run composition should be traced via `lineage/EXPERIMENT_LINEAGE.md` and per-run artifacts under `experiments/<RUN_ID>/`.

## Source Types Used Across the Lineage

### Natural Language Inference (NLI)
- Premise/hypothesis style pairs used for semantic entailment vs contradiction boundaries.

### Sentiment / Emotion signals
- Datasets used to provide weak/auxiliary supervision signals for emotional turbulence and sentiment cues.

### Values / ethics signals
- Datasets used to provide auxiliary supervision signals for value-alignment / ethical anchors.

### Robustness and corner-case coverage
- Targeted additions for known failure modes such as:
  - negation and scope flips
  - high lexical overlap contradictions
  - low lexical overlap entailments
  - long-text truncation stress cases
  - hedge/modal ambiguity

## Repo-Visible Processing Modules

The publish repository includes processing module names in the Hugging Face card for transparency and traceability.
Those module names indicate what code exists, not a guarantee that every source is included in every run.

See: `huggingface/README.md` → Data Processing Modules.
