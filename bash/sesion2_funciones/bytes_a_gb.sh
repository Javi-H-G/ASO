#!/bin/bash

gb='1073741824'

bytes_a_gigas() {
    echo "======================================"
    echo "scale=2; $bytes / 1073741824" | bc
}

echo "Introduce los bytes a pasar en GB"
read bytes

bytes_a_gigas