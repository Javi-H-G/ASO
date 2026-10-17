#!/bin/bash

if [[ -z $1 ]]; then

    echo "Uso correcto: ./anonimizar_log.sh <fichero>"
    exit 1

else

    if [[ -f $1 ]]; then

        sed -E 's/[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/X\.X\.X\.X/g' $1 > $1.anonimo

        echo "fichero anonimizado: $1.anonimo"

    else

        echo "El fichero no existe"
        exit 1

    fi

fi
