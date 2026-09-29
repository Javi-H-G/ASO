#!/bin/bash

condicion='^[0-9]*$'

read -p "Introduce un numero de puerto: " puerto

if [[ -z $puerto ]]; then 

    echo "Tienes que introducir un numero de puerto"

    elif [[ $puerto =~ $condicion ]]; then
    
        if [[ $puerto -ge 1 && $puerto -le 65535 ]]; then

            echo "el puerto $puerto es valido"

            else 

            echo "El puerto está fuera de rango (1-65535)"

        fi
    else

    echo "$puerto no es un numero valido"

fi
