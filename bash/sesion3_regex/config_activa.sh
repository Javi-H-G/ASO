#!/bin/bash

fichero="${1:-/etc/login.defs}"


if [[ ! -f "$fichero" ]]; then
    echo "Error: El fichero $fichero no existe."
    exit 1
fi

totales=0
utiles=0

while read -r linea; do
    ((totales++))

    if [[ -z "$linea" ]] || [[ $linea =~ \#* ]]; then
        continue
    fi

    echo "$linea"
    ((utiles++))
done < "$fichero"


echo "----"
echo "Líneas totales: $totales"
echo "Líneas útiles: $utiles"


#busca en la salida el valor de PASS_MAX_DAYS. 
# ¿Qué significa?
# R/ significa el valor de dias que una contraseña es valida (ahora mismo dura 273 años)
# ¿Te parece seguro?
# R/ No, por que la cantidad de dias podria considerarse un limite indefinido
# por ende si un atacante tiene acceso a la contraseña, tiene acceso ilimitado hasta
# que sea descubierto 

