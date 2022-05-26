#!/usr/bin/env cwl-runner

cwlVersion: v1.2
class: Workflow

inputs:
  zenodo_dataset: File

outputs: []

steps:
  tool:
    run: ./tool.cwl
    in:
      zenodo_dataset: zenodo_dataset
    out: []



      


