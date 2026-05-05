# Model Architecture

Public high-level description:

Input → Tokenizer → Transformer encoder → Shared representation → Primary head + Human Values head + Emotion/Sentiment head.

Output contract: bounded decision + decision confidence + structured reason codes with reason-code confidence scores.

Backbone: bert-base-uncased
Max sequence length: 128

This file intentionally excludes proprietary mechanisms.
