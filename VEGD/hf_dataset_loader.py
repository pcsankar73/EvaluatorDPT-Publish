"""
Hugging Face Datasets loader for VEGD.

This script is intended to live at the root of the dataset repo on the Hub.
It reads Parquet splits from `data/` and exposes them via `datasets.load_dataset`.
"""

from __future__ import annotations

import datasets


_DESCRIPTION = "VEGD — Value-Emotion Governance Dataset."

_HOMEPAGE = ""

_LICENSE = "Research & non-commercial (see LICENSE.md)"


class VEGD(datasets.GeneratorBasedBuilder):
    VERSION = datasets.Version("1.0.0")

    def _info(self) -> datasets.DatasetInfo:
        features = datasets.Features(
            {
                "record_id": datasets.Value("string"),
                "source_name": datasets.Value("string"),
                "source_config": datasets.Value("string"),
                "value_array": datasets.Sequence(datasets.Value("float32"), length=10),
                "emotion_array": datasets.Sequence(datasets.Value("float32"), length=28),
                "decision_label": datasets.ClassLabel(names=["NO", "TBD", "YES"]),
                "confidence": datasets.Value("float32"),
                "rule_version": datasets.Value("string"),
                "context_text_sha256": datasets.Value("string"),
                "source_ref": datasets.Value("string"),
            }
        )

        return datasets.DatasetInfo(
            description=_DESCRIPTION,
            features=features,
            homepage=_HOMEPAGE,
            license=_LICENSE,
        )

    def _split_generators(self, dl_manager: datasets.DownloadManager):
        data_files = {
            "train": "data/train.parquet",
            "validation": "data/validation.parquet",
            "test": "data/test.parquet",
        }
        optional_files = {
            "sample_1k": "data/sample_1k.parquet",
        }

        downloaded = dl_manager.download(data_files)
        downloaded_optional = dl_manager.download(optional_files)

        splits = [
            datasets.SplitGenerator(
                name=datasets.Split.TRAIN,
                gen_kwargs={"filepath": downloaded["train"]},
            ),
            datasets.SplitGenerator(
                name=datasets.Split.VALIDATION,
                gen_kwargs={"filepath": downloaded["validation"]},
            ),
            datasets.SplitGenerator(
                name=datasets.Split.TEST,
                gen_kwargs={"filepath": downloaded["test"]},
            ),
        ]

        sample_path = downloaded_optional.get("sample_1k")
        if sample_path:
            splits.append(
                datasets.SplitGenerator(
                    name=datasets.Split("sample_1k"),
                    gen_kwargs={"filepath": sample_path},
                )
            )

        return splits

    def _generate_examples(self, filepath: str):
        # ParquetReader yields dict rows with column names as keys.
        for idx, row in enumerate(datasets.ParquetReader(filepath)):
            yield idx, row
