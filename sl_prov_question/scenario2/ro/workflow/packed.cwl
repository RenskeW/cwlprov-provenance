{
    "$graph": [
        {
            "baseCommand": "echo",
            "class": "CommandLineTool",
            "stdout": "output_step1.txt",
            "arguments": [
                "Step 1 output:",
                "$(inputs.st1_string_in)",
                "$(inputs.st1_both_string_in)",
                "$(inputs.st1_file_in.path)",
                "$(inputs.st1_both_file_in.path)"
            ],
            "inputs": [
                {
                    "type": "File",
                    "id": "#step1.cwl/st1_both_file_in"
                },
                {
                    "type": "string",
                    "id": "#step1.cwl/st1_both_string_in"
                },
                {
                    "type": "File",
                    "default": {
                        "class": "File",
                        "location": "file:///Users/renskedewit/Documents/Bioinformatics_Systems_Biology/CWLproject/cwlprov-provenance/sl_prov_question/scenario2/input1_file.txt"
                    },
                    "id": "#step1.cwl/st1_file_in"
                },
                {
                    "type": "string",
                    "default": "step1_string_input",
                    "id": "#step1.cwl/st1_string_in"
                }
            ],
            "id": "#step1.cwl",
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
                    "id": "#step1.cwl/st1_print_output",
                    "outputBinding": {
                        "glob": "output_step1.txt"
                    }
                }
            ]
        },
        {
            "baseCommand": "echo",
            "class": "CommandLineTool",
            "stdout": "output_step2.txt",
            "arguments": [
                "Step 2 output:",
                "$(inputs.st2_string_in)",
                "$(inputs.st2_both_string_in)",
                "$(inputs.st2_file_in.path)",
                "$(inputs.st2_both_file_in.path)"
            ],
            "inputs": [
                {
                    "type": "File",
                    "id": "#step2.cwl/st2_both_file_in"
                },
                {
                    "type": "string",
                    "id": "#step2.cwl/st2_both_string_in"
                },
                {
                    "type": "File",
                    "default": {
                        "class": "File",
                        "location": "file:///Users/renskedewit/Documents/Bioinformatics_Systems_Biology/CWLproject/cwlprov-provenance/sl_prov_question/scenario2/input2_file.txt"
                    },
                    "id": "#step2.cwl/st2_file_in"
                },
                {
                    "type": "string",
                    "default": "step2_string_input",
                    "id": "#step2.cwl/st2_string_in"
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "id": "#step2.cwl/st2_print_output",
                    "outputBinding": {
                        "glob": "output_step2.txt"
                    }
                }
            ],
            "id": "#step2.cwl",
            "hints": [
                {
                    "class": "LoadListingRequirement",
                    "loadListing": "deep_listing"
                },
                {
                    "class": "NetworkAccess",
                    "networkAccess": true
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
                        "location": "file:///Users/renskedewit/Documents/Bioinformatics_Systems_Biology/CWLproject/cwlprov-provenance/sl_prov_question/scenario2/input_all_file.txt"
                    },
                    "id": "#main/both_input_file"
                },
                {
                    "type": "string",
                    "default": "both_steps_string_input",
                    "id": "#main/both_input_string"
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "outputSource": "#main/step1/st1_print_output",
                    "id": "#main/outfile1"
                },
                {
                    "type": "File",
                    "outputSource": "#main/step2/st2_print_output",
                    "id": "#main/outfile2"
                }
            ],
            "steps": [
                {
                    "in": [
                        {
                            "source": "#main/both_input_file",
                            "id": "#main/step1/st1_both_file_in"
                        },
                        {
                            "source": "#main/both_input_string",
                            "id": "#main/step1/st1_both_string_in"
                        }
                    ],
                    "out": [
                        "#main/step1/st1_print_output"
                    ],
                    "run": "#step1.cwl",
                    "id": "#main/step1"
                },
                {
                    "in": [
                        {
                            "source": "#main/both_input_file",
                            "id": "#main/step2/st2_both_file_in"
                        },
                        {
                            "source": "#main/both_input_string",
                            "id": "#main/step2/st2_both_string_in"
                        }
                    ],
                    "out": [
                        "#main/step2/st2_print_output"
                    ],
                    "run": "#step2.cwl",
                    "id": "#main/step2"
                }
            ],
            "id": "#main"
        }
    ],
    "cwlVersion": "v1.2"
}