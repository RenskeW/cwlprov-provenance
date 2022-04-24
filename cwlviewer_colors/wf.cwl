#!/usr/bin/env cwl-runner

cwlVersion: v1.2
class: Workflow

inputs:
  wf_clt_input:
    type: string
    default: "clt_input_value"
  wf_operation_input:
    type: string
    default: "operation_input_value"

outputs: 
  clt_output:
    type: string
    outputSource: operation_step1/operation_output

steps:
  operation_step1:
    label: "Operation step"
    in: 
      operation_input: wf_operation_input
    out: 
      [operation_output]
    run:
      class: Operation
      inputs:
        operation_input: string
      outputs:
        operation_output: string
    doc: |
      "First step is an operation."
  clt_step2:
    label: "CLT step"
    in:
      clt_input: wf_clt_input
      clt_input2: operation_step1/operation_output
    out: []
    run:
      class: CommandLineTool
      baseCommand: echo
      arguments:
      - $(inputs.clt_input)
      - $(inputs.clt_input2)
      inputs:
        clt_input:
          type: string
        clt_input2:
          type: string
      outputs: []
    doc: |
      "Second step is a CommandLineTool."


    

