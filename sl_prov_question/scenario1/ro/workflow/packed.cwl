{
    "$graph": [
        {
            "baseCommand": "echo",
            "class": "CommandLineTool",
            "stdout": "scenario1_output.txt",
            "arguments": [
                "CWL CommandLineTool output:",
                "$(inputs.file_required.path)",
                "$(inputs.file_default.path)",
                "$(inputs.string_required)",
                "$(inputs.string_default)",
                "$(inputs.clt_default_file.path)",
                "$(inputs.clt_default_string)"
            ],
            "inputs": [
                {
                    "type": "File",
                    "default": {
                        "class": "File",
                        "location": "file:///Users/renskedewit/Documents/Bioinformatics_Systems_Biology/CWLproject/cwlprov-provenance/sl_prov_question/scenario1/clt_def_file.txt"
                    },
                    "id": "#clt_example.cwl/clt_default_file"
                },
                {
                    "type": "string",
                    "default": "clt_level_default_string",
                    "id": "#clt_example.cwl/clt_default_string"
                },
                {
                    "type": "File",
                    "id": "#clt_example.cwl/file_default"
                },
                {
                    "type": "File",
                    "id": "#clt_example.cwl/file_required"
                },
                {
                    "type": "string",
                    "id": "#clt_example.cwl/string_default"
                },
                {
                    "type": "string",
                    "id": "#clt_example.cwl/string_required"
                }
            ],
            "id": "#clt_example.cwl",
            "hints": [
                {
                    "class": "LoadListingRequirement",
                    "loadListing": "deep_listing"
                },
                {
                    "class": "NetworkAccess",
                    "networkAccess": true
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "id": "#clt_example.cwl/clt_print_output",
                    "outputBinding": {
                        "glob": "scenario1_output.txt"
                    }
                }
            ]
        },
        {
            "class": "Workflow",
            "inputs": [
                {
                    "type": "File",
                    "default": {
                        "class": "File",
                        "location": "file:///Users/renskedewit/Documents/Bioinformatics_Systems_Biology/CWLproject/cwlprov-provenance/sl_prov_question/scenario1/wf_file_def.txt"
                    },
                    "id": "#main/wf_file_default"
                },
                {
                    "type": "File",
                    "id": "#main/wf_file_required"
                },
                {
                    "type": "string",
                    "default": "wf_input_default_string",
                    "id": "#main/wf_string_default"
                },
                {
                    "type": "string",
                    "id": "#main/wf_string_required"
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "outputSource": "#main/wf_print_output/clt_print_output",
                    "id": "#main/out_file"
                }
            ],
            "steps": [
                {
                    "in": [
                        {
                            "source": "#main/wf_file_default",
                            "id": "#main/wf_print_output/file_default"
                        },
                        {
                            "source": "#main/wf_file_required",
                            "id": "#main/wf_print_output/file_required"
                        },
                        {
                            "source": "#main/wf_string_default",
                            "id": "#main/wf_print_output/string_default"
                        },
                        {
                            "source": "#main/wf_string_required",
                            "id": "#main/wf_print_output/string_required"
                        }
                    ],
                    "out": [
                        "#main/wf_print_output/clt_print_output"
                    ],
                    "run": "#clt_example.cwl",
                    "id": "#main/wf_print_output"
                }
            ],
            "id": "#main"
        }
    ],
    "cwlVersion": "v1.2"
}