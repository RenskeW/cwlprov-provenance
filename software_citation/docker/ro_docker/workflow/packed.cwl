{
    "class": "CommandLineTool",
    "hints": [
        {
            "dockerPull": "amancevice/pandas:1.3.4-slim",
            "class": "DockerRequirement"
        },
        {
            "packages": [
                {
                    "specs": [
                        "https://anaconda.org/conda-forge/numpy"
                    ],
                    "package": "numpy"
                }
            ],
            "class": "SoftwareRequirement"
        }
    ],
    "baseCommand": "python3",
    "inputs": [
        {
            "type": "File",
            "inputBinding": {
                "position": 2
            },
            "id": "#main/fasta"
        },
        {
            "type": "string",
            "inputBinding": {
                "position": 3,
                "prefix": "-o"
            },
            "default": "pc7_features",
            "id": "#main/outdir"
        },
        {
            "type": "File",
            "inputBinding": {
                "position": 1
            },
            "id": "#main/script"
        }
    ],
    "id": "#main",
    "outputs": [
        {
            "type": "Directory",
            "outputBinding": {
                "glob": "$(inputs.outdir)"
            },
            "id": "#main/pc7_features"
        }
    ],
    "cwlVersion": "v1.0"
}