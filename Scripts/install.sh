#!/bin/bash
echo "The Following Packages Will Be Installed:"
echo
echo "android-tool-adb"
echo "detox"
echo "libimage-exiftool-perl"
echo "ffmpeg"
echo "aapt"
echo
echo "Do You Want To Continue? [Y/n]" 
read YN
YN=${YN,,}
if [ $YN = "y" ]; then
	clear
	echo $' \n *********** Android-tool-adb installing *********** \n\n'
	sudo apt-get install android-tools-adb

	clear
	echo $'\n *********** Detox installing *********** \n\n'
	sudo apt-get install detox

	clear
	echo $'\n *********** Libimage-exiftool-perl installing *********** \n\n'
	sudo apt-get install libimage-exiftool-perl
	
	clear
	echo $'\n *********** Ffmpeg installing *********** \n\n'
	sudo apt-get install ffmpeg

	clear
	echo $'\n *********** Aapt installing *********** \n\n'
	sudo apt-get install aapt
else
pkill -f Main.sh
exit
fi

