import argparse
import hashlib
from pathlib import Path

import pandas as pd


KEEP_COLUMNS = [
    "record_id",
    "source_name",
    "source_config",
    "value_array",
    "emotion_array",
    "decision_label",
    "confidence",
    "rule_version",
    "split",
    "context_text_sha256",
    "source_ref",
]


def sha256_text(value: str) -> str:
    if value is None:
        return ""
    data = str(value).encode("utf-8")
    return hashlib.sha256(data).hexdigest()


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--in", dest="input_path", required=True, help="Input CSV/Parquet")
    parser.add_argument("--out", dest="output_path", required=True, help="Output Parquet")
    parser.add_argument(
        "--text-col",
        default="context_text",
        help="Column containing upstream text (used only to compute hash; not output).",
    )
    args = parser.parse_args()

    input_path = Path(args.input_path)
    output_path = Path(args.output_path)
    output_path.parent.mkdir(parents=True, exist_ok=True)

    if input_path.suffix.lower() == ".csv":
        df = pd.read_csv(input_path)
    else:
        df = pd.read_parquet(input_path)

    text_col = args.text_col
    if "context_text_sha256" not in df.columns:
        if text_col in df.columns:
            df["context_text_sha256"] = df[text_col].map(sha256_text)
        else:
            df["context_text_sha256"] = ""

    for col in KEEP_COLUMNS:
        if col not in df.columns:
            df[col] = ""

    out = df[KEEP_COLUMNS].copy()
    out.to_parquet(output_path, index=False)
    print(f"Wrote {output_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
