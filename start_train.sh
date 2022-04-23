#!/bin/bash

cd /content/repo/new-recipes

source /content/venv/bin/activate

nohup python3 /content/repo/new-recipes/train_vits_colab.py --continue_path /content/persistence/ 2>&1 > /content/logs/run.log &
