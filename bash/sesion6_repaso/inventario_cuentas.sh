#!/bin/bash

cuentas=0
uid_mil=0


if [ $# -gt 1 ]; then
    echo "Error: demasiados parámetros" >&2
    exit 1
elif [ $# -eq 1 ]; then
    shell="$1"
    
    if [[ ! "$shell" =~ ^/([a-z]+/)*[a-z]+$ ]]; then
        echo "Error: $shell no es una ruta válida" >&2
        exit 1
    fi
else
    shell="/bin/bash"
fi

while IFS=':' read -r usuario x uid gid desc home actual_shell; do
    if [ "$actual_shell" = "$shell" ]; then
        echo "$usuario:$uid:$home:$actual_shell"
            ((cuentas++))
        if [ "$uid" -ge 1000 ]; then
            ((uid_mil++))
        fi
    fi
done < /etc/passwd


echo "Cuentas listadas: $cuentas"
echo "Con UID >= 1000: $uid_mil"
