from datasets import load_dataset

# From a local checkout:
# - Ensure the Parquet files exist under `VEGD/data/`
# - Run this script from the repository root
ds = load_dataset("VEGD", data_dir="VEGD")
print(ds)
print(ds["train"][0])

