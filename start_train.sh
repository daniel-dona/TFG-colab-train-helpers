#!/bin/bash

RUN_DIR=$(rclone --config=/content/rclone.conf lsf UPM:/Training/vits_ljs --max-depth 1 | grep -v "phoneme_cache")


cd /content/repo/new-recipes

source /content/venv/bin/activate

nohup python3 /content/repo/new-recipes/train_vits_colab.py --continue_path /content/persistence/$RUN_DIR 2>&1 > /content/logs/run.log &
