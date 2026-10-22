#!/bin/bash

if [[ -z $# ]]; then

    echo "Debe especificar un PID"
    exit 1

    elif [[ $# -gt 1 ]]; then

    echo "Error, demasiados parametros"
    exit 1

    else

        ps -u "$USER" -o pid,pcpu,pmem,comm --sort=-pcpu > procesos.txt


        if [ -n "$n" ]; then
            
            head -n $((n + 1)) procesos.txt
        else
            cat procesos.txt
        fi


        total_procesos=$(($(wc -l < procesos.txt) - 1))
        echo "Procesos de $USER: $total_procesos"

fi

