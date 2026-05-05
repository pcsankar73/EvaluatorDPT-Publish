from huggingface_hub import HfApi

api = HfApi()
api.upload_file(
    path_or_fileobj="huggingface/README.md",
    path_in_repo="README.md",
    repo_id="pcsankar73s/EvaluatorModel",
    repo_type="model",
    commit_message="Update model card",
)
print("Model card pushed to pcsankar73s/EvaluatorModel")
