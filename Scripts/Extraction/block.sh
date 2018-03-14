#!/bin/bash
DIREKTORIJA=`pwd`
adb shell su -c chmod -R 777 dev/block
clear
echo "Pulling System Image Out of The Device" 
echo "It Will Take Some Time (From 5 To 20 Minutes)" 
echo

adb pull /dev/block/mmcblk0 Blocks/userdata.img
fdisk -l Blocks/userdata.img | grep ^Device* > fdisk1.txt
fdisk -l Blocks/userdata.img | grep ^Blocks* | sed '/unknown/d' > fdisk.txt
sudo mkdir /mnt/TeamFly
EILES=`grep -c "^" fdisk.txt`
for (( i=1; i <= $EILES; ++i ))
do

BLOCK=`sed -n "${i}p" fdisk.txt`
value=$(echo $BLOCK |awk '{print $2}')
sudo mkdir /mnt/TeamFly/$i
sudo mount -t auto -o loop,offset=$(($value * 512)) Blocks/userdata.img /mnt/TeamFly/$i
[ "$(ls -A /mnt/TeamFly/$i)" ] && ats=1 || ats=0

if ((ats==0)); then
sudo umount /mnt/TeamFly/$i
sudo rm -rf /mnt/TeamFly/$i
echo "****************** Failed to mount ******************" >> mount.txt
echo "Directory $i/" >> mount.txt
echo $BLOCK >> mount.txt
echo "*****************************************************" >> mount.txt
else
echo "Directory $i/" >> mount.txt
echo $BLOCK >> mount.txt
fi

done
clear
echo
echo "********************************** Mounted **********************************"
echo
cat fdisk1.txt
cat mount.txt
echo
echo "************** Mounted Sectors Check in /mnt/TeamFly Directory *************"
rm *.txt

