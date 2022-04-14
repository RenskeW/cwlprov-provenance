#!/usr/bin/env cwl-runner

cwlVersion: v1.0
baseCommand: echo
class: CommandLineTool

stdout: nested2_output.txt

arguments:
- "Nested step 2 output:"
- $(inputs.st2_main_in)
- $(inputs.st2_main_step_in)
- $(inputs.st2_nested_step_in)
- $(inputs.st2_clt_in)

inputs:
  st2_main_in:
    type: string
  st2_main_step_in:
    type: string
  st2_nested_step_in:
    type: string
  st2_clt_in:
    type: string
    default: "st2_clt"

outputs: 
  st2_print_output:
    type: stdout