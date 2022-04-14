#!/usr/bin/env cwl-runner

cwlVersion: v1.2
class: Workflow

inputs:
  both_input_file: 
    type: File
    default:
      class: File
      location: ./input_all_file.txt
  both_input_string:
    type: string
    default: "both_steps_string_input"

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
      st1_both_file_in: both_input_file
      st1_both_string_in: both_input_string
      # other inputs have default values in CLT description
    out: [ st1_print_output ]
    run: ./step1.cwl
  step2:
    in:
      st2_both_file_in: both_input_file
      st2_both_string_in: both_input_string
      # other inputs have default values in CLT description
    out: [ st2_print_output ]
    run: ./step2.cwl

      