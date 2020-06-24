#!/bin/bash


set -x 

my_idx=${1:-JIHOG_ME}
url=$2
video=$3
audio=$4


function start(){
  ./timeout3.sh -t $1 ./start-chrome.sh $2 $url $video $audio
  sleep 3
  killall chrome
}


if [ $my_idx -lt 4 ] ;then
  start 670 test_0
elif [ $my_idx -lt 8 ] ;then
  start 300 test_0
else 
  start 300 test_1
fi

if [ $my_idx -lt 8 ] ;then
  if [ $my_idx -gt 3 ] ;then
	start 180 test_2
  fi
elif [ $my_idx -lt 12 ] ;then
	start 180 test_3
else
	start 180 test_4
fi

if [ $my_idx -gt 3 ] ;then
    u=test2_$(($my_idx%6))
	start 180 $u
fi

u=test3_$(($my_idx%8))
start 180 $u

u=test3_$(($my_idx%2))
start 180 $u

