# `--cachedir`

Objective: Understand which timestamps are used with `--provenance` if `--cachedir` is used simultaneously.

## Experiment
- Execute workflow with `--cachedir` only, each time adding one extra step. Hence cached output will be used for the subsequent steps.
- After all the steps are executed, rerun workflow with `--provenance` and check the timestamps. Are the execution times corresponding to the original time the steps were executed or the final, full workflow execution?

## Files/directories
- `cachedirs` Contains copies of `cachedir` directory after each step (hence we see that each time extra steps are added)
- `ro` the research object created by `cwltool --cachedir cachedir --provenance ./ro wf.cwl wf_job.yml`

Execution times:
- Step 1: `13:25`
- Step 1+2: `13:29`
- Step 1-3: `13:35`
- Final execution with `--provenance`: `13:43`

## Conclusions
- Timestamps in primary.cwlprov.* correspond to the final execution (= 13:43).
- Consequence 1: Duration of step executions are not reliable
- Consequence 2: If downloads are part of workflow, download dates are not correct (could be months later)