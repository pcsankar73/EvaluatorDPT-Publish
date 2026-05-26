# Limitations

- Results are specific to DS-L and the S12B evaluation setup.
- The interface is domain-agnostic, but performance is not a domain-transfer claim.
- New domains require calibration review, threshold selection, policy-version review, and error audit.
- Inputs longer than 128 tokens require chunking or preprocessing.
- TBD is a governed deferral output, not a guarantee of correctness.
- Emotion-head performance is not claimed for S12B because the emotion head is masked in DS-L.
- Auxiliary value and emotion/sentiment channels require separate validation before use as deployment policy controls.
- Certification evidence supports review; it does not replace deployment-specific governance.
