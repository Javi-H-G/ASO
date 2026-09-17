#!/bin/bash

if [[ -z $1 || -z $2 ]]; then
    echo "Por favor inserte dos argumentos"
else
    calculo=$(( $1 * 100 / $2))

    if [[ $calculo -lt 70 ]]; then
    echo "OK"
    elif [[ $calculo -ge 70 && $calculo -le 89 ]]; then
    echo "AVISO"
    elif [[ $calculo -ge 90 ]]; then
    echo "CRITICO"
    fi
fi