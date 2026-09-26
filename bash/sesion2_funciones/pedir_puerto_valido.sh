#!/bin/bash

pedir_puerto_valido() {
    while true; do
    echo "Introduzca un puerto valido"
    read puerto

    if [[ $puerto =~ ^[0-9]+$ ]] && (( puerto >= 1 && puerto <= 65535 )); then
        echo "Puerto valido recibido"
        break
    else 
        echo "INTRODUZCA UN PUERTO VALIDO"
    fi

    done
}

pedir_puerto_valido