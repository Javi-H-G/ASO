#!/bin/bash

laboratorio='lab-sed/login.defs'

if [[ -z $1 ]]; then

    echo "Uso correcto ./caducidad.sh <numero>"
    exit 1

    elif [[ $1 =~ ^[0-9]{1,3}$ ]]; then

        antes=$(grep '^PASS_MAX_DAYS' "$laboratorio")


        sed "s/^PASS_MAX_DAYS.*/PASS_MAX_DAYS   $1/" $laboratorio > $laboratorio.bak 

        echo "Antes: $antes"
        echo "Después: PASS_MAX_DAYS $1"


    else

    echo "Error: $1 no es un numero de dias valido"
    exit 1


fi