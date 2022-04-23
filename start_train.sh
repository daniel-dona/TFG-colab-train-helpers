#!/bin/bash

cd /content/repo/new-recipes

source /content/venv/bin/activate

nohup python3 /content/coqui-ai-TTS/new-recipes/train_vits_colab.py --continue_path /content/persistence/vits_colab_ljs_sync/ 2>&1 > /content/logs/run.log &
