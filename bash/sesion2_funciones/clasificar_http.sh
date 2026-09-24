#!/bin/bash

clasificar_http() {
    if [[ $input1 -ge 200 && $input1 -le 299 ]] then
        echo "Éxito"
    elif [[ $input1 -ge 300 && $input1 -le 399 ]] then
        echo "Redirección"
    elif [[ $input1 -ge 400 && $input1 -le 499 ]] then
        echo "Error del cliente"
    elif [[ $input1 -ge 500 && $input1 -le 599 ]] then
        echo "Error del servidor"
    else
        echo "Codigo no valido"
    fi
}


echo "Introduce un codigo"
read input1
echo "===================="

clasificar_http