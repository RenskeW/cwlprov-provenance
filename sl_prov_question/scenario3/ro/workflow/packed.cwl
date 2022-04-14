{
    "$graph": [
        {
            "class": "Workflow",
            "inputs": [
                {
                    "type": "string",
                    "id": "#nested.cwl/main_input1"
                },
                {
                    "type": "string",
                    "id": "#nested.cwl/main_input2"
                },
                {
                    "type": "string",
                    "id": "#nested.cwl/step_input1"
                },
                {
                    "type": "string",
                    "id": "#nested.cwl/step_input2"
                }
            ],
            "steps": [
                {
                    "in": [
                        {
                            "source": "#nested.cwl/main_input1",
                            "id": "#nested.cwl/step1/st1_main_in"
                        },
                        {
                            "source": "#nested.cwl/step_input1",
                            "id": "#nested.cwl/step1/st1_main_step_in"
                        },
                        {
                            "default": "st1_nested_step",
                            "id": "#nested.cwl/step1/st1_nested_step_in"
                        }
                    ],
                    "out": [
                        "#nested.cwl/step1/st1_print_output"
                    ],
                    "run": "#step1_nested.cwl",
                    "id": "#nested.cwl/step1"
                },
                {
                    "in": [
                        {
                            "source": "#nested.cwl/main_input2",
                            "id": "#nested.cwl/step2/st2_main_in"
                        },
                        {
                            "source": "#nested.cwl/step_input2",
                            "id": "#nested.cwl/step2/st2_main_step_in"
                        },
                        {
                            "default": "st2_nested_step",
                            "id": "#nested.cwl/step2/st2_nested_step_in"
                        }
                    ],
                    "out": [
                        "#nested.cwl/step2/st2_print_output"
                    ],
                    "run": "#step2_nested.cwl",
                    "id": "#nested.cwl/step2"
                }
            ],
            "id": "#nested.cwl",
            "outputs": [
                {
                    "type": "File",
                    "outputSource": "#nested.cwl/step1/st1_print_output",
                    "id": "#nested.cwl/outfile1"
                },
                {
                    "type": "File",
                    "outputSource": "#nested.cwl/step2/st2_print_output",
                    "id": "#nested.cwl/outfile2"
                }
            ]
        },
        {
            "baseCommand": "echo",
            "class": "CommandLineTool",
            "stdout": "nested1_output.txt",
            "arguments": [
                "Nested step 1 output:",
                "$(inputs.st1_main_in)",
                "$(inputs.st1_main_step_in)",
                "$(inputs.st1_nested_step_in)",
                "$(inputs.st1_clt_in)"
            ],
            "inputs": [
                {
                    "type": "string",
                    "default": "st1_clt",
                    "id": "#step1_nested.cwl/st1_clt_in"
                },
                {
                    "type": "string",
                    "id": "#step1_nested.cwl/st1_main_in"
                },
                {
                    "type": "string",
                    "id": "#step1_nested.cwl/st1_main_step_in"
                },
                {
                    "type": "string",
                    "id": "#step1_nested.cwl/st1_nested_step_in"
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "id": "#step1_nested.cwl/st1_print_output",
                    "outputBinding": {
                        "glob": "nested1_output.txt"
                    }
                }
            ],
            "id": "#step1_nested.cwl",
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
            "baseCommand": "echo",
            "class": "CommandLineTool",
            "stdout": "nested2_output.txt",
            "arguments": [
                "Nested step 2 output:",
                "$(inputs.st2_main_in)",
                "$(inputs.st2_main_step_in)",
                "$(inputs.st2_nested_step_in)",
                "$(inputs.st2_clt_in)"
            ],
            "inputs": [
                {
                    "type": "string",
                    "default": "st2_clt",
                    "id": "#step2_nested.cwl/st2_clt_in"
                },
                {
                    "type": "string",
                    "id": "#step2_nested.cwl/st2_main_in"
                },
                {
                    "type": "string",
                    "id": "#step2_nested.cwl/st2_main_step_in"
                },
                {
                    "type": "string",
                    "id": "#step2_nested.cwl/st2_nested_step_in"
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "id": "#step2_nested.cwl/st2_print_output",
                    "outputBinding": {
                        "glob": "nested2_output.txt"
                    }
                }
            ],
            "id": "#step2_nested.cwl",
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
            "requirements": [
                {
                    "class": "SubworkflowFeatureRequirement"
                }
            ],
            "inputs": [
                {
                    "type": "string",
                    "default": "st1_main",
                    "id": "#main/wf_main_input1"
                },
                {
                    "type": "string",
                    "default": "st2_main",
                    "id": "#main/wf_main_input2"
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "outputSource": "#main/step/outfile1",
                    "id": "#main/outfile1"
                },
                {
                    "type": "File",
                    "outputSource": "#main/step/outfile2",
                    "id": "#main/outfile2"
                }
            ],
            "steps": [
                {
                    "in": [
                        {
                            "source": "#main/wf_main_input1",
                            "id": "#main/step/main_input1"
                        },
                        {
                            "source": "#main/wf_main_input2",
                            "id": "#main/step/main_input2"
                        },
                        {
                            "default": "st1_main_step",
                            "id": "#main/step/step_input1"
                        },
                        {
                            "default": "st2_main_step",
                            "id": "#main/step/step_input2"
                        }
                    ],
                    "out": [
                        "#main/step/outfile1",
                        "#main/step/outfile2"
                    ],
                    "run": "#nested.cwl",
                    "id": "#main/step"
                }
            ],
            "id": "#main"
        }
    ],
    "cwlVersion": "v1.2"
}