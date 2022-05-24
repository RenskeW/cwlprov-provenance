# Last modification date of a remote file

## Scenario 1: Use curl to download a remote file for which last modification date was not today.
- `curl --remote-time https://ibi.vu.nl/downloads/multi-task-PPI/test_ppi.zip --output test_ppi.zip` retains the modification timestamp of the remote file if it is available. WIthout `--remote-time`, the download datetime is used as last modification timestamp of the file.

## Build simple CWL workflow to download file & extract datetime
- Last modification timestamp = timestamp of remote file, not the download datetime.

## Scenario 3: Specify remote location as file location
- Last modification datetime is the download modification datetime

Conclusion: use `curl --remote-time`; specifying a remote location for a file will set the last modification date to the download date.

