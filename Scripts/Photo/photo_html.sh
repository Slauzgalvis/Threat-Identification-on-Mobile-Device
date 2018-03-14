#!/bin/bash


cd ../..
vieta=`pwd`

cat <<- _EOF_
    <HTML>
    <HEAD>
        <TITLE>
        #TEAM_FLY
        </TITLE>
    </HEAD>
    <BODY>
	<img src="$vieta/TeamFly.png" alt="Something went wrong" style="width:200px;height:200px;" align="right">
<br/>
    </BODY>
    </HTML>
_EOF_

cd Photo
ls -dp * | grep / > failai.txt # direktorijos
EILES=`grep -c "^" failai.txt` # suskaiciuoja kiek direktoriju
for (( i=1; i <= $EILES; ++i ))
do
	cd `sed -n "${i}p" failai.txt`
	paveiksliukas=`ls *.jpg`
echo 
vieta=`pwd`

cat <<- _EOF_
    <HTML>
    <HEAD>
        <TITLE>
        #TEAM_FLY
        </TITLE>
    </HEAD>

    <BODY>
	<br/>
	______________________________________________________________________________________
	<br/>
	$paveiksliukas
	<br/>
     <img src="$vieta/$paveiksliukas" alt="Something went wrong" style="width:304px;height:228px;">
	<br/>
        <br/>
	<embed src="$vieta/fingerprint.txt" style="width:1000px;height:110px;">
	
	<br/>
	<br/>

	<embed src="$vieta/exif_info.txt" style="width:1000px;height:500px;">
	<br/>
	<br/>
	<br/>





    </BODY>
    </HTML>
_EOF_

cd ..

done




###############################################

