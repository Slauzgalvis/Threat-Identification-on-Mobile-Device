#!/bin/bash
clear
namuvieta=`pwd`
cd /run/user/1000/gvfs
ls > $namuvieta/lsmtp.txt

cd /media/*
ls > $namuvieta/ls1.txt
cat -n $namuvieta/ls1.txt > $namuvieta/ls.txt

echo $'Directories:\n'
echo "     0  `cat $namuvieta/lsmtp.txt`"
cat $namuvieta/ls.txt
echo
read -p "Write Directory of Device To Analyze: " ATSAKYMAS
#################################################
if (($ATSAKYMAS==0)); then
cd /run/user/1000/gvfs/*/*
find -name "*.mp4" -exec cp {} $namuvieta/Video \;
cd $namuvieta/Video
#
for file in *.mp4;
do
dir=${file%.*}
mkdir -p "$dir"
mv "$file" "$dir"
cd $dir

DATE=`date +%Y-%m-%d_%H:%M:%S`
echo "Time:" > fingerprint.txt
echo "$DATE" >> fingerprint.txt
echo "md5sum: " >> fingerprint.txt
md5sum $file >> fingerprint.txt
echo "sha1sum: " >> fingerprint.txt
sha1sum $file >> fingerprint.txt
exiftool $file > exiftool.txt

sudo ffmpeg -i $file -r 0.5 -f image2 image-%04d.png
cd ..
done
#
#################################################
else 
DIREKTORIJA=`sed -n "${ATSAKYMAS}p" $namuvieta/ls1.txt`
cd $DIREKTORIJA
find -name "*.mp4" -exec cp {} $namuvieta/Video \;
cd $namuvieta/Video
#
for file in *.mp4;
do
dir=${file%.*}
mkdir -p "$dir"
mv "$file" "$dir"
cd $dir

DATE=`date +%Y-%m-%d_%H:%M:%S`
echo "Time:" > fingerprint.txt
echo "$DATE" >> fingerprint.txt
echo "md5sum: " >> fingerprint.txt
md5sum $file >> fingerprint.txt
echo "sha1sum: " >> fingerprint.txt
sha1sum $file >> fingerprint.txt
exiftool $file > exiftool.txt

sudo ffmpeg -i $file -r 0.5 -f image2 image-%04d.png
cd ..
done
#
fi
#################################################
rm failai.txt
cd ../Scripts/Video
./video_html.sh > page.html
xdg-open page.html

cd ../..
rm ls.txt
rm ls1.txt
rm lsmtp.txt
