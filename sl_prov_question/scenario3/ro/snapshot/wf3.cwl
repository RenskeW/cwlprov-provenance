#!/usr/bin/env cwl-runner

cwlVersion: v1.2
class: Workflow

requirements:
  SubworkflowFeatureRequirement: {}

inputs:
  wf_main_input1: 
    type: string
    default:  "st1_main"
  wf_main_input2: 
    type: string
    default: "st2_main" 

outputs: 
  outfile1:
    type: File
    outputSource: step/outfile1
  outfile2:
    type: File
    outputSource: step/outfile2

steps:
  step:
    in:
      main_input1: wf_main_input1
      main_input2: wf_main_input2
      step_input1: { default: "st1_main_step" }
      step_input2: { default: "st2_main_step" }
      # 2 other inputs have default values at nested wf step level
      # 2 other inputs have default values in CLT description
    #out: [ st1_print_output, st2_print_output ]
    out: [ outfile1, outfile2 ]
    run: ./nested.cwl

      