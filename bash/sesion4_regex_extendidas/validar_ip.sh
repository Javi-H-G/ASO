#!/bin/bash

if [[ -z $1 ]]; then

    echo "Mal, debes rellenar asi: ./validar_ip.sh <ip>"

else
    
    if [[ $1 =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then

        echo "$1 tiene formato de IP"

    else

        echo "$1 no tiene formato de IP"

    fi


fi

# Que responde tu script con 999.999.999.999?
# Responde con que es valida
# Es una IP válida?
# No es una ip valida (una IP valida debe ser maximo 255.255.255.255)