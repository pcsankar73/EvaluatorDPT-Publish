# Dataset Versions

VEGD is versioned as a sequence of releases and build variants (e.g., cleaned subsets).

## Naming Conventions

- `v2`: second major iteration of the dataset spec / pipeline output
- `v2-clean`: v2 after cleaning filters
- `v2-final`: v2 after final selection / QA
- size variants (example): `v2_5k`, `v2_10k`, `v2_100k`

## Local Source-of-Truth (Development Repo)

As of 2026-05-15, dataset versions exist in:

`C:\Users\pcsan\smm\evaluator-model-dev\data\`

Observed folder names include:

- `clean_v2_final/` (contains `train.csv`, `validation.csv`, `test.csv`)
- `clean_v2_clean/`
- `clean_v2_5k/`, `clean_v2_10k/`, `clean_v2_100k/`
- `tokenized_*` variants (not necessarily publishable as-is)

## Publishing Workflow (This Repo)

This publishing repo (`VEGD/`) should contain the publishable artifacts only:

- `VEGD/data/train.parquet`
- `VEGD/data/validation.parquet`
- `VEGD/data/test.parquet`
- optional: `VEGD/data/sample_1k.parquet`

Once the final version choice is made, copy the selected split files into `VEGD/data/` and convert to Parquet before publishing.

