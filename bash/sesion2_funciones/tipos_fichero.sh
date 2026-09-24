#!/bin/bash

contar_por_extension() {
    for ext in log txt csv; do
    resultado=$(find "$carpeta" -maxdepth 1 -type f -name "*.$ext" | wc -l)
    echo "Hay $resultado ficheros con la extensión $ext"
    echo "====================="
    done

}

echo "====================="
echo "Introduce el nombre de la carpeta"
read carpeta
echo "====================="

contar_por_extension