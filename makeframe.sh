#!/bin/bash
pwd && ls -a
LINK="https://drive.google.com/uc?id=1szSZvOG9vXj93C0WmCszEHP6-C3jG4sh"
cd /usr/src/app
gdown $LINK
file ben10AFS01.zip
mkdir -pv videos/raw && unzip -d ./videos/ -j ben10AFS01.zip
ls -a
ffmpeg -copyts -i "./videos/${VIDEO_NAME}" -r 1000 -vf "mpdecimate=hi=64*12*15:lo=64*5*15:frac=1" -frame_pts true -vsync vfr -q:v 5 "./videos/raw/%08d.jpg"
python3 yafot-facebook.py --page-id $PAGE_ID --pdir "videos/raw/" --token $ACCESS_TOKEN --start $START --count 5000 --delay 60
