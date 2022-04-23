#!/bin/bash

RUN_DIR=$(rclone lsf UPM:/Training/vits_ljs --max-depth 1 | grep -v "phoneme_cache")

echo "AAA $RUN_DIR BBB"
