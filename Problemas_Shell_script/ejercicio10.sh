#!/bin/bash

read -p "Introduce un número: " num
echo "$num"
until [[ $num -eq 0 ]]; do
	for ((i=0; i<=$num; i++));do
		let count=$count+1
		echo "El numero de datos introducidos es $count"
		let num1=$num+$num
		echo "$num1 "
		media=$(($num1 / $count)) 
		echo "la media es $media"
		read -p "Introduce un número: " num
	done
done
