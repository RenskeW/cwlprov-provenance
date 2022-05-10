# CWLProv provenance of software

Current status:
- Docker images are captured (DockerRequirement)
- SoftwareRequirement is not captured


from `docker` run `cwltool --provenance ro_docker wf_docker.cwl ../wf_job.yml`
from `software_req` run `cwltool --provenance ro_software_req  wf_nodocker.cwl ../wf_job.yml`

`docker/ro_docker` is a research object from a CWL tool description with DockerRequirement (`docker/wf_docker.cwl`)
`software_req/ro_software_req` is a CWLProv RO from an identical tool description but without DockerRequirement, only SoftwareRequirement (`software_req/wf_nodocker.cwl`).

`docker/ro_docker/metadata/provenance/primary.cwlprov.json`, line 41 specifies docker image used in run
`software_req/ro_software_req/metadata/provenance/primary.cwlprov.json` does not contain 'numpy', the specified SoftwareRequirement.