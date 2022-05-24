#!/usr/bin/env cwl-runner

cwlVersion: v1.2
class: CommandLineTool
baseCommand: [curl, "--remote-time"]

arguments:
- $(inputs.url)
- "--output"
- $(inputs.out_file)

inputs:
  url: string
  out_file: string

outputs:
  file_download:
    type: File
    outputBinding:
      glob: $(inputs.out_file)
  
  

