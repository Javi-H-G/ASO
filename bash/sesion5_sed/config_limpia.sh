#!/bin/bash

if [[ -z $1 ]]; then

    echo "Uso correcto: ./config_limpia.sh <fichero>"
    
    else

    if [[ ! -f $1 ]]; then
        echo "No existe el fichero"
    else
        sed -E '/^#/d; /^$/d' $1
    fi
fi