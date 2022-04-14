Why: to answer a provenance question

- Is it possible to see in which CLT or subwf a wf input parameter is used?

# scenario 1
1-step workflow which takes 4 inputs:
1. required file: `./scenario1/wf_file_req.txt`
2. required string: `"wf_input_required_string"`
3. required file, default specified at workflow inputs level: `./scenario1/wf_file_def.txt`
4. required string, default specified at workflow inputs level: `"wf_input_default_string"`

In addition, there are 2 more inputs with defaults specified at CLT level:
5. file: `./scenario1/clt_def_file.txt`
6. string: `"clt_level_default_string"` 

Workflow input parameters specified in  `./scenario1/job_wf_example.yml`

Workflow output stored in `./scenario1/scenario1_output.txt`

From `scenario1`, run: `cwltool --provenance ro wf_example.cwl job_wf_example.yml`

# scenario 2
2-step workflow which takes 6 inputs and produces 2 outputs.

Inputs: 
1. step 1 file input `./scenario2/input1_file.txt` (default specified at CLT level)
2. step 1 string input `"step1_string_input"` (default specified at CLT level)
3. step 2 file input `./scenario2/input2_file.txt` (default specified at CLT level)
4. step 2 string input `"step2_string_input"` (default specified at CLT level)
5. both steps file input `./scenario2/input_all_file.txt` (default wf input parameter)
6. both steps string input `"both_steps_string_input"` (default wf input parameter)

Outputs:
1. Produced by step 1: `./scenario2/output_step1.txt`
2. Produced by step 2: `./scenario2/output_step2.txt`

From `scenario2/`, run `cwltool --provenance ro wf.cwl`

`ro/metadata/provenance/` contains an annotated version of the `.ttl` file (`primary.cwlprov_annotated.ttl`).

Observations about `primary.cwlprov*.ttl`:
- `data:...` are the files, e.g. `input_all_file.txt`.
- `id:..` is that file *as an input*. Hence `input_all_file.txt` has 2 `id:...` since it is used in both steps of the workflow.
- The descriptions of the workflow steps list all the inputs that are used in that step (including those which have default values at CLT level). 
- The description of the main workflow only lists the workflow inputs (also if they have default values at wf input level), but not those which have default values at CLT level.
- output files are listed at the top of the file

# scenario 3
Multi-step workflow where one of the steps is a nested workflow?

# scenario 4
Multistep workflow where the output of step 1 is the input for step 2?

# scenario 5
workflow where inputs have default values at wf step level. Are these default values listed in description of packed.cwl#main?