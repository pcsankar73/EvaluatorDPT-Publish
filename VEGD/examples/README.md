# Examples

This folder contains runnable or copy/pasteable examples for working with VEGD.

- For label examples and intuition-building samples, see `../EXAMPLES.md`.

## Quickstart (Hugging Face Datasets)

```python
from datasets import load_dataset

ds = load_dataset("<org-or-user>/VEGD")
print(ds["train"][0])
```

Note: VEGD is intended to be published as **annotations-only**. You should expect fields like
`source_name` (and optionally `source_config`) rather than redistributed raw text or per-record upstream IDs.
