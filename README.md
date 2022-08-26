# cwlprov_provenance

This repository contains the results of several CWLProv-related experiments and their results.

## cachedir_timestamps
If workflow is previously run with `--cachedir` and later with `--provenance`, will the timestamps recorded in the RO correspond to the final execution time (when the cached results were used instead of rerunning the steps) or do they (as they should) represent the time of the execution when the results were cached?

Answer: they do incorrectly represent to the final execution time.

## cwlviewer_colors
Example workflow to test and enhance the `--print-dot` function of cwltool such that it distinguishes between components of class Operation (dashed), Workflow (orange) and CommandLineTool (yellow). See PR #...

## docker_provenance
To assess whether information about docker containers is included in CWLProv provenance.

## modification_date
To assess whether a file specified with a remote location preserves its remote timestamp.

## prov_data_annotations
Comparison of CLWProv provenance before and after the propagation of input data annotations.

## prov_software_annotations
Design for software metadata in CWLProv provenance.

## sl_prov_question
Answer to the question: Are input parameter values included in CWLProv provenance?

## software_citation
Are SoftwareRequirement and DockerRequirement included in CWLProv provenance?

## sparql_queries
Emulated extended provenance graph (`niaa_wf_run/primary.cwlprov.ttl`) and associated SPARQL queries (`sparql_queries.ipynb`) which can extract the newly added information from the RDF graph.