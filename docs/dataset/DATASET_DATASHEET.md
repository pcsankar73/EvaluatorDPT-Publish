# Dataset Datasheet

## Dataset Name

EvaluatorDPT NLI Decision Corpus

## Current Version

- v6b (DS-G): `data/tokenized_v6b_20260522`
- v6 (DS-F): `data/tokenized_v6_nli_20260520`
- Prior major version: v5 (DS-E) NLI-only corpus — `data/tokenized_v5_nli_only_20260519`

## Dataset Purpose

Train and evaluate bounded semantic decision classification:
- YES
- NO
- TBD

## Dataset Lineage

| Version | Purpose | Notes |
|---|---|---|
| v5 (DS-E) | NLI-only semantic cleanup | All single-text sources removed; NLI premise/hypothesis only. 814K→444K reduction with quality gain; class balance improved (per the lineage narrative). |
| v6 (DS-F) | TBD→NO correction pass | 3,462 corrected rows |
| v6b (DS-G) | Corrected auxiliary supervision vectors | Same NLI text as DS-F with rebuilt aux vectors (diversity fix); used for S7A–S7C |

## v6 Corrections

| Split | TBD→NO Corrections |
|---|---:|
| Train | 2,287 |
| Validation | 577 |
| Test | 598 |
| Total | 3,462 |

## Label Policy

### YES
Supported / entailed / sufficiently justified decision.

### NO
Contradicted / blocked / unsupported due to explicit opposition.

### TBD
Insufficient evidence, ambiguity, unresolved semantic uncertainty, or not enough confidence to act.

## Splits

### v6b / DS-G counts

- Train: 355,408
- Validation: 44,404
- Test: 44,597

Source: S7A stage record (`evaluator-model-dev/docs/SuperImportant-Modelparams.txt`, 2026-05-23).

### Decision-class distribution (validation, v6b / DS-G)

From S7C validation diagnostics (n=44,404):

| Class | Count | Share |
|---|---:|---:|
| YES | 14,962 | 33.7% |
| NO  | 15,534 | 35.0% |
| TBD | 13,908 | 31.3% |

Source: `experiments/S7C_20260523/metrics.json` and `experiments/S7C_20260523/confusion_matrix.csv`.

## Known Limitations

- Long-text truncation at 128 tokens
- Semantic overlap between weak entailment and TBD
- Contradiction-vs-neutral boundary requires careful policy enforcement

## Audit History

- 30-point audit: PASS
- smoke test: PASS
- 1,000-row focal functionality test: PASS
