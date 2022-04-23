#!/bin/bash


RUN_DIR=$(rclone --config=/content/rclone.conf lsf UPM:/Training/vits_ljs --max-depth 1 | grep -v "phoneme_cache")

while true
do

	rclone  --config=/content/rclone.conf copy -v --transfers=10 /content/persistence/$RUN_DIR UPM:/Training/vits_ljs/$RUN_DIR 2>&1 > /content/logs/sync.log
	sleep 5m

done
