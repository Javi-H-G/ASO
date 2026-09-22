#!/bin/bash

#funciones

menu() {
    echo "===CALCULADORA==="
    echo "1 - SUMAR"
    echo "2 - RESTAR"
    echo "3 - MULTIPLICAR"
    echo "4 -  DIVIDIR"
    echo "5 - Salir :D"
    read -p "indique la opción: " opcion
}

sumar() {
    read -p "Introduce el primer numero: " input1
    read -p "Introduce el segundo numero: " input2
    resultado=$((input1+input2))
    echo "====el resultado es $resultado===="
}

restar() {
    read -p "Introduce el primer numero: " input1
    read -p "Introduce el segundo numero: " input2
    resultado=$((input1-input2))
    echo "====el resultado es $resultado===="
}

multiplicar() {
    read -p "Introduce el primer numero: " input1
    read -p "Introduce el segundo numero: " input2
    resultado=$((input1*input2))
    echo "====el resultado es $resultado===="
}

dividir() {
    read -p "Introduce el primer numero: " input1
    read -p "Introduce el segundo numero: " input2
    resultado=$((input1/input2))
    echo "====el resultado es $resultado===="
}


#el codigo principal


while true; do 
menu

case $opcion in

    1) sumar ;;
    2) restar ;;
    3) multiplicar ;;
    4) dividir ;;
    5) echo "adios :D"
        break;;
    *)
    clear 
    echo "TIENES QUE INDICAR UNA DE LAS OPCIONES"
    ;;
esac

done