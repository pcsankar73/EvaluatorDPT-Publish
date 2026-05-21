import sys

import pyarrow.parquet as pq


REQUIRED_COLUMNS = [
    "record_id",
    "source_name",
    "value_array",
    "emotion_array",
    "decision_label",
    "rule_version",
]


def main(path: str) -> int:
    table = pq.read_table(path)
    missing = [c for c in REQUIRED_COLUMNS if c not in table.column_names]
    if missing:
        print(f"Missing columns in {path}: {missing}")
        return 2
    print(f"OK: {path} has required columns")
    return 0


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python VEGD/scripts/validate_parquet_schema.py <path-to-parquet>")
        raise SystemExit(2)
    raise SystemExit(main(sys.argv[1]))
