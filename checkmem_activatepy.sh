#!/bin/bash
#---------PERSONAL VARIABLES
PCUSER=`whoami`
RAM_PERCENTAGE_WARNING="***ram_percentage_warning***
HOME_DIRECTORY="/home/$PCUSER"
TMP_DIRECTORY="/tmp"
#---------SCRIPT - CHECK MEM
USED_MEM=`vmstat -s |awk '/used/ && /memory/' |cut -d'K' -f1 | sed "s/ //g"`
PC_MEM=`vmstat -s |awk '/total/ && /memory/' |cut -d'K' -f1 | sed "s/ //g"`
RATIO_WARNING=`echo "scale=2; $USED_MEM / $PC_MEM * 100" | bc | cut -d'.' -f1`
#--------SCRIPT - SEND EMAIL       
if [[ "$RATIO_WARNING" -ge $RAM_PERCENTAGE_WARNING  && ! -f $TMP_DIRECTORY/nowarning.txt ]]
then
	cd $HOME_DIRECTORY/.scriptmail-dependencies/
	python3 mailwarningmem.py
	cd $TMP_DIRECTORY
	echo 0 > nowarning.txt
fi
