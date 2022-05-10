#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool 
hints:
  SoftwareRequirement:
    packages: 
      numpy:
        specs: [ https://anaconda.org/conda-forge/numpy ]

baseCommand: python3
inputs:
  script:
    type: File
    inputBinding: {position: 1}
  fasta:
    type: File 
    inputBinding:
      position: 2
  outdir:
    type: string
    inputBinding: 
      position: 3
      prefix: -o
    default: "pc7_features"

outputs: 
  pc7_features: 
    type: Directory 
    outputBinding:
      glob: $(inputs.outdir)