#!/bin/bash 
alias echo='echo -e'
DSK=$(df -hT|awk '$2 !~ /tmpfs/{print $1}'|sed '1d')
MNT=$(df -hT|awk '$2 !~ /tmpfs/{print $NF}'|sed '1d')
HMNT=$(echo $MNT|sed -z 's/\n//g')
COUNT=$(echo "$DSK"|wc -l)
#SRCH=$(awk -F# '{print NF-1}')
#DEV=$(for A in $(seq $COUNT);do  echo "$DSK"|sed -n "$A p";done)
for A in  $(seq $COUNT)
do  
CharCT=$(echo "$MNT"|sed -n "$A p")
CharNUM=$(echo ${#CharCT})
if  [ $CharNUM -le 50 ]
then
	echo -e  " $CharCT "
fi
done
#echo "$DEV"|cut -c1-100

#FIELDV=$(for A in $(seq $COUNT);do echo "$A"|sed -z 's/\n/, $/g';done)
#FIELD=$(echo "\$$FIELDV"|sed 's/, $$//g')
#awk -v FLD=$FIELD '{ print $(print FLD) }'  /var/log/messages
#echo "$FIELD"
