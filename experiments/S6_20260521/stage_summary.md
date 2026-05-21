# Stage Summary — S6 (ABORTED)

## Experiment
exp_t90_S6_AuxEncoderAnchor01_v6nli_ep3

## Purpose
Encoder-anchor approach for emotion collapse. Anchor 10% decision loss to prevent
encoder drift while training aux heads with emotion emphasis on v6 NLI data.

## Parent Checkpoint
exp_t90_S3A_v2_L9-11_Hds_v6nli_F8196_ep8/best_model_epoch_3.pt (F1=0.8215)

## Dataset
tokenized_v6_nli_20260520 (v6-nli-corrected) — 355,408 train / 44,404 val

## Model Configuration

| Parameter              | Value                                         |
|------------------------|-----------------------------------------------|
| Base model             | bert-base-uncased                             |
| Encoder layers unfrozen| 10, 11                                        |
| Loss weights           | 0.1 / 1.0 / 1.0 (decision / emotion / value) |
| Decision class weights | 1.0 / 1.0 / 1.2 (YES / NO / TBD)             |
| Learning rate          | 2e-5                                          |
| Encoder LR map         | 10: 1e-6, 11: 5e-7                            |
| Seed                   | 42                                            |

## Epoch Results

| Epoch | Macro F1 | YES F1 | NO F1  | TBD F1 | ValLoss | Emo P/R      |
|-------|----------|--------|--------|--------|---------|--------------|
| 1     | 0.8201   | 0.8241 | 0.8487 | 0.7874 | 1.3862  | 0.027/1.000  |
| 2     | 0.8210   | 0.8238 | 0.8503 | 0.7890 | 1.3563  | 0.027/1.000  |

## Outcome

ABORTED after epoch 2.

Emotion precision: 0.027 — identical across both epochs, zero movement.
Encoder-anchor approach cannot fix a data problem. NLI pairs carry no genuine
emotion signal; training on them cannot teach the emotion head to discriminate.

## Decision

Root cause confirmed: data, not architecture. S7 required.
S7 introduces 112K genuine emotion rows (GoEmotions, MELD, EmpatheticDialogues)
with emotion_mask field and masked BCE loss. S7 parent = S3A-v2 ep3 (not S6 ep2).
