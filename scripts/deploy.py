#!/usr/bin/python3
import os

current_dir = os.path.dirname(os.path.realpath(__file__))
build_path = current_dir + "/build/libs"
app_name = os.path.split(os.getcwd())[1]
artifact = None
manifest_found = False

if os.path.isdir(build_path):
    for filename in os.listdir(build_path):
        if filename.endswith("-SNAPSHOT.jar") and filename.startswith(app_name):
            artifact = filename
        if filename == "manifest.lab.yml":
            manifest_found = True

if artifact is None:
    print(f"jar artifact not found in {build_path}, please rebuild...")
    exit(1)

if not manifest_found:
    print(f"manifest.lab.yml not found in {build_path}, please recreate it...")
    exit(1)

artifact_path = build_path + "/" + artifact

deploy = f"cf push -f build/libs/manifest.lab.yml {app_name} -p {artifact_path}"
print("running: " + deploy)
os.system(deploy)

