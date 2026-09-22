#!/bin/bash

gb='1073741824'

bytes_a_gigas() {
    resultado=$((bytes/gb))
    echo "el resultado es $resultado GB"
}

echo "Introduce los bytes"
read bytes

bytes_a_gigas