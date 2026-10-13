#!/bin/bash

seguridad=5

if [[ -z $1 ]]; then

    echo "Incorrecto, introduzca una contraseña"

else

    if [[ $1 =~ .{12,} ]]; then

        echo "Tiene al menos 12 caracteres: si"
    else

        echo "Tiene al menos 12 caracteres: no"
        ((seguridad--))
    fi

    if [[ $1 =~ [0-9] ]]; then

        echo "Contiene algún digito: si"
    
    else

        echo "Contiene algún digito: no"
        ((seguridad--))

    fi

    if [[ $1 =~ [A-Z] ]]; then
        echo "Contiene alguna letra mayúscula: si"
    else
        echo "Contiene alguna letra mayúscula: no"
        ((seguridad--))
    fi

    if [[ $1 =~ [^a-zA-z0-9] ]]; then
        echo "Contiene algun simbolo: si"
    else
        echo "Contiene algun simbolo: no"
        ((seguridad--))
    fi

    if ! grep -qxi "$1" /usr/share/dict/words 2>/dev/null; then
        echo "Contiene alguna palabra del diccionario: si"
        ((seguridad--))
    else
        echo "Contiene alguna palabra del diccionario: no"
    fi

    if [[ $seguridad -lt 5 ]]; then
        echo "La contraseña no es segura"
    else
        echo "La contraseña es es segura"
    fi

fi