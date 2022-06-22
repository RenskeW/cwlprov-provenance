{
    "$graph": [
        {
            "class": "CommandLineTool",
            "baseCommand": [
                "date",
                "-r"
            ],
            "inputs": [
                {
                    "type": "File",
                    "inputBinding": {
                        "position": 1
                    },
                    "id": "#date.cwl/file"
                }
            ],
            "id": "#date.cwl",
            "outputs": []
        },
        {
            "class": "CommandLineTool",
            "baseCommand": "echo",
            "arguments": [
                "$(inputs.input_file.path)",
                "$(inputs.input_dir.path)"
            ],
            "inputs": [
                {
                    "type": "Directory",
                    "id": "#echo.cwl/input_dir"
                },
                {
                    "type": "File",
                    "id": "#echo.cwl/input_file"
                }
            ],
            "outputs": [],
            "id": "#echo.cwl"
        },
        {
            "class": "Workflow",
            "inputs": [
                {
                    "type": "Directory",
                    "id": "#main/pdb_dir"
                },
                {
                    "type": "File",
                    "format": "https://www.iana.org/assignments/media-types/text/tab-separated-values",
                    "id": "#main/sabdab_file"
                }
            ],
            "outputs": [],
            "steps": [
                {
                    "label": "Prints date of input file",
                    "in": [
                        {
                            "source": "#main/sabdab_file",
                            "id": "#main/date_step/file"
                        }
                    ],
                    "out": [],
                    "run": "#date.cwl",
                    "id": "#main/date_step"
                },
                {
                    "label": "Echo paths of input file & directory",
                    "in": [
                        {
                            "source": "#main/pdb_dir",
                            "id": "#main/echo_step/input_dir"
                        },
                        {
                            "source": "#main/sabdab_file",
                            "id": "#main/echo_step/input_file"
                        }
                    ],
                    "out": [],
                    "run": "#echo.cwl",
                    "id": "#main/echo_step"
                }
            ],
            "id": "#main"
        }
    ],
    "cwlVersion": "v1.2"
}