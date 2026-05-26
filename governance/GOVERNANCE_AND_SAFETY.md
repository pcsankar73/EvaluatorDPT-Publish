# Governance and Safety

## Purpose

EvaluatorDPT is designed as an auditable operational decision-control layer. Governance is based on separating the model checkpoint from the operating policy that controls runtime routing.

## Governance Principles

- Use bounded outputs: YES, NO, and TBD.
- Treat TBD as governed deferral, not model failure.
- Keep operating thresholds external to the checkpoint.
- Version every threshold policy used in deployment.
- Log the checkpoint identity, policy version, probabilities, routed label, and fallback path.
- Revalidate calibration and thresholds before use in a new domain.

## Required Inference Record

Each production inference should record:

| Field | Purpose |
|---|---|
| Request identifier | Connects the decision to the workflow event |
| Input hash or trace reference | Supports replay without exposing unnecessary content |
| Model identifier | Identifies the checkpoint used |
| Policy version | Identifies thresholds and fallback rules |
| Decision probabilities | Supports threshold reconstruction |
| Final routed label | Records YES, NO, or TBD after policy application |
| Auxiliary channels used | Records any validated auxiliary policy-control signals |
| Timestamp | Supports audit chronology |

## Escalation Policy

TBD and low-confidence cases should route to a documented fallback path. Suitable fallback paths include human review, additional evidence collection, policy-engine review, or conservative non-automation.

## Domain Transfer

The output interface is domain-agnostic, but performance is not automatically transferable. Each new domain requires validation, calibration review, threshold selection, and error analysis before operational use.

## Rollback Requirements

A deployment should retain:

- the previous checkpoint identifier
- the previous threshold policy
- the current artifact manifest
- a procedure for reverting routing policy or checkpoint selection
