#!/bin/bash
echo "Is your device rooted? [Y/n]"
read YN
YN=${YN,,}
if [ $YN = "n" ]; then
echo "Do you want your device to be rooted? [Y/n]" 
read YN
YN=${YN,,}
if [ $YN = "y" ]; then
clear
echo $'\n**** Installing Rooting Software ****\n\n'
adb install KingoRoot.apk
clear
echo $'\n**** Launching an App in Your Phone ****\n\n'
adb shell monkey -p com.kingoapp.apk -v 5
clear
echo $'\nFollow these steps:\n'
echo "1. Take your device and open the screen (KingoRoot should be launched)" 
echo "2. Click ROOT button to start the process(it will take some time)"
echo "3. Click Finish to reboot your device"
echo 
echo "When phone is fully rebooted press 'y'"
read YN
YN=${YN,,}
if [ $YN = "y" ]; then
echo
else
pkill -f Main.sh
exit
fi
else
pkill -f Main.sh
exit
fi
fi
adb uninstall com.kingoapp.apk
