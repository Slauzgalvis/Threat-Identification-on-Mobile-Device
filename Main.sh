#!/bin/bash
function Forensics ####
{
echo
echo "You selected 'Forensics Analysis of Data'"
echo
echo "1. To Analyze Images With '.jpg' Extension"
echo "2. To Analyze Videos With '.mp4' Extension"
echo "3. Go Back"
read NUMERIS
TIKRINU2=0
if (($NUMERIS==1)); then
	rm -rf Photo
	mkdir Photo
	chmod +x Scripts/Photo/photo.sh
	./Scripts/Photo/photo.sh
	TIKRINU2=1
fi

if (($NUMERIS==2)); then
	rm -rf Video
	mkdir Video
	chmod +x Scripts/Video/video.sh
	./Scripts/Video/video.sh
	TIKRINU2=1
fi

if (($NUMERIS==3)); then
	clear
	(Meniu)
	TIKRINU2=1
fi

if (($TIKRINU2==0)); then
	clear
	echo "***** The selection is wrong, plese try again *****"
	echo
	(Forensics)
fi

}



function Meniu ####
{
echo
TIKRINU=0
echo "1. Forensics Analysis of Data"
echo "2. Malware Threats Indentification"
echo "3. Device's Full System Block Extraction"
echo "4. Clean Up Analyzed Data"
echo "5. Exit"
read NUMERIS
#####################################################
if (($NUMERIS==1)); then
	clear
	TIKRINU=1
	(Forensics)
fi
#####################################################
if (($NUMERIS==2)); then
clear
echo
echo "**** You selected 'Malware Threats Indentification' ****"
echo $'\n\n\n'
TIKRINU=1
rm -rf Apps
rm -rf Decompiled
mkdir Apps
mkdir Decompiled
chmod +x Scripts/Malware/rooting.sh
chmod +x Scripts/Malware/pullapk.sh
chmod +x Scripts/Malware/hashcode.sh
chmod +x Scripts/Malware/perm.sh
chmod +x Scripts/Malware/threat.sh
./Scripts/Malware/rooting.sh
clear
./Scripts/Malware/pullapk.sh
clear
./Scripts/Malware/perm.sh
clear
./Scripts/Malware/threat.sh
clear
./Scripts/Malware/hashcode.sh

fi
#####################################################
if (($NUMERIS==3)); then
clear
echo
echo "**** You selected 'Device's Full System Block Extraction' ****"
echo
rm -rf Blocks
mkdir Blocks
TIKRINU=1
chmod +x Scripts/Extraction/rooting.sh
chmod +x Scripts/Extraction/block.sh
./Scripts/Extraction/rooting.sh
clear
./Scripts/Extraction/block.sh
fi
#####################################################
if (($NUMERIS==4)); then
chmod +x Scripts/clear.sh
./Scripts/clear.sh
TIKRINU=1
clear
echo "********** Analyzed Data Deleted **********"
echo
(Meniu)
fi
#####################################################
if (($NUMERIS==5)); then
exit
fi
#####################################################
if (($TIKRINU==0)); then
clear
echo "***** The selection is wrong, plese try again *****"
echo
(Meniu)
fi
#####################################################
}

#MAIN
clear
chmod +x Scripts/install.sh
clear
./Scripts/install.sh
clear
(Meniu)
