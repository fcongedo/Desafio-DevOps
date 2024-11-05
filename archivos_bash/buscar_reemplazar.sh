#!/bin/bash

# Directorio de trabajo
directorio="/home/vagrant/Documentos/Proyectos/BlogPersonal/artículos"

# Archivo en el que se realizará el reemplazo
archivo="$directorio/$1"

# Texto a buscar y reemplazar (pasado como argumentos al script)
texto_buscar=$2
texto_reemplazar=$3

# Verificar si se han pasado los argumentos necesarios
if [ "$#" -ne 3 ]; then
  echo "Uso: $0 nombre_archivo 'texto_a_buscar' 'texto_a_reemplazar'"
  exit 1
fi

# Verificar si el archivo existe
if [ ! -f "$archivo" ]; then
  echo "El archivo '$archivo' no existe."
  exit 1
fi

# Realizar el reemplazo en el archivo especificado
sed -i "s/${texto_buscar}/${texto_reemplazar}/g" "$archivo"

echo "Reemplazo completado en el archivo '$archivo'."