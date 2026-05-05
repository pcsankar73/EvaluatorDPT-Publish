# System Overview

This system performs multi-output prediction under ambiguity and production constraints.

## Inputs
Text-like decision-event inputs tokenized to max sequence length 128.

## Outputs
1. Primary bounded output: YES, NO, TBD
2. Human Values vector: 10 binary labels
3. Emotion/Sentiment vector: 28 binary labels

## Evaluation Summary
- Decision accuracy: 0.8506
- Decision F1 (mean across classes): 0.8240
- p50 latency: ~200 ms
- p95 latency: ~415 ms

Metric source: `Model-Score.txt` (timestamp `2025-08-18 07:29:07`).

This document intentionally provides a high-level description only.
