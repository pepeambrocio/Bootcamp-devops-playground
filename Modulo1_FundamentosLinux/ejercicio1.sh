#!/bin/bash
# Ejercicio 1: Crear jerarquía de directorios y archivos

# Crear la estructura de directorios
mkdir -p foo/dummy
mkdir -p foo/empty

# Crear file1.txt con contenido
echo "Me encanta la bash!!" > foo/dummy/file1.txt

# Crear file2.txt vacío
touch foo/dummy/file2.txt

echo "Jerarquía creada exitosamente:"
tree foo/ 2>/dev/null || find foo/ -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
