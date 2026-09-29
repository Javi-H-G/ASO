#!/bin/bash

echo "Usuarios con bash"
echo "======================"

while read -r linea; do

    if [[ $linea =~ ${linea%%:*} ]]; then

        echo "$linea"

    fi

done < /etc/passwd