#!/bin/bash -vx
nom=usuario
rm -r /home/grupo1
rm /root/logs/prueba_final.log
for (( i=1; i<=10; i++ )); do
	userdel -f $nom$i
	rm -rf /home/$nom$i
done
groupdel grupo1
