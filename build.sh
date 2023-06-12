#!/bin/bash

if [ ! -z "$VENV" ]; then
  echo "Setting venv to $VENV"
  source $VENV/bin/activate
else
  echo "Creating a new venv"
  python3 -m venv build-env
  . ./build-env/bin/activate
fi

# ----- Install dependencies before the build
python3 -m pip install --upgrade pip
python3 -m pip install --upgrade -r requirements.txt

# Create the binary
python3 -m pyinstaller -v
python3 -m pyinstaller --onefile --windowed main.py

# deactivate the virtual env at the end
deactivate