#!/bin/bash

ip="$1"

if [[ -z $1 ]]; then
    echo "Uso: tipo_ip.sh <direccion_ip>"
else

    if [[ $ip =~ ^127\. ]]; then
        echo "$ip es una dirección loopback"

    
    elif [[ $ip =~ ^(10\.|192\.168\.|172\.(1[6-9]|2[0-9]|3[0-1])\.) ]]; then
        echo "$ip es una dirección privada"

    else
        echo "$ip es una dirección pública"
    fi

fi

# Pregunta: el rango de 172.16 a 172.31 no se puede escribir con una sola clase. ¿Cómo lo has resuelto?
# Respuesta: si pusiera algo como [16-31] buscaria entre esos numeros por lo que quedaria mal
# asi que para evitar eso, lo divido en subpatrones acompañados del |