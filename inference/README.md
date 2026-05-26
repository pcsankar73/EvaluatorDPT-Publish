# Inference

This folder provides a minimal example interface for the EvaluatorDPT decision-control contract.

The deployment pattern is policy-separable:

1. The model emits YES / NO / TBD probabilities.
2. A versioned threshold policy converts probabilities into a routed label.
3. The routed label, policy version, and probabilities are logged for audit.

This folder is not a production SDK. Production use should implement authentication, request tracing, policy versioning, monitoring, and escalation handling.
