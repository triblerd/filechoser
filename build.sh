#!/bin/bash


echo "Creating a new venv"
python3 -m venv build-env
. ./build-env/bin/activate

# ----- Install dependencies before the build
python3 -m pip install --upgrade pip
python3 -m pip install --upgrade -r requirements.txt

# Create the binary
./build-env/bin/pyinstaller -v
./build-env/bin/pyinstaller --onefile --windowed main.py

# deactivate the virtual env at the end
deactivate