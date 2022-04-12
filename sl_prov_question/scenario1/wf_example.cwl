#!/usr/bin/env cwl-runner

cwlVersion: v1.2
class: Workflow

inputs:
  wf_file_required: File
  wf_file_default: 
    type: File
    default:
      class: File
      location: ./wf_file_def.txt
  wf_string_required: string
  wf_string_default: 
    type: string
    default: "wf_input_default_string"

outputs: 
  out_file:
    type: File
    outputSource: wf_print_output/clt_print_output

steps:
  wf_print_output:
    in: 
      file_required: wf_file_required
      file_default: wf_file_default
      string_required: wf_string_required
      string_default: wf_string_default
    out: [ clt_print_output ]
    run: ./clt_example.cwl

      