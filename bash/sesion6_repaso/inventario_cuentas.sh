#!/bin/bash

default='/bin/bash'
cuentas=0

if [[ -z $1 ]]; then

    echo "Shell no añadida, usando /bin/bash"

    while IFS=':' read -r usuario x uid gid desc home shell; do

        if [[ $linea == *$default ]]; then

            echo "$linea"
            ((cuentas++))

        fi

    done < /etc/passwd

    echo "----"
    echo "Cuentas listadas: $cuentas"

    elif

fi

