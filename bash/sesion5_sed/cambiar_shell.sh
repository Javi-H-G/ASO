#!/bin/bash

lab='lab-sed/passwd'

if [[ -z $1 || -z $2 ]]; then

    echo "uso correcto: ./cambiar_shell.sh <usuario> <shell>"
    exit 1

elif ! grep -q "^$1:" "$lab"; then

    echo "Error: El usuario $1 no existe"
    exit 1

elif [[ ! $2 =~ ^/bin/(bash|sh|zsh)$ ]]; then

    echo "Error: la Shell debe ser /bin/bash, /bin/sh o /bin/zsh"
    exit 1

else

    sed -i.bak  -E "s|^($1:.*):[^:]*$|\1:$2|" "$lab"
    grep "^$1:" "$lab"

fi


# en un sistema real, ¿se cambiaría la shell editando /etc/passwd con sed? ¿Qué comando se usa normalmente?
# R/ No, es incluso peligroso ya que una linea mal formulada puede dejar a un usuario
# sin poder validarse.
# el comando que se usa normalmente es "chsh" o usermod -s que permiten validar la shell y dejar el fichero
# consistente.