#!/bin/bash

# mostrar por pantalla los 10 procesos que más CPU consuman.
#	ps aux --width 30 --sort=-%cpu | head -n 11
#	top -o %CPU -b -n 1 | head -n 17 | tail -11

function cpu()
{
ps aux | awk '{print $2, $3, $11}' | sort -k2r | head -n 11
}

# cpuname=(`ps aux | awk '{print $2, $3, $11}' | sort -k2r | head -n 11 | tail -10 | cut -d " " -f 3`)
# cpupid=(`ps aux | awk '{print $2, $3, $11}' | sort -k2r | head -n 11 | tail -10 | cut -d " " -f 1`)

# mostrar por pantalla los 10 procesos que más memoria consuman.
#	ps aux --width 30 --sort -rss | head -n 11
#	top -o %MEM -b -n 1 | head -n 17 | tail -11

function mem()
{
ps aux | awk '{print $2, $4, $11}' | sort -k2r | head -n 11
}
# memname=(`ps aux | awk '{print $2, $4, $11}' | sort -k2r | head -n 11 | tail -10 | cut -d " " -f 3`)
# mempid=(`ps aux | awk '{print $2, $4, $11}' | sort -k2r | head -n 11 | tail -10 | cut -d " " -f 1`)


# eliminar un proceso de la lista de procesos.

function deleteprocess()
{
cpuname=(`ps aux | awk '{print $2, $3, $11}' | sort -k2r | head -n 11 | tail -10 | cut -d " " -f 3`)
memname=(`ps aux | awk '{print $2, $4, $11}' | sort -k2r | head -n 11 | tail -10 | cut -d " " -f 3`)
	echo
	read -p "introduce la opción para listar procesos segun su consumo [1.cpu 2.memoria]: " optlist
	echo
	if [ $optlist -eq 1 ]; then
		cpu
		echo
		echo "Selecciona un proceso para matarlo: "
		echo
			select proceso in ${cpuname[@]} "EXIT"; do
				case $proceso in
					${cpuname[1]}) 
							killall -KILL ${cpuname[1]}
					;;

					${cpuname[2]}) 
							killall -KILL ${cpuname[2]}
					;;

					${cpuname[3]}) 
							killall -KILL ${cpuname[3]}
					;;

					${cpuname[4]}) 
							killall -KILL ${cpuname[4]}
					;;

					${cpuname[5]}) 
							killall -KILL ${cpuname[5]}
					;;

					${cpuname[6]}) 
							killall -KILL ${cpuname[6]}
					;;

					${cpuname[7]}) 
							killall -KILL ${cpuname[7]}
					;;

					${cpuname[8]}) 
							killall -KILL ${cpuname[8]}
					;;
					
					${cpuname[9]}) 
							killall -KILL ${cpuname[9]}
					;;

					${cpuname[10]}) 
							killall -KILL ${cpuname[10]}
					;;

					EXIT) 
							break
					;;
				esac
			done

	elif [ $optlist -eq 2 ]; then	
		mem
		echo
		echo "Selecciona un proceso para matarlo: "
		echo
			select proceso in ${memname[@]} "EXIT"; do
				case $proceso in
					${memname[1]}) 
							killall -KILL ${memname[1]}
					;;

					${memname[2]}) 
							killall -KILL ${memname[2]}
					;;

					${memname[3]}) 
							killall -KILL ${memname[3]}
					;;

					${memname[4]}) 
							killall -KILL ${memname[4]}
					;;

					${memname[5]}) 
							killall -KILL ${memname[5]}
					;;

					${memname[6]}) 
							killall -KILL ${memname[6]}
					;;

					${memname[7]}) 
							killall -KILL ${memname[7]}
					;;

					${memname[8]}) 
							killall -KILL ${memname[8]}
					;;
					
					${memname[9]}) 
							killall -KILL ${memname[9]}
					;;

					${memname[10]}) 
							killall -KILL ${memname[10]}
					;;

					EXIT) 
							break
					;;
				esac
			done
	fi
}

# hacer una copia de los archivos modificados con más de 7 días.
function sevendays()
{
	read -p "introduce desde donde quieres hacer la copia: " ruta
	find $ruta -type f -mtime +7 -daystart -exec cp {} /home/liquidator007/dir_sevendays/ 2> /dev/null \;
}

# listar los ficheros de un directorio que se le pase como argumento.
function listfile()
{
	read -p "introduce el nombre del fichero: " fichero
	echo
	ls $fichero
	echo
}

# MENÚ

if [ $# -eq 0 ]; then
#clear
while :
do
echo
echo "------------------------------------------------------------"
echo "---------------------  MENU  -------------------------------"
echo " Escoja una opción: "
echo
echo "1. Mostrar los 10 procesos que más CPU consumen."
echo "2. Mostrar los 10 procesos que más memoria consumen."
echo "3. Eliminar un proceso de la lista de procesos."
echo "4. Hacer una copia de los archivos modificados con más de 7 días."
echo "5. Listar los ficheros de un directorio."
echo "6. SALIR."
echo
echo -n " Seleccione una opción [ 1 - 6 ]: "
read opcion

case $opcion in
	1)	
		cpu
		;;
	
	2)	
		mem
		;;

	3)
		deleteprocess
		;;	
		
	4)
		sevendays
		;;

	5)	
		listfile
		;;	

	6)
		break
		;;
esac

done
fi



# pasar un directorio y diversos ficheros como argumentos, determinar si los ficheros están
# presentes en ese directorio, usar la partícula "shift".
	if [ $# -ge 2 ]; then
		var=$1
		shift
		while [ $# -ge 1 ]; do
				if [ -f $var/$1 ]; then
					echo
					echo " $1 es un fichero y se encuentra dentro de $var "
				else
					echo " ERROR: $1 no está en $var "
				fi
			shift
			done
	fi

# pasar un solo directorio como argumento, descomprimir todos los ".zip" que contenga en un
# subdirectorio por cada archivo con el mismo nombre que el fichero.
	if [ $# -eq 1 ]; then
		if [ -d $1 ]; then
			arr=(`ls $1 | grep .zip`)
			for (( i; i<${#arr[*]}; i++ )); do
			nomzip=${arr[$i]}
			nom=`unzip -c $1/$nomzip | cut -d " " -f 3 | head -n 1 | cut -d "." -f 1`
		       		unzip $1/$nomzip -d $nom
	       		done
		else
			echo " $1 no es un directorio "
		fi
	fi


