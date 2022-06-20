#!/usr/bin/env cwl-runner

cwlVersion: v1.2
class: CommandLineTool
baseCommand: python3

hints:
  DockerRequirement:
    dockerImageId: python_image:3.9
    dockerFile: |                                                             
      FROM docker.io/debian:stable-slim                                                                                                                         
      RUN apt-get update && apt-get install -y --no-install-recommends python3-pip

arguments:
- $(inputs.script.path)

inputs:
  script:
    type: File
    default:
      class: File
      location: ./test_python.py

outputs: []