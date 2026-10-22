#!/bin/bash

error() {
    echo "Error: $1" >&2
    echo "Uso: $0 alta | baja identificador" >&2
    exit 1
}

generar_id() {
    local nombre="$1"
    local apellido1="$2"
    local apellido2="$3"

    local l_nom=$(echo "$nombre" | tr 'A-Z' 'a-z' | cut -c1-2)
    local l_ap1=$(echo "$apellido1" | tr 'A-Z' 'a-z' | cut -c1-2)
    local l_ap2=$(echo "$apellido2" | tr 'A-Z' 'a-z' | cut -c1-1)

    echo "alu${l_nom}${l_ap1}${l_ap2}"
}

if [[ -z $# ]]; then 

    echo "Por favor indique un parametro"
    exit 1

fi

case "$1" in

    alta)

        read -p "Nombre: " nombre
                read -p "Apellidos: " apellidos

               
                if [[ ! "$nombre" =~ ^[a-zA-Z]+$ ]]; then
                    echo "Error: el nombre debe ser una sola palabra formada por letras" >&2
                    exit 1
                fi

                
                if [[ ! "$apellidos" =~ ^[a-zA-Z]+\ [a-zA-Z]+$ ]]; then
                    echo "Error: escribe los dos apellidos separados por un espacio" >&2
                    exit 1
                fi

             
                apellido1=$(echo "$apellidos" | cut -d' ' -f1)
                apellido2=$(echo "$apellidos" | cut -d' ' -f2)

              
                id_usuario=$(generar_id "$nombre" "$apellido1" "$apellido2")
                echo "Identificador generado: $id_usuario"

               
                if id "$id_usuario" &>/dev/null; then
                    echo "Error: el usuario $id_usuario ya existe" >&2
                    exit 1
                fi

                
                echo "Para crearlo: sudo useradd -m -s /bin/bash -c \"$nombre $apellidos\" $id_usuario"
                ;;

    baja)

    
        if [ $# -lt 2 ]; then
            error "falta el identificador"
        fi
        
        id_usuario="$2"

        
        if [[ ! "$id_usuario" =~ ^alu[a-z]{5}$ ]]; then
            echo "Error: $id_usuario no tiene el formato aluXXYYZ" >&2
            exit 1
        fi

        
        if ! id "$id_usuario" &>/dev/null; then
            echo "Error: el usuario $id_usuario no existe" >&2
            exit 1
        fi

      
        echo "Para eliminarlo: sudo userdel -r $id_usuario"
        ;;
    *)
        error "la acción $accion no es válida"
        ;;

esac