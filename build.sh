#!/bin/bash

virtualenv venv
source venv/bin/activate
pip3 install -r ./requirements.txt
pip3 isntall PyInstaller
pyinstaller --onefile --windowed main.py
deactivate