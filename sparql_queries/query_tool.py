"""
Python script which runs SPARQL query

"""
import rdflib
from pathlib import Path

def run_query(rdf_file, query_file, input_binding = None):
    """
    file = RDF file; query_file = path to sparql query file.
    """
    g = rdflib.Graph()
    g.parse(rdf_file)
    with open(query_file, 'r')  as f:
        query = f.read()
        
    qres = g.query(query)

    for row in qres:
        print(row)



# qres = g.query(knows_query)
# for row in qres:
#     print(f"{row.aname} knows {row.bname}")

queries_dir = Path(__file__).parent / "queries"

# Extract contents of specific folder
print("\nFiles in this folder:")
folder_id = rdflib.URIRef("urn:uuid:4ae20241-bf95-4357-b2e9-53a1337afc0a") # must be full uri, not namespaced
print(f"Folder id: {folder_id}")
provenance_file = Path(__file__).parent / "labels_wf_primary_cwlprov.ttl"
extract_folder_contents_query = queries_dir / "extract_folder_contents.sparql"
# run_query(provenance_file, extract_folder_contents_query)

# Extract docker images from provenance file
print("\nDocker images in this workflow:")
extract_images_query = queries_dir / "docker_images.sparql"
# run_query(provenance_file, extract_images_query)

# Try with initBindings
print("\nFiles in this folder:")
g = rdflib.Graph()
g.parse(provenance_file)
with open(extract_folder_contents_query, 'r') as f:
    query = f.read()
qres = g.query(query, initBindings={"folder_id": folder_id})
for row in qres:
    print(row)



