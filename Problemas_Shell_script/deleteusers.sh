#!/bin/bash -vx
nom=asir22-
rm -r /home/grupo1
rm /root/logs/prueba_final.log
for (( i=0; i<=9; i++ )); do
	userdel -f $nom$i
	rm -rf /home/$nom$i
done
groupdel grupo1
