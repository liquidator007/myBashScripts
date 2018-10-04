#!/bin/bash
read -n 3 -p "introduce un numero de 3 cifras: " num
echo
echo "${num:2:1}${num:1:1}${num:0:1}"
