# Why
To make CWLViewer produce colours specific for the type of operation (CommandLineTool, Workflow and Operation).
Description of files:
- `wf.cwl`: a workflow with 1 CommandLineTool step and 1 Operation step
- `wf_original_graph.svg`: Workflow graph generated with cwltool version 3.1.20220224085855 (`cwltool --print-dot wf.cwl | dot -Tsvg > wf_original_graph.svg`)
- `wf.ttl`: RDF description of workflow, input to CWLViewer
