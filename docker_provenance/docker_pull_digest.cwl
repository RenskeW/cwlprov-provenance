#!/usr/bin/env cwl-runner

cwlVersion: v1.2 
class: CommandLineTool
baseCommand: echo

hints:
  DockerRequirement:
    dockerPull: debian:stable-slim@sha256:bfe148bd4647169a5597ac5e975ecd7809619ccda32b2b8eb909f05eeb14405b


inputs: 
  message: 
    type: string
    default: "Hello world"
    inputBinding:
      position: 1

outputs: []
