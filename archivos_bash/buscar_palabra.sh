#!/bin/bash

# Verifica si se proporcionó la palabra a buscar
if [ -z "$1" ]; then
  echo "Uso: $0 palabra_a_buscar"
  exit 1
fi

palabra_a_buscar="$1"

# Busca la palabra en todos los archivos del directorio actual
echo "Buscando la palabra '$palabra_a_buscar' en archivos del directorio actual..."
grep -rl "$palabra_a_buscar" .