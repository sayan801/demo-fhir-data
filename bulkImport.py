import requests
import json
import os

# Set your Bearer Token here or use an environment variable
# Example: export FHIR_TOKEN="your_token_here"
BEARER_TOKEN = os.getenv("FHIR_TOKEN", "eyJhbGciOiJFUzI1NiIsImtpZCI6IjY5ODBmY2RlLWM1NjUtNDNkOS05YmJhLTUyMGIzNDczMTVmNCIsInR5cCI6IkpXVCJ9.eyJsb2dpbl9pZCI6IjdhMWRmNDIyLTNmNzYtNGMwZS05YTY3LTczZmQ3OTJlMjNhZCIsInN1YiI6IjYxMzc2MGMxLTIyMmQtNDlmOC1hMWNmLWE2ODY1M2ZkYzQ4YSIsInVzZXJuYW1lIjoiNjEzNzYwYzEtMjIyZC00OWY4LWExY2YtYTY4NjUzZmRjNDhhIiwic2NvcGUiOiJvcGVuaWQiLCJwcm9maWxlIjoiUHJhY3RpdGlvbmVyL2UxMjIxZTM5LWNkNGQtNGE3My1iMTI3LWM1ZjM4YjMyMjk5MyIsImlhdCI6MTc2MDM0MTkwMCwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo4MTAzLyIsImV4cCI6MTc2MDM0NTUwMH0.uaoDkWLWRcO5lPzzdUUR3AQW_bnJ65_sKkI_ryd9lC-d1Xc4v-1CxHqeg5EvXjd6MWpq1ae5IReP2aqyLJDHJw")

def upload_bundle(file_path, server_url):
    with open(file_path, 'r') as f:
        bundle = json.load(f)

    headers = {
        "Content-Type": "application/fhir+json",
        "Authorization": f"Bearer {BEARER_TOKEN}"
    }

    response = requests.post(
        f"{server_url}",
        json=bundle,
        headers=headers
    )
    return response.status_code, response.text


# ====== CONFIG ======
# server_url = "http://localhost:8090/fhir"
server_url = "http://localhost:8103/fhir/R4"
data_dir = "Bundle-auto-compiled-bundle"
# data_dir = "./aseno-hapi-technicise"
# data_dir = "./missing_synthea_bundle"
# =====================

for filename in os.listdir(data_dir):
    if filename.endswith('.json'):
        file_path = os.path.join(data_dir, filename)
        status, response = upload_bundle(file_path, server_url)
        print(f"Uploaded {filename}: Status {status}")
        if status >= 400:
            print(f"Response: {response}\n")
