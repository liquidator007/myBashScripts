#!/bin/bash
a=0
read -p "introduce un numero: " num

if [[ $num -gt 0 ]]; then
	for (( i=0; i<=$num; i+=2 )); do
		let a=$a+$i
	done
echo $a
else
	echo "el numero no es positivo"
fi
