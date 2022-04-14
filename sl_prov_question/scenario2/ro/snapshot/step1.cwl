#!/usr/bin/env cwl-runner

cwlVersion: v1.0
baseCommand: echo
class: CommandLineTool

stdout: output_step1.txt

arguments:
- "Step 1 output:"
- $(inputs.st1_string_in)
- $(inputs.st1_both_string_in)
- $(inputs.st1_file_in.path)
- $(inputs.st1_both_file_in.path)

inputs:
  st1_file_in:
    type: File
    default:
      class: File
      location: ./input1_file.txt
  st1_string_in:
    type: string
    default: "step1_string_input"
  st1_both_file_in:
    type: File
  st1_both_string_in:
    type: string

outputs: 
  st1_print_output:
    type: stdout



