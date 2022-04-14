#!/usr/bin/env cwl-runner

cwlVersion: v1.0
baseCommand: echo
class: CommandLineTool

stdout: nested1_output.txt

arguments:
- "Nested step 1 output:"
- $(inputs.st1_main_in)
- $(inputs.st1_main_step_in)
- $(inputs.st1_nested_step_in)
- $(inputs.st1_clt_in)

inputs:
  st1_main_in:
    type: string
  st1_main_step_in:
    type: string
  st1_nested_step_in:
    type: string
  st1_clt_in:
    type: string
    default: "st1_clt"

outputs: 
  st1_print_output:
    type: stdout