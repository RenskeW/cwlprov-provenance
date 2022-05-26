{
    "$graph": [
        {
            "class": "CommandLineTool",
            "baseCommand": "python3",
            "arguments": [
                "$(inputs.script.path)",
                "$(inputs.zenodo_dataset.path)"
            ],
            "inputs": [
                {
                    "type": "File",
                    "default": {
                        "class": "File",
                        "location": "file:///Users/renskedewit/Documents/Bioinformatics_Systems_Biology/CWLproject/cwlprov-provenance/cwl_metadata/annotated_prov_example/script.py"
                    },
                    "id": "#tool.cwl/script"
                },
                {
                    "type": "File",
                    "id": "#tool.cwl/zenodo_dataset"
                }
            ],
            "id": "#tool.cwl",
            "outputs": []
        },
        {
            "class": "Workflow",
            "inputs": [
                {
                    "type": "File",
                    "id": "#main/zenodo_dataset"
                }
            ],
            "outputs": [],
            "steps": [
                {
                    "run": "#tool.cwl",
                    "in": [
                        {
                            "source": "#main/zenodo_dataset",
                            "id": "#main/tool/zenodo_dataset"
                        }
                    ],
                    "out": [],
                    "id": "#main/tool"
                }
            ],
            "id": "#main"
        }
    ],
    "cwlVersion": "v1.2"
}