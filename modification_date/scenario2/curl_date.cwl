#!/ur/bin/env cwl-runner

cwlVersion: v1.2
class: Workflow

inputs:
  remote_file:
    type: string
    default: "https://ibi.vu.nl/downloads/multi-task-PPI/test_ppi.zip"
  download_name:
    type: string
    default: "test_ppi.zip"

outputs: 
  timestamp:
    type: File
    outputSource: extract_timestamp/datetime

steps:
  download:
    run: ./curl.cwl
    in:
      url: remote_file
      out_file: download_name
    out: [ file_download ]
    label: Download the remote file using curl --remote-time
  extract_timestamp:
    run: ./date.cwl  
    in:
      file: download/file_download
    out: [ datetime ]
    label: Extract the timestamp of the downloaded file, stored in modification_date.txt

  
