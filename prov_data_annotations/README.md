# Propagate input data annotations to CLWProv provenance

## Example 1: Simple CLT description
- `cwltool --provenance <ro_name> date.cwl input_date.yml`
- ro_original is RO before modification of provenance_profile.py
- ro_new is RO with label annotation propagated to primary.cwlprov.* files.