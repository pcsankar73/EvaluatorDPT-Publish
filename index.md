---
title: "EvaluatorDPT"
---

# EvaluatorDPT

**Auditable Decision Models with Learned Abstention and Real-Time Steering**

EvaluatorDPT is a bounded operational decision-control layer for AI workflows where uncertainty must be routed, governed, and audited. It emits a constrained decision distribution over `YES`, `NO`, and `TBD`; downstream policy applies recorded thresholds and fallback rules to decide whether to act, block, or defer.

## What It Produces

- Primary bounded decision: `YES` / `NO` / `TBD`
- Decision confidence for threshold review
- Auxiliary value and emotion/sentiment channels as architectural signals requiring separate validation before deployment claims

## Current Evidence

- Test Accuracy: `0.8260`
- Test Macro F1: `0.8252`
- Test class F1: `YES=0.8314`, `NO=0.8486`, `TBD=0.7956`
- Validation ECE: `0.0338`
- Forced binary YES/NO without deferral: `Macro F1=0.4945`

## Start Here

- GitHub publication repository: `https://github.com/pcsankar73/EvaluatorDPT-Publish`
- Hugging Face model page: `https://huggingface.co/pcsankar73s/EvaluatorModel`
- OSF preprint: `https://osf.io/ztnya/`
- arXiv: submitted — pending announcement and ID assignment
- Docs hub: `https://docs.smsquared.ai/docs-next/index.html`
- Trust Center: `https://demo.smsquared.ai/trust-center/trust-center.html`

## Contact

- `sankar@smsquared.ai`
