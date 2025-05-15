# Helm Repositories

## OCI repositories

`helm search repo` does not work with OCI repositories ([GitHub issue](https://github.com/helm/helm/issues/11000)), so instead ([from the issue](https://github.com/helm/helm/issues/11000#issuecomment-2676820894):

```bash
skopeo list-tags docker://ghcr.io/sigstore/helm-charts/rekor | \
egrep "[0-9]+\.[0-9]+\.[0-9.a-zA-Z-]+" | \
awk '{ gsub(/[ ]+|"|,/,""); print $0 }' | \
while read tag
do 
  echo -en "$tag -> "; 
  helm show values oci://ghcr.io/sigstore/helm-charts/rekor --version "${tag}" 2> /dev/null |  \
  egrep "[ ]*(registry:|repository:|version:)"; 
done
```