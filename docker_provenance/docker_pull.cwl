#!/usr/bin/env cwl-runner

cwlVersion: v1.2 
class: CommandLineTool
baseCommand: python3

hints:
  DockerRequirement:
    dockerPull: amancevice/pandas:1.3.4-slim

arguments:
- $(inputs.script.path)

inputs:
  script:
    type: File
    default:
      class: File
      path: ./test_pandas.py

outputs: []
