#!/bin/bash


contadorconf=0
contadorbak=0

for archivo in /etc/*; do

    if [[ $archivo =~ ^.*\.conf$ ]]; then

        echo "$archivo"
        ((contadorconf++))

    elif [[ $archivo =~ ^*.\.conf$ ]]; then

        echo "$archivo"
        ((contadorbak++))

    fi

done

echo "============================="
echo "ficheros de configuración"
echo "=========================="
echo "configuración: $contadorconf"
echo "Copia de seguridad: $contadorbak"