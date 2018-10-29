#!/bin/bash -xv 
nom=usuario
grp=grupo1
groupadd $grp
mkdir /root/logs
touch /root/logs/prueba_final.log
for (( i=1; i<=10; i++ )); do
	useradd $nom$i -g $grp -p `mkpasswd --method=sha-512 "$nom$i"` -m -s /bin/bash
	echo "usuario creado: $nom$i `date`" >> /root/logs/prueba_final.log
	echo "---------------------------------------------------------------------------------" >> /root/logs/prueba_final.log
done

mkdir /home/$grp

chown root:$grp /home/$grp

chmod 770 /home/$grp
