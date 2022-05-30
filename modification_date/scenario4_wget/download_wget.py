"""
Script which downloads and checks last modification date of remote file using wget.
"""

import os
from datetime import datetime
from pathlib import Path

url = "https://ibi.vu.nl/downloads/multi-task-PPI/test_ppi.zip" # Last modification date: 2021-12-14 15:23
download_path = Path(__file__).parent / "test_ppi.zip"

if os.path.exists(download_path):
    os.remove(download_path)

cmd1 = f"wget {url}"
os.system(cmd1)

out_path = Path(__file__).parent / 'modification_date.txt'

if os.path.exists(out_path):
    os.remove(out_path) 

cmd2 = f"date -r {download_path} > {out_path}"
os.system(cmd2)

with open(out_path, 'r') as f:
    computed_date = f.read().strip('\n')

today = datetime.now()
print(f"Download date is: {today}")
print(f"Last modification date of downloaded file is: {computed_date}")


