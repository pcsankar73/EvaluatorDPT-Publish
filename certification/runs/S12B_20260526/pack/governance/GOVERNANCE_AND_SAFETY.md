# Governance and Safety

## Purpose

Document operational safety controls for EvaluatorDPT.

## Safety Principles

- bounded decisions
- explicit deferral
- thresholded confidence
- audit logs
- human escalation for TBD
- versioned model artifacts

## Logging Requirements

Each inference should log:
- input hash
- model version
- threshold version
- decision probabilities
- final decision
- auxiliary outputs
- timestamp
- request ID

## Escalation Policy

TBD decisions should route to:
- human review
- additional evidence collection
- fallback workflow
- blocked automation, depending on deployment context

## Rollback

Maintain:
- previous production checkpoint
- previous threshold config
- rollback command
- artifact manifest hash
