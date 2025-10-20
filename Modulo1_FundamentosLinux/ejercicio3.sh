#!/bin/bash
# Ejercicio 3: Script completo que agrupa los ejercicios 1 y 2
# Acepta un parámetro para establecer el texto de file1.txt

# Establecer el texto por defecto o usar el parámetro
if [ -z "$1" ]; then
    TEXTO="Que me gusta la bash!!!!"
else
    TEXTO="$1"
fi

echo "Creando estructura de directorios..."

# Limpiar si existe
rm -rf foo

# Crear la estructura de directorios
mkdir -p foo/dummy
mkdir -p foo/empty

# Crear file1.txt con el texto especificado
echo "$TEXTO" > foo/dummy/file1.txt

# Crear file2.txt vacío
touch foo/dummy/file2.txt

echo "Estructura inicial creada."

# Copiar el contenido de file1.txt a file2.txt
cat foo/dummy/file1.txt > foo/dummy/file2.txt

# Mover file2.txt a la carpeta empty
mv foo/dummy/file2.txt foo/empty/

echo -e "\nEstructura final:"
tree foo/ 2>/dev/null || find foo/ -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'

echo -e "\nContenido de foo/dummy/file1.txt:"
cat foo/dummy/file1.txt

echo -e "\nContenido de foo/empty/file2.txt:"
cat foo/empty/file2.txt
