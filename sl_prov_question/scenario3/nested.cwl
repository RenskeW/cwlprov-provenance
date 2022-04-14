#!/usr/bin/env cwl-runner

cwlVersion: v1.2
class: Workflow

inputs:
  main_input1: # default at main wf level
    type: string
  main_input2:
    type: string
  step_input1: # default at main wf step level
    type: string
  step_input2:
    type: string

outputs: 
  outfile1:
    type: File
    outputSource: step1/st1_print_output
  outfile2:
    type: File
    outputSource: step2/st2_print_output

steps:
  step1:
    in:
      st1_main_in: main_input1
      st1_main_step_in: step_input1
      st1_nested_step_in: { default: "st1_nested_step" }
      # other input has default values in CLT description
    out: [ st1_print_output ]
    run: ./step1_nested.cwl
  step2:
    in:
      st2_main_in: main_input2
      st2_main_step_in: step_input2
      st2_nested_step_in: { default: "st2_nested_step" }
      # other input has default values in CLT description
    out: [ st2_print_output ]
    run: ./step2_nested.cwl

      