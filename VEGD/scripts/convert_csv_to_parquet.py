import argparse
from pathlib import Path

import pyarrow.csv as pacsv
import pyarrow.parquet as pq


def convert(csv_path: Path, parquet_path: Path) -> None:
    table = pacsv.read_csv(str(csv_path))
    pq.write_table(table, str(parquet_path), compression="zstd")


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--in", dest="input_csv", required=True, help="Input CSV path")
    parser.add_argument(
        "--out", dest="output_parquet", required=True, help="Output Parquet path"
    )
    args = parser.parse_args()

    input_csv = Path(args.input_csv)
    output_parquet = Path(args.output_parquet)
    output_parquet.parent.mkdir(parents=True, exist_ok=True)

    convert(input_csv, output_parquet)
    print(f"Wrote {output_parquet}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

