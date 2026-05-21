# Data Files

This folder is intended to contain the dataset splits as Parquet files:

- `train.parquet`
- `validation.parquet`
- `test.parquet`
- `sample_1k.parquet` (optional quick-start subset)

## Recommended: Git LFS

Parquet files are typically large. For publishing on Hugging Face, it’s common to commit them using Git LFS.

If you plan to commit Parquet files into this repo, run:

```bash
git lfs install
git lfs track "VEGD/data/*.parquet"
```

