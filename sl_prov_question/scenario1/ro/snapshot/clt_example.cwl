#!/usr/bin/env cwl-runner

cwlVersion: v1.0
baseCommand: echo
class: CommandLineTool

stdout: scenario1_output.txt

arguments:
- "CWL CommandLineTool output:"
- $(inputs.file_required.path)
- $(inputs.file_default.path)
- $(inputs.string_required)
- $(inputs.string_default)
- $(inputs.clt_default_file.path)
- $(inputs.clt_default_string)

inputs:
  file_required:
    type: File
  file_default:
    type: File
  string_required:
    type: string
  string_default: 
    type: string
  clt_default_string:
    type: string
    default: "clt_level_default_string"
  clt_default_file:
    type: File
    default: 
      class: File
      location: ./clt_def_file.txt

outputs: 
  clt_print_output:
    type: stdout



