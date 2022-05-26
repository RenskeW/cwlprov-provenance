#!/usr/bin/env cwl-runner

cwlVersion: v1.2
class: CommandLineTool
baseCommand: python3

arguments:
- $(inputs.script.path)
- $(inputs.zenodo_dataset.path)

inputs:
  script:
    type: File
    default:
      class: File
      location: ./script.py
  zenodo_dataset:
    type: File
  
outputs: []


