# Reproducibility

## Evaluated Release

| Field | Value |
|---|---|
| Release date | 2026-05-26 |
| Base model | `bert-base-uncased` |
| Max sequence length | 128 |
| Primary seed | 42 |
| Stability seeds | 42, 0, 7 |

## Commands

- Training command template: `train_commands.sh`
- Evaluation command template: `eval_commands.sh`
- Seed configuration: `seed_config.json`

## Determinism Scope

The multi-seed result validates stable evaluation behavior under the recorded scoring procedure. It is not a claim that all future training runs will be identical.
