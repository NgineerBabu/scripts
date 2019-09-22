#!/bin/bash

 if [[ "$1" == "m" ]]
 then
 DIR="dev dev/pts sys proc run"
	for A in $DIR
	do 
		mount --bind /$A  $2$A
	done
 elif [[ "$1" == "u" ]]
 then
 DIR="dev/pts dev sys proc run"
	 for A in $DIR
	 do
		 umount $2$A
	 done
 elif [[ "$2" == "" ]]
 then
	 printf "\n Mention target chroot pathi\n Example - Path /mnt/usb to chroot USB stick mounted directory\n"
 else
	 printf "Choose any one switch\n  m ==> to mount bind directory\n  u ==> to unmount the bind directories\n"
 fi
