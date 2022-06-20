{
    "class": "CommandLineTool",
    "baseCommand": "python3",
    "hints": [
        {
            "dockerPull": "amancevice/pandas:1.3.4-slim",
            "class": "DockerRequirement"
        }
    ],
    "arguments": [
        "$(inputs.script.path)"
    ],
    "inputs": [
        {
            "type": "File",
            "default": {
                "class": "File",
                "path": "file:///Users/renskedewit/Documents/Bioinformatics_Systems_Biology/CWLproject/cwlprov-provenance/docker_provenance/test.py"
            },
            "id": "#main/script"
        }
    ],
    "id": "#main",
    "outputs": [],
    "cwlVersion": "v1.2"
}