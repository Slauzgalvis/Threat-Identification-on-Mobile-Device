#!/bin/bash

cd ../..
vieta=`pwd`
cd Video
cat <<- _EOF_
    <HTML>
    <HEAD>
        <TITLE>
        #TEAM_FLY
        </TITLE>
    </HEAD>
    <BODY>
	<img src="$vieta/TeamFly.png" alt="Something went wrong" style="width:200px;height:200px;" align="right">
    </BODY>
    </HTML>
_EOF_

ls -dp * | grep / > failai.txt # direktorijos
EILES=`grep -c "^" failai.txt` # suskaiciuoja kiek direktoriju
for (( i=1; i <= $EILES; ++i ))
do
	video=`sed -n "${i}p" failai.txt`
	cd `sed -n "${i}p" failai.txt`
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
	<br/>
	$video
	<br/>
	<embed src="$vieta/fingerprint.txt" style="width:1000px;height:110px;">
	<br/>
	<br/>
	<embed src="$vieta/exiftool.txt" style="width:1000px;height:1000px;">
	<br/>
    </BODY>
    </HTML>
_EOF_

ls *.png > failai.txt # direktorijos
EILES2=`grep -c "^" failai.txt` # suskaiciuoja kiek direktoriju
for (( j=1; j <= $EILES2; ++j ))
do
	paveiksliukas=`sed -n "${j}p" failai.txt`

cat <<- _EOF_
    <HTML>
    <HEAD>
        <TITLE>
        #TEAM_FLY
        </TITLE>
    </HEAD>

    <BODY>
     <img src="$vieta/$paveiksliukas" alt="Something went wrong" style="width:304px;height:228px;">
    </BODY>
    </HTML>
_EOF_


done
rm failai.txt
cd ..
done
rm failai.txt


