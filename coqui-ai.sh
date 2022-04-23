#!/bin/bash

git clone https://github.com/daniel-dona/coqui-ai-TTS
mv coqui-ai-TTS /content/repo

cd /content/repo
source /content/venv/bin/activate;
pip install -e .[all]
# Temporal fix
pip install git+https://github.com/coqui-ai/Trainer
pip install ipykernel
