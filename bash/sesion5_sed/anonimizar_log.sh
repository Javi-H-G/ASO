#!/bin/bash

if [[ -z $1 ]]; then

    echo "Uso correcto: ./anonimizar_log.sh <fichero>"

else

    if [[ -f $1 ]]; then

        sed -i 's/[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}/x.x.x.x/' $1

    else

        echo "El fichero no existe"

fi
