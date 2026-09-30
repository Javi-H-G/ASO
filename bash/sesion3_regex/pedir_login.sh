#!/bin/bash

while true; do

    read -p "Nombre de usuario: " userinput

    if [[ $userinput =~ ^[a-z][a-z0-9]*$ ]]; then
        
        if grep -q "^$userinput:" /etc/passwd; then

            echo "Ese usuario ya existe"
            break

        else

            echo "Para crearlo: sudo useradd -m -s /bin/bash $userinput"

        fi

    else

        echo "No es válido. Debe empezar por minúscula y tener solo minúsculas o dígitos"

fi

done