#!/bin/bash

curl https://rclone.org/install.sh | sudo bash

echo "[UPM]" >> /content/rclone.conf
echo "type = webdav" >> /content/rclone.conf
echo "url = https://drive.upm.es/remote.php/dav/files/daniel.dona/" >> /content/rclone.conf
echo "vendor = nextcloud" >> /content/rclone.conf
echo "user = daniel.dona" >> /content/rclone.conf
echo "pass = hlyjjBPCKDOmynXx6EjpFax8AtFFMBk5aSm3eGVrPlOcLabfgWMe" >> /content/rclone.conf

mkdir /content/persistence
#rclone  --config=/content/rclone.conf copy -v --transfers=10 UPM:/Training/vits_ljs/ /content/persistence/

RUN_DIR=$(rclone --config=/content/rclone.conf lsf UPM:/Training/vits_ljs --max-depth 1 | grep -v "phoneme_cache")

CP_FILE=$(rclone --config=/content/rclone.conf lsl UPM:/Training/vits_ljs/ | grep "checkpoint" | sort -rk 2 | head -n "1" | awk '{print $4}')
BM_FILE=$(rclone --config=/content/rclone.conf lsl UPM:/Training/vits_ljs/ | grep "best_model" | sort -rk 2 | head -n "1" | awk '{print $4}')

rclone  --config=/content/rclone.conf copy -v --transfers=10 UPM:/Training/vits_ljs/phoneme_cache/ /content/persistence/phoneme_cache/

rclone  --config=/content/rclone.conf copy -v --transfers=10 UPM:/Training/vits_ljs/$CP_FILE /content/persistence/$RUN_DIR/
rclone  --config=/content/rclone.conf copy -v --transfers=10 UPM:/Training/vits_ljs/$BM_FILE /content/persistence/$RUN_DIR/
rclone  --config=/content/rclone.conf copy -v --transfers=10 UPM:/Training/vits_ljs/$RUN_DIR/config.json /content/persistence/$RUN_DIR/



mkdir /content/dataset
rclone  --config=/content/rclone.conf copy -v --transfers=10 UPM:/Datasets/ljs/ /content/dataset/
