{
    "class": "CommandLineTool",
    "baseCommand": "python3",
    "hints": [
        {
            "dockerImageId": "python_image:3.9",
            "dockerFile": "FROM docker.io/debian:stable-slim                                                                                                                         \nRUN apt-get update && apt-get install -y --no-install-recommends python3-pip\n",
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
                "location": "file:///Users/renskedewit/Documents/Bioinformatics_Systems_Biology/CWLproject/cwlprov-provenance/docker_provenance/test_python.py"
            },
            "id": "#main/script"
        }
    ],
    "id": "#main",
    "outputs": [],
    "cwlVersion": "v1.2"
}