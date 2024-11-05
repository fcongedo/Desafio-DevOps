#!/bin/bash

# Función para mostrar el menú
mostrar_menu() {
  echo "Seleccione una opción:"
  echo "1. Ver la lista de archivos"
  echo "2. Copiar un archivo"
  echo "3. Eliminar un archivo"
  echo "4. Salir"
}

# Función para ver la lista de archivos
ver_lista_archivos() {
  echo "Lista de archivos en el directorio actual:"
  ls -l
}

# Función para copiar un archivo
copiar_archivo() {
  echo "Ingrese el nombre del archivo a copiar y el destino, separados por un espacio:"
  read archivo_original destino
  if [ -f "$archivo_original" ]; then
    cp "$archivo_original" "$destino"
    echo "Archivo '$archivo_original' copiado exitosamente a '$destino'."
  else
    echo "Error: El archivo '$archivo_original' no existe."
  fi
}

# Función para eliminar un archivo
eliminar_archivo() {
  echo "Ingrese el nombre del archivo a eliminar:"
  read archivo
  if [ -f "$archivo" ]; then
    rm "$archivo"
    echo "Archivo '$archivo' eliminado exitosamente."
  else
    echo "Error: El archivo '$archivo' no existe."
  fi
}

# Bucle principal del menú
while true; do
  mostrar_menu
  read -p "Seleccione una opción: " opcion

  # Verificar que la opción esté en el rango de 1 a 4
  if [[ "$opcion" =~ ^[1-4]$ ]]; then
    case $opcion in
      1)
        ver_lista_archivos
        ;;
      2)
        copiar_archivo
        ;;
      3)
        eliminar_archivo
        ;;
      4)
        echo "Saliendo..."
        exit 0
        ;;
    esac
  else
    echo "Opción inválida. Intente de nuevo con una opción entre 1 y 4."
  fi
  echo # Línea en blanco para mejor legibilidad entre opciones
done