# S12B Certification Artifact Pointers

Run ID: `S12B_20260526`

This document identifies the artifacts needed to review the S12B certification candidate. Model weights and tokenized datasets are not stored in this repository.

## Controlled Artifact Identifiers

| Artifact | Identifier |
|---|---|
| Raw checkpoint | `checkpoints/exp_t90_S12B_boundarypack_ep1_fromS12ep3/best_model_epoch_1.pt` |
| Hugging Face export | `checkpoints/exp_t90_S12B_boundarypack_ep1_fromS12ep3/hf_format/` |
| DS-L tokenized dataset | `data/tokenized_s12_20260525_dsl/` |
| S12B boundary-pack tokenized dataset | `data/tokenized_s12_boundarypack_20260526/` |

## Vendored Certification Evidence

The certifier-facing evidence included in this repository is under:

`certification/runs/S12B_20260526/pack/`

It includes evaluation reports, calibration evidence, threshold sweeps, post-training tests, governance documents, and reproducibility commands.

## Access

Controlled model and dataset artifacts should be provided through the release owner or the approved model-hosting channel. No credentials or signed access URLs are stored in this repository.
