#!/bin/bash
# ScriptName: Auto print text
# ScriptRepo: https://github.com/NgineerBabu/scripts
# Author: Sanju P Debnath
# Dt:  09-21-2019

TIME="0.01"

if [[ "$1" == "" ]]
then
printf "\nRun script as mention below example:
./apt.sh  <target text file>\n\n"
exit 0
fi

ERN=$(file $1)
FL=$(echo "$ERN"|sed -n '/ASCII/p')
if [[ -n $FL ]]
then 
FILE=$(cat $1)
COUNT_A=$(echo "$FILE"|wc -l)

for FND in $(seq $COUNT_A)
do 
LINE=$(echo "$FILE"|sed -n "$FND p")
COUNT_B=$(echo "$LINE"|wc -L)

for PNT in $(seq $COUNT_B)
do
printf "$(echo -en "$LINE" | cut -b$PNT)"
sleep $TIME
done
printf "\n"
done

else
	printf "\nPlease provide only text files.\n$ERN\n\n"

fi
