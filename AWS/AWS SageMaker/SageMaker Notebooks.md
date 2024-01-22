# SageMaker Notebooks

NVMe drives:
* SageMaker Studio Classic (only?) notebooks do NOT have access to the NVMe drive.
* SageMakerNotebooks created (outside of Studio) do (check with `df -h`)

# Get user profile information

Load the profile information from `/opt/ml/metadata/resource-metadata.json` ([SO](https://stackoverflow.com/a/76377860), [Notebook Instance Metadata](https://docs.aws.amazon.com/sagemaker/latest/dg/nbi-metadata.html))

```python
with open("/opt/ml/metadata/resource-metadata.json", "r") as f:
app_metadata = json.loads(f.read())
print(json.dumps(app_metadata, indent=2))
sm_user_profile_name = app_metadata["UserProfileName"]
```

```json
{
  "AppType": "KernelGateway",
  "DomainId": "...",
  "UserProfileName": "my-profile-id",
  "ResourceArn": "arn:aws:sagemaker:...",
  "ResourceName": "...",
  "AppImageVersion": ""
}
```