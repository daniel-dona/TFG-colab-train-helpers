#!/bin/bash

while true
do

	rclone  --config=/content/rclone.conf copy -v --transfers=10 /content/persistence/ UPM_drive:/Training/vits_ljs/ 2>&1 > /content/logs/sync.log
	sleep 5m

done
