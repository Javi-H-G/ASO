#!/bin/bash

usuarios=0

while read -r linea; do

    if [[ $linea == *bash ]]; then

        echo "${linea%%:*}"
        ((usuarios++))

    fi

done < /etc/passwd

echo "----"
echo "usuarios con bash $usuarios"