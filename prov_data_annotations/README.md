# Propagate input data annotations to CLWProv provenance

## Example 1: Simple CLT description
- `cwltool --provenance <ro_name> date.cwl input_date.yml`
- ro_original is RO before modification of provenance_profile.py
- ro_new is RO with label annotation propagated to primary.cwlprov.* files.


## Example 2: Example workflow 
- `wf.cwl` is workflow file
- `wf_job.yml` has annotations for actions and data entities
- `ro_old`: original research object, cwltool version 3.1.20220502060230
- `ro_new`: with propagated annotations, see https://github.com/common-workflow-language/cwltool/pull/1678
- `cwltool --provenance <ro> --full-name "Renske de Wit" wf.cwl wf_job.yml`

### TODO
- [ ] propagate action metadata under cwlprov:prov to provenance
- [ ] solution for hasPart on inputs of type Directory?
