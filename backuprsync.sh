#!/bin/bash

fechahora=`date +%F"_"%H"-"%M"-"%S`
fecha=`date +%F`
backupdir="$PWD/rsync/backup_$fecha"
sufijo="-$fechahora.old"
clear
echo "############  BACKUPS INCREMENTALES CON RSYNC  ############"

	if [[ $# -ne 2 ]]; then
		echo "Se deben pasar 2 parámetros"
		echo
		echo "USO: $0 <origen> <destino>"
		echo
	else
		rsync -abvvzhP --no-whole-file --suffix=$sufijo --delete --backup-dir=$backupdir $1 $2
		#rsync -abvvP --delete --backup-dir=$backupdir $1 $2
	fi			
