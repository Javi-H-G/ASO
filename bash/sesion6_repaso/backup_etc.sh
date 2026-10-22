#!/bin/bash


destino="${1:-/var/backups}"
max_copias="${2:-7}"


registrar() {
    local mensaje="$1"
    echo "$(date +'%H:%M:%S') $mensaje"
    logger -t aso-backup "$mensaje"
}


if [ $# -gt 2 ]; then
    registrar "Error: demasiados parámetros"
    exit 1
fi

if [ ! -d "$destino" ]; then
    registrar "Error: el directorio $destino no existe"
    exit 1
fi

if [[ ! "$max_copias" =~ ^[0-9]+$ ]]; then
    registrar "Error: $max_copias no es un número"
    exit 1
fi

if [ "$max_copias" -le 0 ]; then
    registrar "Error: el número máximo de copias debe ser mayor que 0"
    exit 1
fi


fecha=$(date +%Y%m%d-%H%M%S)
fichero="$destino/etc-$fecha.tar.gz"


if tar -czf "$fichero" /etc 2>/dev/null; then
    registrar "Copia creada: $fichero"
else
    registrar "Error al crear la copia de seguridad"
    exit 1
fi


contador=0
for f in "$destino"/etc-*.tar.gz; do
    if [ -f "$f" ]; then
        nombre_fichero=$(basename "$f")
        if [[ "$nombre_fichero" =~ ^etc-[0-9]{8}-[0-9]{6}\.tar\.gz$ ]]; then
            contador=$((contador + 1))
        fi
    fi
done


if [ "$contador" -gt "$max_copias" ]; then
    registrar "Aviso: hay $contador copias y el máximo recomendado es $max_copias"
fi