#!/bin/bash
#---------PERSONAL VARIABLES
RAM_PERCENTAGE_WARNING="###ram_percentage_warning###"
SCRIPT_DIRECTORY="###script_directory###"
TMP_DIRECTORY="/tmp"
#---------SCRIPT - CHECK MEM
USED_MEM=`vmstat -s |sed -n '2p' |cut -d'K' -f1 |sed "s/ //g"`
PC_MEM=`vmstat -s |sed -n '1p' |cut -d'K' -f1 | sed "s/ //g"`
RATIO_WARNING=`echo "scale=2; $USED_MEM / $PC_MEM * 100" |bc|cut -d'.' -f1`
#--------SCRIPT - SEND EMAIL       
if [[ "$RATIO_WARNING" -ge $RAM_PERCENTAGE_WARNING  && ! -f $TMP_DIRECTORY/nosendmailwarningmem.txt ]]
then
	python3 $SCRIPT_DIRECTORY/sendmailwarningmem.py
	touch $TMP_DIRECTORY/nosendmailwarningmem.txt
fi
