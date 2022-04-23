#!/bin/bash

curl https://rclone.org/install.sh | sudo bash

echo "[UPM_drive]" >> /content/rclone.conf
echo "type = webdav" >> /content/rclone.conf
echo "url = https://drive.upm.es/remote.php/dav/files/daniel.dona/" >> /content/rclone.conf
echo "vendor = nextcloud" >> /content/rclone.conf
echo "user = daniel.dona" >> /content/rclone.conf
echo "pass = hlyjjBPCKDOmynXx6EjpFax8AtFFMBk5aSm3eGVrPlOcLabfgWMe" >> /content/rclone.conf

mkdir /content/persistence
rclone  --config=/content/rclone.conf copy -v --transfers=10 UPM_drive:/Training/vits_colab_ljs_sync/ /content/persistence/

mkdir /content/dataset
rclone  --config=/content/rclone.conf copy -v --transfers=10 UPM_drive:/Datasets/ljs/ /content/dataset/
