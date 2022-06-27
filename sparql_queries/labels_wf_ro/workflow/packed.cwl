{
    "$graph": [
        {
            "class": "Workflow",
            "inputs": [
                {
                    "type": "Directory",
                    "id": "#main/dssp_directory"
                },
                {
                    "type": "Directory",
                    "id": "#main/epitope_directory"
                },
                {
                    "type": "File",
                    "id": "#main/fasta_file"
                },
                {
                    "type": "Directory",
                    "id": "#main/ppi_directory"
                }
            ],
            "steps": [
                {
                    "label": "Combine labels into 1 file per protein sequence.",
                    "run": "#combine_labels.cwl",
                    "in": [
                        {
                            "source": "#main/dssp_directory",
                            "id": "#main/combine_labels/dssp_directory"
                        },
                        {
                            "source": "#main/epitope_directory",
                            "id": "#main/combine_labels/epitope_directory"
                        },
                        {
                            "source": "#main/ppi_directory",
                            "id": "#main/combine_labels/ppi_directory"
                        }
                    ],
                    "out": [
                        "#main/combine_labels/labels_combined"
                    ],
                    "id": "#main/combine_labels"
                },
                {
                    "label": "Calculate PC7 features for each residue in each protein sequence.",
                    "run": "#pc7_inputs.cwl",
                    "in": [
                        {
                            "source": "#main/fasta_file",
                            "id": "#main/generate_pc7/fasta"
                        }
                    ],
                    "out": [
                        "#main/generate_pc7/pc7_features"
                    ],
                    "id": "#main/generate_pc7"
                }
            ],
            "id": "#main",
            "outputs": [
                {
                    "type": "Directory",
                    "outputSource": "#main/combine_labels/labels_combined",
                    "id": "#main/all_labels"
                },
                {
                    "type": "Directory",
                    "outputSource": "#main/generate_pc7/pc7_features",
                    "id": "#main/pc7_inputs"
                }
            ]
        },
        {
            "class": "CommandLineTool",
            "baseCommand": "python3",
            "arguments": [
                "$(inputs.script.path)",
                "$(inputs.epitope_directory.path)",
                "$(inputs.ppi_directory.path)",
                "$(inputs.dssp_directory.path)",
                "--outdir",
                "$(inputs.output_directory)"
            ],
            "inputs": [
                {
                    "type": "Directory",
                    "label": "Directory with DSSP output files.",
                    "id": "#combine_labels.cwl/dssp_directory"
                },
                {
                    "type": "Directory",
                    "label": "Directory with FASTA files with epitope annotations.",
                    "id": "#combine_labels.cwl/epitope_directory"
                },
                {
                    "type": "string",
                    "default": "./combined_labels",
                    "id": "#combine_labels.cwl/output_directory"
                },
                {
                    "type": "Directory",
                    "label": "Directory with FASTA files with PPI annotations.",
                    "id": "#combine_labels.cwl/ppi_directory"
                },
                {
                    "type": "File",
                    "default": {
                        "class": "File",
                        "location": "file:///Users/renskedewit/Documents/GitHub/cwl-epitope/tools/combine_labels.py"
                    },
                    "id": "#combine_labels.cwl/script"
                }
            ],
            "outputs": [
                {
                    "type": "Directory",
                    "outputBinding": {
                        "glob": "$(inputs.output_directory)"
                    },
                    "id": "#combine_labels.cwl/labels_combined"
                }
            ],
            "id": "#combine_labels.cwl"
        },
        {
            "class": "CommandLineTool",
            "hints": [
                {
                    "class": "LoadListingRequirement",
                    "loadListing": "deep_listing"
                },
                {
                    "class": "NetworkAccess",
                    "networkAccess": true
                },
                {
                    "dockerPull": "amancevice/pandas:1.3.4-slim",
                    "class": "DockerRequirement"
                }
            ],
            "baseCommand": "python3",
            "label": "Script which generates pc7 input features.",
            "doc": "PC7 features are assigned to each residue in each protein sequence. Output is a directory of files (1 per sequence).",
            "inputs": [
                {
                    "type": "File",
                    "format": "http://edamontology.org/format_2200",
                    "inputBinding": {
                        "position": 2
                    },
                    "default": {
                        "class": "File",
                        "location": "file:///Users/renskedewit/Documents/GitHub/cwl-epitope/test.fasta"
                    },
                    "id": "#pc7_inputs.cwl/fasta"
                },
                {
                    "type": "string",
                    "inputBinding": {
                        "position": 3,
                        "prefix": "-o"
                    },
                    "default": "pc7_features",
                    "id": "#pc7_inputs.cwl/outdir"
                },
                {
                    "type": "File",
                    "default": {
                        "class": "File",
                        "location": "file:///Users/renskedewit/Documents/GitHub/cwl-epitope/tools/get_pc7_inputs.py"
                    },
                    "inputBinding": {
                        "position": 1
                    },
                    "id": "#pc7_inputs.cwl/script"
                }
            ],
            "outputs": [
                {
                    "type": "Directory",
                    "outputBinding": {
                        "glob": "$(inputs.outdir)"
                    },
                    "id": "#pc7_inputs.cwl/pc7_features"
                }
            ],
            "id": "#pc7_inputs.cwl",
            "https://schema.org/mainEntity": {
                "https://schema.org/programmingLanguage": "Python",
                "https://schema.org/codeRepository": "https://github.com/RenskeW/cwl-epitope/blob/b5e31d42006fd7003716f57963646d47d1154549/tools/get_pc7_inputs.py",
                "https://schema.org/isBasedOn": [
                    {
                        "class": "https://schema.org/SoftwareApplication",
                        "https://schema.org/name": "OPUS-TASS",
                        "https://schema.org/identifier": "https://bio.tools/opus-tass"
                    }
                ]
            }
        }
    ],
    "cwlVersion": "v1.2",
    "$schemas": [
        "https://schema.org/version/latest/schemaorg-current-https.rdf",
        "https://edamontology.org/EDAM_1.25.owl"
    ]
}