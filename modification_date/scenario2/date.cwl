#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: [date, "-r"]

stdout: "modification_date.txt"

inputs:
  file:
    type: File
    inputBinding:
      position: 1
    default:
      class: File
      location: https://ibi.vu.nl/downloads/multi-task-PPI/test_ppi.zip # last modification date: 2021-12-14 15:23

outputs:
  datetime:
    type: stdout