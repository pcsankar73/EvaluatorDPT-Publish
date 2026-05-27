# Limitations

- Results are specific to the evaluated corpus and the evaluated release configuration.
- The interface is domain-agnostic, but performance is not a domain-transfer claim.
- New domains require separate validation, calibration review, threshold selection, policy-version review, and error audit.
- Inputs longer than 128 tokens require chunking or preprocessing.
- TBD is a governed deferral output, not a guarantee of correctness.
- Emotion-head performance is not claimed for the evaluated release because the emotion head is disabled in this lineage.
- Auxiliary value signals require separate validation before use as deployment policy controls.
- Evaluation evidence supports external review; it does not replace deployment-specific governance.
