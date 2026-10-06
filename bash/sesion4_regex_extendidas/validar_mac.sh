#!/bin/bash

if [[ -z $1 ]]; then

    echo "Por favor indique una MAC válida"

    elif [[ $1 =~ ^[0-9a-fA-F]{2}\:[0-9a-fA-F]{2}\:[0-9a-fA-F]{2}\:[0-9a-fA-F]{2}\:[0-9a-fA-F]{2}\:[0-9a-fA-F]{2}$ ]]; then

    echo "$1 es una MAC válida"

    elif [[ $1 =~ ^[0-9a-fA-F]{2}\-[0-9a-fA-F]{2}\-[0-9a-fA-F]{2}\-[0-9a-fA-F]{2}\-[0-9a-fA-F]{2}\-[0-9a-fA-F]{2}$ ]]; then

    echo "$1 es una MAC válida"

    else 

    echo "$1 NO es una MAC válida"

fi