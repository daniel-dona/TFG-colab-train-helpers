#!/bin/bash

echo "Installing python venv"

apt-get install python3.7 python3.7-venv
python3 -m venv /content/venv

