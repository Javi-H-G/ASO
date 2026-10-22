#!/bin/bash

fecha=$(date %Y%m%d-%H%M%S)

if [ $# -gt 2 ]; then

    echo "DEMASIADOS PARAMETROS"
    exit 1

elif [ $2 -gt 7 || $2 -lt 1 ]; then

    echo "Numero de copias invalido (minimo 1 y maximo 7)"
    exit 1

elif [ $2 =~ [^0-9] ]; then

    echo "debe introducirse un numero en el segundo parametro"
    exit 1

fi

if [ ! -e $1 || -d $1 ]; then

    echo "El parametro no es un fichero o no existe"
    exit 1

fi

tar -czf "etc-$fecha.tar.gz" /etc 

logger -t aso-backup "Se creó una copia: etc-$fecha.tar.gz"
journalctl -t aso-backup