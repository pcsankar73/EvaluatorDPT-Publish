# Reproducibility

## Evaluated Candidate

| Field | Value |
|---|---|
| Run ID | `S12B_20260526` |
| Experiment | `exp_t90_S12B_boundarypack_ep1_fromS12ep3` |
| Base model | `bert-base-uncased` |
| Max sequence length | 128 |
| Primary seed | 42 |
| Stability seeds | 42, 0, 7 |

## Commands

- Training command: `train_commands.sh`
- Evaluation commands: `eval_commands.sh`
- Seed configuration: `seed_config.json`

## Determinism Scope

The published multi-seed result validates deterministic evaluation behavior under the recorded scoring procedure. It is not a claim that all future training runs will be identical.
