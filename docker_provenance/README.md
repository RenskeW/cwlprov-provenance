# Are Docker images represented in CWLProv provenance?

Example case workflow with 4 steps:
1. dockerPull
2. dockerFile
3. dockerLoad??
4. dockerImport??

## dockerPull:
- image name and tag is supposed to be in the RO.


## dockerFile:
- Can only be used in combination with `dockerImageId` (name the image which will be built from the Dockerfile)
- The dockerFile is only built the first time, after that the existing image is used. (Hence the digest is only represented in the log the first time?)


## `ro_file`
- `cwltool --provenance ./ro_file docker_file.cwl`
- Observation: `packed.cwl` line 7: only contains the first line of the Dockerfile!

## `ro_pull`
- `cwltool --provenance ./ro_pull docker_pull.cwl`
- Digest is not part of the provenance, image name:tag is. 

## `ro_pull_digest`
- `cwltool --provenance ./ro_pull_digest docker_pull_digest.cwl`
- actual digest of container is not saved, only the part after `dockerPull`


