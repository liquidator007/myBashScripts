#!/bin/bash

read -p "introduce un numero " a

read -p "introduce otro numero " b

read -p "introduce un ultimo numero " c

if [[ $a -eq $b ]] && [[ $a -eq $c ]]; then
	echo "los numeros son iguales"
else

	if [[ $a -gt $b && $b -gt $c ]]; then
	 	printf "$a $b $c \n" 
	elif
		[[ $b -gt $a && $a -gt $c ]]; then
			printf "$b $a $c \n" 
	elif
		[[ $c -gt $a && $b -gt $a ]]; then
			printf "$c $b $a \n" 
	elif
		[[ $c -gt $a && $a -gt $b ]]; then
			printf "$c $a $b \n" 
	elif
		[[ $b -gt $a && $c -gt $a ]]; then
			printf "$b $c $a"
	fi
fi
