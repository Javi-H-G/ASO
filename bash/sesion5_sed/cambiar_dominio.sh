#!/bin/bash

if [[ -z $1 ]]; then

    echo "Uso correcto: ./cambiar_dominio.sh <fichero>"

else

    if [[ -e $1 ]]; then

        sed -E 's/@gmail.com/alu.edu.gva.es/; s/@hotmail.com/alu.edu.gva.es/' $1

    else

        echo "no existe el fichero"
    fi

fi