#!/usr/bin/env cwl-runner

cwlVersion: v1.0
baseCommand: echo
class: CommandLineTool

stdout: output_step2.txt

arguments:
- "Step 2 output:"
- $(inputs.st2_string_in)
- $(inputs.st2_both_string_in)
- $(inputs.st2_file_in.path)
- $(inputs.st2_both_file_in.path)

inputs:
  st2_file_in:
    type: File
    default:
      class: File
      location: ./input2_file.txt
  st2_string_in:
    type: string
    default: "step2_string_input"
  st2_both_file_in:
    type: File
  st2_both_string_in:
    type: string

outputs: 
  st2_print_output:
    type: stdout



