import requests
import os
import subprocess
import json
from time import sleep
import sys

def get_consumers_count():
    url = "http://0.0.0.0:8032/consumers/data"

    headers = {
        'cache-control': "no-cache",
        'content-type': "application/json",
        'postman-token': "f506a34d-dc91-7638-bb65-a92f04b84120"
        }

    response = requests.request("GET", url, headers=headers)

    return json.loads(response.text)["merge_consumer"]

def add_merge_consumer():
    url = "http://0.0.0.0:8032/consumers/merge"

    headers = {
        'cache-control': "no-cache",
        'content-type': "application/json",
        'postman-token': "83352776-73a2-a13a-dad1-3c4671e210db"
        }

    response = requests.request("POST", url, headers=headers)

    print(response.text)

def merge_refs(*args, **kwargs):
    url = "http://localhost:8030/documents/mergeRefs"

    zzip = kwargs["zzip"]
    payload = "{\n\t\"references\": {\n\t\t\"c13fcf57-fb95-41cf-ae57-5c10d6833b75\": {\"name\": \"assurance.pdf\", \"info\": \"assurance\"},\n\t\t\"b254b8ca-5ca0-4510-b5da-2ac949c8f3e3\": {\"name\": \"watson.pdf\", \"label\": \"watson\"},\n\t\t\"dadc05ab-1431-414d-9e9c-3a5454296c9c\": {\"name\": \"fiche-de-poste.pdf\", \"label\": \"fiche\", \"info\": \"de poste\"}\n\t},\n\t\"zip\": "+zzip+",\n\t\"callback_url\": \"http://10.0.160.190:8080\"\n}"
    headers = {
        'cache-control': "no-cache",
        'content-type': "application/json",
        'postman-token': "2b68adf0-8286-20f8-2b9d-087276a4f2b8"
        }

    response = requests.request("POST", url, data=payload, headers=headers)

    print(response.text)

def download_by_ref(ref):
    url = f"http://0.0.0.0:8030/documents/{ref}"

    payload = "{\n\t\"references\": {\"b2121fc2-4a09-458a-b628-6d86539d5bbb\": \"some file\", \"a4744a7c-1216-4e40-af51-418205c0c663\": \"some other file\"}\n}"
    headers = {
        'cache-control': "no-cache",
        'content-type': "application/json",
        'postman-token': "ded7cf47-00da-85ad-7a28-41119a50afae"
        }

    response = requests.request("GET", url, data=payload, headers=headers)

    extension = "zip" if zzip == "true" else "pdf"
    with open(f"response.{extension}", "wb") as f:
        f.write(response.content)


if __name__ == "__main__":

    if len(sys.argv) <= 1:
        zzip = "true" 
    else:
        zzip = sys.argv[1]

    if get_consumers_count() == 0:
        add_merge_consumer()

    merge_refs(zzip=zzip)

    print("removing files in ~/Documents...")
    os.chdir("/home/mpomaran/Documents")
    list_files = os.listdir(os.getcwd())

    for filename in list_files:
        if not 'clean.py' in filename: 
            os.remove(filename)

    # try to read the reference from logs
    sleep(0.5)
    with open("/var/novapost/sae/logs/worker_output.log", "r") as f:
        last_line = f.readlines()[-1]
        ref = (last_line.split(":")[-1]).strip()
        print(f"ref used: {ref}")

    if not ref:
        ref = input("enter ref: ")
    download_by_ref(ref)



    subprocess.call(["unzip", "response.zip"])
