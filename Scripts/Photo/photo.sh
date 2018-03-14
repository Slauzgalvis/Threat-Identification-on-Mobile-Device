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
cd ~/../../../run/user/1000/gvfs/*/*
find -name "*.jpg" -exec cp {} $namuvieta/Photo \;
cd $namuvieta
detox -r Photo
cd Photo
#
for file in *.jpg;
do
dir=${file%.*}
mkdir -p "$dir"
DATE=`date +%Y-%m-%d_%H:%M:%S`
echo "Time:" > $dir/fingerprint.txt
echo "$DATE" >> $dir/fingerprint.txt
exiftool $file > $dir/exif_info.txt
echo "md5sum: " >> $dir/fingerprint.txt
md5sum $file >> $dir/fingerprint.txt
echo "sha1sum: " >> $dir/fingerprint.txt
sha1sum $file >> $dir/fingerprint.txt

mv "$file" "$dir"
done
#
#################################################
else 
DIREKTORIJA=`sed -n "${ATSAKYMAS}p" $namuvieta/ls1.txt`
cd $DIREKTORIJA
find -name "*.jpg" -exec cp {} $namuvieta/Photo \;
cd $namuvieta
detox -r Photo
cd Photo
#
for file in *.jpg;
do
dir=${file%.*}
mkdir -p "$dir"
DATE=`date +%Y-%m-%d_%H:%M:%S`
echo "Time:" > $dir/fingerprint.txt
echo "$DATE" >> $dir/fingerprint.txt
echo "md5sum: " >> $dir/fingerprint.txt
md5sum $file >> $dir/fingerprint.txt
echo "sha1sum: " >> $dir/fingerprint.txt
sha1sum $file >> $dir/fingerprint.txt
exiftool $file > $dir/exif_info.txt
mv "$file" "$dir"
done
#
fi
#################################################
cd ../Scripts/Photo
./photo_html.sh > page.html
xdg-open page.html

cd ../..
rm ls.txt
rm ls1.txt
rm lsmtp.txt
cd Photo
rm failai.txt
