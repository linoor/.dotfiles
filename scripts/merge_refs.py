import requests
import os
import subprocess
import json


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

def merge_refs():
    url = "http://localhost:8030/documents/mergeRefs"

    payload = "{\n\t\"references\": {\n\t\t\"7f3cdf66-0b80-4c8c-9c67-faf6c2b804a4\": {\"name\": \"file2.pdf\", \"info\": \"ipsum2\"},\n\t\t\"5cd6eb2d-1e01-48f6-ab0e-5fbf07a96351\": {\"name\": \"file3.pdf\", \"label\": \"label3\"},\n\t\t\"c15bbf33-6dbf-493d-ad4d-d2d02cc8daf6\": {\"name\": \"file4.pdf\", \"label\": \"label4\", \"info\": \"ipsum4\"}\n\t},\n\t\"zip\": true,\n\t\"callback_url\": \"http://10.0.160.190:8080\"\n}"
    headers = {
        'cache-control': "no-cache",
        'content-type': "application/json",
        'postman-token': "9a28587d-654e-4175-a983-2c2c5d321fd1"
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

    with open("response.zip", "wb") as f:
        f.write(response.content)


if __name__ == "__main__":
    if get_consumers_count() == 0:
        add_merge_consumer()

    merge_refs()

    print("removing files in ~/Documents...")
    os.chdir("/home/mpomaran/Documents")
    list_files = os.listdir(os.getcwd())

    for filename in list_files:
        if not 'clean.py' in filename: 
            os.remove(filename)

    ref = input("enter ref: ")
    download_by_ref(ref)

    subprocess.call(["unzip", "response.zip"])
