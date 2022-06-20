{
    "class": "CommandLineTool",
    "baseCommand": "echo",
    "hints": [
        {
            "dockerPull": "debian:stable-slim@sha256:bfe148bd4647169a5597ac5e975ecd7809619ccda32b2b8eb909f05eeb14405b",
            "class": "DockerRequirement"
        }
    ],
    "inputs": [
        {
            "type": "string",
            "default": "Hello world",
            "inputBinding": {
                "position": 1
            },
            "id": "#main/message"
        }
    ],
    "id": "#main",
    "outputs": [],
    "cwlVersion": "v1.2"
}