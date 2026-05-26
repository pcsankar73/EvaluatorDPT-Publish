# Reproducibility

## Environment (known)

- Hardware used for S7A–S7C runs: `Standard_NC4as_T4_v3` (Tesla T4 16GB)
- Base model: `bert-base-uncased`
- Max sequence length: 128

Not yet captured in publish repo:
- exact Python version
- exact PyTorch/CUDA versions
- driver version
- full package lock / hashes

## Seeds

Primary:
- 42

Certification (planned):
- 42
- 123
- 777

## Determinism Notes

Known sources of nondeterminism to control when certifying:
- dropout
- dataloader shuffle
- GPU kernel nondeterminism
- mixed precision
- optimizer state initialization

## Final Commands

See:
- `train_commands.sh`
- `eval_commands.sh`
