#!/usr/bin/env cwl-runner

cwlVersion: v1.2
class: Workflow

inputs: []

outputs: []

steps:
  step_docker_pull:
    in: []
    out: []
    run: ./docker_pull.cwl
  step_docker_file:
    in: []
    out: []
    run: ./docker_file.cwl




