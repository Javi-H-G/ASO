#!/bin/bash

if [[ -z $1 ]]; then

    echo "No haz introducido ningun correo"
    echo "Uso correcto: correo_centro.sh <correo>"

elif [[ $1 =~ ^[a-z0-9.\-\_]+@edu\.gva\.es$ ]]; then

    echo "$1 es un correo de profesorado"

elif [[ $1 =~ ^[a-z0-9.\-\_]+@alu\.edu\.gva\.es$ ]]; then

    echo "$1 es un correo de alumnado"

else 

    echo "$1 no es una cuenta educativa"

fi